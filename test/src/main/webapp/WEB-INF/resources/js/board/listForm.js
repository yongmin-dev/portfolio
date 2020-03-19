window.addEventListener("load", init, false);

function init() {
	// 글쓰기 버튼 클릭시
	writeBtn.addEventListener("click", function(e) {

		e.preventDefault();
		
		let returnPage = e.target.getAttribute('data-returnPage');
		location.href = getContextPath() + "/board/writeForm/" + returnPage;
	}, false);

	// 검색버튼 클릭시
	searchBtn.addEventListener("click", function(e) {
		e.preventDefault();
		// console.log("검색!!");
		// 검색어 입력값이 없으면
		if (keyword.value.trim().length == 0) {
			alert('검색어를 입력하세요!');
			keyword.value = "";
			keyword.focus();
			return false;
		}

		let stype = searchType.value; // 검색유형
		let kword = keyword.value.trim(); // 검색어

		location.href = getContextPath() + "/board/list/1/" + stype + "/"
				+ kword;
	}, false);
}