<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>신고하기</title>

<style>
	a{
		text-decoration-line:none;
	}
	
</style>

</head>

<body>
<div style="width : 1200px; margin: 0 auto">
     <div class="container-fluid">
     <div class="row">
     	<div class="col">
		<div class="row">
			<div class="col" style="text-align:center">
				<h1 class="my-3">신고하기</h1><hr style="width:75%; text-align:center; margin:0 auto;">
			</div>
		</div>
		<!-- 작성자 -->
		<div class="row my-5">
			<div class="col-2"></div>
			<div class="col-2"><h3>작성자</h3></div>
			<div class="col-1" style="text-align:center"><h3>|</h3></div>
			<div class="col-3"><h3>${sessionMemberInfo.member_nick }</h3></div>
			<div class="col"></div>
		</div>
		<!-- 신고대상자 -->	
		<div class="row my-5">
			<div class="col-2"></div>
			<div class="col-2"><h3>신고대상자</h3></div>
			<div class="col-1" style="text-align:center"><h3>|</h3></div>
			<div class="col-3"><h3><!-- =========el넣어야댐.. 게시글에서 신고라면 ========-->신고대상자입니다.</h3></div>
			<div class="col"></div>
		</div>
		
		<!-- 카테고리 -->
		<form action="reportProcess" method="post" enctype="multipart/form-data">
		<div class="row my-5">
			<div class="col-2"></div>
			<div class="col-2"><h3>카테고리</h3></div>
			<div class="col-1" style="text-align:center"><h3>|</h3></div>
			<div class="col-3">
				<select class="form-select" aria-label="Default select example" name="report_category">
				  <option selected value="cheating">사기</option>
				  <option value="swearing">욕설</option>
				  <option value="papering">도배</option>
				  <option value="pornography">음란물</option>
				  <option value="spam">스팸</option>
				  <option value="unpleasant">불편한 내용</option>
				  <option value="plagiarism">표절</option>
				</select>
			</div>
			<div class="col"></div>
		</div>
		
		<!-- 신고 내용 -->
		<div class="row my-5">
			<div class="col-2"></div>
			<div class="col"><textarea class="form-control" style="height:25rem; width:100%;" name="report_content"></textarea></div>
			<div class="col-2"></div>
		</div>
		
		<!-- 파일 첨부하기 -->
		<div class="row my-5">
			<div class="col-2"></div>
			<div class="col"><input type="file" name="reportFiles" multiple accept="image/*"></div>
			<div class="col-2"></div>
		</div>
		
		<!-- 신고 버튼 -->
		<div class="row my-5">
			<div class="col-8"></div>
			<div class="col">
				<button type="submit" class="btn btn-secondary btn-lg" style="width:6rem; height:3rem">제출</button>
				<button class="btn btn-danger btn-lg" style="width:6rem; height:3rem;"><a href="#" style="color:white">취소</a></button>
			</div>
		</div>
		<!-- 리폿정보 넘기기. 게시글에서 신고버튼 누를때나 스타일리스트 개인페이지에서 신고버튼 누를때 신고하고 싶은 member의 정보를 넘겨야 함.. 이건
		     스타일리스트 개인 페이지나 게시글에서 member의 정보를 여기 reportRequestPage에 전달해주어ㅑ 한다. -->
		<input type="hidden" value="${sessionMemberInfo.member_no }" name="reporting_member_no">
		<input type="hidden" value="2" name="reported_member_no">
		<input type="hidden" value="0" name="report_confirm">
		<input type="hidden" value="0" name="report_complete">
		</form>
		</div>
	</div>
	</div>
	</div>
</body>
</html>