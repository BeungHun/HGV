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

    <!-- 외부 css 로드  -->
    <link rel="stylesheet" type="text/css" href="../resources/css/commons.css">
	<!-- 글꼴 -->
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Gothic+A1:500" rel="stylesheet">
	<!-- 외부 스크립트 -->
    <script src="../resources/js/main.js"></script>
    <script src="../resources/js/mainPage.js"></script>
     
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
		}
		
		.pagination{
			justify-content:center;
		}
		
		.font_jua{
			font-family:"Jua";
		}
		
		.layout_content{
			margin: 40px 0px;
			background-color: #fff;
			border-radius:10px;
		}
		
		.faq_header{
			margin: 10px 0px 0px 30px;
		}

		.faq_category{
			margin-top: 30px;
		}

		.faq_content{
			margin-top: 30px;
		}
		
		.btn_category{
			border-radius:0px;
			background-color:#243d6c;
			color: white;
			font-family: "Gothic A1";
		}
		
		.btn_admin_only{
			border-radius:0px;
			background-color:#243d6c;
			color: white;
			font-family: "Gothic A1";
			margin-left: 10px;
		}
		
		.right_banner{
			width:200px;
			height:900px;
		}
		
		.leftMenu{
			background: #fff;
			height: 700px;
			border-radius:5px;
			margin-top: 5px;
		}
		

    </style>
    <!-- Jquery 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>



    </script>
</head>

<body>
    <div style="width : 1200px; margin: 0 auto">
        <div class="container-fluid">
        	<jsp:include page="../commons/header.jsp"></jsp:include>
	        <!-- 메인 컨텐츠 -->
	        <div class="row">
	        	<div class="col-2" style="font-family: 'Jua', sans-serif; padding:35px 0px 0px">
	        	<c:choose>
							<c:when test="${!empty adminInfo }">
	        	
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
									            <li><a href="#" class="link-dark rounded fs-6">Settings</a></li>
									            <li><a href="../admin/logoutProcess" class="link-dark rounded fs-6">Logout</a></li>
									          </ul>
									        </div>
									      </li>
									    </ul>
									    </div>
									    </div>
						  	  </div>
		        	</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</div>
		       	<div class="col-8 layout_content main_content" style="width:816px;">
		   		 <div class="row my-4 font_jua">
		   		 	<div class="col faq_header">
			  	     	<h1>FAQ</h1>
		   		 	</div>
		  	     </div>
		  	     <div class="row"><hr style="height:2px; width:90%; margin-left:30px"></div>
		 	      <div class="row faq_category">
		   	    	<div class="col-1"></div>	
		  	     	 <div class="col-10" style="text-align:center">
			       	 	<a class="btn btn_category" href="#" role="button" style="width:7em">결제</a>
			       	 	<a class="btn btn_category" href="#" role="button" style="width:7em">회원</a>
		   	    	 	<a class="btn btn_category" href="#" role="button" style="width:7em">문의</a>
		   	    	 	<a class="btn btn_category" href="#" role="button" style="width:7em">게시판</a>
		 	      	 </div>
		       		 <div class="col-1"></div>
		       	
		         </div>
		         
		         <div class="row my-2">
		   	    	<div class="col-1"></div>	
		  	     	 <div class="col-10" style="text-align:center">
			       	 	<a class="btn btn_category" href="#" role="button" style="width:7em">매칭</a>
			       	 	<a class="btn btn_category" href="#" role="button" style="width:7em">신고</a>
		   	    	 	<a class="btn btn_category" href="#" role="button" style="width:7em">마이페이지</a>
		   	    	 	<a class="btn btn_category" href="#" role="button" style="width:7em">일정</a>
		 	      	 </div>
		       		 <div class="col-1"></div>
		         </div>
		       
		       	<div class="row faq_content">
		       	<div class="col"  style="margin-left:100px; margin-top:50px;">
		       	<div class="accordion accordion" id="accordionExample">
				  <c:forEach  var="data" items="${FAQList }" varStatus="statusNm">
 					<div class="accordion-item" style="width:90%">
 					<c:forEach var="NumData" items="${NumString[statusNm.index ]}" varStatus="status">
					    <h2 class="accordion-header" id="heading${NumData }">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${NumData }" aria-expanded="false" aria-controls="collapse${NumData }">
					       <i class="bi bi-patch-question-fill" style="color:blue"></i>&nbsp;&nbsp;${data.faq_title } 
					      </button>
					    </h2>
					    <div id="collapse${NumData }" class="accordion-collapse collapse" aria-labelledby="heading${NumData }" data-bs-parent="#accordionExample">
					      <div class="accordion-body">${data.faq_content }</div>
				   	    </div>
				   	    </c:forEach>
				    </div>				
				  </c:forEach>
				  
				 
				  
				</div>
				</div>
				</div>
		            
	            
           
            
        <nav aria-label="Page navigation example">
        <div class="row">
        	<div class="col-4">
        		
        	</div>
        	<div class="col">
        		 <ul class="pagination mt-5">
		    
		    	<c:choose>
		    		<c:when test="${startPage <= 1 }">
		    			<li class="page-item disabled"><a class="page-link">&lt;</a></li>
		    		</c:when>
		    		<c:otherwise>
		    			<li class="page-item disabled"><a class="page-link" href="./FAQPage?pageNum=${startPage-1 }${additionalParam}">&lt;</a></li>
		    		</c:otherwise>
		    	</c:choose>
		    
		    <c:forEach begin="${startPage }" end="${endPage }" var="i"> 
		    	<c:choose>
		    		<c:when test="${i == currentPageNum}">
		    		  <li class="page-item active"><a class="page-link" href="./FAQPage?pageNum=${i}${additionalParam}">1</a></li>
		    		</c:when>
		    		<c:otherwise>
		    		  <li class="page-item active"><a class="page-link" href="./FAQPage?pageNum=${i}${additionalParam}">1</a></li>
		    		</c:otherwise>
		    	</c:choose>
		    
		    </c:forEach>
		    
		    <c:choose>
		    	<c:when test="${endPage >= totalPageCount}">
		    		<li class="page-item disabled"><a class="page-link">&gt;</a></li>	
		    	</c:when>
		    	<c:otherwise>
		    			<li class="page-item"><a class="page-link" href="./FAQPage?pageNum=${endPage+1}${additionalParam}">&gt;</a></li>
		    	</c:otherwise>
		    
		    </c:choose>
		    
		   
		   
		    </ul>
        	</div>
        	<div class="col-4" style="margin-top:45px">
        		 <c:choose>
		    	<c:when test="${!empty adminInfo }">
		    		<button type="button" class="btn btn_admin_only"><a href="./FAQWritePage" style="color:white">작성</a></button>
		  			<button type="button" class="btn btn_admin_only"><a href="" style="color:white">삭제</a></button>
		  
		    	</c:when>
				<c:otherwise>
				
				</c:otherwise>		    		
		    </c:choose>
        	</div>
        </div>
		 
		  
		  
		</nav>
			</div> 
			<div class="col-2" style="width:150px">
       			<img src="../resources/img/ad/advertisement1.png" style="width:150px; height:800px; margin: 0px 20px">
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