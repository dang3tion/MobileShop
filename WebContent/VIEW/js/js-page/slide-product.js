//var clientHeight = document.getElementById('content').clientHeight;
//
//
//
//if (clientHeight < 500) {
//	document.getElementById('send1').style.display = 'none';
//} else {
//	document.getElementById('send1').style.display = 'block';
//}

var countSlide = 0;
var arrSlide = [document.getElementById('img1').src, document.getElementById('img2').src, document.getElementById('img3').src, document.getElementById('img4').src]
console.log(arrSlide);
document.getElementById('next').onclick = function next() {
	countSlide++;
	if (countSlide < 4) {
		var t = document.getElementById("img");
		t.src = arrSlide[countSlide];
	} else {
		countSlide = 0;
		var t = document.getElementById("img");
		t.src = arrSlide[countSlide];
	}

}
document.getElementById('pre').onclick = function pre() {
	countSlide--;
	if (countSlide >= 0) {
		var t = document.getElementById("img");
		t.src = arrSlide[countSlide];
	} else {
		countSlide = arrSlide.length - 1;
		var t = document.getElementById("img");
		t.src = arrSlide[countSlide];
	}
}


function change(path) {
	var t = document.getElementById("img");
	t.src = path;
	console.log(t.src);
}


function ttOpen(){
  document.getElementById('send1').style.display = 'none';
  document.getElementById('content').style.maxHeight = 'none';
  document.getElementById('close').style.display = 'block';

}



