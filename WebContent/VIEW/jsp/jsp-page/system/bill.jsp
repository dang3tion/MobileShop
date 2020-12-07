<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<jsp:include page="/VIEW/jsp/jsp-component/head-css.jsp" />
<c:url var="url" scope="application" value="/VIEW" ></c:url>
  <link rel="stylesheet" href="${url }/css/css-page/bill.css">
      <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet">
</head>

<body>
	<jsp:include page="/VIEW/jsp/jsp-component/menu.jsp"></jsp:include>
	<!-- Thanh menu loc du lieu va sap xep-->
	
	<!-- Page Content -->
	
<div class="center canTop" style="margin-top: 40px;">
    <table align="center" border="0" cellpadding="0" cellspacing="0"
        style="padding: 0 30px;background-color: #fff; -webkit-box-shadow: 0px 0px 14px -4px rgba(0, 0, 0, 0.2705882353);box-shadow: 0px 0px 14px -4px rgba(0, 0, 0, 0.2705882353);width: 100%;">
        <tbody>
            <tr>
                <td>
                    <table align="left" border="0" cellpadding="0" cellspacing="0" style="text-align: left;"
                    width="100%">
                    <tr>
                        <td style="text-align: center;">
                               <h2 style="margin-bottom: 20px;">Hóa đơn</h2>
                                <img width="20%" src="..//image/img_checkOut/bill.webp" alt="image bill" style="margin-bottom: 30px;">
                            </td>
                        </tr>
                    </table>
                            <div style="margin-left: 110px;text-align:left">
                                    <p style="font-size: 18px;"><b>Chào Nguyễn Văn Dũng,</b></p>
                                    <p style="font-size: 18px;"><b>Số điện thoại : 0953636841</b></p>
                                    <p style="font-size: 18px;">Đơn hàng của bạn đã được đặt hàng thành công</p>
                                    <p style="font-size: 18px;"><b>Mã đơn hàng : 267676GHERT105467</b></p>
                                    <p style="font-size: 18px;"><b>Địa chỉ giao hàng : 124/97 Khu phố 6,Phường Linh Trung,Quận Thủ Đức, Tp.HCM</b></p>
                            </div>

                    <!-- <table cellpadding="0" cellspacing="0" border="0" align="left"
                        style="width: 100%;margin-top: 10px; width: 80%  ; margin-bottom: 10px; margin-left: 110px;margin-right: 10px;">
                        <tbody >
                            <tr>
                                <td
                                    style="background-color: #fafafa;border: 1px solid #ddd;padding: 15px;letter-spacing: 0.3px;width: 45%;">
                                    <h5
                                        style="font-size: 16px; font-weight: 600;color: #000; line-height: 16px; padding-bottom: 13px; border-bottom: 1px solid #e6e8eb; letter-spacing: -0.65px; margin-top:0; margin-bottom: 13px;">
                                        Địa chỉ giao hàng</h5>
                                    <p
                                        style="text-align: left;font-weight: normal; font-size: 14px; color: #000000;line-height: 21px;    margin-top: 0;">
                                        124/97 Khu phố 6,<br> Phường Linh Trung <br>Quận Thủ Đức, tp.HCM</p>
                                </td>
                                <td></td>
                                <td
                                    style="background-color: #fafafa;border: 1px solid #ddd;padding: 15px;letter-spacing: 0.3px;width: 45%;">
                                    <h5
                                        style="font-size: 16px;font-weight: 600;color: #000; line-height: 16px; padding-bottom: 13px; border-bottom: 1px solid #e6e8eb; letter-spacing: -0.65px; margin-top:0; margin-bottom: 13px;">
                                        Địa chỉ thanh toán</h5>
                                    <p
                                        style="text-align: left;font-weight: normal; font-size: 14px; color: #000000;line-height: 21px;    margin-top: 0;">
                                        124/97 Khu phố 6,<br> Phường Linh Trung <br>Quận Thủ Đức, tp.HCM</p>
                                </td>
                            </tr>
                        </tbody>
                    </table> -->
                    <table class="order-detail" border="0" cellpadding="0" cellspacing="0" align="left"
                        style="width: 80%;    margin-bottom: 50px;margin-left: 110px;">
                        <tr align="left">
                            <th>SẢN PHẨM</th>
                            <th style="padding-left: 15px;">MÔ TẢ</th>
                            <th>SỐ LƯỢNG</th>
                            <th>THÀNH TIỀN </th>
                        </tr>
                        <tr>
                            <td>
                                <img src="../image/Product/IPhone8.jpg" alt="" width="80">
                            </td>
                            <td valign="top" style="padding-left: 15px;">
                                <h5 style="font-size: 14px; color:#444;margin-top:15px;    margin-bottom: 0px;">IPHONE 8-phiên bản bộ nhớ 512GB </h5>
                            </td>
                            <td valign="top" style="padding-left: 15px;">
                                <h5 style="font-size: 14px; color:#444;margin-top:15px;    margin-bottom: 0px;">Màu :
                                    <span> Đen</span> </h5>
                                <h5 style="font-size: 14px; color:#444;margin-top: 10px;">Số lượng : <span>1</span></h5>
                            </td>
                            <td valign="top" style="padding-left: 15px;">
                                <h5 style="font-size: 14px; color:#444;margin-top:15px"><b>9.000.000 VNĐ</b></h5>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="../image/Product/sony.jpg" alt="" width="80">
                            </td>
                            <td valign="top" style="padding-left: 15px;">
                                <h5 style="font-size: 14px; color:#444;margin-top:15px;    margin-bottom: 0px;">SONY XPERIA-Phiên bản quốc tế </h5>
                            </td>
                            <td valign="top" style="padding-left: 15px;">
                                <h5 style="font-size: 14px; color:#444;margin-top:15px;    margin-bottom: 0px;">Màu :
                                    <span> Đen</span> </h5>
                                <h5 style="font-size: 14px; color:#444;margin-top: 10px;">số lượng : <span>1</span></h5>
                            </td>
                            <td valign="top" style="padding-left: 15px;">
                                <h5 style="font-size: 14px; color:#444;margin-top:15px"><b>8.000.000VNĐ</b></h5>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <img src="../image/Product/samsung.png" alt="" width="80">
                            </td>
                            <td valign="top" style="padding-left: 15px;">
                                <h5 style="font-size: 14px; color:#444;margin-top:15px;    margin-bottom: 0px;">OPPO A8 PLUS-Phiên bản limited edition</h5>
                            </td>
                            <td valign="top" style="padding-left: 15px;">
                                <h5 style="font-size: 14px; color:#444;margin-top:15px;    margin-bottom: 0px;">Màu :
                                    <span> Đen</span> </h5>
                                <h5 style="font-size: 14px; color:#444;margin-top: 10px;">số lượng : <span>1</span></h5>
                            </td>
                            <td valign="top" style="padding-left: 15px;">
                                <h5 style="font-size: 14px; color:#444;margin-top:15px"><b>5.000.000 VNĐ</b></h5>
                            </td>
                        </tr>
                        <tr class="pad-left-right-space ">
                            <td colspan="2" align="left">
                                <p >Tổng:</p>
                            </td>
                            <td colspan="2" align="right">
                                <b>50.000.000<span> VNĐ</span></b>
                            </td>
                        <!-- <tr class="pad-left-right-space">
                            <td colspan="2" align="left">
                                <p style="font-size: 14px;">THUẾ :</p>
                            </td>
                            <td colspan="2" align="right">
                                <b>200.000VNĐ</b>
                            </td>
                        </tr>
                        <tr class="pad-left-right-space">
                            <td colspan="2" align="left">
                                <p style="font-size: 14px;">VAT 10% :</p>
                            </td>
                            <td colspan="2" align="right">
                                <b>2.220.000VNĐ</b>
                            </td>
                        </tr> -->
                        <tr class="pad-left-right-space">
                            <td colspan="2" align="left">
                                <p >Phí giao hàng :</p>
                            </td>
                            <td colspan="2" align="right">
                                <b>500.000<span> VNĐ</span></b>
                            </td>
                        </tr>
                        <!-- <tr class="pad-left-right-space">
                            <td colspan="2" align="left">
                                <p style="font-size: 14px;">giảm giá :</p>
                            </td>
                            <td colspan="2" align="right">
                                <b>3.000.000VNĐ</b>
                            </td>
                        </tr> -->
                        <tr class="pad-left-right-space ">
                            <td class="m-b-5" colspan="2" align="left">
                                <p">Tổng cộng :</p>
                            </td>
                            <td class="m-b-5" colspan="2" align="right">
                                <h5 style="color: red;text-align: right;">27.920.000 <span>VNĐ</span></h5>
                            </td>
                        </tr>

                    </table>

                </td>
            </tr>
        </tbody>
    </table>
    <table class="main-bg-light text-center top-0" align="center" border="0" cellpadding="0" cellspacing="0"
        width="100%">
        <tr>
            <td style="padding: 30px;">
                <a href="../index.html">
                    <button type="submit" class="btn btn-primary">TIẾP TỤC MUA HÀNG</button>
                </a>
                <table border="0" cellpadding="0" cellspacing="0" class="footer-social-icon" align="center"
                    class="text-center" style="margin-top:20px;">
                    <tr>
                        <td>
                            <a href="#"><img src="assets/images/email-temp/facebook.png" alt=""></a>
                        </td>
                        <td>
                            <a href="#"><img src="assets/images/email-temp/youtube.png" alt=""></a>
                        </td>
                        <td>
                            <a href="#"><img src="assets/images/email-temp/twitter.png" alt=""></a>
                        </td>
                        <td>
                            <a href="#"><img src="assets/images/email-temp/gplus.png" alt=""></a>
                        </td>
                        <td>
                            <a href="#"><img src="assets/images/email-temp/linkedin.png" alt=""></a>
                        </td>
                        <td>
                            <a href="#"><img src="assets/images/email-temp/pinterest.png" alt=""></a>
                        </td>
                    </tr>
                </table>
                <div style="border-top: 1px solid #ddd; margin: 20px auto 0;"></div>
                <table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin: 20px auto 0;">

                    <tr>
                        <td>
                            <!-- <a href="../index.html">
                                <button type="submit" class="btn btn-primary">TIẾP TỤC MUA HÀNG</button>
                            </a> -->
                        </td>
                    </tr>
                    <tr>
                        <td>
                           
                        </td>
                    </tr>
                  
                </table>
            </td>
        </tr>
    </table>
</div>

	<!-- /.container -->



	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>
	<!-- Bootstrap core JavaScript -->

	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>