<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>수 건설</title>


<!-- CSS 모음 -->
<%@ include file="include/bootstrap_css.jsp"%>

</head>

<body>

	<!-- ============================================================================================================= -->
	<!--::header part start::-->
	<%@ include file="include/bs_header.jsp"%>
	<!-- Header part end-->
	<!-- ============================================================================================================= -->

<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${pageContext.request.contextPath }/resources/img/work/01.jpg" class="d-block w-100 rounded-sm" alt="...">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath }/resources/img/work/02.jpg" class="d-block w-100 rounded-sm" alt="...">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath }/resources/img/work/03.jpg" class="d-block w-100 rounded-sm" alt="...">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>


	<!-- ============================================================================================================= -->
	<!-- banner post start-->
	<section class="banner_post">
		<div class="container-fluid">
			<div class="row justify-content-between">
				<div class="banner_post_1 banner_post_bg_1">
					<div class="banner_post_iner text-center">
						<a href="category.html"><h5>Fashion / Life style</h5></a> <a
							href="single-blog.html"><h2>All said replenish years
								void kind say void</h2></a>
						<p>Posted on April 15, 2019</p>
					</div>
				</div>
				<div class="banner_post_1 banner_post_bg_2">
					<div class="banner_post_iner text-center">
						<a href="category.html"><h5>Fashion / Life style</h5></a> <a
							href="single-blog.html"><h2>All said replenish years
								void kind say void</h2></a>
						<p>Posted on April 15, 2019</p>
					</div>
				</div>
				<div class="banner_post_1 banner_post_bg_3">
					<div class="banner_post_iner text-center">
						<a href="category.html"><h5>Fashion / Life style</h5></a> <a
							href="single-blog.html"><h2>All said replenish years
								void kind say void</h2></a>
						<p>Posted on April 15, 2019</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!--banner post end-->

	<!-- ============================================================================================================= -->
	<!-- Body 부분 구현 추후예정 -->
	<%@ include file="include/bs_body.jsp"%>
	<!-- ============================================================================================================= -->

	<!-- ============================================================================================================= -->
	<!-- footer part start-->
	<%@ include file="include/bs_footer.jsp"%>
	<!-- footer part end-->
	<!-- ============================================================================================================= -->

	<!-- ============================================================================================================= -->
	<!-- js start -->
	<%@ include file="include/bootstrap_js.jsp"%>
	<!-- js end -->

</body>

</html>