@extends('layouts.admin_layout')

@section('title', 'Chi tiết cây cảnh')

@section('content')
    <style>
        .column {
            float: left;
            width: 33.33%;
            padding: 5px;
        }
    </style>
    <div class="card">
        <h5 class="card-header">Chi tiết chờ duyệt chuyên gia </h5>
        @if(session()->has('saved'))
            <div class="alert alert-success">
                <strong>Đã update</strong>
            </div>
        @endif
        <div class="card-body">
            <form method="POST" action="/admin/server-plant/admin_update">
                @csrf

                <div class="form-group ">
                    <!--ID -->
                    <input hidden type="text"
                           name="id" value="{{ $pendingExpert->id }}" autocomplete="name" autofocus>
                    <!-- Bio -->
                    <label><b>Bio: </b></label> <p>{{$pendingExpert->bio}}</p>

                    <!-- Experience in -->
                    <label><b>Chuyên về: </b></label> <p>{{$pendingExpert->experience_in}}</p>

                    <!-- HÌNH ẢNH-->
                    <label><b>Hình ảnh: </b></label>
                    <div class="row">
                        <div class="column">
                            <img src="https://img-9gag-fun.9cache.com/photo/ajmOyWG_460swp.webp" alt="Snow" style="width:100%">
                        </div>
                        <div class="column">
                            <img src="https://img-9gag-fun.9cache.com/photo/ajmOyWG_460swp.webp" alt="Forest" style="width:100%">
                        </div>
                        <div class="column">
                            <img src="https://img-9gag-fun.9cache.com/photo/ajmOyWG_460swp.webp" alt="Mountains" style="width:100%">
                        </div>
                        <div class="column">
                            <img src="https://img-9gag-fun.9cache.com/photo/ajmOyWG_460swp.webp" alt="Mountains" style="width:100%">
                        </div>
                        <div class="column">
                            <img src="https://img-9gag-fun.9cache.com/photo/ajmOyWG_460swp.webp" alt="Mountains" style="width:100%">
                        </div>
                    </div>

                </div>

                <a class="btn btn-danger ml-2" href="/admin/server_plant/list_plant" role="button">Quay lại</a>

                <a class="btn btn-danger ml-2" href="" role="button">Duyệt</a>

                <a class="btn btn-danger ml-2" href="" role="button">Xóa</a>

            </form>
        </div>
@endsection

