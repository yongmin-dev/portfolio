<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="commentArea">
		<!-- 댓글 달기 -->
		<div id="comment">
			<div class="row">
				<textarea name="ccontent" id="ccontent" rows="3"></textarea>
				<button id="commentBtn2">등록</button>
			</div>
		</div>

		<!-- 댓글 목록 -->
		<div id="commentList">
			<div class="row pw-10">
				<div class="row pw-10">
					<div class="col fw-7">
						<img src="" alt="사진" />
					</div>
					<div class="col pw-10">
						<div class="row header pw-10">
							<div class="col fw-10">댓글작성자</div>
							<div class="col fw-10">
								<small><i>댓글작성일시</i></small>
							</div>
							<div class="col fw-5">
								<span><a href="#" class="commentModifyBtn" data-rnum="">수정버튼</a></span>
							</div>
							<div class="col fw-5">
								<span><a href="#" class="commentDeleteBtn" data-rnum="">삭제버튼</a></span>

							</div>
						</div>
					</div>
				</div>
				<div class="row body">
					<div class="col fw-5">부모댓글작성자</div>
					<div class="col">댓글내용</div>
				</div>
				<div class="row bottom">
					<div class="col fw-10">
						<span><a href="#" class="goodbtn" data-rnum="">선호</a></span>
						<div class="col fw-10">
							<span><a href="#" class="badbtn" data-rnum="">비선호</a></span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 대댓글 양식  -->
			<div class="row pw-10" data-rnum="">
				<div class="row pw-10 lm-7">
					<div class="col fw-7">
						<img src="" alt="사진" />
					</div>
					<div class="col pw-10">
						<div class="row header pw-10">
							<div class="col fw-10">댓글작성자</div>
							<div class="col fw-10">
								<small><i>댓글작성일시</i></small>
							</div>
							<div class="col fw-5">
								<span><a href="#" class="recomentBtn" data-rnum="">댓글버튼</a></span>
							</div>
							<div class="col pw-10">
								<div class="row">
									<div class="col fw-5">
										<span><a href="#" class="comentModifyBtn" data-rnum="">수정버튼</a></span>
									</div>
									<div class="col fw-5">
										<span><a href="#" class="comentDeleteBtn" data-rnum="">삭제버튼</a></span>
									</div>
								</div>
							</div>
						</div>
						<div class="row body">
							<div class="col fw-5">부모댓글작성자</div>
							<div class="col">댓글내용</div>
						</div>
						<div class="row bottom">
							<div class="col fw-10">
								<span><a href="#" class="goodBtn" data-rnum="">선호</a></span>(3)
							</div>
							<div class="col fw-10">
								<span><a href="#" class="badBtn" data-rnum="">비선호</a></span>(1)
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--페이징-->
		<div id="paging">
			<a href="#">첫페이지</a> <a href="#">이전페이지</a> <a href="#">1</a> <a
				href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
			<a href="#">6</a> <a href="#">7</a> <a href="#">8</a> <a href="#">9</a>
			<a href="#">10</a> <a href="#">다음페이지</a> <a href="#">끝페이지</a>































