<?php

namespace App\Http\Controllers;

use App\Http\Interfaces\FilePathInterface;
use App\Http\Models\EmailActivate;
use App\Http\Models\Post;
use App\Http\Repositories\EmailActiveRepository;
use App\Http\Traits\FileUploadTrait;
use App\Http\Validators\ImageValidator;
use App\Notifications\SignupActivate;
use App\User;
use App\Validators\PostValidator;
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

class UserController extends Controller implements FilePathInterface
{

    use FileUploadTrait;

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

    public function login(Request $request)
    {
        $rules = [
            'email' => 'required',
            'password' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);

        $email = request('email');
        $user1 = User::withTrashed()
            //->select('id', 'email', 'password', 'deleted_at', 'name', 'username')
            ->select()
            ->where('email', 'LIKE', $email)
            ->first();

        if (Auth::attempt(['email' => request('email'), 'password' => request('password')])) // if ($this->checkLogin($user))
        {
            $user = Auth::user();
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
            'data' => '1'
        ], 200);
    }

    public function getUserInfoById(Request $request)
    {
        $user = DB::table('user')
            ->select('username', 'email', 'name', 'bio', 'id')
            ->where('id', '=', $request->get('id'))
            ->get();

        $avatarLink = DB::table('image_for_user')
            ->select('url')
            ->where('user_id', '=', $request->get('id'))
            ->first();

        $followers = DB::table('user_follow_user')
            ->select('follower_user_id')
            ->where('user_id', '=', $request->get('id'))
            ->get();
        $numberOfFollowers = count($followers);

        $following = DB::table('user_follow_user')
            ->select('user_id')
            ->where('follower_user_id', '=', $request->get('id'))
            ->get();
        $numberOfFollowing = count($following);

        if ($avatarLink != null)
            $avatarTemp = $avatarLink;
        else $avatarTemp = '';

        return response()->json(
            [
                'user' => $user,
                'avatar_link' => $avatarTemp != null ? asset($avatarTemp->url) : '',
                'number_of_followers' => $numberOfFollowers,
                'number_of_following' => $numberOfFollowing,
            ],
            200,
            ['Content-type' => 'application/json;charset=utf-8'],
            JSON_UNESCAPED_UNICODE);
    }

    public function checkFollow(Request $request)
    {
        $currentUserId = $request->get('current_user_id');
        $userId = $request->get('user_id');

        $result = DB::table('user_follow_user')
            ->select('user_id', 'follower_user_id')
            ->where('user_id', '=', $userId)
            ->where('follower_user_id', '=', $currentUserId)
            ->get();
        if ($result->isEmpty()) {
            return Response::json([
                'result' => false,
            ], 200);
        } else {
            return Response::json([
                'result' => true,
            ], 200);
        }
    }

    public function followUser(Request $request)
    {
        $currentUserId = $request->get('current_user_id');
        $userId = $request->get('user_id');

        $result = DB::table('user_follow_user')
            ->select('user_id', 'follower_user_id')
            ->where('user_id', '=', $userId)
            ->where('follower_user_id', '=', $currentUserId)
            ->get();

        // Nếu chưa follow, sẽ follow
        if ($result->isEmpty()) {
            // UPDATE TABLE TRUNG GIAN
            DB::table('user_follow_user')->insert([
                'follower_user_id' => $currentUserId,
                'user_id' => $userId,
            ]);

            return Response::json([
                //'result' => 'liked',
                'follow' => true,

            ], 200);
        } // Nếu đã follow, sẽ unfollow
        else {
            // UPDATE TABLE TRUNG GIAN
            DB::table('user_follow_user')
                ->select('follower_user_id', 'user_id')
                ->where('user_id', '=', $userId)
                ->where('follower_user_id', '=', $currentUserId)
                ->delete();

            return Response::json([
                //'result' => 'unliked',
                'follow' => false,

            ], 200);
        }
    }

    public function uploadAvatar(Request $request)
    {
        DB::beginTransaction();

        // validate the image
        $validator = ImageValidator::validateImage($request);

        if ($validator->fails()) {
            DB::rollBack();
            return Response::json([
                'error' => $validator->getMessageBag()->toArray(),
            ], 400);
        }

        // get avatar link
        $avatarLink = DB::table('image_for_user')
            ->select('url')
            ->where('user_id', '=', $request->get('user_id'))
            ->first();

        // check if user already has an avatar
        // if user already has avatar
        if ($avatarLink != '') {
            //get old avatar name
            preg_match('/[^\/]*$/', $avatarLink->url, $matches);
            $oldAvatar = $matches[0];
            //insert new avatar
            if ($files = $request->file('files')) {
                // loop through image array
                foreach ($files as $file) {
                    $this->imageForUserHandleToStorage(
                        $request->get('user_id'),
                        $file,
                        UserController::IMAGE_FOR_USER_DB_URL,
                        UserController::IMAGE_FOR_USER_PATH_TO_PUT_FILE
                    );
                }
            }
            //delete old avatar
            Storage::disk('public')->delete('image_for_user/' . $oldAvatar);
            DB::table('image_for_user')
                ->where('url', 'LIKE', $avatarLink->url)
                ->delete();

        } // if user doesn't have avatar
        else {
            if ($files = $request->file('files')) {
                // loop through image array
                foreach ($files as $file) {
                    $this->imageForUserHandleToStorage(
                        $request->get('user_id'),
                        $file,
                        UserController::IMAGE_FOR_USER_DB_URL,
                        UserController::IMAGE_FOR_USER_PATH_TO_PUT_FILE
                    );
                }
            }
        }
        DB::commit();
        return response()->json(
            [
                'status' => 'ok'
            ],
            200
        );
    }
}
