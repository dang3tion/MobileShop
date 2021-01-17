var move = parseInt(getCurrentPage());

function getNumberPageDefault(page) {
	move = page;
	console.log("page default: " + page);
	pageDefault(page, totalPage());

}
function totalPage() {
	var total = document.getElementById("page-navigation").getAttribute("value");
	console.log(total + " total");
	return parseInt(total);
}

function showPage(numberStart, numberEnd) {
	var containerPage = document.getElementById("page-number");

	var arrButton = containerPage.getElementsByTagName("button");
	var length = arrButton.length;
	for (let i = 0; i < length; i++) {
		arrButton[0].remove();
	}

	for (let i = numberStart; i <= numberEnd; i++) {

		var btn = document.createElement("button");
		containerPage.appendChild(btn);
		btn.onclick = function() {
			SendDataToServlet(i);
		};
		btn.innerHTML = i;
	}
}
function activePage(pageNumber) {
	var page = document.getElementById("page-number");
	var btns = page.getElementsByTagName("button");

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
	console.log(arrButton.length + " arr");
	if (total > 10) {
		if (pageNumber > 5 && pageNumber < total - 5) {

			showPage(pageNumber - 4, pageNumber + 5);

		} else if (pageNumber <= 5) {

			showPage(1, 10);
		} else if (pageNumber >= total - 5) {
			showPage(total - 9, total);
		}
	} else {
		showPage(1, total);
	}
	activePage(pageNumber);
}
function nextPage() {
	if (move != totalPage()) {
		SendDataToServlet(move + 1);
	}
}
function previousPage() {
	if (move != 1) {
		SendDataToServlet(move - 1);
	}
} function getMove() {
	return move;
}
SendDataToServlet(move);

