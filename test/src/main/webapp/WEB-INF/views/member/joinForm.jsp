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

<title>Sign Up</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />
<link rel="stylesheet"
	href="<c:url value ='/resources/css/member/memberJoin.css' /> ">
	
	<!-- CSS 모음 -->
<%@ include file="../include/bootstrap_css.jsp"%>
<script src="<c:url value='/resources/js/member/memberJoin.js' />"></script>

<link rel="shortcut icon" href="#">



</head>
<body>
			<!--::header part start::-->
			<%@ include file="../include/bs_header.jsp"%>
			<!-- Header part end-->
	<form:form id="joinFrm"
		action="${pageContext.request.contextPath }/member/join"
		modelAttribute="mvo" method="post">
		<div class="container">
			<div class="content">
				<div>
					<h2 class="join-title">회원가입</h2>
				</div>

				<!-- 아이디 -->
				<div>
					<form:label path="id">아이디</form:label>
				</div>
				<div>
					<form:input type="text" path="id" />
				</div>
				<div>
					<span class="errmeg" id="id_errmsg"></span>
					<form:errors path="id" cssClass="errmsg"></form:errors>
				</div>

				<!-- 비밀번호 -->
				<div>
					<form:label path="pw">비밀번호</form:label>
				</div>
				<div>
					<form:input type="password" path="pw" />

				</div>
				<div>
					<span class="errmsg" id="pw_errmsg"></span>
					<form:errors path="pw" cssClass="errmsg"></form:errors>
				</div>


				<!-- 비밀번호 재확인 -->
				<div>
					<label for="pwChk">비밀번호 재확인</label>
				</div>
				<div>
					<input type="password" id="pwChk">
				</div>
				<div>
					<span class="errmsg" id="pwChk_errmsg"></span>
				</div>


				<!-- 전화번호  -->
				
				<div>
					<form:label path="tel">전화번호</form:label>
				</div>
				

				<div>
					<form:input type="tel" path="tel" ></form:input>
				</div>

				<div>
					<span class="errmsg" id="tel_errmsg"></span>
					<form:errors path="tel" cssClass="errmsg"></form:errors>
				</div>

				<!-- 별명 -->
				<div>
					<form:label path="nickname">별명</form:label>
				</div>

				<div>
					<form:input type="text" path="nickname"></form:input>
				</div>

				<div>
					<span class="errmsg" id="nickname_errmsg"></span>
					<form:errors path="nickname" cssClass="errmsg"></form:errors>
				</div>

				<!-- 지역 -->
				<div>
					<form:label path="region">지역</form:label>
				</div>
				<div>
					<form:select path="region">
						<option value="0">== 선택==</option>
						<form:options path="region" items="${region }" itemValue="code"
							itemLabel="label" />
					</form:select>
				</div>
				<div>
					<span class="errmsg" id="region_errmsg"></span>
					<form:errors path="region" cssClass="errmsg"></form:errors>
				</div>


				<!-- 성별 -->
				<div>
					<form:label path="gender">성별</form:label>
				</div>
				<div>
					<form:radiobuttons path="gender" items="${gender }"
						itemValue="code" itemLabel="label" />
				</div>
				<div>
					<span class="errmsg" id="gender_errmsg"></span>
					<form:errors path="gender" cssClass="errmsg"></form:errors>
				</div>

				<!-- 생년월일 -->
				<div>
					<form:label path="birth">생년월일</form:label>
				</div>
				<div>
					<form:input type="date" path="birth" />
					<i class="fas fa-mobile-alt fa-lg"></i>
				</div>
				<div>
					<span class="errmsg" id="birth_errmsg"></span>
					<form:errors path="birth" cssClass="errmsg"></form:errors>
				</div>

				<div style="color: red; font-weight: bold; font-size: 1.5 .rem">${svr_msg }</div>




				<!-- 가입하기 버튼 -->
				<div>
					<button type="submit" id="joinBtn">가입</button>




				</div>
			</div>
		</div>
	</form:form>
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