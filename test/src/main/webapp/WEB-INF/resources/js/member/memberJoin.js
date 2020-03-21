window.addEventListener("load", init, false);
function init() {
	joinBtn.addEventListener("click", function(e) {
		e.preventDefault();
		console.log('clicked!');

		if (checkValid()) {
			console.log('submit 실행');
			document.getElementById("joinFrm").submit();
		}
	}, false);
}


function checkValid() {
	console.log('checkValid');
    var id_errmsg = document.getElementById('id_errmsg');
    var pw_errmsg = document.getElementById('pw_errmsg');
    var pwChk_errmsg = document.getElementById('pwChk_errmsg');
    var tel_errmsg = document.getElementById('tel_errmsg');
    var nickname_errmsg = document.getElementById('nickname_errmsg');
    var legion_errmsg = document.getElementById('region_errmsg');
    var gender_errmsg = document.getElementById('gender_errmsg');
    var birth_errmsg = document.getElementById('birth_errmsg');

	var idEle = document.getElementById('id');
	var pwEle = document.getElementById('pw');
	var pwChkEle = document.getElementById('pwChk');
	var telEle = document.getElementById('tel');
	var nicknameEle = document.getElementById('nickname');
	var regionEle = document.getElementById('region');
	var genderEle = document.getElementsByName('gender');
	var birthEle = document.getElementById('birth');


var flag = true;

// 1)이메일 주소 체크
if(!isEmail(idEle.value)){
	id_errmsg.innerHTML = "The email format is wrong";
	flag = flag && false;
}else{
	id_errmsg.innerHTML = "id ok";
}

// 2) 비밀번호 체크
if(!isPassword(pwEle.value)){
	pw_errmsg.innerHTML ="The password format is wrong";
	flag = flag && false;
}else{
	pw_errmsg.innerHTML = "";
}

// 3) 비밀번호 재확인
// 3-1 비밀번호 패턴 체크
if(isPassword(pwChkEle.value)){
	pwChk_errmsg.innerHTML = "비밀번호가 잘못되었습니다";
	flag = flag && false;
}else{
	pwChk_errmsg.innerHTML = "";
}
// 3-2 password matching check
if(pwEle.value != pwChkEle.value ){
	pwChk_errmsg.innerHTML = "비밀번호가 일치하지 않습니다";
	flag = flag && false;
}else{
	pwChk_errmsg.innerHTML = "";
}

// 4 phone Number
if(!isTel(telEle.value)){
	tel_errmsg.innerHTML = "tel number format is wrong ex)010-1234-1234";
	flag = flag && false;
}else{
	tel_errmsg.innerHTML = "";
}

// 5) nickname
if(nicknameEle.value == ""){
		nickname_errmsg.innerHTML = "please input nickname!";
		flag = flag && false;
}else{
	nickname_errmsg.innerHTML = "";
}

// 6) region
if(regionEle.selectedIndex == 0){
	region_errmsg.innerHTML = "please select region";
	flag = flag && false;
}else{
	region_errmsg.innerHTML = "";
}

// 7) 성별
var status = false;
for(var gender of genderEle){
	if(gender.checked){
		status = true;
		break;
	}
}
if(!status){
	gender_errmsg.innerHTML = "please select gender";
	flag = flag && false;
}else{
	gender_errmsg.innerHTML = "";
}

// 8) 생년월일 체크
if(birthEle.value == ""){
	birth_errmsg.innerHTML = "please input birthday";
	flag = flag && false;
}else{
	birth_errmsg.innerHTML = "";
}
console.log('flag 까지 돌았음');
flag = true;
return flag;

}


// 이메일 체크 정규식
function isEmail(asValue) {
  var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
  return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}

// 핸드폰 번호 체크 정규식
function isTel(asValue) {
  var regExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
  return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}

// 비밀번호 체크 정규식
function isPassword(asValue) {
  var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,10}$/; // 8 ~ 10자 영문, 숫자 조합
  return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}




































