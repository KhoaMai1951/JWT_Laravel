<?php

namespace App\Http\Controllers;

use App\Http\Models\EmailActivate;
use App\Http\Repositories\EmailActiveRepository;
use App\Notifications\SignupActivate;
use App\User;
use App\Validators\UserValidator;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;
use PharIo\Manifest\Email;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param \App\User $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\User $user
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\User $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\User $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        //
    }

    public function appLogin(Request $request)
    {
        $validate_admin = DB::table('user')
            ->select('email', 'password')
            ->where('email', $request['email'])
            ->first();

        if ($validate_admin && Hash::check($request['password'], $validate_admin->password)) {
            // here you know data is valid
            return Response::json([
                'status' => 'ok'
            ], 200);
        } else {
            return Response::json([
                'status' => 'not ok'
            ], 500);
        }
    }

    public function checkLogin($user)
    {
        $password = request('password');
        if ($user != null)
            return Hash::check($password, $user->password);
        else return false;
    }

    public function login()
    {
        $email = request('email');
        $user = User::withTrashed()
            ->select('email', 'password', 'deleted_at')
            ->where('email', 'LIKE', $email)
            ->first();

        if ($this->checkLogin($user)) {
            //$user = Auth::user();
            if ($user->deleted_at == null) {
                $success['token'] = $user->createToken('appToken')->accessToken;
                //After successful authentication, return json parameters
                return response()->json([
                    'success' => true,
                    'token' => $success,
                    'user' => $user
                ]);
            } else {
                return response()->json(
                    [
                        'success' => false,
                        'message' => 'Tài khoản bị khóa',
                    ],
                    401,
                    ['Content-type' => 'application/json;charset=utf-8'],
                    JSON_UNESCAPED_UNICODE);
            }
        } else {
            //if authentication is unsuccessful
            return response()->json(
                [
                    'success' => false,
                    'message' => 'Sai email hoặc mật khẩu',
                ],
                401,
                ['Content-type' => 'application/json;charset=utf-8'],
                JSON_UNESCAPED_UNICODE);
        }
    }

    // register new account
    public function register(Request $request)
    {
        // validate if email is unique
        $validator = UserValidator::validateRegister($request);
        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors(),
            ], 401);
        }
        // table email_activate có email vừa nhập?
        $emailActivate = EmailActiveRepository::getByEmail($request->get('email'));
        if ($emailActivate != null) {
            EmailActiveRepository::deleteByEmail($request->get('email'));
        }
        //tạo mới EmailActivate bao gồm email và activation token
        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        // create a 4 digits code to email the user
        $input['activation_token'] = rand(pow(10, 4 - 1), pow(10, 4) - 1);
        $newEmailActivate = EmailActivate::create($input);

        //send email to verify
        MailController::sendVerificationEmail($newEmailActivate->activation_token, $newEmailActivate->email);
        //$success['token'] = $user->createToken('appToken')->accessToken;
        return response()->json(
            [
                'success' => true,
                'message' => 'Xin kiểm tra email để lấy mã xác nhận',
                'user' => $newEmailActivate
            ],
            200,
            ['Content-type' => 'application/json;charset=utf-8'],
            JSON_UNESCAPED_UNICODE);
    }

    public function activateAccount(Request $request)
    {
        //lấy record trong table email_active theo email
        $emailActivate = EmailActiveRepository::getByEmail($request->get('email'));
        // activation token trong record = activation token trong request?
        if ($emailActivate->activation_token == $request->get('activation_token')) {
            // tạo mới user theo record trong email_active
            $user = new User();
            $user->username = $emailActivate->username;
            $user->email = $emailActivate->email;
            $user->password = $emailActivate->password;
            $user->name = $emailActivate->name;
            $success['token'] = $user->createToken('appToken')->accessToken;
            $user->save();
            // xóa record trong table email_active
            EmailActiveRepository::deleteByEmail($request->get('email'));
            // trả về token cho app
            return response()->json([
                'success' => true,
                'token' => $success,
                'user' => $user
            ]);
        } else {
            return response()->json([
                'message' => 'wrong activation token',
            ]);
        }
    }

    public function logout(Request $res)
    {
        if (Auth::user()) {
            $user = Auth::user()->token();
            $user->revoke();

            return response()->json([
                'success' => true,
                'message' => 'Logout successfully'
            ]);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Unable to Logout'
            ]);
        }
    }

    public function getData()
    {
        return Response::json([
            'data' => '1111'
        ], 200);
    }

    /* public function uploadImage(Request $request)
     {

         if (!$request->hasFile('image')) {
             return response()->json(['upload_file_not_found'], 400);
         }
         $file = $request->file('image');
         if (!$file->isValid()) {
             return response()->json(['invalid_file_upload'], 400);
         }
         $path = public_path() . '/uploads/images/store/';
         $file->move($path, $file->getClientOriginalName());
         return response()->json(compact('path'));
     }*/

}
