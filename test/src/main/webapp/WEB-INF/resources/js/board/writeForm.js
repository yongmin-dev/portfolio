	window.addEventListener("load", init, false);
	function init() {
		//쓰기버튼
		writeBtn.addEventListener("click", function(e) {
			e.preventDefault();
			document.getElementById("boardVO").submit();
		}, false);

		//취소버튼
		cancelBtn.addEventListener("click", function(e) {
			e.preventDefault();
			document.getElementById("boardVO").reset();
		}, false);

		//목록버튼
		listBtn.addEventListener("click", function(e) {
			e.preventDefault();
			location.href = getContextPath() + "/board/list";

		}, false);

	}