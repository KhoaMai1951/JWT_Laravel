<?php


namespace App\Validators;


 use Illuminate\Http\Request;
 use Illuminate\Support\Facades\Validator;

class UserValidator
{
    public static function validateRegister(Request $request){
        return Validator::make($request->all(), [
            'username' => 'required',
            'name' => 'required',
            'email' => 'required|email|unique:user',
            'password' => 'required',
        ]);
    }
}
