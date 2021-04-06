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
                ], 200);
            } // if there is error, return fail
            else {
                DB::rollBack();
                return Response::json([
                    'message' => 'Image upload failed',
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
        $imageLink = '/uploads/images/store/' . $fileName;
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
        foreach ($imagesForPost as $image)
        {
            $image->dynamic_url = asset($image->url);
        }
        $tags = $post->tags;
        $user = $post->user;
        if (!$post) {
            return Response::json([
                'message' => 'no post is found',
            ], 400);
        } else {
            return Response::json([
                'post' => Post::find($id),
                'images_for_post' => $imagesForPost,
                'tags' => $tags,
                'user' => $user,
            ], 200);
        }

    }

    public function uploadImageToStorage($file, $fileName)
    {
        $path = public_path() . '/uploads/images/store/';
        $file->move($path, $fileName);
    }
}
