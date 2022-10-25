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
	
     <!-- 외부 css 로드  -->
	<link href="https://fonts.googleapis.com/css?family=Gothic+A1:500" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link rel="StyleSheet" type="text/css" href="../resources/css/commons.css">
    
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
		
		#notice_itemBox {
			background-color: white;
			border-radius: 10px;
			padding: 20px 50px;
		}
		
		.font_gothic{
			font-family: 'Gothic A1';
		}
		
		
		


    </style>
    <!-- Jquery 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="../resources/js/main.js"></script>
    <script src="../resources/js/mainPage.js"></script>
    <script type="text/javascript">

    var userNo = 0; //userNo가 0 즉 getMemberNo 아무것도 안날라오면 비회원..
    var noticeNo = ${noticeVo.notice_no};
    
    
    function getMemberNo(){
    	var xhr = new XMLHttpRequest();
    	
    	xhr.onreadystatechange = function(){
    		if(xhr.readyState == 4 && xhr.status == 200) {
    			var jsonObj = JSON.parse(xhr.responseText);

    			if(jsonObj.data != null) {
    				userNo = jsonObj.data;
    			}
				    			
    		}	
    		
    	}
    	
    	
    	//false 여기에만 써라....
    	xhr.open("get", "../testapi/getMemberNo" , false);
    	xhr.send();
    }
    
    function doLike() {
    	if(userNo == 0) {
	    	var result = confirm("로그인 후 이용가능합니다. 로그인 하시겠습니까?");
	    	if(result == true) {
	    		location.href = "../member/loginPage";
	    	}
	    	return;
    	}
    
    
    	var xhr = new XMLHttpRequest();
    	
    	xhr.onreadystatechange = function() {
    		if(xhr.readyState == 4 && xhr.status == 200) {
    			var jsonObj = JSON.parse(xhr.responseText);
    			refreshHeart();
    			refreshTotalCount();
    			
    			
    		}
    	}
    	// post 방식은 open에다가 파라미터로 안넘길것이다. send에 적어준다.
    	xhr.open("post", "../testapi/doLike");
    	xhr.setRequestHeader("Content-type" , "application/x-www-form-urlencoded");
    	xhr.send("notice_no="+ noticeNo); 
    }
    
    function refreshHeart(){
		
    	if(userNo==0) return;
		var xhr = new XMLHttpRequest();
    	
    	xhr.onreadystatechange = function() {
    		if(xhr.readyState == 4 && xhr.status == 200) {
    			var jsonObj = JSON.parse(xhr.responseText);
    			
    			//렌더링 
    			var heartBox = document.getElementById("likeHeart");
    			
    			 if(jsonObj.data == true){
    				heartBox.setAttribute("class", "bi bi-heart-fill text-danger");
    				 
    			 }else{
     				heartBox.setAttribute("class", "bi bi-heart text-danger");
    			 }
    			
    			
    			
    			
    		}
    	}
    	// post 방식은 open에다가 파라미터로 안넘길것이다. send에 적어준다.
    	xhr.open("get", "../testapi/isLiked?notice_no=" + noticeNo);
//     	xhr.setRequestHeader("Content-type" , "application/x-www-form-urlencoded");
    	xhr.send();
    	
    }
    
    function refreshTotalCount(){
    	var xhr = new XMLHttpRequest();
    	xhr.onreadystatechange = function() {
    		if(xhr.readyState == 4 && xhr.status == 200) {
    			var jsonObj = JSON.parse(xhr.responseText);
    			
    			var likeCountBox = document.getElementById("likeCount");
    			likeCountBox.innerText = jsonObj.data;
    		}
    	}
    	// post 방식은 open에다가 파라미터로 안넘길것이다. send에 적어준다.
    	xhr.open("get", "../testapi/getTotalLikeCount?notice_no=" + noticeNo);
//     	xhr.setRequestHeader("Content-type" , "application/x-www-form-urlencoded");
    	xhr.send();
    }
    
    
    
    
    
    
    function resfreshNotice(){
    	
    }
    

	window.addEventListener("DOMContentLoaded", function(){
// 		자바스크립트 코드 시작지점은 여기다. 페이지가 로드될때 로그인 됐는지 안됐는지부터 확인할 것이다.
		getMemberNo();
		refreshHeart();
		refreshTotalCount();
		});
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
	        		<div class="col main_content" style="padding: 1px 12px; margin-bottom:20px;">
	        			<div class="row"  style="width:800px;">
			        		<div class="col" id="notice_itemBox">
			        			<div class="row mt-4">
			        				<div class="col" style="font-family: 'Jua', sans-serif;"><h2>HGV의 공지사항을 알려드립니다!</h2></div>
			        			</div>
			        			<div class="row font_gothic">
			        				<div class="col">
			        				<hr style="height:2px; width:100%">
			        				</div>
			        			</div>
			        			<div class="row font_gothic" >
			        				<div class="col">
			        					[개선 안내] ${noticeVo.notice_title }<br>
			        					<fmt:formatDate value="${noticeVo.notice_writedate }" pattern="yyyy.MM.dd"/><br>
			        					<hr style="height:1px; width:100%">
			        					${noticeVo.notice_content }<br>
			        				</div>
			        			</div>
			        			<div class="row font_gothic">
			        				<div class="col">
			        					<c:forEach items="${noticeData.noticeFileInfoVoList }" var="noticeFileInfoVo">
			        						<img src="/uploadFiles/${noticeFileInfoVo.notice_file_link }" style="width:500px"><br>
			        					</c:forEach>
			        					<div class="row"  style="padding-top:10px;">
			        						<div class="col">
			        							<i id="likeHeart" class="bi bi-heart text-danger" onclick="doLike()"></i><span id="likeCount"></span> 좋아요
			        						</div>
			        					</div>
			        				</div>
			        			</div>
			        			<div class="row my-4 font_gothic">
			        				<div class="col" style="text-align:right">
			        					<button type="button" class="btn btn-secondary"><a href="./notice" style="color:white">목록</a></button>
				        				<c:choose>
				        					<c:when test="${!empty adminInfo }">
				        						<button type="button" class="btn btn-primary"><a href="./noticeUpdatePage?NoticeNo=${noticeVo.notice_no }" style="color:white">수정</a></button>
				        						<button type="button" class="btn btn-danger"><a href="./noticeDeleteProcess?NoticeNo=${noticeVo.notice_no }" style="color:white">삭제</a></button>
				        			
				        					</c:when>
				        					<c:otherwise>
				        					
				        					</c:otherwise>
				        				</c:choose>
			        					</div>
			        				</div>
			        			</div>
			        		</div>
	        			</div>
	        			<div class="col">
	        			<img src="../resources/img/ad/advertisement1.png" style="width:180px; height:1000px;">
	        		</div>
	        		</div>
	        		
	        	</div>
	        </div>
	     </div>
</body>
</html>