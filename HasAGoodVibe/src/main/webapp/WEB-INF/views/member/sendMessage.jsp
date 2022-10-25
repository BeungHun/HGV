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
                         <i class="bi bi-send-fill"></i>   보낸 쪽지함
                    </div>
          </div>
          
          <table class="table table-striped">
			<tr>
				<td>체크박스</td>
				<td>받은 사람</td>
				<td>내용</td>
				<td>보낸 일시</td>
				<td>수신 확인</td>
			</tr>
		
	
			<c:forEach items="${sentList }" var="data">
				<tr>
					<td><input type="checkbox" name="check" id="checktype" value="aaa"></td>
					<td>${data.memberVo.member_nick }</td>
					<td>${data.messageVo.message_content }</td>
					<td><fmt:formatDate value="${data.messageVo.message_send_date }" pattern="yyyy-MM-dd hh:mm"></fmt:formatDate></td>
					<td>${data.messageVo.read_check }  <fmt:formatDate value="${data.messageVo.message_read_date }" pattern="yyyy-MM-dd hh:mm"></fmt:formatDate></td>
				</tr>
				
			</c:forEach>
			</table>

			<div class="row">
        		<div class="col-10"></div>
        		<div class="col">	
        			<a href="./message">
        				<a href="./deleteMessageProcess?message_no=${data.messageVo.message_no}"><button class="btn btn-primary mt-2">삭제</button></a>
        			</a>
        	</div>
        	</div>
        </div>
     </div>

</body>
</html>