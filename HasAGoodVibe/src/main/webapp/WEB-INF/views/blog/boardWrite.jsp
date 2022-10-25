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
        <div class="container-fluid px-4">
    	<jsp:include page="./blogHeader.jsp"></jsp:include>
        	
        	<form action="./writeProcess" method="post">
				  <table>
				    <tr id="name">
				      <td class="col1">이름</td>
				     <td>${sessionMemberInfo.member_nick }</td>
				    </tr>
				    <tr id="category">
				    	<td class="col">카테고리</td>
				    	<td>${category.c_name }</td>
				    </tr>
				    <tr id="subject">
				      <td class="col1">제목</td>
				      <td class="col2"><input type="text" name="blog_title"></td>
				    </tr>		
				    <tr id="content">
				      <td class="col1">내용</td>
				      <td class="col2"><textarea  name="blog_content"></textarea></td>
				    </tr>	
				    <tr id="upload">
				      <td class="col1">업로드 파일</td>
				      <td class="col2"><input type="text"> <input type="file"></td>
				    </tr>	
				  </table>
				 
				 
				  <div id="buttons">
				  	<c:if test="${!empty sessionStylistInfo }">
				  		<input type="hidden" name="stylist_no" value="${stylistInfo.stylist_no }">
				  		<input type="hidden" name="c_no" value="${category.c_no }">
						<button type="submit" class="btn btn-outline-primary">OK</button>
					</c:if>
				    <a href="./myBlog" class="btn btn-outline-primary">목록으로</a>
				  </div>
  		 	</form>
        	
        	
        	
        	
        	
      <jsp:include page="./blogBottom.jsp"></jsp:include>
    </div>
   </div>
   
<!-- bootstrap_ICON 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
    crossorigin="anonymous"></script>
</body>

</html>