function getNumberPageDefault(page) {
  var containerPage = document.getElementById("page-number");

  for (let i = 0; i < page; i++) {
    var btn = document.createElement("button");
    containerPage.appendChild(btn);
    btn.innerHTML = i + 1;
  }
}
function totalPage() {
  var containerPage = document.getElementById("page-number");
  var total = containerPage.getElementsByTagName("button").length;
  return total;
}
function showPage(numberStart, numberEnd) {
  var containerPage = document.getElementById("page-number");
  var arrButton = document.getElementsByTagName("button");

  for (let i = 0; i < arrButton.length; i++) {
    arrButton[0].remove();
  }
  for (let i = numberStart; i <= numberEnd; i++) {
    var btn = document.createElement("button");
    containerPage.appendChild(btn);
    btn.innerHTML = i;
  }
}
function onclickPage(id){
	
}
function activePage(pageNumber) {
  var page = document.getElementById("page-number");
  var btns = page.getElementsByTagName("button");
  console.log("asda " + btns.length);
  for (let i = 0; i < btns.length; i++) {
    var x = btns[i].id;
    if (btns[i].innerHTML != pageNumber) {
      btns[i].setAttribute("class", "");
    } else {
      btns[i].setAttribute("class", "active");
    }
  }
}

function pageDefault(pageNumber, total) {
  var containerPage = document.getElementById("page-number");
  var arrButton = containerPage.getElementsByTagName("button");

  if (total > 10) {
    if (pageNumber > 5 && pageNumber < total - 5) {
      showPage(pageNumber - 5, pageNumber + 5);
      console.log("asdasd");
    } else if (pageNumber <= 5) {
      showPage(1, 10);
    } else if (pageNumber >= total - 5) {
      showPage(total - 10, total);
    }
  } else {
    showPage(1, total);
  }
  activePage(pageNumber);
}
