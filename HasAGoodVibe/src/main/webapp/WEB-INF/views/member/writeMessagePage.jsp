<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    		<div class="col">
    			
                <!-- 쪽지창 -->
              <div class="col">
        	<div class="row my-3">
            <div class="col px-0 bolder">
                <!-- TITLE 로우 -->
                <!-- text-truncate  :: 칸 넘어서는 ... -->
                <div class="row my-2">
                    <div class="col-8 fs-4 fw-bold text-danger text-truncate">
                         <i class="bi bi-envelope"></i>   쪽지 보내기
                    </div>
                </div>
              
                <!-- 받는 사람 -->
                <div class="row my-2">
                    <div class="col fs-6 text-secondary">
							받는 사람: ${MemberInfo.member_nick}
                    </div>
                </div>
                <!-- 내용  -->
                <form action="./writeMessageProcess" method="get">
                <div class="row my-2">
                    <div class="col-3 text-secondary">
      					 <div class="col1">내용</div>
     					 <div class="col2"><textarea name="message_content" col="100" row="100"></textarea>
      						<input type="hidden" name="member_no" value="${sessionMemberInfo.member_no}">
							<input type="hidden" name="bfmember_no" value=${MemberInfo.member_no }>
							<input type="submit" value="보내기">
							<a href="./m_friendList"><button class="btn btn-outline-primary">취소</button></a>
     				 </form>
                    </div>
                    
                </div>
                
            </div>
    		</div>
    	</div>
     
        </div>
        
    </div>
   
<form action="./writeMessageProcess" method="post">
  



 
   </form>
            
            
            
            
        </div>
    </div>

</body>
</html>