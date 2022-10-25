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
		
		
		


    </style>
    <!-- Jquery 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>



    </script>
</head>

<body>
    <div style="width : 1200px; margin: 0 auto">
        <div class="container-fluid">
        	<!-- 헤더 -->
            <div class="row" >
            	<!-- 로고 이미지 -->
                <div class="col">
                	<img id="logo_img" alt="" src="../resources/img/HGV_logo.jpg">
                </div>
                <!-- 공란 -->
                <div class="col-8" style="text-align:center">
                </div>
                <!-- 로그인 및 회원가입 -->
                <div class="col" style="text-align:right;">
                	<c:choose>
						<c:when test="${!empty sessionMemberInfo }">
							${sessionMemberInfo.member_nick } 님 안녕하세요
							<br>
							<a href="../member/logoutProcess"> 로그아웃 </a>
							<c:choose>
								<c:when test="${!empty sessionStylistInfo }">
									<a href="../stylist/mypage"> MYPAGE </a>
								</c:when>
								<c:otherwise>
									<a href="../user/mypage"> MYPAGE </a>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:when test="${!empty adminInfo }">
							관리자님 안녕하세요<br>
							<a href="../admin/logoutProcess"> 로그아웃 </a>
						</c:when>
						<c:otherwise> 
		                	<a href="../admin/loginPage"><spen>LOGIN</spen></a>
						</c:otherwise>
					</c:choose>
                </div>
            </div>
            
            <!-- 개발메뉴바 -->
           <div class="row">
           	<div class="col-2"></div>
           	<div class="col">
				<div class="col nav-fill">
		            <nav class="navbar navbar-expand-lg navbar-light bg-light">
					  <div class="container-fluid">
					    <a class="navbar-brand" href="#" >매칭해조</a>
					    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
					      <span class="navbar-toggler-icon"></span>
					    </button>
					    <div class="collapse navbar-collapse" id="navbarNav">
					      <ul class="navbar-nav">
					        <li class="nav-item">
					          <a class="nav-link active" aria-current="page" href="notice">공지사항</a>
					        </li>
					        <li class="nav-item">
					          <a class="nav-link" href="#">회원 게시글 관리</a>
					        </li>
					        <li class="nav-item">
					          <a class="nav-link" href="#">회원 관리</a>
					        </li>
					        
					      </ul>
					    </div>
					  </div>
					</nav>
				</div>
			</div>
			<div class="col-1"></div>
		   </div>
  			
        <!-- 왼쪽 사이드바~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
        	
        	<div class="row">	
		        <div class="col">
		        	<form action="./memberManagePage" method="get">
		        			<div class="row">
				        		<div class="col-2">
				        			<select class="form-select my-2"  name="searchType">
									  <option selected value="member_id">아이디</option>
									  <option value="member_nick">닉네임</option>
									</select>
				  				</div>
				  					
				        		<div class="col-4 my-2">
				        			검색 : <input type="text" name="searchWord">
				        		</div>
				        		<div class="col-1">
				        			 <button type="submit" class="btn btn-primary">검색</button>
				        		</div>
				        		<div class="col"></div>
				        	
				        	</div>
				        	
				       </form>
		        	<div class="row">
					  <div class="col">
					    <div class="row">
					      <div class="col" style="text-align:center">신고자</div>
					      <div class="col" style="text-align:center">신고받은자</div>
					      <div class="col" style="text-align:center">신고내용</div>
					      <div class="col" style="text-align:center">카테고리</div>
					      <div class="col" style="text-align:center">신고날짜</div>
					    </div>
					  </div>
					</div>
					<c:forEach items="${reportList }" var="reportList">
					<div class="row">
					  <div class="col">
					    <div class="row">
					    <hr style="margin-top:15px">
					   	  <div class="col" style="text-align:center">${reportList.reportedMemberData.member_nick}</div>
					      <div class="col" style="text-align:center">${reportList.reportingMemberData.member_nick }</div>
					      <div class="col" style="text-align:center"><button class="btn btn-primary" type="button"><a href="./reportContentPage?report_no=${reportList.reportData.report_no }" style="color:white">내용확인</a></button></div>
					      <div class="col" style="text-align:center">${reportList.reportData.report_category }</div>
					      <div class="col" style="text-align:center"><fmt:formatDate value="${reportList.reportData.report_date }" pattern="yy.MM.dd"/> </div>
					    </div>
					  </div>
					</div>
					</c:forEach>
			 	</div>
			</div>
		            
	            
           
            
        <nav aria-label="Page navigation example">
		  <ul class="pagination mt-5">
		    
		    	<c:choose>
		    		<c:when test="${startPage <= 1 }">
		    			<li class="page-item disabled"><a class="page-link">&lt;</a></li>
		    		</c:when>
		    		<c:otherwise>
		    			<li class="page-item"><a class="page-link" href="./notice?pageNum=${startPage-1 }${additionalParam}">&lt;</a></li>
		    		</c:otherwise>
		    	</c:choose>
		    
		    <c:forEach begin="${startPage }" end="${endPage }" var="i"> 
		    	<c:choose>
		    		<c:when test="${i == currentPageNum}">
		    		  <li class="page-item active"><a class="page-link" href="./notice?pageNum=${i}${additionalParam}">${i}</a></li>
		    		</c:when>
		    		<c:otherwise>
		    		  <li class="page-item"><a class="page-link" href="./notice?pageNum=${i}${additionalParam}">${i}</a></li>
		    		</c:otherwise>
		    	</c:choose>
		    
		    </c:forEach>
		    
		    <c:choose>
		    	<c:when test="${endPage >= totalPageCount}">
		    		<li class="page-item disabled"><a class="page-link">&gt;</a></li>	
		    	</c:when>
		    	<c:otherwise>
		    			<li class="page-item"><a class="page-link" href="./notice?pageNum=${endPage+1}${additionalParam}">&gt;</a></li>
		    	</c:otherwise>
		    
		    </c:choose>
		    
		   
		    <c:choose>
		    	<c:when test="${!empty adminInfo }">
		    		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button type="button" class="btn btn-primary"><a href="./noticeWritePage" style="color:white">작성</a></button>
		  			&nbsp&nbsp&nbsp<button type="button" class="btn btn-primary"><a href="" style="color:white">삭제</a></button>
		  
		    	</c:when>
				<c:otherwise>
				
				</c:otherwise>		    		
		    </c:choose>
		    </ul>
		  
		  
		</nav>
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