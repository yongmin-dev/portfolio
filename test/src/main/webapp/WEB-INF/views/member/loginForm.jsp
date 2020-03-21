<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>Login Page</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />
<link rel="stylesheet" href="<c:url value='/resources/css/member/login.css' />">
<%@ include file="../include/bootstrap_css.jsp"%>
<script src="<c:url value='/resources/js/member/login.js' />"></script>
</head>
<body>
	<div class="container">
		<div class="login-wrapper">
			<form id="frm"
				action="${pageContext.request.contextPath }/member/login"
				method="post">
				<div>
					<h3 class="login-title">LOGIN</h3>
				</div>
				<div class="login-content">
					<div>
						<input type="text" name="id" id="id" value="" placeholder="아이디">
					</div>
					<div>
						<span id="idMsg"></span>
					</div>
					<div>
						<input type="password" name="pw" id="pw" placeholder="비밀번호">
					</div>
					<div>
						<span id="pwMsg" class="errmsg"><c:if
								test="${!empty svr_msg}">${svr_msg }</c:if></span>
					</div>
					<div>
						<input type="submit" name="" id="loginBtn" value="              LOGIN              "/>
					</div>
				</div>
			</form>
			<div class="find_info">
				<a href="<c:url value='/member/findIDForm' />">Finding ID</a> <span>|</span>
				<a href="<c:url value='/member/findPWForm' />">Finding PW</a> <span>|</span>
				<a href=<c:url value='/member/joinForm' />>Join</a>
			</div>
		</div>
	</div>
</body>
</html>





























