<?php


namespace App\Http\Controllers;


use App\Http\Models\ImageForPost;
use App\Http\Models\Post;
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

//        // TEST LẤY 1 PHẦN CONTENT
//        $postTest = DB::table('post')->select(DB::raw('SUBSTRING(content, 1, 70) AS short_content'))
//        ->where('id', '=', $request->get('id'))
//        ->get();


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

    public function getAllPostsByChunkByUserId(Request $request)
    {
        $userId = $request->get('user_id');

        $posts = Post::select('id', 'title', 'created_at', 'like', DB::raw('SUBSTRING(content, 1, 70) AS short_content'))
            ->where('user_id', '=', $userId)
            ->orderBy('created_at', 'DESC')
            ->skip($request->get('skip'))->take($request->get('take'))
            ->get();

       foreach ($posts as $post)
       {
           $first_image_for_post = DB::table('image_for_post')
               ->where('post_id', '=', $post->id)
               ->first();

           if($first_image_for_post != null)
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
            ], 200);
        }
    }
}
