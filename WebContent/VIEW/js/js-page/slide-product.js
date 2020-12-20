var countSlide = 0;
var arrSlide =[document.getElementById('img1').src,document.getElementById('img2').src,document.getElementById('img3').src,document.getElementById('img4').src]
console.log(arrSlide);
document.getElementById('next').onclick=function next(){
  countSlide++;
  if(countSlide<4){
  var t = document.getElementById("img");
  t.src = arrSlide[countSlide];
  }else{
    countSlide = 0;
    var t = document.getElementById("img");
    t.src = arrSlide[countSlide];
  }

}
document.getElementById('pre').onclick=function pre(){
  countSlide--;
  if(countSlide>=0){
  var t = document.getElementById("img");
  t.src = arrSlide[countSlide];
  }else{
    countSlide = arrSlide.length-1;
    var t = document.getElementById("img");
    t.src = arrSlide[countSlide];
  }
}


function change(path){
    var t = document.getElementById("img");
  t.src = path;
  console.log(t.src);
}





