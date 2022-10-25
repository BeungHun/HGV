<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- #수정# 게시판 날짜 변환  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- #수정# 게시판 날짜 변환 끝  -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

</head>

<body>
	<div class="container">
	   	<div class="row card">
	   		<div class="col">
		   		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
		   		 <thead>
			   		 <tr>
			   		 	<th colspan="12" style="background-color: #eeeeee; text-align: center;">게시판 글보기</th>
			   		 
					</tr>
				</thead>
				
				<tbody>
					<tr>
			   		 	<td style="background-color: #eeeeee; text-align: center;">${data.freeBoardVo.board_no }</td>
			   		 	<td style="background-color: #eeeeee; text-align: center;">${data.freeBoardVo.board_title}</td>
			   		 	<td style="background-color: #eeeeee; text-align: center;">닉네임: ${data.memberVo.member_nick }</td>
			   		 	<td style="background-color: #eeeeee; text-align: center;">조회수: ${data.freeBoardVo.board_readcount }</td>
			   		 	<td style="background-color: #eeeeee; text-align: center;"><fmt:formatDate value="${data.freeBoardVo.board_writedate }" pattern="yyyy.MM.dd"/></td>
					</tr>
				</tbody>		
				</table>		
				
				
				 <div class="row">
				 	<div class="col" style="height: 250px; text-align: left;">
				 		<p>${data.freeBoardVo.board_content }</p>		 
				 	</div>
			 	</div>		
	   		</div>
	   		<!-- 댓글 -->
	   		<div class="row">
	   			<div class="col">
	   				<c:forEach items="${data.commentList }" var="list" >
	   					<div class="row">
		   					<div class="col">${list.memberVo.member_nick }</div>
		   					<div class="col">${list.commentVo.freeboard_comment_content }</div>
		   					<div class="col">${list.commentVo.freeboard_comment_writedate }</div>
	   					</div>
	   				</c:forEach>
	   			</div>
	   		</div>
	   		<!-- 댓글쓰기 -->
	   		<div class="row">
	   			<div class="col">
	   				<form action="./writeCommentProcess" method="post"> 
						<div class="row"><!-- 입력 양식 -->
							<div class="col">
								<textarea name="freeboard_comment_content" class="form-control"></textarea>
								<input type="hidden" name="freeboard_no" value="${data.freeBoardVo.board_no }">
							</div>
							<div class="col-2 d-grid">
								<button class="btn btn-primary">입력</button>
							</div>
						</div> 	
					</form>	
	   			</div>
	   		</div>
	   		<br>
			<div class="row">
	   			<div class="col text-end">
	   				<a href="../member/freeboard" class="btn btn-primary">목록</a>
					<c:if test="${!empty sessionUserInfo && sessionUserInfo.member_no == data.memberVo.member_no  }">
						<a href="./updateContentPage?board_no=${data.freeBoardVo.board_no }" class="btn btn-warning">수정</a>
						<a href="./deleteContentProcess?board_no=${data.freeBoardVo.board_no }" class="btn btn-danger">삭제</a>
					</c:if>
	   			</div>
	   		</div> 
		</div>
	</div>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>	
	
</body>
</html>