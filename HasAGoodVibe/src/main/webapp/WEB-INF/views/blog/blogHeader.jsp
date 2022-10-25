<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#logo image{
	height: 80px;
	width: 80px;
}
.container{
	display:flex;
	align-items: center;
	height: 100px;
}
a{
color: #141619
text-decoration: none;
}

</style>
</head>
<body>
<div style="width : 1200px; margin: 0 auto">
        <div class="container-fluid px-4">
        	<div class="row">
                <div class="col">
                    <div class="row">
                        <div class="col border-bottom">
                            <div class="row">
                                <div id="logo image" class="col-2 container"><!--HGV 로고-->
                                    <c:choose>
                                        <c:when test="${!empty sessionMemberInfo }">
                                            <a href="../member/mainPage"><img id="banner_img" alt="" width="80" src="../resources/img/HGV_logo.png"></a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="../member/index"><img id="banner_img" alt="" width="80" src="../resources/img/HGV_logo.png"></a>
                                        </c:otherwise>
                                    </c:choose>	
                                </div>
                                <div class="col-5"></div> <!--공란-->
                                <div class="col "><!--상단 메뉴 (둘러보기, 검색, 알림, 기록하기, 내 블로그)-->
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
											  <c:choose>
											  	<c:when test="${!empty stylistInfo }">
											    <a type="button" onclick="location.href='./myBlog?stylist_no=${stylistInfo.stylist_no}'"><h5>마이 클로젯</h5></a><br><br>
											    </c:when> 
											    <c:otherwise>
											    <a type="button" onclick="location.href='./#"><h5>마이 클로젯</h5></a><br><br>
											    </c:otherwise>
											    </c:choose>
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
                    
