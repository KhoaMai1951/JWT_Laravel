<?php


namespace App\Http\Controllers;

use App\Http\Models\ServerPlant;
use App\Http\Services\ServerPlantService;
use Illuminate\Support\Facades\Response;
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
        for ($i = 1; $i < 7; $i++) {
            $serverPlant = new ServerPlant();
            $serverPlant->common_name = Str::random(10);
            $serverPlant->scientific_name = Str::random(10);
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
}
