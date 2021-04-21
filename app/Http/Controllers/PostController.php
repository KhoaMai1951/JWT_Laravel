<?php


namespace App\Http\Controllers;


use App\Http\Models\ImageForPost;
use App\Http\Models\Post;
use App\Http\Models\UserFollowUser;
use App\User;
use App\Utilities\S3Helper;
use App\Validators\PostValidator;
use App\Validators\UserValidator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;
use function PHPUnit\Framework\isEmpty;


class PostController extends Controller
{
    public function testDio(Request $request)
    {
        $flag = true;
        if (($request->file('files')) == null) {
            return Response::json([
                'message' => 'No image ',
            ], 200);
        }

        $count = -1;
        if ($files = $request->file('files')) {
            // loop through image array
            foreach ($files as $file) {
                $count++;
                if (S3Helper::S3UploadFile($file, (string)Str::uuid()) == false) {
                    $flag = false;
                    break;
                }
            }
        }

        if ($flag) {
            return Response::json([
                'message' => 'Image upload success',
                'files' => $request->file('files'),
                'countFile' => $count,
            ], 200);
        } else {
            return Response::json([
                'message' => 'Image upload failed',
            ], 400);
        }
    }

    public function submitPost(Request $request)
    {
        $validator = PostValidator::validateSubmitPost($request);
        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors(),
            ], 401);
        }

        //if ($request->file('images_for_post') != null) {
        if ($request->file('files') != null) {
            return $this->submitPostWithImage($request);
        } else {
            return $this->submitPostWithoutImage($request);
        }
    }

    public function submitPostWithImage(Request $request)
    {
        DB::beginTransaction();

        // validate the image
        $validator = PostValidator::validateImage($request);

        if ($validator->fails()) {
            DB::rollBack();
            return Response::json([
                'error' => $validator->getMessageBag()->toArray(),
            ], 400);
        }

        $post = new Post();
        //fields handle
        $post->title = $request->get('title');
        $post->content = $request->get('content');
        $post->user_id = $request->get('user_id');
        $post->save();
        //tag field handle
        $post->tags()->attach($request->get('tag_ids'));
        //image for post handle
        // handle multiple images
        $uploadIsErrorFlag = false;
        if ($files = $request->file('files')) {
            // loop through image array
            foreach ($files as $file) {
                //$result = $this->imageForPostHandleToS3($post, $file);
                $result = $this->imageForPostHandleToStorage($post, $file);
                // if upload file to s3 successful
                if ($result == true) {
                    $uploadIsErrorFlag = true;
                } // if fail, break the loop
                else {
                    $uploadIsErrorFlag = false;
                    break;
                }
            }
            // if there is no error happens, then return successful
            if ($uploadIsErrorFlag == true) {
                $post->update();
                DB::commit();
                return Response::json([
                    'message' => 'Post submit with image successfully',
                    'post_id' => $post->id,
                    'status' => true,
                ], 200);
            } // if there is error, return fail
            else {
                DB::rollBack();
                return Response::json([
                    'message' => 'Image upload failed',
                    'status' => false,
                ], 400);
            }
        }
        return null;
    }

    public function submitPostWithoutImage(Request $request)
    {
        DB::beginTransaction();

        $post = new Post();
        //fields handle
        $post->title = $request->get('title');
        $post->content = $request->get('content');
        $post->user_id = $request->get('user_id');
        $post->save();
        //tag field handle
        $post->tags()->attach($request->get('tag_ids'));

        DB::commit();
        return Response::json([
            'success' => true,
            'message' => 'Post without image submit successfully',
            'post_id' => $post->id,
        ], 200);
    }

    public function imageForPostHandleToS3($post, $file)
    {
        $fileName = (string)Str::uuid() . $file->getClientOriginalName();

        // if upload succeeded
        if (S3Helper::S3UploadFile($file, $fileName) == true) {
            $imageForPost = new ImageForPost();
            $imageLink = 'https://caycanhapi.s3.ap-southeast-1.amazonaws.com/' . $fileName;
            $imageForPost->url = $imageLink;
            $imageForPost->post()->associate($post);
            $imageForPost->save();
            return true;
        } // if upload failed
        else {
            return false;
        }
    }

    public function imageForPostHandleToStorage($post, $file)
    {
        // change new name
        $fileName = (string)Str::uuid() . $file->getClientOriginalName();
        // upload the image to local storage
        $this->uploadImageToStorage($file, $fileName);
        // create new image for post object and associate it with post object
        $imageForPost = new ImageForPost();
        $imageLink = '/storage/image_for_post/' . $fileName;
        $imageForPost->url = $imageLink;
        $imageForPost->post()->associate($post);
        $imageForPost->save();
        return true;

    }

    public function getPostById(Request $request)
    {
        $id = $request->get('id');

        $post = Post::find($id);

        $imagesForPost = $post->imagesForPost;

        // handle images for post dynamic url
        foreach ($imagesForPost as $image) {
            $image->dynamic_url = asset($image->url);
        }
        $tags = $post->tags;
        $user = $post->user;
        $commentsNumber = count(DB::table('comment')
            ->select('id')
            ->where('post_id', '=', $post->id)
            ->get());
        // avatar for user of the post
        $avatar_url = DB::table('image_for_user')
            ->select('url')
            ->where('user_id', '=', $post->user->id)
            ->first();
        if ($avatar_url != '' && $avatar_url != null)
            $post->user->avatar_url = asset($avatar_url->url);
        else $post->user->avatar_url = '';

        // CHECK LIKED POST OR NOT
        $postId = $post->id;
        $userId = $post->user->id;

        $result = DB::table('liked_post')
            ->select('post_id', 'user_id')
            ->where('post_id', '=', $postId)
            ->where('user_id', '=', $userId)
            ->get();
        $post->is_liked = !$result->isEmpty();

        if (!$post) {
            return Response::json([
                'message' => 'no post is found',
            ], 400);
        } else {
            return Response::json([
                //'post2' => $postTest,
                'post' => $post,
                'images_for_post' => $imagesForPost,
                'tags' => $tags,
                'user' => $user,
                'comments_number' => $commentsNumber,
            ], 200);
        }

    }

    // LẤY DS BÀI VIẾT CỦA USER CHO TRANG PROFILE THEO CỤM
    public function getAllPostsByChunkByUserId(Request $request)
    {
        $userId = $request->get('user_id');

        $posts = Post::select('id', 'title', 'created_at', 'like', DB::raw('SUBSTRING(content, 1, 70) AS short_content'))
            ->where('user_id', '=', $userId)
            ->orderBy('created_at', 'DESC')
            ->skip($request->get('skip'))->take($request->get('take'))
            ->get();

        foreach ($posts as $post) {
            $first_image_for_post = DB::table('image_for_post')
                ->where('post_id', '=', $post->id)
                ->first();

            if ($first_image_for_post != null)
                $post->image_url = asset($first_image_for_post->url);
            else $post->image_url = '';

            $commentsNumber = count(DB::table('comment')
                ->select('id')
                ->where('post_id', '=', $post->id)
                ->get());
            $post->comments_number = $commentsNumber;
        }

        foreach ($posts as $post) {
            $post->short_content .= '...';
        };
        return Response::json([
            //'post2' => $postTest,
            'posts' => $posts,

        ], 200);


    }

    // LẤY DS BÀI VIẾT USER ĐÃ SAVE CHO TRANG PROFILE THEO CỤM
    public function getAllSavedPostsByChunkByUserId(Request $request)
    {
        $userId = $request->get('user_id');

        // LẤY DS ID CỦA CÁC POST ĐƯỢC SAVE
        $postIdsResult = DB::table('saved_post')
            ->select('post_id')
            ->where('user_id', '=', $userId)
            ->get();
        $postIds = [];
        foreach ($postIdsResult as $value)
        {
            array_push($postIds, $value->post_id);
        }

        $posts = Post::select('id', 'title', 'created_at', 'like', DB::raw('SUBSTRING(content, 1, 70) AS short_content'))
            ->whereIn('id', $postIds)
            ->orderBy('created_at', 'DESC')
            ->skip($request->get('skip'))->take($request->get('take'))
            ->get();

        foreach ($posts as $post) {
            $first_image_for_post = DB::table('image_for_post')
                ->where('post_id', '=', $post->id)
                ->first();

            if ($first_image_for_post != null)
                $post->image_url = asset($first_image_for_post->url);
            else $post->image_url = '';

            $commentsNumber = count(DB::table('comment')
                ->select('id')
                ->where('post_id', '=', $post->id)
                ->get());
            $post->comments_number = $commentsNumber;
        }

        foreach ($posts as $post) {
            $post->short_content .= '...';
        };
        return Response::json([
            'posts' => $posts,

        ], 200);

    }

    // LẤY DS BÀI VIẾT CHO TRANG NEWSFEED THEO CỤM
    public function getAllPostsOfFollowingUsersByChunkByUserId(Request $request) {
        $userId = $request->get('user_id');
        // GET IDS OF FOLLOWING USER
        $queryFollowingUsersIds = UserFollowUser::select('user_id')
            ->where('follower_user_id', '=', $userId)
            ->get();
        $followingUsersIds = [];
        array_push($followingUsersIds, $userId);
        foreach ($queryFollowingUsersIds as $followingUsersId) {
            array_push($followingUsersIds, $followingUsersId->user_id);
        }

        // GET ALL POSTS BY CHUNK BY USER ID and FOLLOWING USERS IDS
        $posts = Post::select('id', 'user_id', 'title', 'created_at',
            'like', DB::raw('SUBSTRING(content, 1, 1000) AS short_content'))
            ->whereIn('user_id', $followingUsersIds)
            ->orderBy('created_at', 'DESC')
            ->skip($request->get('skip'))->take($request->get('take'))
            ->get();
        // GET ALL POSTS BY CHUNK OF THE USERS

        // IMAGES FOR POST + COMMENTS NUMBER + USER + SHORT CONTENT HANDLE
        foreach ($posts as $post) {
            // HANDLE SHORT CONTENT
            $post->short_content .= '...';

            // IMAGES FOR POST HANDLE
            $imagesForPost = $post->imagesForPost;

            // handle images for post dynamic url
            foreach ($imagesForPost as $image) {
                $image->dynamic_url = asset($image->url);
            }

            // COMMENTS NUMBER HANDLE
            $commentsNumber = count(DB::table('comment')
                ->select('id')
                ->where('post_id', '=', $post->id)
                ->get());
            $post->comments_number = $commentsNumber;

            // USER HANDLE
            $avatar_url = DB::table('image_for_user')
                ->select('url')
                ->where('user_id', '=', $post->user->id)
                ->first();
            if ($avatar_url != '' && $avatar_url != null)
                $post->user->avatar_url = asset($avatar_url->url);
            else $post->user->avatar_url = '';

            // CHECK LIKED POST OR NOT
            $postId = $post->id;
            $userId = $request->get('user_id');

            $result = DB::table('liked_post')
                ->select('post_id', 'user_id')
                ->where('post_id', '=', $postId)
                ->where('user_id', '=', $userId)
                ->get();
            $post->is_liked = !$result->isEmpty();
        }

        return Response::json([
            //'post2' => $postTest,
            'posts' => $posts,

        ], 200);
    }

    public function getAllPostsByChunk(Request $request)
    {
        // GET ALL POSTS BY CHUNK
        $posts = Post::select('id', 'user_id', 'title', 'created_at',
            'like', DB::raw('SUBSTRING(content, 1, 1000) AS short_content'))
            ->orderBy('created_at', 'DESC')
            ->skip($request->get('skip'))
            ->take($request->get('take'))
            ->get();

        // IMAGES FOR POST + COMMENTS NUMBER + USER + SHORT CONTENT HANDLE
        foreach ($posts as $post) {
            // HANDLE SHORT CONTENT
            $post->short_content .= '...';

            // IMAGES FOR POST HANDLE
            $imagesForPost = $post->imagesForPost;

            // handle images for post dynamic url
            foreach ($imagesForPost as $image) {
                $image->dynamic_url = asset($image->url);
            }

            // COMMENTS NUMBER HANDLE
            $commentsNumber = count(DB::table('comment')
                ->select('id')
                ->where('post_id', '=', $post->id)
                ->get());
            $post->comments_number = $commentsNumber;

            // USER HANDLE
            $avatar_url = DB::table('image_for_user')
                ->select('url')
                ->where('user_id', '=', $post->user->id)
                ->first();
            if ($avatar_url != '' && $avatar_url != null)
                $post->user->avatar_url = asset($avatar_url->url);
            else $post->user->avatar_url = '';

            // CHECK LIKED POST OR NOT
            $postId = $post->id;
            $userId = $request->get('user_id');

            $result = DB::table('liked_post')
                ->select('post_id', 'user_id')
                ->where('post_id', '=', $postId)
                ->where('user_id', '=', $userId)
                ->get();
            $post->is_liked = !$result->isEmpty();
        }

        return Response::json([
            //'post2' => $postTest,
            'posts' => $posts,

        ], 200);

    }

    public function uploadImageToStorage($file, $fileName)
    {
//        $path = storage_path('/uploads/images/store/') ;
//        $file->move($path, $fileName);
        Storage::disk('public')->putFileAs('image_for_post/', $file, $fileName);
    }

    public function likePost(Request $request)
    {
        $postId = $request->get('post_id');
        $userId = $request->get('user_id');

        $result = DB::table('liked_post')
            ->select('post_id', 'user_id')
            ->where('post_id', '=', $postId)
            ->where('user_id', '=', $userId)
            ->get();

        $post = Post::find($postId);

        // Nếu chưa like, sẽ like
        if ($result->isEmpty()) {
            // UPDATE TABLE TRUNG GIAN
            DB::table('liked_post')->insert([
                'post_id' => $postId,
                'user_id' => $userId,
            ]);
            // UPDATE TABLE POST CHO CỘT LIKE
            $post->like++;
            $post->update();

            return Response::json([
                //'result' => 'liked',
                'liked' => true,
                'likes' => Post::where('id', $postId)->select('like')->first(),
            ], 200);
        } // Nếu đã like, sẽ unlike
        else {
            // UPDATE TABLE TRUNG GIAN
            DB::table('liked_post')
                ->select('post_id', 'user_id')
                ->where('post_id', '=', $postId)
                ->where('user_id', '=', $userId)
                ->delete();
            // UPDATE TABLE POST CHO CỘT LIKE
            $post->like > 0 ? $post->like-- : null;
            $post->update();

            return Response::json([
                //'result' => 'unliked',
                'liked' => false,
                'likes' => Post::where('id', $postId)->select('like')->first(),
            ], 200);
        }
    }

    public function checkLikePostOrNot(Request $request)
    {
        $postId = $request->get('post_id');
        $userId = $request->get('user_id');

        $result = DB::table('liked_post')
            ->select('post_id', 'user_id')
            ->where('post_id', '=', $postId)
            ->where('user_id', '=', $userId)
            ->get();
        if ($result->isEmpty()) {
            return Response::json([
                'result' => false,
            ], 200);
        } else {
            return Response::json([
                'result' => true,
            ], 400);
        }
    }

    public function testSearch(Request $request)
    {
        $posts = Post::select('id', 'user_id', 'title', 'created_at', 'like', DB::raw('SUBSTRING(content, 1, 70) AS short_content'))
            ->where('content', 'LIKE', '%' . $request->get('keyword') . '%')
            ->orWhere('title', 'LIKE', '%' . $request->get('keyword') . '%')
            ->orderBy('created_at', 'DESC')
            ->skip($request->get('skip'))->take($request->get('take'))
            ->get();
        // IMAGES FOR POST + COMMENTS NUMBER + USER + SHORT CONTENT HANDLE
        foreach ($posts as $post) {
            // HANDLE SHORT CONTENT
            $post->short_content .= '...';

            // IMAGES FOR POST HANDLE
            $imagesForPost = $post->imagesForPost;

            // handle images for post dynamic url
            foreach ($imagesForPost as $image) {
                $image->dynamic_url = asset($image->url);
            }

            // COMMENTS NUMBER HANDLE
            $commentsNumber = count(DB::table('comment')
                ->select('id')
                ->where('post_id', '=', $post->id)
                ->get());
            $post->comments_number = $commentsNumber;

            // USER HANDLE
            $avatar_url = DB::table('image_for_user')
                ->select('url')
                ->where('user_id', '=', $post->user->id)
                ->first();
            if ($avatar_url != '' && $avatar_url != null)
                $post->user->avatar_url = asset($avatar_url->url);
            else $post->user->avatar_url = '';

            // CHECK LIKED POST OR NOT
            $postId = $post->id;
            $userId = $request->get('user_id');

            $result = DB::table('liked_post')
                ->select('post_id', 'user_id')
                ->where('post_id', '=', $postId)
                ->where('user_id', '=', $userId)
                ->get();
            $post->is_liked = !$result->isEmpty();
        }

        return Response::json([
            'posts' => $posts,
        ], 200);
    }

    public function savePost(Request $request)
    {
        $userId = $request->get('user_id');
        $postId = $request->get('post_id');
        $getRecord = DB::table('saved_post')
            ->where('user_id', '=', $userId)
            ->where('post_id', '=', $postId)
            ->get();

        if($getRecord->isEmpty())
        {
            DB::table('saved_post')
                ->insert([
                    'user_id' => $userId,
                    'post_id' => $postId,
                ]);
        }

        return Response::json([
            'message' => 'save post success',
        ], 200);

    }

    public function unSavePost(Request $request)
    {
        $userId = $request->get('user_id');
        $postId = $request->get('post_id');
        $getRecord = DB::table('saved_post')
            ->where('user_id', '=', $userId)
            ->where('post_id', '=', $postId)
            ->delete();
        return Response::json([
            'message' => 'unsave post success',
        ], 200);

    }
}
