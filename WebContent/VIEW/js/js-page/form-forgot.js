function vali_isEmail(text) {
    const regex = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g;
    const result = regex.test(text);
    return result;
}

function vali_isPassword(text) {
    const regex = /^(?=.*[a-z])(?=.*[a-zA-Z]).{8,}$/g;
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

var checkRepass = false;




function vali_isEmpty(text) {
    if (text === "") {
        return true;
    }
    return false;
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
    } else {
        document.getElementById("require-password2").style.display = "none";
        checkRepass = true;
    }
}

var checknhap = false;
function check_password3(id, id2) {
    var s = document.getElementById(id).value;
    var s2 = document.getElementById(id2).value;
    if (s != s2) {
        document.getElementById("displayErr").style.display = "block";
        checknhap = false;
    } else {
        document.getElementById("displayErr").style.display = "none";
        checknhap = true;
    }
}

function checkNhap(){
    if (checknhap){
        return true;
    }else
        return false
}

function checkRegister() {
    if (checkRepass&&checkPass){
        return true;
    }else {
        return  false;
    }
}

