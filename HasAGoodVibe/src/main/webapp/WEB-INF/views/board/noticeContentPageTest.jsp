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
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
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
		
		hr{
			height:10px;
			background-color:black;
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
        	<jsp:include page="../commons/adminheader.jsp"></jsp:include>
	        <!-- 메인 컨텐츠 -->
	        <div class="row">
	        		<div class="col">
	        			<div class="row mt-4">
	        				<div class="col" style="font-family: 'Jua', sans-serif;"><h2>HGV의 공지사항을 알려드립니다!</h2></div>
	        			</div>
	        			<div class="row">
	        				<div class="col-8">
	        				<hr style="height:2px; width:100%">
	        				</div>
	        			</div>
	        			<div class="row">
	        				<div class="col-8">
	        					[개선 안내] ${noticeVo.notice_title }<br>
	        					<fmt:formatDate value="${noticeVo.notice_writedate }" pattern="yyyy.MM.dd"/><br>
	        					<hr style="height:1px; width:100%">
	        					${noticeVo.notice_content }<br>
	        				</div>
	        			</div>
	        			<div class="row">
	        				<div class="col-8">
	        					<c:forEach items="${noticeData.noticeFileInfoVoList }" var="noticeFileInfoVo">
	        						<img src="/uploadFiles/${noticeFileInfoVo.notice_file_link }"><br>
	        					</c:forEach>
	        					
	        				</div>
	        			</div>
	        			<div class="row my-4">
	        				<div class="col-5"></div>
	        				<div class="col-3 mt-5" style="margin-left:3em"><button type="button" class="btn btn-secondary"><a href="./notice" style="color:white">목록</a></button>
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
	     </div>
</body>
</html>