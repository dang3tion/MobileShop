function vali_isEmail(text) {
  const regex = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g;
  const result = regex.test(text);
  return result;
}
var checkEmail = false;
var checkPass = false;
function vali_isPassword(text) {
  const regex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/g;
  const result = regex.test(text);
  return result;
}

function vali_Number(text) {
  const regex = /^\d+$/g;
  const result = regex.test(text);
  return result;
}
 var checknum = false;
function check_OTP(id) {
  var s = document.getElementById(id).value;
  if (!vali_Number(s)) {
    document.getElementById("check_OTP").style.display = "block";
    checknum = false;
    return true;
  }
  if (vali_Number(s)) {
    document.getElementById("check_OTP").style.display = "none";
    checknum = true;
    return false;
  }
}

function checkNum(){
  if (checknum){
    return true;
  }else {
    return false;
  }
}

function check_email(id) {
  var s = document.getElementById(id).value;
  if (!vali_isEmail(s)) {
    document.getElementById("require-email").style.display = "block";
    checkEmail = false;
    return true;
  }
  if (vali_isEmail(s)) {
    document.getElementById("require-email").style.display = "none";
    checkEmail = true;
    return false;
  }
}
var checkmail2 = false;

function check_email2(id) {
  var s = document.getElementById(id).value;
  if (!vali_isEmail(s)) {
    document.getElementById("require-email2").style.display = "block";
    checkmail2 = false;
    return true;
  }
  if (vali_isEmail(s)) {
    checkmail2 = true;
    document.getElementById("require-email2").style.display = "none";

    return false;
  }
}
function checkMail2(){
  if (checkmail2){
    return true;
  }else {
    return false;
  }
}

function clickEmail(){
  var id = 'inputEmail';
  if (check_email2(id)||check_email2(id)==null){
    document.getElementById("require-email2").style.display = "block";
  }
}






function check_password(id) {
  var s = document.getElementById(id.id).value;
  if (!check_email("inputEmail")) {
    console.log("asdfsf");
    if (!vali_isPassword(s)) {
      document.getElementById("require-password").style.display = "block";
      checkPass = false;
      return true;
    }
    if (vali_isPassword(s)) {
      document.getElementById("require-password").style.display = "none";
      checkPass = true;
      return false;
    }
  }
}

function check11(){
  if (checkEmail == false){
    console.log(checkEmail);
    document.getElementById('require-email').style.display = 'block';
  }else {
    document.getElementById('require-email').style.display = 'none';
  }
  var passid = document.getElementById('inputPassword');

  if (check_password(passid) == true|| check_password(passid)==null){
  document.getElementById('require-password').style.display = 'block';
  }


}



function checkVali(){
  if (checkPass&&checkEmail){
    console.log("true");
    return true;
  }else{
    // alert("KKKKKK");
    console.log("false");
    return false;
  }
}
