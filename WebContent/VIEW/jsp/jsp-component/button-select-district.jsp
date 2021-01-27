<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<select onchange="getWard(this.value)" class="mx-2"
	style="height: 38px;min-width: 140px; padding: 3px; outline: 0; border: 1px solid #b7b7b7; border-radius: 5px;"
	name="district" id="sehuyen">
	<option disabled selected value="0">Chọn quận/huyện</option>
	<c:forEach items="${LIST_DISTRICT}" var="pro">
		<option value="${pro.key}">${pro.value}</option>
	</c:forEach>
</select><span id="huyen" style="display: block; width: 150px; color: red">Chọn
											quận/huyện</span>