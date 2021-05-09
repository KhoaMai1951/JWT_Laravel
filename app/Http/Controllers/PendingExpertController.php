<?php


namespace App\Http\Controllers;

use App\Http\Models\ImageForPendingExpert;
use App\Http\Models\PendingExpert;
use App\Http\Services\PendingExpertService;
use App\Http\Services\UserService;
use App\Http\Validators\PostValidator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class PendingExpertController extends Controller
{
    private $pendingExpertService;
    private $userService;

    public function __construct(
        PendingExpertService $pendingExpertService,
        UserService $userService
    )
    {
        $this->pendingExpertService = $pendingExpertService;
        $this->userService = $userService;
    }

    // HANDLE REQUEST EXPERT
    public function handleRequestExpert(Request $request){
        $pendingExpert = $this->pendingExpertService->find($request->get('user_id'));

        // NẾU USER CHƯA REQUEST LÀM EXPERT
        if($pendingExpert == null)
            return $this->requestExpert($request);
        else {
            return Response::json([
                'already_requested' => true,
            ], 200);
        }
    }

    // REQUEST EXPERT
    public function requestExpert(Request $request)
    {
        //validate img
        $validator = PostValidator::validateImage($request);
        if ($validator->fails()) {
            DB::rollBack();
            return Response::json([
                'error' => $validator->getMessageBag()->toArray(),
            ], 400);
        }
        $input = $request->except('files');
        $pendingExpert = PendingExpert::create($input);
        //image handle
        if ($request->file('files') != null)
            foreach ($request->file('files') as $file) {
                //image handle ==============================
                // change new name
                $fileName = (string)Str::uuid() . $file->getClientOriginalName();
                // upload the image to local storage
                Storage::disk('public')->putFileAs('image_for_pending_expert/', $file, $fileName);
                // save url to db
                $imageInput['url'] = '/storage/image_for_pending_expert/' . $fileName;
                $imageInput['pending_expert_id'] = $pendingExpert->id;
                ImageForPendingExpert::create($imageInput);
            }
        return Response::json([
            'message' => 'Request successfully',
            'status' => true,
            'request_id' => $pendingExpert->id,
        ], 200);
    }

    // GET DETAIL BY ID
    public function getDetail(Request $request)
    {
        $requestExpert = PendingExpert::find($request->get('id'));
        //image
        foreach($requestExpert->imagesForPendingExpert as $image)
        {
            $image->dynamic_url = asset($image->url);
        }
        if ($request != null) {
            return Response::json([
                'request_expert' => $requestExpert,
            ], 200);
        }
        else {
            return Response::json([
                'request_expert' =>  null,
            ], 500);
        }
    }

    // KIỂM TRA TRẠNG THÁI (CHƯA LÀ EXPERT / PENDING EXPERT / ĐÃ LÀ EXPERT)
    // 0, 1, 2
    public function checkStatus(Request $request)
    {
        //1.CHECK ĐÃ LÀ EXPERT
        $roleId = $this->userService->getRoleId($request->get('user_id'));
        if($roleId == 2)
        {
            return Response::json([
                'status' => 2,
                'message' => 'is expert',
            ], 200);
        }
        //2.CHECK ĐANG PENDING
        if($this->pendingExpertService->find($request->get('user_id')))
        {
            return Response::json([
                'status' => 1,
                'message' => 'pending',
            ], 200);
        }
        //3.CHECK CHƯA LÀ EXPERT
        return Response::json([
            'status' => 0,
            'message' => 'not expert',
        ], 200);
    }

    // PENDING LIST PAGE
    public function pendingExpertPage() {
        $pendings = PendingExpert::paginate(10);
        foreach ($pendings as $pending)
        {

            $pending->username = 'a';
        }
        return view('/admin_pages/pending_expert/list_pending',compact('pendings'));
    }

    // PENDING EXPERT DETAIL PAGE
    public function pendingExpertDetailPage($id) {

        $pendingExpert = PendingExpert::find($id);

        return view('/admin_pages/pending_expert/detail_pending')->with('pendingExpert', $pendingExpert);
    }
}
