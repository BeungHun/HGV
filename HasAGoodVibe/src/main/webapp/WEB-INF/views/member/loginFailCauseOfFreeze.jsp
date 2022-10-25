<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>계정 이용 정지 상태 알림</h1><br>
<h3>현재 회원님은 계정 이용 정지 상태입니다.</h3><br>
<h3>회원님의 로그인 가능 날짜는 <fmt:formatDate value="${memberFreezeVoForCheck.member_canLoginDate }" pattern="yyyy.MM.dd"/> 입니다.</h3>
<h3><a href="./loginPage">로그인 페이지로 돌아가기</a></h3>
</body>
</html>