<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype html>
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
    <link rel="stylesheet" type="text/css" href="../resources/css/mainPage.css">
    <!-- 외부 script 로드  -->
    <script src="../resources/js/main.js"></script>
    <script src="../resources/js/mainPage.js"></script>
    <style>
    
    
         #logo_img{
        	height: 100px;
            width: 160px;
            object-fit: cover;
		}
		#graycolor{
			color: rgb(162, 162, 162);
		}
		
		#blackcolor{
			color: black;
		}
		
/* 		body { */
/* 	          background-image: linear-gradient( */
/* 	              rgba(0, 0, 0, 0.8), */
/* 	              rgba(0, 0, 0, 0.8) */
/* 	              ), url("../resources/img/projectimg(1).png"); */
/* 	          background-size: cover; */
	 
/* 	    } */

		.card{
			color: #363636;
		}
		.card a{
			color: #363636;
			text-decoration:none;
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
            <div class="row main_content">
            	<div class="col">
            	
		            <!-- 배너 -->
		            <div class="row">
		                <div class="col mt-4 ">
		               <span style="text-align:center;"><h4>RandomBox<br>Event</h4></span>
		                </div>
		            </div>
		            <div class="row">
		            	<div class="col" style="text-align:center; color: rgb(162, 162, 162);"><small><span>Dandy[ 1 ] Hiphop[ 2 ] Casual[ 3 ] Amekaji[ 1 ] Minimal[ 1 ]</span></small></div>
		            </div>
		            <div class="row">
		            	<div class="col">	<c:if test="${! empty sessionStylistInfo }" >
		                <a href="./randomBoxCard">신규등록하기</a>
		                </c:if></div>
		            </div>
		            
		           <div class="row row-cols-1 row-cols-md-3 g-4">
		           <c:forEach items="${randomBoxdataList }" var="randomBoxdata">
		           <div class="col-4">
		            <div class="card" style="width: 18rem;">
		 				<div class="row">
		 					<div class="col" class="card-img-top" style="width:20em; height:20em">
		 					<c:choose>
		             			<c:when test="${randomBoxdata.memberVo.member_profileimage_link == null}">
		       						<img class="img-fluid center-block" src="../resources/img/noneProfileImg.jpg"
		       						style="width:22em; height:22em">
		              			</c:when>
		              			<c:otherwise>
		              				<a href="./randomBoxReadPage?randomBox_no=${randomBoxdata.randomBoxVo.randomBox_no }">
		              				<img class="img-fluid center-block" src="/uploadFiles/${randomBoxdata.memberVo.member_profileimage_link}"
		              				 style="width:22em; height:21em">
		              				</a>
		              			</c:otherwise>
		             		</c:choose>
		 					</div>
		 				</div>
		  				 <div class="card-body">
		  			 		<div class="row">
		  			 			<div class="col">
		  			 				<a href="./randomBoxReadPage?randomBox_no=${randomBoxdata.randomBoxVo.randomBox_no }">
		            				 <small id="graycolor">${randomBoxdata.randomBoxVo.randomBox_category }</small></a>	
		  			 			</div>
		  			 			<div class="col">
		  			 				<a href="./randomBoxReadPage?randomBox_no=${randomBoxdata.randomBoxVo.randomBox_no }">
		            				<span id="graycolor">${randomBoxdata.memberVo.member_nick }</span></a>
		  			 			</div>
		  			 		</div>
		  			 		<div class="row">
		  			 			<div class="col">
		  			 				<h5 class="card-title"><a href="./randomBoxReadPage?randomBox_no=${randomBoxdata.randomBoxVo.randomBox_no }">
		            				<span id="blackcolor">${randomBoxdata.randomBoxVo.randomBox_title }</span></a></h5>
		  			 			</div>
		  			 		</div>
		  			 		<div class="row">
		  			 			<div class="col">
			  			 			<h5 class="card-title money">${randomBoxdata.randomBoxVo.randomBox_price }원</h5>						 			
		  			 			</div>
		  			 		</div>
		  				 </div>
					</div>
					</div>
		            </c:forEach>
					</div>
		            
		            
		            <!-- 슬라이드 -->
		            <div class="row">
		                <div class="col">
		                </div>
		            </div>
            
            	</div>
            </div>
            
            <!-- 밑단 -->
            
        </div>
    </div>
<!-- bootstrap_ICON 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
    crossorigin="anonymous"></script>
</body>

</html>