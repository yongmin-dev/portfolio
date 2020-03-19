window.addEventListener("load", init, false);
function init(){
	//등록버튼 클릭
	
	let writeBtn = document.getElementById("writeBtn");
	let cancelBtn = document.getElementById("cancelBtn");
	let listBtn = document.getElementById("listBtn");
	
	writeBtn.addEventListener("click", function(e){
		e.preventDefault();
		
		//게시글 작성 전송
		document.getElementById("boardVO").submit();
		
	},false)
	
	cancelBtn.addEventListener("click", function(e){
		e.preventDefault();
		document.getElementById("boardVO").reset();
	},false);
	
	listBtn.addEventListener("click", function(e){
		e.preventDefault();
		let returnPage = e.target.getAttribute('data-returnPage');
		location.href=getContextPath()+"/board/list/"+returnPage;
	},false);
	
	
}