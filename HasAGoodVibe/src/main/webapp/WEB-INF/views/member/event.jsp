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
    	
		function modify() {
			check_modify = true;
			
		}
		


    </script>
</head>

<body>
    <div style="width : 1200px; margin: 0 auto">
        <div class="container-fluid">
        	<jsp:include page="../commons/header.jsp"></jsp:include>
           
            
           	<div class="row my-2">
               <div class="col-8 fs-4 fw-bold text-danger text-truncate">
                   <i class="bi bi-balloon-fill"></i> 출석 이벤트
               		<div class="row"> <!-- 이미지 로우 -->
               			<div class="col">
               				<img id="event_img" style="width: 100%; height: auto;" alt="" src="../resources/img/event_ex.jpg"/>
               			</div>
               		</div>
             		<!-- 하루 한 번만 댓글 작성  -->
	                  	<form action="./writeECommentProcess" method="get">
                  			<c:choose>
								<c:when test="${!empty sessionMemberInfo && dateCount==0}">
			                  	<div class="row">
				                    <div class="col" id="comment_box"> <!-- 댓글창 -->
				                    	<textarea style="width:100%; height:auto; resize: none;" name="attend_comment"></textarea>
				                     </div>
				                </div>
		                    	<div class="row">
				                    <div class="col">
				                    	<input type="hidden" name="member_no" value="${sessionMemberInfo.member_no}">
										<input type="submit" class="btn btn-primary mt-2" value="작성">
				                    </div> 
		                    	</div>                    
	                    	</c:when>
	                    	<c:otherwise>
	                    		<div class="row">
	                    			<div class="col">
	                    				<span>이미 이벤트에 참여하셨습니다</span>
	                    			</div>
	                    		</div>
	                    	</c:otherwise>
	                    </c:choose> 
                    </form>
                    	<div class="row my-5"></div>
                    		<div class="row">
                    			<div class="col">
                    			 	<table class="table table-striped">
										<tr>
											<td>작성자</td>
											<td>내용</td>
											<td>참여 일시</td>
											<td>삭제</td>
										</tr>
									<c:forEach items="${commentList }" var="data">
										<tr>
											<td>${data.memberVo.member_nick }</td>
											<td>
												<c:choose>
												<c:when test="${!empty sessionMemberInfo && sessionMemberInfo.member_no == data.memberVo.member_no && check_modify}">
													<textarea>${data.attendVo.attend_comment}</textarea>
												</c:when>
												<c:otherwise>
													${data.attendVo.attend_comment }
												</c:otherwise>
												</c:choose>
											</td>
											<td><fmt:formatDate value="${data.attendVo.attend_date }" pattern="yyyy-MM-dd hh:mm"/></td>
											<td>
												<c:choose>
												<c:when test="${!empty sessionMemberInfo && sessionMemberInfo.member_no == data.memberVo.member_no && check_modify}">
													<a href="./event" class="btn btn-primary mt-2">취소</a>
													<a href="updateECommentProcess?attend_no=${data.attendVo.attend_no}&&attend_comment=${data.attendVo.attend_comment}" class="btn btn-primary mt-2">확인</a>
												</c:when>
												<c:otherwise>
													<c:if test="${!empty sessionMemberInfo && sessionMemberInfo.member_no == data.memberVo.member_no}">
														<a href="deleteECommentProcess?attendNo=${data.attendVo.attend_no}" class="btn btn-primary mt-2">삭제</a>
														<a onclick="modify(this)" class="btn btn-primary mt-2">수정</a>
													</c:if>
												</c:otherwise>	
												</c:choose>
											</td>
										</tr>
									</c:forEach>
									</table>
                    			</div>
                    		</div>
                    	</div>
	                </div>
        	 </div>
       </div>
</body>
</html>