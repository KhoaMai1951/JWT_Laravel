<?php


namespace App\Http\Services;


use App\Http\Helpers\ImageUrlHandle;
use App\Http\Models\ServerPlant;
use Illuminate\Http\Request;

class ServerPlantService
{


    // LẤY DS THÔNG TIN CÂY CẢNH THEO CỤM
    public function getPlantListByChunk($skip, $take, $keyword){
        $plants = ServerPlant::select('id', 'common_name', 'scientific_name', 'image_url')
            ->where('common_name', 'LIKE', '%' . $keyword .'%')
            ->orWhere('scientific_name', 'LIKE', '%' . $keyword .'%')
            ->orderBy('common_name', 'ASC')
            ->skip($skip)
            ->take($take)
            ->get();
        foreach ($plants as $plant)
        {
            $plant->image_url = ImageUrlHandle::getDynamicImageUrl($plant->image_url);
        }
        return $plants;
    }

    // LẤY CHI TIẾT THÔNG TIN CÂY CẢNH
    public function getPlantDetail($id)
    {
        $plant = ServerPlant::find($id);
        $plant->temperature_range = [$plant->min_temperature, $plant->max_temperature];
        $plant->ph_range = [$plant->min_ph, $plant->max_ph];
        $plant->image_url = ImageUrlHandle::getDynamicImageUrl($plant->image_url);
        $plant->makeHidden(['min_temperature', 'max_temperature', 'min_ph', 'max_ph']);

        return $plant;
    }
}
