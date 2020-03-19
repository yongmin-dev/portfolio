<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>게시판</title>
<link rel="stylesheet" href="<c:url value='/resources/css/reset.css' />">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />
<link rel="stylesheet" href="<c:url value='/resources/css/menu.css' />">
<link rel="stylesheet"
	href="<c:url value='/resources/css/layout.css' />">
<link rel="stylesheet"
	href="<c:url value='/resources/css/board/listForm.css' />">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/webjars/bootstrap/4.4.1-1/css/bootstrap.css">
	
	<!-- CSS 모음 -->
<%@ include file="../include/bootstrap_css.jsp"%>
	
<script src="<c:url value='/resources/js/common.js' />"></script>
<script src="<c:url value='/resources/js/board/listForm.js'/>">
	
</script>




</head>
<body>
	<div class="mycontainerAll">
		<div class="content">
	<!--::header part start::-->
	<%@ include file="../include/bs_header.jsp"%>
	<!-- Header part end-->
			</nav>

			<!-- main -->
			<main>
				<div class="mycontainer main-inner-box">
					<div class="mycontainer mycontainer-sc">
						<div id="boardList">
							<div>
								<h2 id="title">질문게시판</h2>
							</div>
							<div>
								<table class="table table-hover">
									<tr>
										<th>번호</th>
										<th>분류</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회수</th>
									</tr>
									<c:forEach var="rec" items="${list }">
										<fmt:formatDate value="${rec.bcdate }"
											pattern="yyyy/MM/dd HH:mm" var="cdate" />
										<tr>
											<td>${rec.bnum }</td>
											<td>${rec.boardCategoryVO.cname }</td>
											<td><c:forEach begin="1" end="${rec.bindent }">&nbsp;&nbsp;</c:forEach>
												<c:if test="${rec.bindent >0 }">
													->
												</c:if> <a class="board_title"
												href="${pageContext.request.contextPath }/board/view/${pc.rc.reqPage}/${rec.bnum }">
													${rec.btitle }</a></td>
											<td>${rec.bnickname }(${rec.bid })</td>
											<td>${cdate }</td>
											<td>${rec.bhit }</td>
										</tr>
									</c:forEach>
									<tr>
										<td colspan="5"></td>
										<td><button id="writeBtn"
												data-returnPage="${pc.rc.reqPage }">글쓰기</button></td>
									</tr>
								</table>
							</div>
							<div id="paging">
								<!-- 처음페이지 / 이전페이지 이동 -->
								<c:if test="${pc.prev }">
									<a
										href="${contextRoot }/board/list/1/${pc.fc.searchType }/${pc.fc.keyword }">
										<i class="fas fa-angle-double-left"></i>
									</a>
									<a
										href="${contextRoot }/board/list/${pc.startPage-1}/${pc.fc.searchType}/${pc.fc.keyword}">
										<i class="fas fa-angle-left"></i>
									</a>
								</c:if>
								<c:forEach var="pageNum" begin="${pc.startPage }"
									end="${pc.endPage }">
									<!-- 현재 페이지와 요청 페이지가 다르면 -->
									<c:if test="${pc.rc.reqPage != pageNum }">
										<a
											href="${contextRoot }/board/list/${pageNum}/${pc.fc.searchType}/${pc.fc.keyword}"
											class="off">${pageNum }</a>
									</c:if>

									<!-- 현재 페이지와 요청 페이지가 같으면 -->
									<c:if test="${pc.rc.reqPage == pageNum }">
										<a
											href="${contextRoot }/board/list/${pageNum }/${pc.fc.searchType}/${pc.fc.keyword}"
											class="on">${pageNum }</a>
									</c:if>
								</c:forEach>

								<!--  다음페이지 / 최종페이지 이동 -->
								<c:if test="${pc.next }">
									<a
										href="${contextRoot }/board/list/${pc.endPage+1}/${pc.fc.searchType }/${pc.fc.keyword }">
										<i class="fas fa-angle-right"></i>
									</a>
								</c:if>
							</div>
							<div id="search">
								<form>
									<select name="searchType" id="searchType">
										<option value="TC"
											<c:out value="${pc.fc.searchType == 'TC' ? 'selected':'' }" />>제목+내용</option>
										<option value="T"
											<c:out value="${pc.fc.searchType == 'T' ? 'selected':'' }" />>제목</option>
										<option value="C"
											<c:out value="${pc.fc.searchType == 'C' ? 'selected':'' }" />>내용</option>
										<option value="N"
											<c:out value="${pc.fc.searchType == 'N' ? 'selected':'' }"/>>작성자</option>
										<option value="I"
											<c:out value="${pc.fc.searchType == 'I' ? 'selected':'' }"/>>아이디</option>
									</select> <input type="search" name="keyword" id="keyword"
										value="${pc.fc.keyword }" />
									<button id="searchBtn">검색</button>

								</form>
							</div>


						</div>
					</div>


				</div>


			</main>
				<script
		src="${pageContext.request.contextPath }/webjars/jquery/3.4.1/jquery.js"></script>
	<script
		src="${pageContext.request.contextPath }/webjars/popper.js/2.0.2/umd/popper.js"></script>
	<script
		src="${pageContext.request.contextPath }/webjars/bootstrap/4.4.1-1/js/bootstrap.js"></script>
			
				<!-- ============================================================================================================= -->
	<!-- footer part start-->
	<%@ include file="../include/bs_footer.jsp"%>
	<!-- footer part end-->
	<!-- ============================================================================================================= -->

	<!-- ============================================================================================================= -->
	<!-- js start -->
	<%@ include file="../include/bootstrap_js.jsp"%>
	<!-- js end -->
</body>
</html>



































