<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>아이디 찾기</title>
<link rel="stylesheet"
	href="<c:url value='/resources/css/member/findID.css' />">
<script src="<c:url value='/resources/js/member/findID.js'/>"></script>
</head>
<body>
	<div class="mycontainer">
		<div class="login-wrapper"></div>
		<form id='frm'>
			<div>
				<h3 class="login-title">아이디 찾기</h3>
			</div>
			<div class="login-content">
				<div>
					<input type="tel" name="tel" id="tel" placeholder="전화번호 입력하세요">
				</div>
				<div>
					<span id="telMsg"></span>
				</div>
				<div>
					<input type="date" name="birth" id="birth" placeholder="생년월일 입력하세요">
				</div>
				<div>
					<span id="birthMsg" class="errmsg"></span>
				</div>
				<div>
					<input type="text" name="id" id="id" readOnly="readOnly"
						placeholder="아이디">
				</div>
				<div>
					<input type="button" id="findIDBtn" value="아이디찾기">
				</div>
			</div>



		</form>

		<div class="find_info">
			<a href="<c:url value='/member/findIDForm' />">아이디 찾기</a> <span>||</span>
			<a href="#">비밀번호 찾기</a> <span>||</span> <a
				href="<c:url value='/member/loginForm' />">Login</a>
		</div>
	</div>


</body>
</html>