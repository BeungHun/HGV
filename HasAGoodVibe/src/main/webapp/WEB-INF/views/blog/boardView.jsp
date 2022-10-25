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
                            <div class="row align-items-center">
                            	 <div class="col-4 fs-5">
                                	<a type="button" onclick="location.href='./myBlog?stylist_no=${data.stylistVo.stylist_no }'"><img id="door_black.png" alt="" width="40" src="../resources/img/door_black.png"><span>  ${data.memberVo.member_nick }의 옷장</span></a>
                                 </div>
                                <div class="col"></div>
                                <div class="col-5 "><!--상단 메뉴 (둘러보기, 검색, 알림, 기록하기, 내 블로그)-->
                                    <div class="row align-items-center">
                                        <div class="col-3">
                                            <div class="container" ><a type="button" onclick="location.href='./blogIndex'">둘러보기</a></div>
                                        </div>
                                        <div class="col">
                                        	<div class="container"><a type="button" onclick="location.href='./#">검색</a></div>
                                        </div>
                                        <div class="col border-end">
                                        	<div class="container"><a type="button" onclick="location.href='./#">알림</a></div>
                                        </div>
                                        <div class="col-3">
                                        	<a href="./boardWriteAll" button type="button" class="btn btn-dark">기록하기</a>
                                        </div>
                                        <div class="col">
                                        	<button  style="background-color: white; border:none;" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"><img alt="" height="50" src="../resources/img/door.png"></button>

											<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
											  <div class="offcanvas-header">
											    <h5 class="offcanvas-title" id="offcanvasRightLabel"> </h5>
											    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
											  </div>
											  <div class="offcanvas-body">
											    <a type="button" onclick="location.href='./myBlog?stylist_no=${stylistInfo.stylist_no}'"><h5>마이 클로젯</h5></a><br><br>
											    <h5>노크/그룹 관리하기</h5><br>
											    <hr width="90%" color="grey"><br>
											    <h5>서랍장</h5><br>
											    <hr width="90%" color="grey"><br>
											    <h5>설정 및 개인정보 보호</h5><br>
											    <a type="button" onclick="location.href='./logoutProcess'"><h5>로그아웃</h5></a>
											  </div>
											</div>
                                        </div>
                                        
                                    </div>
                                </div> 
                            </div>
                        </div>
                    </div>
                    
                    
			
          <div class="row">
          	<div class="col-2"></div>
          	<div class="col">
          		<div class="row my-3 align-items-center">
          			<div class="col-2">
          				<a href="./categoryView?cNo=${data.categoryVo.c_no }"type="button" style="border-radius: 30px"class="btn btn-outline-dark">${data.categoryVo.c_name }</a>
          			</div>
          			<div class="col-7"></div> <!-- 공백 -->
          			<div class="col">
          			<span  style="color:grey;"><fmt:formatDate value="${data.blogVo.blog_writedate }" pattern="yyyy. MM. dd"></fmt:formatDate>    </span><i class="bi bi-three-dots-vertical fs-5" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal"></i>
          			</div>
          			<%-- </c:if> --%>
          		</div>
          		<div class="row my-2">
          			<div class="col border-bottom">
          				<div><h5>${data.blogVo.blog_title }</h5></div>
          			</div>
          		</div>
          		<div class="row">
          			<div class="col border-bottom">
          				<div class="row my-5">
          					<div class="col">
          						<div>${data.blogVo.blog_content}</div>
          					</div>
          				</div>
          			</div>
          		</div>
          		<div class="row">
          			<div class="col">
          				<div class="row">
          					<div class="col-11"></div>
          					<div class="col my-2">
          						<a type="button" onclick="location.href='./commentListPage?blog_no=${data.blogVo.blog_no}'"><i class="bi bi-chat-square-dots fs-4"></i></a>
          					</div>
          				</div>
          			</div>
          		</div>
          		<div class="row">
          			<div class="col">
          				<div class="row">
          					<div class="col">
          						<i class="bi bi-arrow-left-circle fs-4"></i>
          					</div>
          					<div class="col-10"></div>
          					<div class="col">
          						<i class="bi bi-arrow-right-circle fs-4"></i>
          					</div>
          				</div>
          				<div class="row">
          					<div class="col">사랑니 발치</div>
          					<div class="col-8"></div>
          					<div class="col">탑건 관람기 </div>
          				</div>
          			</div>
          		</div>
          	</div>
          		
          		
          	
          	
          	<div class="col-2"></div>
          </div>
         </div>
        </div>
  	</div>
     <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      	<div class="row">
      		<div class="col" style="text-align:end">
      			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      		</div>
      	</div>
      	<div class="row align-items-center">
      		<div class="col" style="text-align:center">
      			<h5 class="modal-title" id="exampleModalLabel">기록 관리</h5>
      		</div>
      	</div>
     	
      <div class="modal-body">
      	<div class="row align-items-center">
      		<div class="col border-bottom">
      			기록 편집
      		</div>
      	</div>
        <div class="row align-items-center">
        	<div class="col">
        		<a type="button" onclick="location.href='./boardDelete?blog_no=${data.blogVo.blog_no}'">기록 삭제</a>
        	</div>
        </div>
      </div>
      <div class="modal-footer">
       	
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