<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<div class="col-sm-4">

    <ul class="list-group mt-3 ps-menu">
        <a href="#">
            <li onclick="switchPage(id)" id="ThongTinCaNhan" class="list-group-item active"><i
                    class="fa fa-id-card"></i>
                Thông tin
                cá nhân</li>
        </a> <a href="profile_receipt.html">
        <li onclick="switchPage(id)" id="DonDatHang" class="list-group-item"><i class="fas fa-box"></i> Đơn hàng đã
            đặt <span class="badge badge-secondary">
                103</span></li>
    </a> <a href="../GioHang&checkout_Page/gioHang.html">
        <li onclick="switchPage(id)" id="GioHangCuaToi" class="list-group-item"><i class="fas fa-shopping-cart"></i>
            Giỏ hàng
            của tôi <span class="badge badge-danger"> 39</span></li>
    </a>
        </a> <a href="../Login_Page/sign-in/signIn.html">
        <li onclick="switchPage(id)" id="SanPhamDoiTra" class="list-group-item"><i class="fas fa-sign-out-alt"></i> Đăng xuất




        </li>
    </a>
    </ul>



    <script>
        $(document).ready(function () {
            $('.toast').toast('show');
        });
    </script>

</div>