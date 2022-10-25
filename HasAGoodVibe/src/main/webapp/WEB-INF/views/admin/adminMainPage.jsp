<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			width: 129px;
			margin-left: 20px;
			
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
		
		.font-bg{
			color:black;
		}
		
		.btn-height{
			height: 10px;
		}
		
		.a{
			text-decoration:none;
		}
		


    </style>
    <!-- Jquery 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  


</head>

<body>
	    <div id="wrap">
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
		        		<div class="col-3 side">
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
		        					<button type="button" class="side-button font-face" style="background-color:#31244B; font-size:25px"><a href="./memberManagePage" style="color:white; text-decoration:none;"><i class="bi bi-people-fill"></i>&nbsp&nbsp회원 관리</a></button>
		        			</div>
		        		</div>
		        		<!-- 가운데 -->
		        		<div class="col-6 middle">
		        			<div class="row">
		        				<div class="col-5 font-face font-bg" style="font-size:40px; padding-top:20px;">오늘의 HGV</div>
		        				<div class="col"></div>
		        			</div>
		        			<div class="row">
		        				<div class="col-5">
			        				<hr style="size:10px; color:black">
		        				</div>
		        			</div>
		        			<div class="row">
		        			<div class="col" style="border-radius:10px; padding:30px 20px; margin:50px 15px; background-color:white">
		        			<div class="row">
		        				<div class="col ml-2 btn">
		        					<div class="row">
		        						<div class="col">
		        							<i class="bi bi-basket middle-icon ml-2"></i>
		        						</div>
		        					</div>
		        					<div class="row">
		        						<div class="col middle-icon-text">매칭수</div>
		        					</div>
		        					<div class="row">
		        						<div class="col font-face" style="padding-top:10px; color:blue;">전날 대비 10 ↑</div>
		        					</div>
		        					<div class="row">
		        						<div class="col btn-height"><hr class="hr"></div>
		        					</div>
		        				</div>
		        				
		        				<div class="col btn">
		        					<div class="row">
		        						<div class="col"><i class="bi bi-coin middle-icon"></i></div>
		        					</div>
		        					<div class="row">
		        						<div class="col middle-icon-text">총결제액</div>
		        					</div>
		        					<div class="row">
		        						<div class="col font-face" style="padding-top:10px; color:blue;">전날 대비 500만 ↑</div>
		        					</div>
		        					<div class="row">
		        						<div class="col btn-height"><hr class="hr"></div>
		        					</div>
		        				</div>
		        				
		        				<div class="col btn">
		        					<div class="row">
		        						<div class="col"><i class="bi bi-exclamation-circle middle-icon"></i></div>
		        					</div>
		        					<div class="row">
		        						<div class="col middle-icon-text">신고수</div>
		        					</div>
		        					<div class="row">
		        						<div class="col font-face" style="padding-top:10px; color:red;">전날 대비 10 ↓</div>
		        					</div>
		        					<div class="row">
		        						<div class="col btn-height"><hr class="hr"></div>
		        					</div>
		        				</div>
		        			
		        				<div class="col btn">
		        					<div class="row">
		        						<div class="col"><i class="bi bi-cloud-arrow-down middle-icon"></i></div>
		        					</div>
		        					<div class="row">
		        						<div class="col middle-icon-text">서버상태</div>
		        					</div>
		        					<div class="row">
		        						<div class="col font-face"  style="padding-top:10px; color:blue;">전날 대비 10% ↑</div>
		        					</div>
		        					<div class="row">
		        						<div class="col btn-height"><hr class="hr"></div>
		        					</div>
		        				</div>
		        			
		        			</div>
		        			</div>
		        			</div>
		        			<!-- 카드 -->
		        			<div class="row" style="padding-top:100px">
		        				<div class="col card-inform-text">Top Stylist</div>
		        				<div class="col card-inform-text">Hot Style</div>
		        			</div>
		        			<div class="row" style="padding-top:20px;">
		        				<div class="col">
			        				<div class="card" style="width:370px; height:300px">
									  <a href="#"><img src="../resources/img/cardCap2.PNG" class="card-img-top" style="height:300px;" alt="..."></a>
									  <div class="card-body">
									    <p class="card-text"></p>
									  </div>
									</div>
		        				</div>
		        				<div class="col">
			        				<div class="card" style="width:370px; height:300px">
									  <img src="../resources/img/cardCap.PNG" class="card-img-top" alt="...">
									  <div class="card-body">
									    <p class="card-text"></p>
									  </div>
									</div>
		        				</div>
		        			</div>
		        			<div class="row" style="padding-top:120px">
		        				<div class="col card-inform-text">Worst User</div>
		        				<div class="col card-inform-text">Advertisement</div>
		        			</div>
		        			<div class="row" style="padding-top:20px;">
		        				<div class="col">
			        				<div class="card" style="width:370px; height:300px">
									  <img src="../resources/img/cardCap2.PNG" class="card-img-top" style="height:300px;" alt="...">
									  <div class="card-body">
									    <p class="card-text"></p>
									  </div>
									</div>
		        				</div>
		        				<div class="col">
			        				<div class="card" style="width:370px; height:300px">
									  <img src="../resources/img/cardCap.PNG" class="card-img-top" alt="...">
									  <div class="card-body">
									    <p class="card-text"></p>
									  </div>
									</div>
		        				</div>
		        				
		        			</div>
		        		</div>	
		        		<!-- 오른쪽 사이드 -->
		        		<div class="col-3 right">
		        			<div class="row padding-top-little">
		        				<div class="col text-center">
		        					<button type="button" class="btn btn-danger font-face" style="width:195px; height:50px;">Alarm</button>	
		        				</div>
		        			</div>
		        			<div class="row font-face text-center" style="color:black">
		        				ㆍ업무량 한계치에 달했습니다. 더하면 죽을것같다
		        			</div>
		        			<div class="row font-face text-center"  style="color:black">
		        				ㆍ몇시간이나 했는데 한게 없어보이냐
		        			</div>
		        			<div class="row">
		        				<div class="col">
									<div id='calendar'></div>
									
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