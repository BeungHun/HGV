<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- 헤더 -->
	<div class="row">
		
		<div class="col"></div>
		<!-- 공란 -->
		<div class="col-6" style="text-align: center">
			<!-- 로고 이미지 -->
			<a href="../admin/mainPage"><img id="banner_img" alt="" width="150"
				src="../resources/img/HGV_banner.png"></a>

		</div>
		<!-- 로그인 및 회원가입 -->
		<div class="col" style="text-align: right;">
			<c:choose>
				<c:when test="${!empty adminInfo }">
							${adminInfo.admin_nick } 님
							<a>&nbsp; |&nbsp; </a>
					<a href="../admin/logoutProcess"> Logout </a>
					
				</c:when>
				
			</c:choose>
		</div>
	</div>

	<!-- 개발메뉴바 -->
	<div class="row text-center">
	<nav class="navbar navbar-expand-lg bg-light" >
		<div class="container-fluid" >
			<a class="navbar-brand" href="../admin/mainPage">Main</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item">
						<div class="dropdown">
						  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						    관리자 게시글관리
						  </a>
						  <ul class="dropdown-menu">
						    <li><a class="dropdown-item" href="../board/adminQandA">Q&A</a></li>
						    <li><a class="dropdown-item" href="../board/FAQPage">FAQ</a></li>
						    <li><a class="dropdown-item" href="../board/notice">NOTICE</a></li>
						  </ul>
						</div>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">컨텐츠관리</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">회원관리</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	</div>
