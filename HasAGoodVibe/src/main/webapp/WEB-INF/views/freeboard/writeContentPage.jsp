<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

    <!-- bootstrap_ICON 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

</head>
<body>
	
	<div class="container">
   	<div class="row">
   		<form action="./writeContentProcess" method="post">
   		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
   		 <thead>
	   		 <tr>
	   		 	<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
	   		 
			</tr>
		</thead>
		<tbody>
		<tr>
		 	<td>작성자 : ${sessionMemberInfo.member_nick }</td>
		 </tr>
		 <tr>
		 	<td><input type="text" class="form-control" placeholder="글 제목" name="board_title"></td>
		 </tr>
		 <tr>
		 	<td><textarea class="form-control" placeholder="글 내용" name="board_content" style="height: 350px;"></textarea></td>
		</tr>	
		</tbody>
		
		</table>
		<input type="submit" class="btn btn-primary pull-right" value="글쓰기">	
		<a href="../member/freeboard" type="submit" class="btn btn-danger pull-right">취소</a>
		
		</form>
		
		
	</div>
	</div>
	
   		

	
	
	<!-- bootstrap_ICON 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
    crossorigin="anonymous"></script>
</body>
</html>