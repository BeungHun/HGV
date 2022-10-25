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
        	height: 80px;
            width: 80px;
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
    	<jsp:include page="./blogHeader.jsp"></jsp:include>
    	<div class="row"><!--메뉴바..기본!!-->
                    	<div class="col-2"></div><!-- 마진  -->
                        <div class="col border-bottom">
                        	<div class="row">
                        		<div class="col mt-3 mb-3" style="text-align : center;" >
                        			<a href="./nokedCloset"><button  type="button" style="background-color: white; border :none; " >내가 노크한 옷장</button></a>
                        		</div>
                        		<div class="col  mt-3 mb-" style="text-align : center;">
                        			<a href="./blogIndex"><button type="button" style="background-color: white; border :none">옷장 산책</button></a>
                        		</div>
                        		<div class="col mt-3 mb-3" style="text-align : center;">
                        			<a href="./closetList"><button type="button" style="background-color: white; border :none">옷장 둘러보기</button></a>
                        		</div>
                        	</div>
                        </div>
                        <div class="col-2"></div>
        		</div>		
        <div class="row">
        	<div class="col-2"></div>
            <div class="col">
                <div class="row my-2">
                    <div class="col-8 fs-4 fw-bold text-truncate ms-4">
                        최신 기록
                    </div>          
                </div>
           
                <!--피드-->
			    <div class="row my-3">
<!-- 			    	<div class="col-2"></div> -->
                    <div class="col ms-4">
                    	<!--카드-->
                    	<div class="row">
                        <c:forEach items="${boardList }" var="data">
                        <div class="col-4 p-3" type="button" onclick="location.href='./boardView?blog_no=${data.blogVo.blog_no}'">
                            <div class="row">
                            	<div class="col py-3 border border-secondary-50 rounded-3">
                            
                                <div class="row">
                                    <div class="col" style="color:black;">
                                        <i class="bi bi-door-closed my-2 fs-3"></i> ${data.memberVo.member_nick}
                                    </div>
                                    
                                </div>
                                <!-- 이미지 로우 -->
                                <div class="row">
                                    <div class="col px-2" style="height: 15em;overflow:hidden;">
                                        <img class="imgLow img-fluid rounded" src="../resources/img/flowers.jpeg">
                                    </div>
                                </div>
                                <div class="row mt-2">
                                	<div class="col fs-6 text-secondary">
                                		<fmt:formatDate value="${data.blogVo.blog_writedate }" pattern="yyyy. MM. dd"></fmt:formatDate>
                                	</div>
                                
                                </div>
                                
                                <!-- TITLE 로우 -->
                               
                                <div class="row mt-2">
                                    <div class="col-8 fs-5  text-truncate">
                                        ${data.blogVo.blog_title }
                                    </div>
                                </div>
                                <!-- 태그내용 -->
                                <div class="row">
                                    <div class="col fs-6 text-secondary text-truncate">
                                       ${data.blogVo.blog_content }
                                    </div>
                                </div>
                        </div>
                        </div>	
                        
                 </div>
			                   <%--  <td>${data.categoryVo.c_name }</td>
			                        <td><a href="boardView?blog_no=${data.blogVo.blog_no}">${data.blogVo.blog_title }</a></td>
			                        <td><fmt:formatDate value="${data.blogVo.blog_writedate }" pattern="yyyy-MM-dd hh:mm"></fmt:formatDate></td>
			                        <td>${data.blogVo.blog_readCount }</td>
			                        <td><i class="bi bi-heart">${data.blogVo.blog_like }</i></td>
			                    
			                       
			                        </tr> --%>
		                   
					                </c:forEach>
					            	 </div>
		  
                                </div>
<!--                         <div class="col-2"></div> -->
                     </div>
                     <div class="row">
                     	<div class="col">
                     		<div class="row my-2">
                     			<div class="col-8 fs-4 fw-bold text-truncate ms-4">옷장</div>
                     		</div>
                     		<div class="row">
                     			<div class="col">
                     				<div class="row">
                     					<div class="col">
                     						<img id="closets" alt="" width="90%" src="../resources/img/closets.png">
                     					<%-- <c:forEach items="${blogList }" var="room">
	                     					<div class="col-3 m-2 px-0 border border-secondary-50 rounded-2" style="text-align : center;">
	                     					</div>
	                     				</c:forEach> --%>
	                     				</div>
                     				</div>
                     			</div>
                     		</div>
                     		<div class="row">
                     			<div class="col">
                     				<div class="row my-2">
                     					<div class="col-8 fs-4 fw-bold text-truncate ms-4">태그</div>
	                     			</div>
	                     			<div class="row">
	                     				<img id="tags" alt="" width="40%" src="../resources/img/tags.png">
	                     			</div>
	                     		</div>
                     	</div>
                     </div>
                  </div>
                  
                  </div>
                  <div class="col-2"></div>


            </div>
        </div>
        <div class="row">
        	<div class="col">
        		<br>
        		<br>
        		<br>
        	</div>
    	</div>

    
    </div>
   </div>
   
<!-- bootstrap_ICON 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
    crossorigin="anonymous"></script>
</body>

</html>
