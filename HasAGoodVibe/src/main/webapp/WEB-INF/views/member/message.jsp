<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    
   		 <div class="row my-2">
                    <div class="col-8 fs-4 fw-bold text-danger text-truncate">
                         <i class="bi bi-person-lines-fill"></i>   전체 회원 목록
                    </div>
          </div>

    
        <form action="./message" method="get">
        <div class="row"> <!-- 검색  -->
        	<div class="col">
        		<select name="searchType"  class="form-control">
        			<option value="id">아이디</option>
        			<option value="nickname">닉네임</option>
        		</select>
			</div>
			<div class="col-8">
				<input name="searchWord" type="text" class="form-control">
        	</div>
        	<div class="col d-grid">
        		<button class="btn btn-primary">검색</button>
        	</div>
        </div>   
        </form>
        
          <!-- 회원 목록 출력 -->
        
        <div class="row">
        	<div class="col d-grid">
        	
        	<table class="table table-striped">
        		<tr>
        			<td>아이디</td>
        			<td>닉네임</td>
        			<td>버튼</td>
        		</tr>
        	<c:forEach items="${dataList }" var="data">
			   <c:if test="${!empty sessionMemberInfo && sessionMemberInfo.member_no != data.memberVo.member_no }">
			   	  
			        	<tr>
				        	<td>${data.memberVo.member_id }</td>
				        	<td>${data.memberVo.member_nick }</td>
				        	<td>
				        		<a href="./insertFriendProcess?bfmember_no=${data.memberVo.member_no }&member_no=${sessionMemberInfo.member_no}"> 
					               <button class = "btn btn-secondary mt-2">친구 추가</button>
					            </a>
				        	</td>
			      		</tr>
					
			   </c:if>
			   </c:forEach>
			   </table>
        	</div>
        </div>
        
      
        <div class="row">
        	<div class="col-10"></div>
        	<div class="col">
        		<a href="./m_friendList">
        			<button class="btn btn-primary mt-2">친구 목록</button>
        		</a>
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