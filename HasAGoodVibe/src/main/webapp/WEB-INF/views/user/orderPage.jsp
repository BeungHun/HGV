<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
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
	<link rel="stylesheet" type="text/css" href="../resources/css/common.css">
     	
    <style>
         #logo_img{
        	height: 100px;
            width: 160px;
            object-fit: cover;
		}
		
		#mainPageProfileImg{
			height: 300px;
            width: 200px;
            object-fit: cover;  
            margin: auto 0;        
		}

    </style>
    <!-- Jquery 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>



    </script>
</head>

<body>
    <div style="width : 1200px; margin: 0 auto">
        <div class="container-fluid">
        	<jsp:include page="../commons/header.jsp"></jsp:include>
            <div class="row"> 여기는 오더 요청 페이지 입니다.
                <div class="col">
                	<!-- 누구에게 어떤 카테고리의 스타일을 요청하는지 확인 문구 -->
                	<div class="row">
                		<div class="col">
                			<h4>"${memberVo.member_nick}" 님에게 </h4>
                			<h4>"스타일 카테고리" 스타일을 요청합니다 !</h4>
                		</div>
                	</div>
                	<!-- 스타일리스트 프로필사진//스타일리스트 닉네임/카테고리/태그 -->
                	<div class="row">
                		<div class = "col text-center">
							<c:choose>
                				<c:when test="${memberVo.member_profileimage_link == null}">
	                				<img id = "mainPageProfileImg" class="img-fluid center-block" src="../resources/img/noneProfileImg.jpg">
                				</c:when>
                				<c:otherwise>
                					<img id = "mainPageProfileImg" class="img-fluid center-block" src="/uploadFiles/${memberVo.member_profileimage_link}">
                				</c:otherwise>
               				</c:choose>
						</div>
						<div class="col-6">
							<div class="row">
								<div class="col">
									<span> 태그(추가예정) </span>
								</div>
								<div class="col">
									<span> 태그(추가예정) </span>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<span> 요청 비용 </span>										
								</div>
								<div class="col">
									<span>${stylist_CardVo.stylist_card_price }</span>										
								</div>
							</div>
						</div>
					</div>
                	<form action="./paymentPage?stylist_card_no=${stylist_CardVo.stylist_card_no }" method="post">
	                	<!-- 유저 스펙 -->
	                	<div class="row">
	                		<div class = "col-6 text-center">
		                		<img class="img-fluid center-block" src="../resources/img/orderSize.jpg">
							</div>
							<div class="col-6">
								<div class="row">
									<div class="col">
										<div class="input-group mb-3">
									  		<span class="input-group-text" id="inputGroup-sizing-default"> 신장 </span>
										  	<input name = "order_heigth" type="text" class="form-control" aria-label="Sizing example input" 
										  		aria-describedby="inputGroup-sizing-default" value="${sessionUserInfo.user_heigth }">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<div class="input-group mb-3">
									  		<span class="input-group-text" id="inputGroup-sizing-default"> 체중 </span>
										  	<input name = "order_weight" type="text" class="form-control" aria-label="Sizing example input" 
										  		aria-describedby="inputGroup-sizing-default" value="${sessionUserInfo.user_weight }">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<div class="input-group mb-3">
									  		<span class="input-group-text" id="inputGroup-sizing-default"> 상의 </span>
										  	<input name = "order_top" type="text" class="form-control" aria-label="Sizing example input" 
										  		aria-describedby="inputGroup-sizing-default" value="${sessionUserInfo.user_top }"> 
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<div class="input-group mb-3">
									  		<span class="input-group-text" id="inputGroup-sizing-default"> 하의 </span>
										  	<input name = "order_bottom" type="text" class="form-control" aria-label="Sizing example input" 
										  		aria-describedby="inputGroup-sizing-default" value="${sessionUserInfo.user_bottom }"> 
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<div class="input-group mb-3">
									  		<span class="input-group-text" id="inputGroup-sizing-default"> 신발 </span>
										  	<input name = "order_shoes" type="text" class="form-control" aria-label="Sizing example input" 
										  		aria-describedby="inputGroup-sizing-default" value = "${sessionUserInfo.user_shoes }">
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 요청사항 기재 -->
	                	<div class="row">
	                		<div class="col">
	                			<div class="form-floating">
								  <textarea name = "order_content" class="form-control" 
								  			placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
								  <label for="floatingTextarea2">요청사항</label>
								</div>
	                		</div>
	                	</div>
						<!-- 요청 사항 파일첨부 -->
	                	<div class="row">
	                		<div class="col">
	                			요청사항 파일첨부 추후 구현 예정
	                		</div>
	                	</div>
						<!-- 취소/완료 버튼 -->
	                	<div class="row">
	                		<!-- 공란 -->
	                		<div class="col-7">
	                		</div>
	                		<!-- 취소 -->
	                		<div class="col d-grid">
	                			<a href="../member/readStylistCard?stylist_card_no=${stylist_CardVo.stylist_card_no }" class="btn btn-success"> 취소 </a>
	                		</div>
	                		<!-- 완료 -->
	                		<div class="col d-grid">
	                			<input type="hidden" name="stylist_card_no" value="${stylist_CardVo.stylist_card_no }">
	                			<input type="hidden" name="order_saleprice" value="${stylist_CardVo.stylist_card_price }">
	                			<button class="btn btn-success"> 결제확인 </button>
	                		</div>
	                	</div>
                	</form>
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