<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title> 타이틀을 적어주세요 ! </title>
    <!-- bootstrap 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

    <!-- bootstrap_ICON 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	
	<!-- 글꼴 -->
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Gothic+A1:500" rel="stylesheet">
	<!-- Jquery 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
	<!-- 공통으로 들어가야할 Css/JS -->
	<!-- 외부 css 로드  -->
    <link rel="stylesheet" type="text/css" href="../resources/css/commons.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/mainPage.css">
    <!-- 외부 script 로드  -->
    <script src="../resources/js/main.js"></script>

    <!-- Favicons -->
	<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
	<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
	<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
	<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
	<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
	<meta name="theme-color" content="#7952b3">
	
	
     

     
    <style>
    
         #logo_img{
        	height: 100px;
            width: 160px;
            object-fit: cover;
		}
		
		.container {
			 display : grid;
		}
		
		a{
			text-decoration-line:none;
			cursor: pointer;
		}
		
		
		.pagination{
			justify-content:center;
		}
		
		.leftMenu {
			background: #fff;
			height: 700px;
			border-radius:5px;
		}
		
		.notice_type{
			font-family: "Gothic A1";
			font-size: 22px;
			font-weight: bold;
		}
		
		


    </style>
    <!-- 외부 스크립트 로드 -->
    <script src="../resources/js/main.js"></script>
    <script src="../resources/js/mainPage.js"></script>
    <script type="text/javascript">
    
    

	function selectNoticeByCategory(e) {
		var noticeCategory = document.getElementById(e);
		console.log(e);
		var xhr = new XMLHttpRequest();
	    	xhr.onreadystatechange = function() {
	    		if(xhr.readyState == 4 && xhr.status == 200) {
	    			var jsonObj = JSON.parse(xhr.responseText);
	    			
	    		}
	    	}
		    
		
		xhr.open("get" , "../testapi/getNoticeListByCategory?notice_category=" + noticeCategory);
		xhr.send();
	}

    </script>
</head>

