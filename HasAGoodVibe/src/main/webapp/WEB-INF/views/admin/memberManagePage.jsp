<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!Doctype html>
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
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">
    <script src="../static/vendor/jquery/jquery.min.js"></script>
	<script src="../static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
	<link href="fullcalendar/fullcalendar.min.css" rel="stylesheet">
	<script src="fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
    <style>
         #logo_img{
        	height: 100px;
            width: 160px;
            object-fit: cover;
		}
		
		.banner_img{
			width: 100px;
			height: 100px;
			float: left;
		}
		
		#wrap{
			width: 1200px; 
			margin:0 auto;
			color: #E4E4E4;
		}
		
		.side{
			width: 200px;
			height: 1500px;
			background-color: #31244B;
		}
		
		.middle{
			width: 800px;
			height: 1500px;
			background-color: #E5E5E5;
		}
		
		.right{
			width: 200px;
			height: 1500px;
		}
		
		.header{
			width: 1200px;
			height: 60px;
			background-color: #F1DD26;
		}	
		
		.dashBoardTitle{
			width: 1000px;
			height: 100px;
			background-color: #F1F1F1;
		}
		
		.hr{
			height: 1px;
			color: #000000;
			width: 150px;
			margin-left: 15px;
		}
		
		.font-face{
			font-family: "Jua";
			font-style: normal;
		}
		
		.icon-normal{
			background-color:#F1DD26;
			color:#000000;
			font-size:30px;
		}
		
		.side-icon{
			color:white;
			font-size:20px;
			
		}
		
		.side-button{
			border:none;
			outline:none;
		}
		
		.middle-icon{
			font-size:50px;
			color: #5E5C63;
			margin: 0 auto;
			text-align:center;
			display:block;
		}
		
		.middle-icon-text{
			text-align:center;
			color: #000000;
			font-family: "Jua";
			font-style:normal;
			font-size:30px;
			margin-top:10px;
			
		}
		
		.card-inform-text{
			text-align:center;
			color:#000000;
			font-family: "Jua";
			font-style:normal;
			font-size:30px;
		}
		
		.padding-top-little{
			padding-top:10px;
		}
		
		.padding-top-middle{
			padding-top:30px;
		}
		
		.font-bl{
			color:black;
		}
		
		.font-middle{
			font-size:30px;
		}
		
		.font-bg{
			font-size:60ox;
		}
		.a{
			text-decoration:none;
		}
		
		.memberManageFontContent{
			font-size:21px;
			color:black;
			font-family: "Jua";
		}
		
		.memberManageFontTitle{
			font-size:23px;
			text-weight:bold;
			font-family: "Jua";
			color:black;
		}
		
		.hr-nm{
			color:black;
			height:1px;
		}
		
		.pagination{
			 justify-content : center;
		}


    </style>
    <!-- Jquery 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  


</head>

