<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="filter-menu">
	<div class="container">
		<div class="row">
			<!--Noi dung loc du lieu-->
			<div class="col-6 alpha">
				<ul class="list-menu">
					<li class="item-menu" id="trademark">
						<div class="header">
							<a href="#">Thương hiệu <i class="fas fa-caret-down"></i></a>
						</div>
						<div class="content-dropdown" id="content-trademark">
							<ul class="list-menu">
								<div class="row">
									<div class="col-4">	
									<c:forEach items="${LIST_BRANCH_IN_DOPDOWN_MENU}" var="branch" begin="0" end="2">
									<li class="item-menu"><a
											href="${pageContext.request.contextPath}/searchingProduct?thuonghieu=${branch.name}">${branch.name}</a></li>
									</c:forEach>
									</div>
									<div class="col-4">	
									<c:forEach items="${LIST_BRANCH_IN_DOPDOWN_MENU}" var="branch" begin="3" end="5">
									<li class="item-menu"><a
											href="${pageContext.request.contextPath}/searchingProduct?thuonghieu=${branch.name}">${branch.name}</a></li>
									</c:forEach>
									</div>
									<div class="col-4">	
									<c:forEach items="${LIST_BRANCH_IN_DOPDOWN_MENU}" var="branch" begin="6" end="8">
									<li class="item-menu"><a
											href="${pageContext.request.contextPath}/searchingProduct?thuonghieu=${branch.name}">${branch.name}</a></li>
									</c:forEach>
									</div>

								</div>
							</ul>
						</div>
					</li>
					<li class="item-menu" id="rateprice">
						<div class="header">
							<a href="#">Mức giá <i class="fas fa-caret-down"></i></a>
						</div>
						<div class="content-dropdown" id="content-rateprice">
							<ul class="list-menu">
								<div class="row">
									<div class="col-4">
										<li class="item-menu"><a
											href="${pageContext.request.contextPath}/searchingProduct?khoanggia=">Dưới 1 triệu</a></li>
										<li class="item-menu"><a
											href="${pageContext.request.contextPath}/searchingProduct?khoanggia=">Từ 1 đến 2 triệu</a></li>
										<li class="item-menu"><a
											href="${pageContext.request.contextPath}/searchingProduct?khoanggia=">Từ 2 đến 3 triệu</a></li>
									</div>
									<div class="col-4">
										<li class="item-menu"><a
											href="${pageContext.request.contextPath}/searchingProduct?khoanggia=">Từ 3 đến 5 triệu</a></li>
										<li class="item-menu"><a
											href="${pageContext.request.contextPath}/searchingProduct?khoanggia=">Từ 5 đến 7 triệu</a></li>
										<li class="item-menu"><a
											href="${pageContext.request.contextPath}/searchingProduct?khoanggia=">Từ 7 đến 9 triệu</a></li>
									</div>
									<div class="col-4">
										<li class="item-menu"><a
											href="${pageContext.request.contextPath}/searchingProduct?khoanggia=">Từ 9 đến 12 triệu</a></li>
										<li class="item-menu"><a
											href="${pageContext.request.contextPath}/searchingProduct?khoanggia=">Từ 12 đến 15 triệu</a></li>
										<li class="item-menu"><a
											href="${pageContext.request.contextPath}/searchingProduct?khoanggia=">Trên 15 triệu</a></li>
									</div>
								</div>
							</ul>
						</div>
					</li>
					<li class="item-menu" id="producttype">
						<div class="header">
							<a href="#">Loại sản phẩm <i class="fas fa-caret-down"></i></a>
						</div>
						<div class="content-dropdown" id="content-producttype">
							<ul class="list-menu">
								<div class="row">
									<div class="col-4">
										<li class="item-menu"><a
											href="result_Page/result-filter.html"> Điện thoại mới
												(232)</a></li>

									</div>
									<div class="col-4">
										<li class="item-menu"><a
											href="result_Page/result-filter.html">Điện thoại cũ (0)</a></li>
									</div>
									<div class="col-4"></div>
								</div>
							</ul>
						</div>
					</li>
				</ul>
			</div>


			<c:if test="${param.display != null}">

				<!--Noi dung sap xep-->
				<div class="col-6 beta">
					<ul class="list-menu">
						<li class="item-menu" id="order">
							<div class="header">
								<a href="#">Xếp theo <i class="fas fa-caret-down"></i></a>
							</div>
							<div class="content-dropdown" id="content-order">
								<div class="row">
									<div class="col-12">
										<div class="list-group">
											<a href="#" class="list-group-item list-group-item-action">Mới
												cập nhật</a> <a href="#"
												class="list-group-item list-group-item-action">Sản phẩm
												Mới-Cũ</a> <a href="#"
												class="list-group-item list-group-item-action">Sản phẩm
												Cũ-Mới</a> <a href="#"
												class="list-group-item list-group-item-action">Tên A-Z</a> <a
												href="#" class="list-group-item list-group-item-action">Tên
												Z-A</a> <a href="#"
												class="list-group-item list-group-item-action">Được xem
												nhiều nhất</a> <a href="#"
												class="list-group-item list-group-item-action">Đánh giá
												cao</a>

										</div>
									</div>

								</div>
							</div>
						<li class="item-menu"><a href="#">
								<div class="filter-check">
									<input type="checkbox" name="check" onclick="onlyOne(this)"
										value="thapcao" id="thapcao"> <label for="thapcao">
										Giá cao đến thấp<i class="fas fa-arrow-up"></i>
									</label>
								</div>
						</a></li>
						<li class="item-menu"><a href="#">
								<div class="filter-check">
									<input type="checkbox" name="check" onclick="onlyOne(this)"
										value="caothap" id="caothap"> <label for="caothap">
										Giá thấp đến cao<i class="fas fa-arrow-down"></i>
									</label>
								</div>
						</a></li>
						<script>
              function onlyOne(checkbox) {
                var checkboxes = document.getElementsByName('check')
                checkboxes.forEach((item) => {
                  if (item !== checkbox) item.checked = false
                })
              }
            </script>
					</ul>
				</div>

			</c:if>


		</div>
	</div>
</div>