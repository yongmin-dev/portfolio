window.addEventListener("load", init, false);

function init() {
	changeMode(false);

	let modifyBtn = document.getElementById('modifyBtn');
	let deleteBtn = document.getElementById('deleteBtn');
	let replyBtn = document.getElementById('replyBtn');
	let listBtn = document.getElementById('listBtn');

	// 답글버튼
	replyBtn.addEventListener("click", function(e) {
		e.preventDefault();
		console.log("답글");
		let returnPage = e.target.getAttribute('data-returnPage');
		let bnum = e.target.getAttribute('data-bnum');
		location.href = getContextPath() + "/board/replyForm/" + returnPage
				+ "/" + bnum;
	}, false);

	// 수정버튼
	if (modifyBtn != null) {
		modifyBtn.addEventListener("click", function(e) {
			e.preventDefault();
			changeMode(true);
		}, false);
	}

	// 삭제 버튼
	if (deleteBtn != null) {
		deleteBtn.addEventListener("click", function(e) {
			e.preventDefault();

			if (confirm("삭제하실거?")) {
				let returnPage = e.target.getAttribute('data-returnPage');
				let bnum = e.target.getAttribute('data-bnum');
				location.href = getContextPath() + "/board/delete/"
						+ returnPage + "/" + bnum;
			}
		}, false);
	}

	// 취소 버튼(수정모드 에서 읽기 모드로 전환)
	cancelBtn.addEventListener("click", function(e) {
		e.preventDefault();
		console.log("취소");
		changeMode(false);
	}, false);

	// 저장하기
	saveBtn.addEventListener("click", function(e) {
		e.preventDefault();
		console.log("저장");

		document.getElementById('boardVO').submit();

	}, false);

	// 목록보기
	listBtn.addEventListener("click", function(e) {
		e.preventDefault();
		console.log("목록");
		let returnPage = e.target.getAttribute('data-returnPage');
		location.href = getContextPath() + "/board/list/" + returnPage;
	}, false);

	// 첨부파일 1건 삭제 : Ajax로 구현함
	let fileList = document.getElementById('fileList');
	if (fileList != null) {
		fileList
				.addEventListener(
						"click",
						function(e) {
							console.log(e.target); // 이벤트가 발생된 요소
							console.log(e.currentTarget); // 이벤트가 등록된 요소
							console.log(e.target.tagName);

							// 선택된 요소가 첨부파일 삭제 아이콘 일때만 삭제처리 수행
							if (e.target.tagName != 'I') {
								return false;
							}
							if (!confirm('삭제하시겠습니까?')) {
								return false;
							}
							// 실제 이벤트가 발생한 요소의 data-del_file 속성값 읽어오기
							let fid = e.target.getAttribute('data-del_file');

							// AJAX 사용
							// 1) XMLHttpRequest 객체 생성
							var xhttp = new XMLHttpRequest();

							// 2) 서버응답처리
							xhttp.addEventListener("readystatechange",
									ajaxCall, false);
							function ajaxCall() {
								if (this.readyState == 4 && this.status == 200) {
									console.log(this.responseText);
									if (this.responseText == "success") {
										console.log('성공');
										// 삭제 대상 요소 찾기
										let delTag = e.target.parentElement.parentElement.parentElement;
										// 부모요소에서 삭제대상 요소 제거
										fileList.removeChild(delTag);
									} else {
										console.log('실패');
									}
								}
							}

							xhttp.open("DELETE",
									"http://localhost:9080/portfolio/board/file/"
											+ fid, true);
							xhttp.send();

						}, false);
	}

}

// 읽기모드, 수정모드
function changeMode(flag){
	let rmodes = document.getElementsByClassName("rmode");
	let umodes = document.getElementsByClassName("umode");
	
	// 수정모드
	if(flag){
		// 제목변경 => 게시글 보기
		document.getElementById("title").textContent = '게시글 수정';
		// 분류, 필드 제목, 내용 필드
		document.getElementById("boardCategoryVO.cid").removeAttribute("disabled");
		document.getElementById("btitle").removeAttribute("readOnly");
		document.getElementById("bcontent").removeAttribute("readOnly");
		// 수정모드버튼 활성화
		Array.from(rmodes).forEach(e=>{e.style.display="none";});
		Array.from(umodes).forEach(e=>{e.style.display="block";});
		
		// 읽기 모드
	}else{
		// 제목 변경 => 게시글 보기
		document.getElementById("title").textContent = '게시글보기';
		// 분류, 필드 제목, 내용 필드
		document.getElementById("boardCategoryVO.cid").setAttribute("disabled",true);
		document.getElementById("btitle").setAttribute("readOnly",true);
		document.getElementById("bcontent").setAttribute("readOnly",true);
		// 읽기 모드 버튼 활성화
		Array.from(rmodes).forEach(e=>{e.style.display="block";});
		Array.from(umodes).forEach(e=>{e.style.display="none";});
	}
	
}










































