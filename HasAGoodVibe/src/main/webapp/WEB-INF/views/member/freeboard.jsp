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
	<link rel="stylesheet" type="text/css" href="../resources/css/common.css">
     
    <style>
        #logo_img{
        	height: 100px;
            width: 160px;
            object-fit: cover;
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
        	
            
        </div>
    </div>
   
   <!-- 게시판 리스트//////////////////////////////////////////////////// -->
   
   
   <div class="container">
   	<div class="row">
   		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
   		 <thead>
   		 	<tr>   		 		
   		 		<th colspan="12" style="background-color: #eeeeee; text-align: center;">자유게시판</th>
   		 	</tr>
   		 	
   		 
	   		 <tr>
	   		 	<th style="background-color: #eeeeee; text-align: center;">글번호</th>
	   		 	<th style="background-color: #eeeeee; text-align: center;">제목</th>
	   		 	<th style="background-color: #eeeeee; text-align: center;">작성자</th>
	   		 	<th style="background-color: #eeeeee; text-align: center;">조회수</th>
	   		 	<th style="background-color: #eeeeee; text-align: center;">작성일</th>
			</tr>
		</thead>
		
		
   		<tbody>
	   		<c:forEach items="${dataList }" var="data">
				<tr>
					<td>${data.freeBoardVo.board_no }</td>
					<td><a href="../freeboard/readContentPage?board_no=${data.freeBoardVo.board_no } ">${data.freeBoardVo.board_title }</a></td>				
					<td>${data.memberVo.member_nick }</td>
					<td>${data.freeBoardVo.board_readcount }</td>
					<td><fmt:formatDate value="${data.freeBoardVo.board_writedate }" pattern="yyyy.MM.dd"/></td>
				</tr>
				
			</c:forEach>
   		
   		</tbody>
   		
   		
   		</table>  
   		<div class="container">
   			<div class="row">
   				<div class="col text-end">
		   			<c:if test="${!empty sessionMemberInfo }">
			   			<a href="../freeboard/writeContentPage" class="btn btn-primary">글쓰기</a>
			   
			    	</c:if> 
		    	</div>
   			</div>
   			<div class="row">
   				<div class="col"></div>
   				<div class="col text-center">
					<nav aria-label="Page navigation example">
					  <ul class="pagination">
					  			<c:choose>
							  		<c:when test="${startPage <= 1}">
										<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>							  		
							  		</c:when>
							  		<c:otherwise>
										<li class="page-item"><a class="page-link" href="./freeboard?pageNum=${startPage - 1}${additionalParam}">&lt;</a></li>							  		
							  		</c:otherwise>
							  	</c:choose>
							  
							    
							    <c:forEach begin="${startPage }" end="${endPage }" var="i">
							    	<c:choose>
							    		<c:when test="${i == currentPageNum }">
											<li class="page-item active"><a class="page-link" href="./freeboard?pageNum=${i}${additionalParam}">${i}</a></li>							    						
							    		</c:when>
							    		<c:otherwise>
											<li class="page-item"><a class="page-link" href="./freeboard?pageNum=${i}${additionalParam}">${i}</a></li>							    		
							    		</c:otherwise>							    	
							    	</c:choose>
							    </c:forEach>
							    <c:choose>
							    	<c:when test="${endPage >= totalPageCount}">
										<li class="page-item disabled"><a class="page-link">&gt;</a></li>							    	
							    	</c:when>
							    	<c:otherwise>
										<li class="page-item"><a class="page-link" href="./freeboard?pageNum=${endPage+1}${additionalParam}">&gt;</a></li>							    	
							    	</c:otherwise>
							    </c:choose>
					  </ul>
					</nav> 
				</div>
				<div class="col"></div>
				  		
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