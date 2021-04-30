<?php


namespace App\Http\Controllers;

use App\Http\Models\ServerPlantUserEdit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;

class ServerPlantUserEditController extends Controller
{
    // UPLOAD EDIT CÂY CẢNH
    public function uploadPlant(Request $request){
        $input = $request->all();
        DB::beginTransaction();
        //insert new record
        $id = ServerPlantUserEdit::create($input)->id;;
        DB::commit();
        return Response::json([
            'message' => 'Plant edit successfully',
            'status' => true,
            'id' => $id,
        ], 200);
    }
}
