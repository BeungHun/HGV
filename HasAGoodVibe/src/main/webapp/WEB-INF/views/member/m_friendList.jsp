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
		    <div class="row">
		       <div class="row my-2">
		            <c:choose>
		 			<c:when test="${!empty sessionMemberInfo }">			
			         	<div class="col-4 fs-4 fw-bold text-danger text-truncate">
			 				<i class="bi bi-emoji-smile-fill"></i> ${sessionMemberInfo.member_nick }님의 친구 목록입니다. 
			          	</div>
		          	<div class="col d-grid">
		           		 <a href="./recievedMessage?member_no=${sessionMemberInfo.member_no}"><button class="btn btn-primary mt-2">받은쪽지함</button></a>
		       		</div>
		         	<div class="col d-grid">
		            	<a href="./sendMessage?member_no=${sessionMemberInfo.member_no}"><button class="btn btn-primary mt-2">보낸쪽지함</button></a>
		       		</div>
		       		<div class="col-5">
		       		</div>
			       </c:when>
			       <c:otherwise></c:otherwise>
			       </c:choose>
		       </div>
		    </div>
    <div class="row">
        <div class="col">
        	<div class="input-group mb-3">
  				<input type="text" class="form-control" placeholder="친구를 검색하세요." aria-label="친구를 검색하세요." aria-describedby="button-addon2">
  				<button class="btn btn-outline-secondary" type="button" id="button-addon2">Search</button>
			</div>
       	</div>
    </div>   
    <div class="row">
    	<div class="col">
    		<table class="table table-striped">
    		<tr>
    			<td>닉네임</td>
    			<td>친구추가일</td>
    			<td>쪽지 보내기</td>
    			<td>친구 삭제</td>
    		</tr>
    		<c:forEach items="${fdataList }" var="data">
			   <c:if test="${!empty sessionMemberInfo && sessionMemberInfo.member_no != data.memberVo.member_no }">
	        	<tr>
		        	<td>${data.memberVo.member_nick }</td>
		        	<td><fmt:formatDate value="${data.friendVo.friend_addDate }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
		        	<td>
		        		<input type="hidden" value="${data.friendVo.bfmember_no }">
		        		<a href="./writeMessagePage?bfmember_no=${data.friendVo.bfmember_no}"><button class="btn btn-secondary mt-2">쪽지보내기</button></a>
		        	</td>
		        	<td>
		        		<a href="./DeleteFriendProcess?bfmember_no=${data.friendVo.bfmember_no}"><button class="btn btn-secondary mt-2">친구삭제</button><br></a>
		        	</td>
	      		</tr>
				<br>
			   </c:if>
			</c:forEach>
		   </table>
		</div>
    </div>
            
             <!-- 친구 목록 출력 -->
           
			<div class="row">
        		<div class="col-10"></div>
        		<div class="col">	
        			<a href="./message">
        				<button class="btn btn-primary mt-2">회원 목록</button>
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