<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<jsp:include page="/VIEW/jsp/jsp-component/head-css.jsp" />
<c:url var="url" scope="session" value="/VIEW"></c:url>
<link rel="stylesheet" href="${url}/css/css-page/contact.css">
</head>

<body>

  
  <!-- Thanh menu tim kiem -->
   <jsp:include page="/VIEW/jsp/jsp-component/menu.jsp"></jsp:include>
  
  <!-- Thanh menu loc du lieu va sap xep-->
  <jsp:include page="/VIEW/jsp/jsp-component/filter.jsp"></jsp:include>
  <!-- Page Content -->
  <div class="container">

    <div class="row">


      <!--Slider san pham noi bat-->
      <div class="hot-products row col-12 bordertitle">
        <div class="col-lg-12">
          <div class="title ">
            <div class="title float-left">
              <h3>Sản phẩm nổi bật</h3>
            </div>
            <div class="title float-right">
              <a href="#">Xem thêm <i class="fas fa-arrow-right"></i></a>
            </div>
          </div>
        </div>
        <div class="col-lg-12">
          <div class="content mt-4">
            <div id="carouselForHorproduct" data-interval="false" class="carousel slide" data-ride="carousel">
              <div class="carousel-inner">

                <div class="carousel-item active ">
                  <div class="row d-block ">
                    <div class="col-3">
                      <div class="card">
                        <div class="card-img text-center"><a href="Product_page/chiTietSanPham.html">
                            <img src="image/img_phone/1.jpg" width="80%" class="" alt="..."></a>
                        </div>
                        <div class="card-content">
                          <div class="card-title">
                            <a href="Product_page/chiTietSanPham.html">Iphone 12 64 GBIphone 12 64 GBIphone 12 64 GB</a>
                          </div>
                          <div class="card-price">
                            <span>
                              <div class="card-count">19.990.000 <span class="unit">đ</span>
                              </div>
                              <div class="card-discount">
                                23.000.000 <span class="unit">đ</span>
                              </div>
                          </div>
                          <div class="card-stars">
                            <span> <i class="fas fa-star text-warning"></i></span>
                            <span> <i class="fas fa-star text-warning"></i></span>
                            <span> <i class="fas fa-star text-warning"></i></span>
                            <span> <i class="fas fa-star text-warning"></i></span>
                            <span> <i class="fas fa-star  text-dark"></i></span>
                          </div>
                        </div>
                      </div>
                    </div>
    
                  </div>
                </div>
                <div class="carousel-item ">
                  <div class="row d-block">
                    <div class="col-3">
                      <div class="card">
                        <div class="card-img text-center"><a href="Product_page/chiTietSanPham.html">
                            <img src="image/img_phone/5.jpg" width="80%" class="" alt="..."></a>
                        </div>
                        <div class="card-content">
                          <div class="card-title">
                            <a href="Product_page/chiTietSanPham.html">Iphone 12 64 GBIphone 12 64 GBIphone 12 64 GB</a>
                          </div>
                          <div class="card-price">
                            <span>
                              <div class="card-count">19.990.000 <span class="unit">đ</span>
                              </div>
                              <div class="card-discount">
                                23.000.000 <span class="unit">đ</span>
                              </div>
                          </div>
                          <div class="card-stars">
                            <span> <i class="fas fa-star text-warning"></i></span>
                            <span> <i class="fas fa-star text-warning"></i></span>
                            <span> <i class="fas fa-star text-warning"></i></span>
                            <span> <i class="fas fa-star text-warning"></i></span>
                            <span> <i class="fas fa-star  text-dark"></i></span>
                          </div>
                        </div>
                      </div>
                    </div>
           
                  </div>

                </div>
                <a class="carousel-control-prev" href="#carouselForHorproduct" role="button" data-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselForHorproduct" role="button" data-slide="next">
                  <span class="carousel-control-next-icon " aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--Slider san pham moi-->
      <div class="hot-products row col-12 bordertitle">
        <div class="col-lg-12">
          <div class="title ">
            <div class="title float-left">
              <h3>Sản phẩm mới</h3>
            </div>
            <div class="title float-right">
              <a href="#">Xem thêm <i class="fas fa-arrow-right"></i></a>
            </div>
          </div>
        </div>
        <div class="col-lg-12">
          <div class="content mt-4">
            <div id="carouselForNewProduct" data-interval="false" class="carousel slide" data-ride="carousel">
              <div class="carousel-inner">
                <div class="carousel-item active ">
                  <div class="row d-block ">
                    <div class="col-3">
                      <div class="card">
                        <div class="card-img text-center"><a href="#">
                            <img src="image/img_phone/6.jpg" width="80%" class="" alt="..."></a>
                        </div>
                        <div class="card-content">
                          <div class="card-title">
                            <a href="#">Iphone 12 64 GBIphone 12 64 GBIphone 12 64 GB</a></div>
                          <div class="card-price">
                            <span>
                              <div class="card-count">19.990.000 <span class="unit">đ</span>
                              </div>
                              <div class="card-discount">
                                23.000.000 <span class="unit">đ</span>
                              </div>
                          </div>
                          <div class="card-stars">
                            <span> <i class="fas fa-star text-warning"></i></span>
                            <span> <i class="fas fa-star text-warning"></i></span>
                            <span> <i class="fas fa-star text-warning"></i></span>
                            <span> <i class="fas fa-star text-warning"></i></span>
                            <span> <i class="fas fa-star  text-dark"></i></span>
                          </div>
                        </div>
                      </div>
                    </div>
         
                  </div>
                </div>
                <div class="carousel-item ">
                  <div class="row d-block">
                    <div class="col-3">
                      <div class="card">
                        <div class="card-img text-center"><a href="#">
                            <img src="image/img_phone/10.jpg" width="80%" class="" alt="..."></a>
                        </div>
                        <div class="card-content">
                          <div class="card-title">
                            <a href="#">Iphone 12 64 GBIphone 12 64 GBIphone 12 64 GB</a></div>
                          <div class="card-price">
                            <span>
                              <div class="card-count">19.990.000 <span class="unit">đ</span>
                              </div>
                              <div class="card-discount">
                                23.000.000 <span class="unit">đ</span>
                              </div>
                          </div>
                          <div class="card-stars">
                            <span> <i class="fas fa-star text-warning"></i></span>
                            <span> <i class="fas fa-star text-warning"></i></span>
                            <span> <i class="fas fa-star text-warning"></i></span>
                            <span> <i class="fas fa-star text-warning"></i></span>
                            <span> <i class="fas fa-star  text-dark"></i></span>
                          </div>
                        </div>
                      </div>
                    </div>
     
                  </div>

                </div>
                <a class="carousel-control-prev" href="#carouselForNewProduct" role="button" data-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselForNewProduct" role="button" data-slide="next">
                  <span class="carousel-control-next-icon " aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>



    </div>
    <!--Thanh bar tim kiem theo noi dung-->
    <div class="row">
      <div class="col-3" id="bar-side">
        <div class="filter-bar">
          <div class="filter-bar-frame">
            <div class="filter-bar-card">
              <div class="filter-bar-title">
                <h5>Hệ điều hành</h5>
              </div>
              <div class="filter-bar-select">
                <div class="check-select">
                  <input type="checkbox" value="android" name="android" id="android">
                  <label for=android>IOS </label>
                </div>
                <div class="check-select">
                  <input type="checkbox" value="ios" name="ios" id="ios">
                  <label for=ios>Andriod </label>
                </div>
    <div class="check-select">
                  <input type="checkbox" value="ios" name="ios" id="ios">
                  <label for=ios>Hệ điều hành khác </label>
                </div>

              </div>
            </div>
            <div class="filter-bar-card">
              <div class="filter-bar-title">
                <h5>Kích cỡ màn hình</h5>
              </div>
              <div class="filter-bar-select">
                <div class="check-select">
                  <input type="checkbox" value="5inch" name="5inch" id="5inch">
                  <label for=5inch>Màn hình nhỏ (Dưới 5 INCH)</label>
                </div>
                <div class="check-select">
                  <input type="checkbox" value="5-6inch" name="5-6inch" id="5-6inch">
                  <label for=5-6inch>Vừa tay (5 INCH đến 6 INCH) </label>
                </div>
                <div class="check-select">
                  <input type="checkbox" value="6inch" name="6inch" id="6inch">
                  <label for=6inch>Trên 6 INCH </label>
                </div>

              </div>
            </div>
            <div class="filter-bar-card">
              <div class="filter-bar-title">
                <h5>Bộ nhớ trong</h5>
              </div>
              <div class="filter-bar-select">
                <div class="check-select">
                  <input type="checkbox" value="8g" name="8g" id="8g">
                  <label for="8g">Nhỏ hơn 8GB </label>
                </div>
                <div class="check-select">
                  <input type="checkbox" value="16-128g" name="16-128g" id="16-128g">
                  <label for="16-128g">16GB đến 128GB </label>
                </div>
                <div class="check-select">
                  <input type="checkbox" value="256g" name="256g" id="256g">
                  <label for="256g">256GB</label>
                </div>
                <div class="check-select">
                  <input type="checkbox" value="512g" name="512g" id="512g">
                  <label for="512g">512GB trở lên </label>
                </div>

              </div>
            </div>
            <div class="filter-bar-card">
              <div class="filter-bar-title">
                <h5>Dung lượng RAM</h5>
              </div>
              <div class="filter-bar-select">
                <div class="check-select">
                  <input type="checkbox" value="r-4g-down" name="r-4g-down" id="r-4g-down">
                  <label for="r-4g-down">Dưới 4GB </label>
                </div>
                <div class="check-select">
                  <input type="checkbox" value="r-4g-6g" name="r-4g-6g" id="r-4g-6g">
                  <label for="r-4g-6g">4GB đến 6GB </label>
                </div>
                <div class="check-select">
                  <input type="checkbox" value="r-8g" name="r-8g" id="r-8g">
                  <label for="r-8g">8GB </label>
                </div>
                <div class="check-select">
                  <input type="checkbox" value="r-12g-up" name="r-12g-up" id="r-12g-up">
                  <label for="r-12g-up">12GB trở lên </label>
                </div>

              </div>
            </div>
            <div class="filter-bar-card">
              <div class="filter-bar-title">
                <h5>Camera trước</h5>
              </div>
              <div class="filter-bar-select">
                <div class="check-select">
                  <input type="checkbox" value="b-5mp-down" name="b-5mp-down" id="b-5mp-down">
                  <label for="b-5mp-down">Dưới 5 MP </label>
                </div>
                <div class="check-select">
                  <input type="checkbox" value="b-5mp-12mp" name="b-5mp-12mp" id="b-5mp-12mp">
                  <label for="b-5mp-12mp">5 MP đến 12 MP </label>
                </div>
                <div class="check-select">
                  <input type="checkbox" value="b-12mp-up" name="b-12mp-up" id="b-12mp-up">
                  <label for="b-12mp-up">Trên 12 MP</label>
                </div>


              </div>
              <div class="filter-bar-card">
                <div class="filter-bar-title">
                  <h5>Camera sau</h5>
                </div>
                <div class="filter-bar-select">
                  <div class="check-select">
                    <input type="checkbox" value="a-5mp-down" name="a-5mp-down" id="a-5mp-down">
                    <label for="a-5mp-down">Dưới 5 MP </label>
                  </div>
                  <div class="check-select">
                    <input type="checkbox" value="a-5mp-12mp" name="a-5mp-12mp" id="a-5mp-12mp">
                    <label for="a-5mp-12mp">5 MP đến 12 MP </label>
                  </div>
                  <div class="check-select">
                    <input type="checkbox" value="a-12mp-up" name="a-12mp-up" id="a-12mp-up">
                    <label for="a-12mp-up">Trên 12 MP</label>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--Noi dung ket qua sau khi tim kiem-->
      <div class="col-9" id="result-content">
        <!--Hang ket qua-->
        <div class="title overflow-auto ">
          <div class="title float-left">
            <h3>Được xem nhiều</h3>
          </div>
          <div class="title float-right">
            <a href="#">Xem thêm <i class="fas fa-arrow-right"></i></a>
          </div>
        </div>
        <div class="row-content">

          <div class="row">
            <div class="col-4">
              <div class="card">
                <div class="card-img text-center"><a href="#">
                    <img src="image/img_phone/15.jpg" width="80%" class="" alt="..."></a>
                </div>
                <div class="card-content">
                  <div class="card-title">
                    <a href="#">Iphone 12 64 GBIphone 12 64 GBIphone 12 64 GB</a></div>
                  <div class="card-price">
                    <span>
                      <div class="card-count">19.990.000 <span class="unit">đ</span>
                      </div>
                      <div class="card-discount">
                        23.000.000 <span class="unit">đ</span>
                      </div>
                  </div>
                  <div class="card-stars">
                    <span> <i class="fas fa-star text-warning"></i></span>
                    <span> <i class="fas fa-star text-warning"></i></span>
                    <span> <i class="fas fa-star text-warning"></i></span>
                    <span> <i class="fas fa-star text-warning"></i></span>
                    <span> <i class="fas fa-star  text-dark"></i></span>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
        <!--Hang ket qua-->


        <!-- pagination -->
        <div class="row ">
          <div class="col-12 d-flex justify-content-end">
            <nav aria-label="...">
              <ul class="pagination">
                <li class="page-item disabled">
                  <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Trở về</a>
                </li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item " aria-current="page">
                  <a class="page-link" href="#">2 </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                  <a class="page-link" href="#">Tiếp</a>
                </li>
              </ul>
            </nav>
          </div>
        </div>



      </div>
    </div>
  
  
  </div>


	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>

 

</body>

</html>