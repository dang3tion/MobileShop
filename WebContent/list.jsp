<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/VIEW/jsp/jsp-component/head-css.jsp"></jsp:include>

<body>

	<jsp:include page="/VIEW/jsp/jsp-component/menu.jsp"></jsp:include>
	<jsp:include page="/VIEW/jsp/jsp-component/filter.jsp"></jsp:include>

	<div class="container">
		<div class="row">




			<c:forEach var="pro" items="${list}">
				<div class="col-3 mx-4">
					<div class="card" style="width: 18rem;">
						<img class="card-img-top" src="${pro.imgSrc}" alt="Card image cap">
						<div class="card-body">
							<h4 class="card-title">${pro.name}</h4>
							<h6 class="card-text">giá : ${pro.price}<h6>
							<a href="#" class="btn btn-primary">Thêm vào giỏ hàng</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>

</html>