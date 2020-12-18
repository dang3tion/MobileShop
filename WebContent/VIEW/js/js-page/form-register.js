function vali_isEmail(text) {
  const regex = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g;
  const result = regex.test(text);
  return result;
}

function vali_isPassword(text) {
  const regex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/g;
  const result = regex.test(text);
  return result;
}
function vali_isText(text) {
  const regex = /[0-9`~!@#$%^&*()_+-={}\|'";:?.><,]/g;
  const result = regex.test(text);
  return !result;
}
function vali_PhoneNumber(text) {
  const regex = /^(09|01[2|6|8|9])+([0-9]{8})\b/g;
  const result = regex.test(text);
  return result;
}


var checkPass = false;
var ckeckEmailkk = false;
var checkRepass = false;




function vali_isEmpty(text) {
  if (text === "") {
    return true;
  }
  return false;
}
function check_email(id) {
  var s = document.getElementById(id).value;
  if (!vali_isEmail(s)) {
    document.getElementById("require-email").style.display = "block";
    ckeckEmailkk  = false;
    return true;
  }
  if (vali_isEmail(s)) {
    document.getElementById("require-email").style.display = "none";
    ckeckEmailkk = true;
    return false;
  }
}
function check_password(id) {
  var s = document.getElementById(id).value;

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
function check_password2(id, id2) {
  var s = document.getElementById(id).value;
  var s2 = document.getElementById(id2).value;
  if (s != s2) {
    document.getElementById("require-password2").style.display = "block";
    checkRepass = false;
    return true;
  } else {
    document.getElementById("require-password2").style.display = "none";
    checkRepass = true;
    return false;
  }
}
function check_phone(id) {
  var s = document.getElementById(id).value;
  if (!vali_PhoneNumber(s)) {
    document.getElementById("require-phone").style.display = "block";
    checkPhone = false;
    return true;
  }
  if (vali_PhoneNumber(s)) {
    document.getElementById("require-phone").style.display = "none";
    checkPhone = true;
    return false;
  }
}
function check_name(id) {
  var s = document.getElementById(id).value;
  if (vali_isEmpty(s)) {
    document.getElementById("require-lname").style.display = "block";
    checkName = false;
    return true;
  } else {
    document.getElementById("require-lname").style.display = "none";
    if (!vali_isText(s)) {
      document.getElementById("require-lname2").style.display = "block";
      checkName = false;
      return true;
    }
    if (vali_isText(s)) {
      checkName = true;
      document.getElementById("require-lname2").style.display = "none";
      return false;
    }
  }
}

function checkEmpty(){
  var idMail = 'inputemail';
  var idpass = 'inputPassword';
  var idrepass='inputPassword-confirm';
  if (check_email(idMail)||check_email(idMail)== null){
    document.getElementById("require-email").style.display = "block";
  }
  if (check_password(idpass)||check_password(idpass)==null){
    document.getElementById('require-password').style.display = "block";
  }
  if (check_password2(idpass,idrepass)||check_password2(idpass,idrepass)==null){
    document.getElementById('require-password2').style.display = "block";
  }


}

function checkRegisterABCDEFGH() {
  if (ckeckEmailkk&&checkRepass&&checkPass){
      return true;
  }else {
    return  false;
  }
}
function checkRegister() {
  if (checkEmail&&checkPass&&checkRepass){
      console.log("123");
      return true;
  }else {
    console.log("false")
    return  false;
  }
  
  
  
}