<body>
	    <div id="wrap">
	    	<div class="container-fluid">
	        <div class="row">
		        <div class="col">
		        	<!-- 헤더 -->
		        	<div class="row header">
		        		<div class="col-1 mt-2"><a class="btn" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
		        			<i class="bi bi-justify" style="background-color:#F1DD26; color:#000000; font-size:20px"></i></a>
		        		</div>
				        			<!-- 오프캔버스 -->
				        			<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
									  <div class="offcanvas-header">
									    <h5 class="offcanvas-title" id="offcanvasExampleLabel">Offcanvas</h5>
									    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
									  </div>
									  <div class="offcanvas-body">
									    <div>
									      Some text as placeholder. In real life you can have the elements you have chosen. Like, text, images, lists, etc.
									    </div>
									    <div class="dropdown mt-3">
									      <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown">
									        Dropdown button
									      </button>
									      <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									        <li><a class="dropdown-item" href="#">Action</a></li>
									        <li><a class="dropdown-item" href="#">Another action</a></li>
									        <li><a class="dropdown-item" href="#">Something else here</a></li>
									      </ul>
									    </div>
									  </div>
									</div>
			       		<div class="col-2 font-face mt-3" style="color:#F1F1F1; font-size:22px;">
			       			제발 잘 됐으면..
			       		</div>
			       		<div class="col-1"><i class="bi bi-envelope-exclamation icon-normal btn"></i></div>
		        	</div>
		        	
		        	<!-- 헤더 밑 -->
		        	<div class="row">
		        	
		        		<!-- 왼쪽 사이드 -->
		        		<div class="col-2 side">
		        			<div class="row" style="height:200px">
		        				<i class="bi bi-gear" style="font-size:70px; text-align:center; margin-top:20px"></i>
		        			</div>
		        			<div class="row">
		        				<div class="col font-face text-center" style="font-size:30px;">관리자 페이지</div>
		        			</div>
		        			<div class="row padding-top-middle">
		        					<button type="button" class="side-button font-face" style="background-color:#31244B; color:white; font-size:25px"><i class="bi bi-file-earmark side-icon  font-face" style="background-color:#31244B; color:white;"></i>&nbsp&nbsp페이지 관리</button>
		        			</div>
		        			<div class="row padding-top-middle">
		        					<button type="button" class="side-button font-face" style="background-color:#31244B; color:white; font-size:25px"><i class="bi bi-box-seam"></i>&nbsp&nbsp컨텐츠 관리</button>
		        			</div>
		        			<div class="row padding-top-middle">
		        					<button type="button" class="side-button font-face" style="background-color:#31244B; color:white; font-size:25px"><i class="bi bi-people-fill"></i>&nbsp&nbsp회원 관리</button>
		        			</div>
		        		</div>
		        		
		        		<!-- 가운데 -->
				        <div class="col" style="background-color:#EAEAEA;">
				        <div class="row mx-1 my-1" style="padding:20px 0px; margin: 0 auto;">
				        	<div class="col-4">
				        		<h1 class="font-face font-bl">회원 관리 페이지</h1>
				        	</div>
				        	<div class="col"></div>
				        </div>
				        <div class="row">
				        	<div class="col-4">
				        		<hr style="color:black">
				        	</div>
				        </div>
				        	<div class="row">
					        	<div class="col" style="background-color:white; padding: 0px 0px 40px; margin:0px 20px; border-radius:10px;">
						        	<form action="./memberManagePage" method="get">
						        			<div class="row" style="padding:40px 0px 0px 20px" >
								        		<div class="col-2 font-face font-bl">
								        			<select class="form-select my-2"  name="searchType">
													  <option selected value="member_id">아이디</option>
													  <option value="member_nick">닉네임</option>
													</select>
								  				</div>
								  					
								        		<div class="col-4 my-2 font-face font-bl" style="width:290px;">
								        			검색 : <input type="text" name="searchWord">
								        		</div>
								        		<div class="col-1 font-face font-bl">
								        			 <button type="submit" class="btn btn-secondary mt-1">검색</button>
								        		</div>
								        		<div class="col"></div>
								        	</div>
								       </form>
						        	<div class="row" style="padding:30px 1px 0px 30px; width:970px;">
						        	  <div class="col">
							        	  <div class="row">
											  <div class="col">
											    <div class="row">
											      <div class="col memberManageFontTitle">아이디</div>
											      <div class="col memberManageFontTitle">닉네임</div>
											      <div class="col memberManageFontTitle">정지여부</div>
											      <div class="col memberManageFontTitle">로그인가능날짜</div>
											      <div class="col memberManageFontTitle">정지기능</div>
											      <div class="col memberManageFontTitle">정지해제</div>
											    </div>
											    <div class="row"><div class="col"><hr style="margin-top:15px; color:black; width:97%;" class="hr-nm"></div></div>
											  </div>
											</div>
											<div class="row">
											  <div class="col">
												<c:forEach items="${dataList }" var="dataList">
											    <div class="row">
											   	  <div class="col memberManageFontContent">${dataList.memberVo.member_id}</div>
											      <div class="col memberManageFontContent">${dataList.memberVo.member_nick }</div>
											      <div class="col memberManageFontContent">${dataList.memberFreezeVo.member_freezeOrNot }</div>
											      <div class="col memberManageFontContent"><fmt:formatDate value="${dataList.memberFreezeVo.member_canLoginDate }" pattern="yy.MM.dd"/> </div>
											      <div class="col memberManageFontContent"><button type="button" class="btn btn-danger"><a href="./memberFreezePage?member_no=${dataList.memberVo.member_no }" style="color:white; text-decoration:none;">정지</a></button></div>
											      <div class="col memberManageFontContent"><button type="button" class="btn btn-primary"><a href="./deleteMemberFreezeVoProcess?member_no=${dataList.memberVo.member_no }" style="color:white; text-decoration:none;">해제</a></button></div>
											      <div class="row"><div class="col"><hr style="margin-top:15px; color:black; width:100%;" class="hr-nm"></div></div>
											    </div>
											 
											</c:forEach>
											</div>
										</div>
									</div>
								</div>
								<div class="row mt-3">
												<div class="col"><!-- 페이징...UI -->
													<nav aria-label="Page navigation example">
													  <ul class="pagination">
													  	<c:choose>
													  		<c:when test="${startPage <= 1}">
																<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>							  		
													  		</c:when>
													  		<c:otherwise>
																<li class="page-item"><a class="page-link" href="./memberManagePage?pageNum=${startPage - 1}${additionalParam}">&lt;</a></li>							  		
													  		</c:otherwise>
													  	</c:choose>
													  
													    
													    <c:forEach begin="${startPage }" end="${endPage }" var="i">
													    	<c:choose>
													    		<c:when test="${i == currentPageNum }">
																	<li class="page-item active"><a class="page-link" href="./memberManagePage?pageNum=${i}${additionalParam}">${i}</a></li>							    						
													    		</c:when>
													    		<c:otherwise>
																	<li class="page-item"><a class="page-link" href="./memberManagePage?pageNum=${i}${additionalParam}">${i}</a></li>							    		
													    		</c:otherwise>							    	
													    	</c:choose>
													    </c:forEach>
													    <c:choose>
													    	<c:when test="${endPage >= totalPageCount}">
																<li class="page-item disabled"><a class="page-link">&gt;</a></li>							    	
													    	</c:when>
													    	<c:otherwise>
																<li class="page-item"><a class="page-link" href="./memberManagePage?pageNum=${endPage+1}${additionalParam}">&gt;</a></li>							    	
													    	</c:otherwise>
													    </c:choose>
													  </ul>
													</nav>							
												</div>
											 </div>
							</div>
					 	</div>
		        		
		        		<!-- 오른쪽 사이드 -->
		        		
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

        	
        	