<?php


namespace App\Http\Controllers;

use App\Http\Models\ServerPlant;
use App\Http\Services\ServerPlantService;
use App\Http\Validators\PostValidator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

class ServerPlantController extends Controller
{
    private $serverPlantService;

    public function __construct(
        ServerPlantService $serverPlantService
    )
    {
        $this->serverPlantService = $serverPlantService;
    }

    // SEEDER
    public function seeder()
    {
        for ($i = 1; $i < 13; $i++) {
            $serverPlant = new ServerPlant();
            $serverPlant->common_name = Str::random(10);
            $serverPlant->scientific_name = Str::random(10);
            $serverPlant->image_url = '/storage/image_for_server_plant/' . $i . '.png';
            $serverPlant->pet_friendly = (bool)random_int(0, 1);
            $serverPlant->difficulty = random_int(0, 5);
            $serverPlant->water_level = random_int(0, 5);
            $serverPlant->information = Str::random(100);
            $serverPlant->sunlight = Str::random(100);
            $serverPlant->feed_information = Str::random(100);
            $serverPlant->common_issue = Str::random(100);
            $serverPlant->min_temperature = rand(20, 22);
            $serverPlant->max_temperature = rand(29, 33);
            $serverPlant->min_ph = rand(50, 60) / 10;
            $serverPlant->max_ph = rand(60, 70) / 10;
            $serverPlant->save();
        }
    }

    //TRANG LIST PLANT/
    public function listPlant() {
        $list = $this->serverPlantService->getPlantListByChunk(0, 100, '');
        return view('/admin_pages/server_plant/list_plant')->with('list', $list);
    }

    //TRANG LIST PLANT ĐÓNG GÓP
    public function listPlantContributePage() {
        $list = $this->serverPlantService->getPlantListContributeByChunk(0, 100, '');
        return view('/admin_pages/server_plant/list_plant_contribute',[
            'list' => $list,
        ]);
    }

    //TRANG CHI TIẾT PLANT
    public function detailPage($id)
    {
        $plant = $this->serverPlantService->getPlantDetail($id);
        return view('/admin_pages/server_plant/detail')->with('plant', $plant);
    }

    //TRANG CHI TIẾT PLANT CONTRIBUTE
    public function detailContributePage($id)
    {
        $plant = $this->serverPlantService->getPlantDetail($id);
        return view('/admin_pages/server_plant/detail_contribute')->with('plant', $plant);
    }

    //UPDATE CHI TIẾT PLANT
    public function adminUpdate(Request $request){
        $input = $request->except(['_token']);
        $this->serverPlantService->update($input);
        return redirect('/admin/server-plant/detail/' . $input['id'])->with(['saved' => true]);
    }

    // LẤY DS THÔNG TIN CÂY CẢNH THEO CỤM
    public function getPlantListByChunk(Request $request)
    {
        $skip = $request->get('skip');
        $take = $request->get('take');
        $keyword = $request->get('keyword');
        $plants = $this->serverPlantService->getPlantListByChunk($skip, $take, $keyword);

        return Response::json([
            'plants' => $plants,
        ], 200);
    }

    // LẤY CHI TIẾT THÔNG TIN CÂY CẢNH
    public function getPlantDetail(Request $request)
    {
        return Response::json([
            'plant' => $this->serverPlantService->getPlantDetail($request->get('id')),
        ], 200);
    }

    // UPLOAD CÂY CẢNH MỚI
    public function uploadPlant(Request $request){
        $input = $request->except('files');
        DB::beginTransaction();
        // validate the image
        $validator = PostValidator::validateImage($request);
        if ($validator->fails()) {
            DB::rollBack();
            return Response::json([
                'error' => $validator->getMessageBag()->toArray(),
            ], 400);
        }
        //image handle
        if($request->file('files') != null)
            foreach ($request->file('files') as $file) {
            //image handle ==============================
            // change new name
            $fileName = (string)Str::uuid() . $file->getClientOriginalName();
            // upload the image to local storage
            Storage::disk('public')->putFileAs('image_for_server_plant/', $file, $fileName);
            $input['image_url'] = '/storage/image_for_server_plant/'.$fileName;
        }
        //insert new record
        $id = $this->serverPlantService->create($input);
        DB::commit();
        return Response::json([
            'message' => 'Plant submit successfully',
            'status' => true,
            'id' => $id,
        ], 200);
    }
}
