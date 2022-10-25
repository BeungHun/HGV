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
        <div class="container-fluid px-4">
        	<div class="row">
        		<div class="col">
        			<div class="row">
        				<div class="col border-bottom">
        					<div class="row">
        						<div class="col"></div>
        						<div class="col-9 fs-4" style="text-align : center;"><div>댓글<i class="bi bi-lock-fill fs-5" style="color: grey"></i></div></div>
        						<div class="col">
        							<a type="button" onclick="location.href='./boardView?blog_no=${data.blogVo.blog_no}'"><i class="bi bi-x-lg fs-4"></i></a>
        						</div>
        					</div>
        				</div>
        			</div>
        			<div class="row">
        				<div class="col">
        					<div class="row my-5">
        						<div class="col" style="text-align : center;">
        							<i class="bi bi-key fs-1"></i><br>
        							<h5>댓글을 남겨보세요.</h5>
        							<div>댓글은 옷장 주인과</div>
        							<div>작성자만 볼 수 있습니다.</div>
        						</div>		
        					</div>
        				</div>
        			</div>
        			<div class="row my-5">
        				<div class="col"></div>
        				<form action="./writeComment" method="post">
        				<div class="col">
        					<div class="row">
        							<div class="col-1"></div>
	        						<div class="col-10">
	        							<input type="text" placeholder="   댓글을 입력해주세요." name="comment_content" style="resize: none; background-color:#f8f9fa; border-radius:30px; border-color:#adb5bd; width:100%; height:40px; ">
	        						</div>
	        						<div class="col">
		        						<input type="hidden" name="blog_no" value=${data.blogVo.blog_no }>
				  						<input type="hidden" name="member_no" value=${memberInfo.member_no }>
		        						<button type="submit" class="btn btn-primary">게시</button> 
	        						</div>
        					</div>
        				</div>
        				</form>
        				<div class="col-1"></div>
        			</div>
        			 <!-- 댓글리스트 -->
        			<div class="row">
        				<div class="col-1"></div>
        				<div class="col">
        				
        					<c:forEach items="${commentList }" var="datas">
        					<%-- <c:choose>
        					<c:when test=" ${data.memberVo.member_no }==${memberInfo.member_no } ||${datas.memberVo.member_no }==${memberInfo.member_no }"> --%>
        					
        					<div class="row">
        						<div class="col ms-3">
									<div class="row">
										<div class="col">
											<div style="font-weight: bold;">${datas.memberVo.member_nick }</div>
										</div>
										<div class="col-7"></div><!-- 공란 -->
										<div class="col fs-6"><span style="color:grey;"><fmt:formatDate value="${datas.commentVo.comment_writedate }" pattern="yyyy. MM. dd"></fmt:formatDate>    </span><i class="bi bi-three-dots-vertical"></i></div>
									</div>
									<div class="row">
										<div class="col">
											${datas.commentVo.comment_content }
										</div>
									</div> 
									<div class="row">
										<hr></hr>
									</div> 
        						</div>
        						<div class="col-1"></div>
        					</div>
        					
        					<%-- </c:when>
        					<c:otherwise>
        					
        					</c:otherwise>
        					</c:choose> --%>
        					</c:forEach>
        					
        				</div>
        			</div>
        	</div>
		</div>
	</div>
  </div>
          
		    
 		   <%--  <c:if test="${!empty sessionMemberInfo && sessioMemberInfo.member_no == data.memberVo.member_no }">
		    	<a href="./board_update?board_no=${data.boardVo.board_no }">수정 </a>
		    </c:if>  --%>
		  
		    
		    <%-- <c:if test="${!empty sessionUserInfo}">
		    	<a href="board_write.html"><img src="../resources/img/write.png"></a>	
		    </c:if> --%>
		  <!-- </div> -->
        	  
        	
          	
			


        	
  
<!-- bootstrap_ICON 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
    crossorigin="anonymous"></script>
</body>

</html>