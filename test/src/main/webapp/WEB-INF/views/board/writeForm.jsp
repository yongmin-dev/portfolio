<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>게시글 작성</title>
<link rel="stylesheet" href="<c:url value='/resources/css/reset.css' />">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />
<link rel="stylesheet" href="<c:url value='/resources/css/menu.css' />">
<link rel="stylesheet"
	href="<c:url value='/resources/css/layout.css' />">
<link rel="stylesheet"
	href="<c:url value='/resources/css/board/writeForm.css' />">
	
	<!-- CSS 모음 -->
<%@ include file="../include/bootstrap_css.jsp"%>
	
<script src="<c:url value='/resources/js/common.js' />"></script>
<script src="<c:url value='/resources/js/board/writeForm.js' />"></script>

</head>
<body>
	<div class="mycontainerAll">
		<div class="content">
			<!--::header part start::-->
			<%@ include file="../include/bs_header.jsp"%>
			<!-- Header part end-->
			
			<!-- main -->
			<main>
				<div class="mycontainer main-inner-box">
					<div class="mycontainer mycontainer-sc">
						<div id="frm">
							<div>
								<h2>게시글 작성</h2>
							</div>
							<form:form
								action="${pageContext.request.contextPath }/board/write/${returnPage }"
								enctype="multipart/form-data" method="post"
								modelAttribute="boardVO">
								<div class="row">
								
									<form:label path="boardCategoryVO.cid" class="col-1-1">분류</form:label>
									<form:select class="col-2-1" path="boardCategoryVO.cid">
										<option value="0">=== 선택 ===</option>
										<form:options path="boardCategoryVO.cid"
											items="${boardCategoryVO }"
											itemValue="cid"
											itemLabel="cname" />
									</form:select>
									<form:errors path="boardCategoryVO.cid" />
								</div>
								<div class="row">
									<form:label path="btitle" class="col-1-1">제목</form:label>
									<form:input class="col-2-1" type="text" path="btitle" />
									<form:errors path="btitle" />
								</div>
								<div class="row">
									<form:label class="col-1-1" path="bid">작성자</form:label>
									<input type="text" class="col-2-1" readonly="readOnly"
										value="${member.nickname }(${member.id })" />

								</div>
								<div class="row">
									<form:label class="col-1-1" path="bcontent">내용</form:label>
									<form:textarea class="col-2-1" rows="10" path="bcontent"></form:textarea>
									<form:errors path="bcontent" />
								</div>
								<div class="row">
									<form:label class="col-1-1" path="files">첨부</form:label>
									<form:input type="file" multiple="multiple" path="files" />
									<form:errors path="files" />
								</div>
								<div class="row">
									<div class="row btns">
										<form:button class="btn" id="writeBtn">등록</form:button>
										<form:button class="btn" id="cancelBtn">취소</form:button>
										<form:button class="btn" id="listBtn">목록</form:button>
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</main>
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
