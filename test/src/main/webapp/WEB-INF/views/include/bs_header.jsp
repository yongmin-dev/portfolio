<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<header class="main_menu">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-12">
				<nav class="navbar navbar-expand-lg navbar-light">
					<a class="navbar-brand" href="${pageContext.request.contextPath }/">
						<img src="<c:url value='/resources/img/logo/logo2.png'/>"
						alt="logo" width="160px" height="70px" />
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div
						class="collapse navbar-collapse main-menu-item justify-content-center"
						id="navbarSupportedContent">
						<ul class="navbar-nav">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> 수건설소개 </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item"
										href="${pageContext.request.contextPath }/board/list">사장 인사말</a>
									<a class="dropdown-item" href="elements.html">찾아오시는 길</a>
									<a class="dropdown-item" href="elements.html">연혁</a>
								</div></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> 사업소개 </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item"
										href="${pageContext.request.contextPath }/board/list">보일러설비</a>
									<a class="dropdown-item" href="elements.html">배관 설비</a>
									<a class="dropdown-item" href="elements.html">누수/관리 보수</a>
							<li class="nav-item"><a class="nav-link"
								href="category.html"> 사진자료실</a></li>

							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> 게시판 </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item"
										href="${pageContext.request.contextPath }/board/list">질문게시판</a>
									<a class="dropdown-item" href="elements.html">자유게시판</a>
								</div></li>
						</ul>
					</div>

					<div class="header_social_icon d-none d-lg-block">
						<ul>
							<li>
								<div id="wrap">

									<c:set var="contextRoot"
										value="${pageContext.request.contextPath }" />
									<div class="mycontainer mycontainer-um">

										<!-- 로그인 전 -->
										<c:if test="${empty member }">
											<div class="gnb">
												<a href="<c:url value='/member/loginForm' />">로그인</a> <a
													href="<c:url value='/member/joinForm' />">회원가입</a>
											</div>
										</c:if>
										<!-- 로그인 후 -->
										<c:if test="${!empty member }">
											<div class="gnb">
												<a href="<c:url value='/member/logout' />">로그아웃</a> <a
													href="<c:url value='/member/modifyForm/${sessionScope.member.id }' />">${member.nickname }님</a>
												<a href="<c:url value='/member/outForm' />">회원탈퇴</a>

											</div>
										</c:if>
									</div>
								</div>
							</li>

						</ul>
					</div>
				</nav>
			</div>
		</div>
	</div>
</header>
