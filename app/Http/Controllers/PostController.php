<?php


namespace App\Http\Controllers;


use App\Http\Models\ImageForPost;
use App\Http\Models\Post;
use App\Utilities\S3Helper;
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
        if ($files = $request->file('files')) {
            // loop through image array
            foreach ($files as $file) {
                S3Helper::S3UploadFile($file, (string)Str::uuid());
            }
        }
    }

    public function submitPost(Request $request)
    {
        if ($request->file('images_for_post') != null) {
            return $this->submitPostWithImage($request);
        } else {
            return $this->submitPostWithoutImage($request);
        }
    }

    public function submitPostWithImage(Request $request)
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
        //image for post handle
        // validate the image
        $validator = Validator::make(
            $request->all(), [
            'images_for_post.*' => 'required|mimes:jpg,jpeg,png,bmp,jpg,gif|max:100'
        ], ['images_for_post .*.required' => 'Please upload an image',
                'images_for_post .*.mimes' => 'Only jpeg,png and bmp images are allowed',
                'images_for_post .*.max' => 'Sorry!Maximum allowed size for an image is 20MB',]
        );
        if ($validator->fails()) {
            DB::rollBack();
            return Response::json([
                'error' => $validator->getMessageBag()->toArray(),
            ], 400);
        }

        // handle multiple images
        $uploadIsErrorFlag = false;
        if ($files = $request->file('images_for_post')) {
            // loop through image array
            foreach ($files as $file) {
                $result = $this->imageForPostHandle($post, $file);
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
                    'message' => 'Post submit successfully',
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
            'message' => 'Post submit successfully',
        ], 200);
    }

    public function imageForPostHandle($post, $file)
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

    public function getPostById(Request $request)
    {
        $id = $request->get('id');

        $post = Post::find($id);
        $imagesForPost = $post->imagesForPost;
        if (!$post) {
            return Response::json([
                'message' => 'no post is found',
            ], 400);
        } else {
            return Response::json([
                'post' => Post::find($id),
                'images_for_post' => $imagesForPost,
            ], 200);
        }

    }
}