<body>
    <div style="width : 1200px; margin: 0 auto">
        <div class="container-fluid">
        <c:choose>
        	<c:when test="${!empty adminInfo }">
		        <jsp:include page="../commons/header.jsp"></jsp:include>
        	</c:when>
        	<c:otherwise>
				<jsp:include page="../commons/header.jsp"></jsp:include>   	
        	</c:otherwise>
        </c:choose>
	        <!-- 메인 컨텐츠 -->
	        <div class="row">
	        	<c:choose>
				<c:when test="${!empty adminInfo }">
		        	<div class="col-2" style="font-family: 'Jua', sans-serif; padding:35px 0px 0px">
		        		  <div class="row">
									<div class="flex-shrink-0 p-3 leftMenu" style="width: 200px;">
										<div class="col pt-5">
									    <a href="/" class="d-flex align-items-center pba-3 mb-3 link-dark text-decoration-none border-bottom">
									      <svg class="bi me-2" style="width:2; height:24"><use xlink:href="#bootstrap"/></svg>
									      <span class="fs-3 fw-semibold">관리자 메뉴</span>
									    </a>
										<ul class="list-unstyled ps-0">
									      <li class="mb-1">
									        <button class="btn btn-toggle align-items-center rounded collapsed fs-3" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false">
									          페이지 관리
									        </button>
									        <div class="collapse show" id="home-collapse">
									          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									            <li><a href="#" class="link-dark rounded fs-6">페이지 수익관리</a></li>
									            <li><a href="#" class="link-dark rounded fs-6">페이지 방문자관리</a></li>
									          </ul>
									        </div>
									      </li>
									      <li class="mb-1">
									        <button class="btn btn-toggle align-items-center rounded collapsed fs-3" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
									          컨텐츠 관리
									        </button>
									        <div class="collapse" id="dashboard-collapse">
									          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									            <li><a href="#" class="link-dark rounded fs-6">공지사항</a></li>
									            <li><a href="#" class="link-dark rounded fs-6">회원 게시글 관리</a></li>
									            <li><a href="#" class="link-dark rounded fs-6">회원 리뷰 관리</a></li>
									          </ul>
									        </div>
									      </li>
									      <li class="mb-1">
									        <button class="btn btn-toggle align-items-center rounded collapsed fs-3" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
									          회원 관리
									        </button>
									        <div class="collapse" id="orders-collapse">
									          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									            <li><a href="#" class="link-dark rounded fs-6">회원 목록</a></li>
									            <li><a href="#" class="link-dark rounded fs-6">스타일리스트 가입심사</a></li>
									            <li><a href="#" class="link-dark rounded fs-6">신고 관리</a></li>
									          </ul>
									        </div>
									      </li>
									      <li class="border-top my-3"></li>
									      <li class="mb-1">
									        <button class="btn btn-toggle align-items-center rounded collapsed fs-3" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
									          Account
									        </button>
									        <div class="collapse" id="account-collapse">
									          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									            <li><a href="#" class="link-dark rounded fs-6">New...</a></li>
									            <li><a href="#" class="link-dark rounded fs-6">Profile</a></li>
									            <li><a href="#" class="link-dark rounded fs-6">Settings</a></li>
									            <li><a href="#" class="link-dark rounded fs-6">Sign out</a></li>
									          </ul>
									        </div>
									      </li>
									    </ul>
									    </div>
									    </div>
						  	  </div>
		        		</div>
		        	</c:when>
						<c:otherwise>
						<div class="col-2"></div>
						</c:otherwise>
					</c:choose>
				
		        <div class="col main_content" style="padding:0px 50px 0px 50px; font-family: 'Gothic A1'; border-radius:10px; height:850px; border-bottom:1px solid rgba(0,0,0,0.08);">
		        	<div class="row" style="padding:30px 0px 0px">
			        	<div class="col">
			        		<div class="row mt-4">
		        				<div class="col" style="font-family: 'Jua', sans-serif;"><h2>HGV의 공지사항을 알려드립니다!</h2></div>
		        			</div>
		        			<div class="row">
		        				<div class="col">
		        				</div>
		        			</div>
			        	</div>
		        	</div>
		        	
		        	<form action="./notice" method="get">
		        			<div class="row" style="padding:20px 0px">
				        		<div class="col-4"></div>
				  				<div class="col-2 my-1">
				        			<select class="form-select" name="searchContentCategory">
									  <option selected value="notice_title">제목</option>
									  <option value="notice_content">내용</option>
									</select>
				  				</div>
				        		<div class="col-3 my-2 text-end">
				        			<input type="text" name="searchWord">
				        		</div>
				        		<div class="col-2 text-center" style="margin-left:50px">
				        			 <button type="submit" class="btn btn-primary mt-2" style="width:100%; font-size:12px; ">검색</button>
				        		</div>
				        	</div>
				       </form>
		        	
		        	<div class="row notice_type">
		        	</div> <hr style="height:1px; color:#CBCBCB; margin: 10px 0px;">
		        	
					  <c:forEach items="${NoticeBoardList }" var="data">
					  <a href="./noticeContentPage?NoticeNo=${data.notice_no}" style="color:black;">
					  	<div class="row" id="noticeListBox">
		        		  <div class="col" id="noticeTitleBox">${data.notice_title }</div>
		        		  <div class="col-2">관리자</div>
		        		  <div class="col-2" id="noticeWriteDateBox"><fmt:formatDate value="${data.notice_writedate }" pattern="yyyy.MM.dd"/></div>
			        	</div> 
			        	</a>
			        	<hr style="height:1px; color:#CBCBCB; margin: 10px 0px;">
					  </c:forEach>
		            
	            
           
            
        <nav aria-label="Page navigation example">
		  <ul class="pagination mt-4">
		    
		    	<c:choose>
		    		<c:when test="${startPage <= 1 }">
		    			<li class="page-item disabled"><a class="page-link" style="border-radius:10px; margin: 0px 2px; color:gray;">&lt;</a></li>
		    		</c:when>
		    		<c:otherwise>
		    			<li class="page-item"><a class="page-link" style="border-radius:10px; margin: 0px 2px; color:black; href="./notice?pageNum=${startPage-1 }${additionalParam}">&lt;</a></li>
		    		</c:otherwise>
		    	</c:choose>
		    
		    <c:forEach begin="${startPage }" end="${endPage }" var="i"> 
		    	<c:choose>
		    		<c:when test="${i == currentPageNum}">
		    		  <li class="page-item"><a class="page-link" style="border:2px solid black; color:black; border-radius:10px; margin: 0px 2px;" href="./notice?pageNum=${i}${additionalParam}">${i}</a></li>
		    		</c:when>
		    		<c:otherwise>
		    		  <li class="page-item"><a class="page-link" style="border-radius:10px; color:black; margin: 0px 2px" href="./notice?pageNum=${i}${additionalParam}">${i}</a></li>
		    		</c:otherwise>
		    	</c:choose>
		    
		    </c:forEach>
		    
		    <c:choose>
		    	<c:when test="${endPage >= totalPageCount}">
		    		<li class="page-item disabled"><a class="page-link" style="border-radius:10px; color:gray; margin: 0px 2px">&gt;</a></li>	
		    	</c:when>
		    	<c:otherwise>
		    			<li class="page-item"><a class="page-link" style="border-radius:10px; color:black; margin: 0px 2px" href="./notice?pageNum=${endPage+1}${additionalParam}">&gt;</a></li>
		    	</c:otherwise>
		    
		    </c:choose>
		    
		   
		    <c:choose>
		    	<c:when test="${!empty adminInfo }">
		    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" style="background-color:white; border:1px solid gray;" class="btn btn-primary"><a href="./noticeWritePage" style="color:black">작성</a></button>
		  			&nbsp;&nbsp;&nbsp;<button type="button" class="btn" style="background-color:white; border:1px solid gray;"><a href="" style="color:black">삭제</a></button>
		  
		    	</c:when>
				<c:otherwise>
				
				</c:otherwise>		    		
		    </c:choose>
		    </ul>
		  
		  
		</nav>
			</div> 
			<div style="width:200px; height:1000px;">
	        			<img src="../resources/img/ad/advertisement1.png" style="width:200px; height:1000px;">
	        		</div>
		</div>
       </div>
    </div>
<!-- bootstrap_ICON 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
    crossorigin="anonymous"></script>
</body>

</html>