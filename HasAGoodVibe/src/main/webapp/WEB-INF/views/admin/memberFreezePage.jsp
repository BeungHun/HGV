<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<!-- bootstrap 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<!-- 부트스트랩 드롭다운-->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <!-- bootstrap_ICON 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <!-- 글꼴 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<style type="text/css">
	a {
		text-decoration-line:none;
	}
	</style>
	
</head>
<body>
	<div style="width : 1200px; margin: 0 auto">
        <div class="container-fluid">
       		<div class="row">
	        	<div class="col"></div>
	        	<div class="col">
	        		<div class="row" style="text-align:center; font-family: 'Jua', sans-serif">
	        			<h1>회원 정지</h1>
	        		</div>
	        	</div>
	        	<div class="col"></div>
        	</div>
        	<hr style="text-align:center; width:70%; margin:0px auto">
        	
        	<div class="row">
        		<div class="col-2"></div>
        		<div class="col-8">
        		<form action="./memberFreezeProcess">
        			<div class="row" style="margin:1rem">
        				<div class="col-3">
        					<h4>아이디</h4>
        				</div>
        				<div class="col"><h4>${memberInfo.member_id }</h4></div>
        			</div>
        			
        			<div class="row" style="margin:1rem">
        				<div class="col-3">
        					<h4>정지일수</h4>
        				</div>
        				<div class="col-4">
        				<select class="form-select my-2" name="FreezeDate">
									  <option selected value="1">1일</option>
									  <option value="3">3일</option>
									  <option value="7">7일</option>
									  <option value="14">14일</option>
									  <option value="30">30일</option>
									  <option value="100">100일</option>
									  <option value="365">365일</option>
									</select>
						<input type="hidden" name="member_freezeOrNot" value="Y">
	        				
						</div>
						<div class="col"></div>
        			</div>
        			<div class="row" style="margin:1rem">
        				<div class="col-3">
        				</div>
        				<div class="col"></div>
        				<div class="col-3">
        					<button type="submit" class="btn btn-primary">완료</button>
        					<button type="button" class="btn btn-secondary"><a href="./memberManagePage" style="color:white">취소</a></button>
        				</div>
        			</div>
        			<input type="hidden" value="${memberInfo.member_no }" name="member_no">
        			</form>
        			
        		</div>
        		<div class="col-2"><a href="./test?testNum=10">ddd</a></div>
        	</div>
        </div>
      </div>
        	
</body>
</html>