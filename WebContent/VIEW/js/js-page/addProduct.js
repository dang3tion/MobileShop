       
/// thêm màu
var dem =1 ;
function themMau() {
  document.getElementById("countColor").value = dem;
  dem++;
console.log(dem);
  /// lấy số lượng form hiện tại
  var current = document.getElementById("btnAddColor").name;
  n = parseInt(current) + 1;

  $("#color").append(
    "<div>" +
      ' <div class="boder-color">' +
      '        <div class="row boder-color1">' +
      '          <div class="col-4 space-top " id="chooseColor" name="1">' +
      '            <h5 class="spacing_form">Màu sắc</h5>' +
      '            <div class="input-group mb-2 ">' +
      '              <div class="input-group-prepend">' +
      '                <div class="input-group-text"><i class="fas fa-mobile-alt"></i></div>' +
      "              </div>" +
      '             <input class="form-control w " value="" placeholder="Nhập màu sắc" name="color'+dem+'">'  +
      "            </div>" +
      "          </div>" +
      '<div class="col-4 space-top " id="chooseColor" name="1">'+
			'						<h5 class="spacing_form">Chọn mã màu</h5>'+
			'						<div class="input-group mb-2 ">'+
			'							<div class="input-group-prepend">'+
			'								<div class="input-group-text">'+
			'									<i class="fas fa-mobile-alt"></i>'+
			'								</div>'+
			'							</div>'+
			'							<input type="color" class="form-control w " value="'+
			'								placeholder="Nhập màu sắc" name="codeColor'+dem+'">'+
			'						</div>'+
			'					</div>'+

      '          <div class="col-4 space-top">' +
      '            <h5 class="spacing_form ">URL hình ảnh nền</h5>' +
      '            <input class="mt-2" type="file" accept=".jpg,.png,.jpge" name ="anhnen'+dem+'">' +
      "          </div>" +
      
      "        </div>" +
      '        <div class="row boder-color2">' +
      '          <div class="col-3 space-top">' +
      '            <h5 class="spacing_form ">URL ảnh mô tả 1</h5>' +
      '            <input class="mt-2" type="file" accept=".jpg,.png,.jpge" name="anhMT1'+dem+'">' +
      "          </div>" +
      '          <div class="col-3 space-top">' +
      '            <h5 class="spacing_form ">URL ảnh mô tả 2</h5>' +
      '            <input class="mt-2" type="file" accept=".jpg,.png,.jpge" name="anhMT2'+dem+'">' +
      "          </div>" +
      '          <div class="col-3 space-top">' +
      '            <h5 class="spacing_form ">URL ảnh mô tả 3</h5>' +
      '            <input class="mt-2" type="file" accept=".jpg,.png,.jpge" name="anhMT3'+dem+'">' +
      "          </div>" +
      '          <div class="col-3 space-top">' +
      '            <h5 class="spacing_form ">URL ảnh mô tả 4</h5>' +
      '            <input class="mt-2" type="file" accept=".jpg,.png,.jpge" name="anhMT4'+dem+'">' +
      "          </div>" +
      "        </div>" +
      "      </div>"
  );
  var textnode = document.createTextNode("Demo" + n);
  node.appendChild(textnode);
  document.getElementById("addColorForm").appendChild(node);

  ///cập nhật lại số lượng form
  document.getElementById("btnAddColor").name = parseInt(current) + 1;
}

function thongSoKt() {
  /// lấy số lượng form hiện tại
  var current = document.getElementById("btnAddColor").name;
  n = parseInt(current) + 1;

  $("#thongSoMoi").append(
    '<div class="boder-color top-s">' +
      '<div class="space-top bodertt">' +
      ' <h5 class="spacing_form">Loại thông số kĩ thuật mới</h5>' +
      ' <div class="input-group mb-2">' +
      '   <div class="input-group-prepend">' +
      '     <div class="input-group-text"></div>' +
      "   </div>" +
      '   <input type="text" class="form-control py-4" value="" placeholder="Nhập tên thông số kĩ thuật mới">' +
      " </div>" +
      '   <h5 class="spacing_form">Nội dung thông số kĩ thuật mới</h5>' +
      ' <div class="input-group mb-2">' +
      '   <div class="input-group-prepend">' +
      '     <div class="input-group-text"></i></div>' +
      "   </div>" +
      '   <input type="text" class="form-control py-4" value="" placeholder="Nhập nội dung">' +
      " </div>" +
      "</div>" +
      "</div>"
  );
  var textnode = document.createTextNode("Demo" + n);
  node.appendChild(textnode);
  document.getElementById("addColorForm").appendChild(node);

  ///cập nhật lại số lượng form
  document.getElementById("btnAddColor").name = parseInt(current) + 1;
}

function thongSoKt() {
  /// lấy số lượng form hiện tại
  var current = document.getElementById("btnAddColor").name;
  n = parseInt(current) + 1;

  $("#thongSoMoi").append(
    '<div class="boder-color top-s">' +
      '<div class="space-top bodertt">' +
      ' <h5 class="spacing_form">Loại thông số kĩ thuật mới</h5>' +
      ' <div class="input-group mb-2">' +
      '   <div class="input-group-prepend">' +
      '     <div class="input-group-text"></div>' +
      "   </div>" +
      '   <input type="text" class="form-control py-4" value="" placeholder="Nhập tên thông số kĩ thuật mới">' +
      " </div>" +
      '   <h5 class="spacing_form">Nội dung thông số kĩ thuật mới</h5>' +
      ' <div class="input-group mb-2">' +
      '   <div class="input-group-prepend">' +
      '     <div class="input-group-text"></i></div>' +
      "   </div>" +
      '   <input type="text" class="form-control py-4" value="" placeholder="Nhập nội dung">' +
      " </div>" +
      "</div>" +
      "</div>"
  );
  var textnode = document.createTextNode("Demo" + n);
  node.appendChild(textnode);
  document.getElementById("addColorForm").appendChild(node);

  ///cập nhật lại số lượng form
  document.getElementById("btnAddColor").name = parseInt(current) + 1;
}

