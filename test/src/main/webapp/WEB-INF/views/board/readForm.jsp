<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시글 읽기</title>
<link rel="stylesheet" href="<c:url value='/resources/css/reset.css' />">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />
<link rel="stylesheet" href="<c:url value='/resources/css/menu.css' />">
<link rel="stylesheet"
	href="<c:url value='/resources/css/layout.css' />">
<link rel="stylesheet"
	href="<c:url value='/resources/css/board/readForm.css' />">

<!-- CSS 모음 -->
<%@ include file="../include/bootstrap_css.jsp"%>

<script src="<c:url value='/resources/js/common.js' />"></script>
<script src="<c:url value='/resources/js/board/readForm.js' />"></script>

</head>
<body>
	<div class="mycontainerAll">
		<div class="content">
			<!--::header part start::-->
			<%@ include file="../include/bs_header.jsp"%>
			<!-- Header part end-->

			<!--  main -->
			<main>
				<div class="mycontainer main-inner-box">
					<div class="mycontainer mycontainer-sc">
						<div id="frm">
							<div>
								<h2 id="title">게시글 보기</h2>
							</div>
							<form:form
								action="${pageContext.request.contextPath }/board/modify/${returnPage }"
								enctype="multipart/form-data" method="post"
								modelAttribute="boardVO">
								<form:hidden path="bnum" />
								<div class="row hit">
									<span>조회수 : ${boardVO.bhit }</span>
								</div>
								<div class="row">
									<form:label path="boardCategoryVO.cid" class="col-1">분류</form:label>
									<form:select class="col-2-1" path="boardCategoryVO.cid"
										disabled="true">
										<option value="0">===선택===</option>
										<form:options path="boardCategoryVO.cid"
											items="${boardCategoryVO }" itemValue="cid" itemLabel="cname" />
									</form:select>
									<form:errors path="boardCategoryVO.cid" />
								</div>
								<div class="row">
									<form:label path="btitle" class="col-1">제목</form:label>
									<form:input class="col-2-1" type="text" path="btitle"
										readOnly="true" />
									<form:errors path="btitle" />
								</div>
								<div class="row">
									<label class="col-1" path="bid" style="margin-left:15px">작성자</label>
									<p>
										<span>${boardVO.bnickname }(${boardVO.bid })</span>
									</p>
								</div>
								<div class="row">
									<form:label class="col-1" path="bcontent">내용</form:label>
									<form:textarea class="col-2-1" rows="10" path="bcontent"
										readOnly="true"></form:textarea>
									<form:errors path="bcontent" />
								</div>
								<div class="row umode">
									<form:label class="col-1" path="files">첨부</form:label>
									<form:input type="file" multiple="multiple" path="files" />
									<form:errors path="files" />
								</div>

								<!-- 버튼 -->
								<div class="row">
									<div class="row btns">
										<form:button class="btn rmode" id="replyBtn"
											data-returnPage="${returnPage }" data-bnum="${boardVO.bnum }">답글</form:button>
										<!-- 작성자만  수정 삭제 가능 기능 시작-->
										<c:if test="${sessionScope.member.id == boardVO.bid }">
											<form:button class="btn rmode" id="modifyBtn">수정</form:button>
											<form:button class="btn rmode" id="deleteBtn"
												data-returnPage="${returnPage }"
												data-bnum="${boardVO.bnum }">삭제</form:button>
										</c:if>
										<!-- 작성자만 수정 삭제 가능 기능 완료 -->
										<form:button class="btn umode" id="cancelBtn">취소</form:button>
										<form:button class="btn umode" id="saveBtn">저장</form:button>
										<form:button class="btn" id="listBtn"
											data-returnPage="${returnPage }">목록</form:button>
									</div>
								</div>
								<!-- 첨부목록 -->
								<c:if test="${!empty files }">
									<div class="row">
										<div class="col-1">첨부목록</div>
										<div class="col-2-1" id="fileList">
											<c:forEach var="file" items="${files }">
												<p style="display: flex">
													<a class="fileList"
														href="${contextRoot }/board/file/${file.fid}">${file.fname}
														}</a> <span style="margin-left: 10px">(${file.fsize/1000 }kb)</span>
													<span class="umode" style="margin-left: 10px"> <a
														href="#none"><i class="fas fa-backspace"
															data-del_file="${file.fid }"></i></a>
													</span>
												</p>
											</c:forEach>
										</div>
									</div>
								</c:if>
							</form:form>
						</div>
					</div>
				</div>
			</main>
			<%-- <div>
				<%@ include file="../board/rereply.jsp"%>
			</div> --%>
			<!-- ============================================================================================================= -->
			<!-- footer part start-->
			<%@ include file="../include/bs_footer.jsp"%>
			<!-- footer part end-->
			<!-- ============================================================================================================= -->

			<!-- ============================================================================================================= -->
			<!-- js start -->
			<%@ include file="../include/bootstrap_js.jsp"%>
			<!-- js end -->
			</div>
			</div>
</body>
</html>





































