<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">ADMIN</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <!-- CÂY CẢNH -->
            <li class="nav-item dropdown active">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Bách khoa cây cảnh
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/admin/server_plant/list_plant">Danh sách cây cảnh</a>
                    <a class="dropdown-item" href="/admin/server_plant/list_plant_contribute">Yêu cầu đóng góp cây cảnh</a>
                    <a class="dropdown-item" href="/admin/server_plant/list_plant_edit">Yêu cầu chỉnh sửa cây cảnh</a>
                    <a class="dropdown-item" href="/admin/server_plant/add_plant">Thêm mới</a>
                </div>
            </li>
            <!-- DUYỆT CHUYÊN GIA -->
            <li class="nav-item dropdown active">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Duyệt chuyên gia
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/admin/expert_pending/list_pending">Danh sách yêu cầu duyệt chuyên
                        gia</a>
                    <a class="dropdown-item" href="/admin/expert_pending/list_expert">Danh sách chuyên gia</a>
                </div>
            </li>
        </ul>

        @if(Route::current()->getName() == 'server_plant.list_plant')
            <form type="GET" class="form-inline my-2 my-lg-0">
                <input name='keyword' class="form-control mr-sm-2" type="search" placeholder="Tìm cây cảnh" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Tìm</button>
            </form>
        @endif

    </div>
</nav>
