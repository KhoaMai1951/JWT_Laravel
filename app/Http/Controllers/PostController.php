<?php


namespace App\Http\Controllers;


use App\Http\Models\ImageForPost;
use App\Http\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;


class PostController extends Controller
{
    public function testAttachTag()
    {
        $post = new Post();
        $post->save();
        $post->tags()->attach([1, 2, 3, 4, 5]);
        $post->update();
    }

    public function testImageUploadPage()
    {
        return view("/test/test_upload");
    }

    public function submitPost(Request $request)
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
        try {
            $this->validate($request, ['image_for_post' => 'required|image|mimes:jpeg,jpg,png,gif|max:50']);
        } catch (ValidationException $e) {
            DB::rollBack();
            return Response::json([
                'error' => 'image error'
            ], 400);
        }
        if ($request->hasfile('image_for_post')) {
            $file = $request->file('image_for_post');
            $name = (string)Str::uuid() . $file->getClientOriginalName();
            $filePath = $name;

            Storage::disk('s3')->put($filePath, file_get_contents($file), 'public');
            // new image for post obj
            $imageForPost = new ImageForPost();
            $imageForPost->url = 'https://caycanhapi.s3.ap-southeast-1.amazonaws.com/' . $name;
            $imageForPost->post()->associate($post);
            $imageForPost->save();

            //update post
            $post->update();
            DB::commit();

            return Response::json([
                'message' => 'Image upload successfully',
                'url' => 'https://caycanhapi.s3.ap-southeast-1.amazonaws.com/' . $name,
            ], 200);
        }
        return null;
    }

    public function getPostById(Request $request)
    {
        $id = $request->get('id');

        $post = Post::find($id);
        $imagesForPost = $post->imagesForPost;
        if(!$post)
        {
            return Response::json([
                'message' => 'no post is found',
            ], 400);
        }
        else {
            return Response::json([
                'post' => Post::find($id),
                'images_for_post' => $imagesForPost,
            ], 200);
        }

    }
}
