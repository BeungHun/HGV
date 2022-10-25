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
    
    </script>
</head>

<body>
<div style="width : 1200px; margin: 0 auto">
        <div class="container-fluid px-4">
       <jsp:include page="./blogHeader.jsp"></jsp:include>
       <div class="row">
       	<div class="col">
			<div class="row my-2"> <!-- 프로필 이미지 로우 -->
               <div class="col m-3">
               		<div style="text-align : center;">
                 		<img class="imgLow img-fluid rounded" src="../resources/img/door.png" style="max-width: 100%; height: auto;">
                 	</div>
              	</div>
            </div>
            
            <div class="row my-2">
            	<div class="col m-3 fs-5">
            		<div style="text-align : center;">호빵맨님의 옷장</div>
            	</div>
            </div>
            
            <div class="row my-2">
            	<div class="col">
            		<nav>
						  <div class="nav nav-tabs" id="nav-tab" role="tablist">
						  <button class="nav-link  active" id="nav-add-tab" data-bs-toggle="tab" data-bs-target="#nav-add" type="button" role="tab" aria-controls="nav-profile" aria-selected="false"><a type="button" onclick="location.href='./myBlog?stylist_no'">전체 글</a></button>
						  <c:forEach items="${categoryList }" var="data">
						    <button class="nav-link active" id="nav-category-tab" data-bs-toggle="tab" data-bs-target="#nav-category" type="button" role="tab" aria-controls="nav-category" aria-selected="true"><a type="button" onclick="location.href='./categoryView?cNo=${data.categoryVo.c_no }'">${data.categoryVo.c_name }</a></button>
						  </c:forEach>	
						  	<button class="nav-link  active" id="nav-add-tab" data-bs-toggle="tab" data-bs-target="#nav-add" type="button" role="tab" aria-controls="nav-profile" aria-selected="false"><a type="button" onclick="location.href='./createCategory'">+</a></button>
						  </div>
					</nav>
            	</div>
            </div>
            <div class="row">
            	<div class="col">

            		<c:forEach items="${boardList }" var="data">
            			<div class="row">
            				<div type="button" onclick="location.href='./boardView?blog_no=${data.blogVo.blog_no}'" class="col-8">
				            	<div class="row">
				            	<div class="col ms-4 fs-6" style="color:grey;">
				            	<fmt:formatDate value="${data.blogVo.blog_writedate }" pattern="yyyy. MM. dd"></fmt:formatDate><span>   ${data.categoryVo.c_name }</span>
				            	</div>
					            </div>
					            <div class="row mt-2">
					            	<div class="col ms-4 fs-4"><h5>${data.blogVo.blog_title }</h5></div>
					            </div>
					            <div class="row">
					            	<div class="col ms-4">${data.blogVo.blog_content }</div>
					            </div>
					            
					        </div>
				            <div class="col m-5 " style="height: 15em;overflow:hidden; ">
                               <img class="imgLow img-fluid rounded" src="../resources/img/flowers.jpeg">
                            </div>
            			</div>
            			<div class="row">
					       <div class="col"><hr></hr></div>
					    </div>
				           </c:forEach>
            			
		         </div>
            </div>
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