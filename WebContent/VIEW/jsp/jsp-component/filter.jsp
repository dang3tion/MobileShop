
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="model_DAO.DAO_IconMenu"%>
<%
	DAO_IconMenu dao = new DAO_IconMenu();
request.setAttribute("color", dao.colorWeb());
%>

<div style="background-color: ${color.colorFilter}" class="filter-menu">
	<div class="container">
		<div class="row">
			<!--Noi dung loc du lieu-->
			<div class="col-6 alpha">
				<ul class="list-menu">
					<li class="item-menu" id="trademark">
						<div class="header">
							<a href="#"><fmt:message key="thuong-filter"></fmt:message> <i
								class="fas fa-caret-down"></i></a>
						</div>
						<div class="content-dropdown" id="content-trademark">
							<ul class="list-menu">
								<div class="row">
									<c:forEach items="${LIST_BRANCH_IN_DOPDOWN_MENU}" var="branch">
										<div class="col-4">

											<li class="item-menu"><a
												href="${pageContext.request.contextPath}/searchingProduct?thuonghieu=${branch.name}">${branch.name}</a></li>
										</div>
									</c:forEach>


								</div>
							</ul>
						</div>
					</li>
					<li class="item-menu" id="rateprice">
						<div class="header">
							<a href="#"><fmt:message key="gia-filter"></fmt:message> <i
								class="fas fa-caret-down"></i></a>
						</div>
						<div class="content-dropdown" id="content-rateprice">
							<ul class="list-menu">
								<div class="row">
									<div class="col-4">
										<li class="item-menu"><a
											href="${pageContext.request.contextPath}/searchingProduct?khoanggia=duoi-1-trieu"><fmt:message
													key="giaduoi1-filter"></fmt:message></a></li>
										<li class="item-menu"><a
											href="${pageContext.request.contextPath}/searchingProduct?khoanggia=tu-1-den-2-trieu"><fmt:message
													key="gia1to2-filter"></fmt:message></a></li>
										<li class="item-menu"><a
											href="${pageContext.request.contextPath}/searchingProduct?khoanggia=tu-2-den-3-trieu"><fmt:message
													key="gia2to3-filter"></fmt:message></a></li>
									</div>
									<div class="col-4">
										<li class="item-menu"><a
											href="${pageContext.request.contextPath}/searchingProduct?khoanggia=tu-3-den-5-trieu"><fmt:message
													key="gia3to5-filter"></fmt:message></a></li>
										<li class="item-menu"><a
											href="${pageContext.request.contextPath}/searchingProduct?khoanggia=tu-5-den-7-trieu"><fmt:message
													key="gia5to7-filter"></fmt:message></a></li>
										<li class="item-menu"><a
											href="${pageContext.request.contextPath}/searchingProduct?khoanggia=tu-7-den-9-trieu"><fmt:message
													key="gia7to9-filter"></fmt:message></a></li>
									</div>
									<div class="col-4">
										<li class="item-menu"><a
											href="${pageContext.request.contextPath}/searchingProduct?khoanggia=tu-9-den-12-trieu"><fmt:message
													key="gia9to12-filter"></fmt:message></a></li>
										<li class="item-menu"><a
											href="${pageContext.request.contextPath}/searchingProduct?khoanggia=tu-12-den-15-trieu"><fmt:message
													key="gia9to12-filter"></fmt:message></a></li>
										<li class="item-menu"><a
											href="${pageContext.request.contextPath}/searchingProduct?khoanggia=tren-15-trieu"><fmt:message
													key="giatren15-filter"></fmt:message></a></li>
									</div>
								</div>
							</ul>
						</div>
					</li>
					<li class="item-menu" id="producttype">
						<div class="header">
							<a href="#"><fmt:message key="loai-filter"></fmt:message> <i
								class="fas fa-caret-down"></i></a>
						</div>
						<div class="content-dropdown" id="content-producttype">
							<ul class="list-menu">
								<div class="row">
									<div class="col-4">
										<li class="item-menu"><a
											href="${pageContext.request.contextPath}/searchingProduct?tinhtrang=MOI"><fmt:message
													key="loaimoi-filter"></fmt:message> </a></li>

									</div>
									<div class="col-4">
										<li class="item-menu"><a
											href="${pageContext.request.contextPath}/searchingProduct?tinhtrang=CU"><fmt:message
													key="loaicu-filter"></fmt:message> </a></li>
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

				<c:choose>
					<c:when test="${ not empty urlSearch }">
						<div class="col-6 beta">
							<ul class="list-menu">
								<li class="item-menu" id="order">
									<div class="header">
										<a href="#"><fmt:message key="xep-filter"></fmt:message> <i
											class="fas fa-caret-down"></i> </a>
									</div>
									<div class="content-dropdown" id="content-order">
										<div class="row">
											<div style="font-size: 0.8em" class="col-12">


												<div class="list-group">

													<a
														href="${pageContext.request.contextPath}/${urlSearch}${urlPrice}&sapxep=moicapnhat"
														class="list-group-item list-group-item-action"> <fmt:message
															key="xepMoi-filter"></fmt:message>
													</a> <a
														href="${pageContext.request.contextPath}/${urlSearch}${urlPrice}&sapxep=sp-moi-cu"
														class="list-group-item list-group-item-action"><fmt:message
															key="xepMoicu-filter"></fmt:message></a> <a
														href="${pageContext.request.contextPath}/${urlSearch}${urlPrice}&sapxep=sp-cu-moi"
														class="list-group-item list-group-item-action"><fmt:message
															key="xepCumoi-filter"></fmt:message></a> <a
														href="${pageContext.request.contextPath}/${urlSearch}${urlPrice}&sapxep=ten-a-z"
														class="list-group-item list-group-item-action"><fmt:message
															key="xepaz-filter"></fmt:message></a> <a
														href="${pageContext.request.contextPath}/${urlSearch}${urlPrice}&sapxep=ten-z-a"
														class="list-group-item list-group-item-action"><fmt:message
															key="xepza-filter"></fmt:message></a> <a
														href="${pageContext.request.contextPath}/${urlSearch}${urlPrice}&sapxep=luotxemnhieu"
														class="list-group-item list-group-item-action"><fmt:message
															key="xepnhieunhat-filter"></fmt:message></a> <a
														href="${pageContext.request.contextPath}/${urlSearch}${urlPrice}&sapxep=danhgiacao"
														class="list-group-item list-group-item-action"><fmt:message
															key="xepdanhgia-filter"></fmt:message></a>

												</div>



											</div>

										</div>
									</div>
								<li class="item-menu">
									<div class="filter-check">
										<a
											href="${pageContext.request.contextPath}/${urlSearch}&gia=thap-cao${urlOrder}"><input
											type="checkbox" name="check" onclick="onlyOne(this)"
											value="thapcao" id="thapcao"> <label for="thapcao"><fmt:message
													key="giacao1-filter"></fmt:message> <i
												class="fas fa-arrow-up"></i> </label></a>
									</div>
								</li>
								<li class="item-menu">
									<div class="filter-check">
										<a
											href="${pageContext.request.contextPath}/${urlSearch}&gia=cao-thap${urlOrder}">
											<input type="checkbox" name="check" onclick="onlyOne(this)"
											value="caothap" id="caothap"> <label for="caothap">
												<fmt:message key="giathap1-filter"></fmt:message><i
												class="fas fa-arrow-down"></i>
										</label>
										</a>
									</div>
								</li>

							</ul>
						</div>
					</c:when>
					<c:otherwise>
						<div class="col-6 beta">
							<ul class="list-menu">
								<li class="item-menu" id="order">
									<div class="header">
										<a href="#"><fmt:message key="xep-filter"></fmt:message> <i
											class="fas fa-caret-down"></i> </a>
									</div>
									<div class="content-dropdown" id="content-order">
										<div class="row">
											<div style="font-size: 0.8em" class="col-12">


												<div class="list-group">

													<a
														href="${pageContext.request.contextPath}/searchingProduct?dssanpham=sanphamgiacao&sapxep=moicapnhat"
														class="list-group-item list-group-item-action"> <fmt:message
															key="xepMoi-filter"></fmt:message>
													</a> <a
														href="${pageContext.request.contextPath}/searchingProduct?dssanpham=sanphamgiacao&sapxep=sp-moi-cu"
														class="list-group-item list-group-item-action"><fmt:message
															key="xepMoicu-filter"></fmt:message></a> <a
														href="${pageContext.request.contextPath}/searchingProduct?dssanpham=sanphamgiacao&sapxep=sp-cu-moi"
														class="list-group-item list-group-item-action"><fmt:message
															key="xepCumoi-filter"></fmt:message></a> <a
														href="${pageContext.request.contextPath}/searchingProduct?dssanpham=sanphamgiacao&sapxep=ten-a-z"
														class="list-group-item list-group-item-action"><fmt:message
															key="xepaz-filter"></fmt:message></a> <a
														href="${pageContext.request.contextPath}/searchingProduct?dssanpham=sanphamgiacao&sapxep=ten-z-a"
														class="list-group-item list-group-item-action"><fmt:message
															key="xepza-filter"></fmt:message></a> <a
														href="${pageContext.request.contextPath}/searchingProduct?dssanpham=sanphamgiacao&sapxep=luotxemnhieu"
														class="list-group-item list-group-item-action"><fmt:message
															key="xepnhieunhat-filter"></fmt:message></a> <a
														href="${pageContext.request.contextPath}/searchingProduct?dssanpham=sanphamgiacao&sapxep=danhgiacao"
														class="list-group-item list-group-item-action"><fmt:message
															key="xepdanhgia-filter"></fmt:message></a>

												</div>



											</div>

										</div>
									</div>
								<li class="item-menu">
									<div class="filter-check">
										<a
											href="${pageContext.request.contextPath}/searchingProduct?dssanpham=sanphamgiacao&gia=thap-cao">
											<fmt:message key="giacao1-filter"></fmt:message> <i
											class="fas fa-arrow-up"></i>
										</a>
									</div>
								</li>
								<li class="item-menu">
									<div class="filter-check">
										<a
											href="${pageContext.request.contextPath}/searchingProduct?dssanpham=sanphamgiacao&gia=cao-thap">
											<fmt:message key="giathap1-filter"></fmt:message><i
											class="fas fa-arrow-down"></i>
										</a>
									</div>
								</li>

							</ul>
						</div>



					</c:otherwise>
				</c:choose>
			</c:if>


		</div>
	</div>
</div>
<script>
              function onlyOne(checkbox) {
                var checkboxes = document.getElementsByName('check')
                checkboxes.forEach((item) => {
                  if (item !== checkbox){
                	  item.checked = false;
                	  item.style.pointerEvents="auto";
                	                    }
                  else{
                	item.style.pointerEvents="none";
                  }
                  
                })
              }
            </script>