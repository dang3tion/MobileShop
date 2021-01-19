


<form action="${pageContext.request.contextPath}/CKFinderUpload" method="GET">
	<button type="button"
		onclick="BrowseServer('Images:/','urlHinhKetQua1')">upload</button>
	<input type="text" name="URLImage1" id="urlHinhKetQua1">
	<button type="button"
		onclick="BrowseServer('Images:/','urlHinhKetQua2')">upload</button>
	<input type="text" name="URLImage2" id="urlHinhKetQua2">
	<button type="button"
		onclick="BrowseServer('Images:/','urlHinhKetQua3')">upload</button>
	<input type="text" name="URLImage3" id="urlHinhKetQua3">
	<button type="button"
		onclick="BrowseServer('Images:/','urlHinhKetQua4')">upload</button>
	<input type="text" name="URLImage4" id="urlHinhKetQua4">
	<button type="submit">Save</button>
</form>






<img src="${URLImage1}">
<img src="${URLImage2}">
<img src="${URLImage3}">
<img src="${URLImage4}">

<script src="${pageContext.request.contextPath}/ckfinder/ckfinder.js"></script>
<script>
	function BrowseServer(startupPath, functionData) {
		var finder = new CKFinder();
		finder.basePath = 'ckfinder/'; //Đường path nơi đặt ckfinder
		finder.startupPath = startupPath; //Đường path hiện sẵn cho user chọn file
		finder.selectActionFunction = SetFileField; // hàm sẽ được gọi khi 1 file được chọn
		finder.selectActionData = functionData; //id của text field cần hiện địa chỉ hình
		//finder.selectThumbnailActionFunction = ShowThumbnails; //hàm sẽ được gọi khi 1 file thumnail được chọn	
		finder.popup(); // Bật cửa sổ CKFinder
	}

	function SetFileField(fileUrl, data) {
		document.getElementById(data["selectActionData"]).value = fileUrl;
	}
</script>












