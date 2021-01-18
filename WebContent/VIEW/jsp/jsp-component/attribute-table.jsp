<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


			<li class="item" id="${idclass }-item${index }">
				<div class="title">
					<select class=""
						style="min-width: 240px; padding: 3px; outline: 0; border: 1px solid #b7b7b7; border-radius: 3px;"
						name="att-id">
						<c:forEach items="${arr }" var="i">
							<option value="${i.id }">${i.title }</option>
						</c:forEach>
					</select>
				</div>
				<div class="value">

					<div class="input">
						<input
							style="border: 1px solid #b7b7b7; outline: 0; padding: 2px 5px; border-radius: 3px; min-width: 300px;"
							name="att-value" type="text" value="">
					</div>

				</div>
				<div class="button">

					<button class="btn btn-warning mb-2"
						onclick="deleteAttribute('${idclass}-item${index }')">Xóa</button>

				</div>

			</li>


	
