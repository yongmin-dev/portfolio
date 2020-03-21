window.addEventListener("load", init, false);

function init() {
	modifyBtn.addEventListener("click", function(e) {
		e.preventDefault();
		if (checkValid()) {
			document.getElementById("joinFrm").submit();
		}
	}, false);
}

// 정보 유효성 체크
function checkValid() {
	var idEle = document.getElementById('id');
	var pwEle = document.getElementById('pw');
	var telEle = document.getElementById('tel');
	var nicknameEle = document.getElementById('nickname');
	var regionEle = document.getElementById('region');
	var genderEle = document.getElementById('gender');
	var birthEle = document.getElementById('birth');

	var flag = true;

	// 비밀번호 확인
	if (!isPassword(pwEle.value)) {
		pw_errmsg.innerHTML = "비밀번호가 잘못되었습니다. (8~10자리)";
		flag = false;
	} else {
		pw_errmsg.innerHTML = "";
	}

	// 전화번호 확인
	if (!isTel(telEle.value)) {
		tel_errmsg.innerHTML = "전화번호가 잘못되었슴 ex)010-1111-1111";
		flag = false;
	} else {
		nickname_errmsg.innerHTML = "";
	}

	// nickname 확인
	if (nicknameEle.value == "") {
		nickname_errmsg.innerHTML = "please input nickname";
		flag = false;
	} else {
		nickname_errmsg.innerHTML = "nickname을 잘 입력했구나";
	}

	// 지역 확인
	if (regionEle.selectedIndex == 0) {
		region_errmsg.innerHTML = "please choose region";
		flag = false;
	}else{
		region_errmsg.innerHTML ="";
	}
	
	// 성별 확인
//	var status = false;
//	for(var gender of genderEle){
//		if(gender.checked){
//			status = true;
//			break;
//		}
//	}
//	if(!status){
//		gender_errmsg.innerHTML = "please choose your gender";
//		flag = false;
//	}else{
//		gender_errmsg.innerHTML = "good job";
//	}
	
	// 생년월일 확인
	if(birthEle.value==""){
		birth_errmsg.innerHTML="please fill your birthday up";
		flag=false;
	}else{
		birth_errmsg.innerHTML="good job";
		
	}
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