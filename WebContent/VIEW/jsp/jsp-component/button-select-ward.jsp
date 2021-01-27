<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<select class="mx-2"
	style="height: 38px;min-width: 140px; padding: 3px; outline: 0; border: 1px solid #b7b7b7; border-radius: 5px;"
	name="ward" id = "sexa" onfocusout="check_xa(this.id)">
	<option disabled selected value="0">Chọn phường/xã</option>
	<c:forEach items="${LIST_WARD}" var="pro">
		<option value="${pro.key}">${pro.value}</option>
	</c:forEach>
</select><span id="xa" style="display: block; width: 150px; color: red">Chọn
											phường/xã</span>