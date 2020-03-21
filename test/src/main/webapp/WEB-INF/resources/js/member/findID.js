window.addEventListener("load", init, false);
function init() {
	var findIDBtn = window.document.getElementById("findIDBtn");

	findIDBtn
			.addEventListener(
					"click",
					function(e) {
						var result = checkFindID();

						if (result) {
							// AJAX 사용
							// 1)XMLHttpRequest 객체 생성
							var xhttp = new XMLHttpRequest();

							// 2) 서버응답처리
							// XMLHttpRequest.readyState 값에대한 정의 Holds the
							// status of the XMLHttpRequest.
							// 0: 초기화되지않은 상태(open()가 호출되지않은상태) request not
							// initialized
							// 1: open()가 실행된 상태 server connection established
							// 2: 서버가 클라이언트의 요청을 받았음. send()가 실행된 상태 request
							// received
							// 3: 서버가 클라이언트의 요청 처리중. 응답헤더는 수신했으나 바디가 수신중인상태
							// processing request
							// 4: 서버가 클라이언트의 요청을 완료했고 서버도 응답이 완료된 상태 request
							// finished and response is ready

							xhttp.addEventListener("readystatechange",
									ajaxCall, false);
							function ajaxCall() {
								if (this.readyState == 4 && this.status == 200) {
									console.log(this.responseText);

									// json 포맷 문자열 => 자바스크립트 object
									var jsonObj = JSON.parse(this.responseText)
									// console.log(jsonObj.id);
									if (jsonObj.success) {
										document.getElementById("id").value = jsonObj.id;
										document.getElementById("birthMsg").innerHTML = "아이디 잘 가져왔네";
									} else {
										document.getElementById("id").value = "";
										document.getElementById("birthMsg").innerHTML = jsonObj.msg;
									}
								}// end if(this.readyState == 4 &&
								// this.status == 200)
							}// end of function ajaxCall()

							// 3)서비스 요청

							var sendData = {};
							sendData.tel = document.getElementById("tel").value;
							sendData.birth = document.getElementById("birth").value;

							var result = JSON.stringify(sendData);
							console.log(result);

							xhttp.open("POST",
									"http://localhost:8088/test/member/id",
									false);
							xhttp.setRequestHeader("Content-Type",
									"application/json;charset=utf-8");
							xhttp.send(result);

						}
					}, false);

}

function checkFindID() {
	// 사용자가 입력한 전화번호 읽어오기
	var telTag = document.getElementById("tel");
	var telValue = telTag.value;
	// 사용자가 입력한 생년월일 읽어오기
	var birthTag = document.getElementById("birth");
	var birthValue = birthTag.value;

	var flag = true; // 유효성 성공유뮤 플래그

	// 1) 전화번호 체크
	if (telValue.trim().length == 0) {
		telMsg.innerHTML = "전화번호를 입력하세요!";
		telMsg.classList.add("errmsg");
		telTag.focus();
		flag = false;
		return flag;
	}
	// 2) 생년월일체크
	if (birthValue.trim().length == 0) {
		telMsg.innerHTML = "";
		birthMsg.innerHTML = "생년월일를 입력하세요!";
		birthMsg.classList.add("errmsg");
		birthTag.focus();
		flag = false;
		return flag;
	}
	telMsg.innerHTML = "";
	birthMsg.innerHTML = "";
	return flag;
}
