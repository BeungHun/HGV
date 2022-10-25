<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
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
	<link rel="stylesheet" href="../resources/css/starRating.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/common.css">
     
    <style>
         #logo_img{
        	height: 100px;
            width: 160px;
            object-fit: cover;
		}
		
		#detailPageProfileImg{
			height: 600px;
            width: 400px;
            object-fit: cover;  
            margin: auto 0;       
		}


    </style>
    <!-- Jquery 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
		var memberNo = 0;
		var userNo = 0;
		var stylistNo = 0;
		var stylistCardNo = ${stylist_CardVo.stylist_card_no};
    
		// 페이지 로드시 회원 번호 가져오기.
		function getMemberNo(){
			var xhr = new XMLHttpRequest(); //AJAX 객체 생성
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
					
					if(jsonObj.result == 'success'){
						memberNo = jsonObj.member_no;
						userNo = jsonObj.member_no;
						stylistNo = jsonObj.member_no;
					}
				}
			}
			xhr.open("get" , "../member/getMemberNo"); //리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
			xhr.send(); //AJAX로 리퀘스트함..
		}
    
    
		//찜하기 Onclick Funtion 
		function doLikeCard(){
			
			if(memberNo == 0){
				var result = confirm("로그인 후 이용가능합니다. 로그인 하시겠습니까?");
				if(result == true) location.href = "../member/loginPage";
				return;
			}
			
			var xhr = new XMLHttpRequest(); //AJAX 객체 생성
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
					refreshUserCardLike();
					totalCardLike();
					
				}
			}
			xhr.open("post" , "../user/doLikeCard"); //리퀘스트 세팅..
			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
			xhr.send("stylist_card_no=" + stylistCardNo); //AJAX로 리퀘스트함..
		}
		
		
		//찜하기 여부 출력
		function refreshUserCardLike(){
			
			var xhr = new XMLHttpRequest(); //AJAX 객체 생성
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
					
					var cardlikeBox = document.getElementById("likeStylistCard");
					if (jsonObj.data == true){
						cardlikeBox.setAttribute("class", "bi bi-postcard-heart-fill text-danger");
					}else{
						cardlikeBox.setAttribute("class", "bi bi-postcard-heart text-danger");
					}
				}
			}
			xhr.open("post" , "../stylist/chkUserCardLike"); //리퀘스트 세팅..
			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
			xhr.send("stylist_card_no=" + stylistCardNo); //AJAX로 리퀘스트함..
		}
		
		
		//토탈 찜 횟수 출력
		function totalCardLike(){
			
			var xhr = new XMLHttpRequest(); //AJAX 객체 생성
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
					
					var totalLikeCountBox = document.getElementById("totalLikeCountBox");
					totalLikeCountBox.innerText = "";
					totalLikeCountBox.innerText = jsonObj.data;
				}
			}
			xhr.open("get" , "../stylist/totalCardLike?stylist_card_no=" + stylistCardNo); //리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
			xhr.send(); //AJAX로 리퀘스트함..
		}
		
		
		
		//답정너 - 가져가 붙이면됨..
		function templeteAjax(){
			
			var xhr = new XMLHttpRequest(); //AJAX 객체 생성
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				}
			}
			xhr.open("get" , "../testapi/test5"); //리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
			xhr.send(); //AJAX로 리퀘스트함..
		}
		
		
		window.addEventListener("DOMContentLoaded" , function (){
			//사실상 처음 실행하는 코드 모음...
			getMemberNo();
			refreshUserCardLike();
			totalCardLike();
			
			/* 
			refreshTotalCount();
			refreshCommentList();
			 */
			//setInterval(refreshCommentList , 3000); //폴링 방식의 실시간... 화면 갱신...
		});
    </script>
</head>

<body>
    <div style="width : 1200px; margin: 0 auto">
        <div class="container-fluid">
        	<jsp:include page="../commons/header.jsp"></jsp:include>
            <div class="row">
                <div class="col-10">여기는 스타일리스트 카드 작성/수정 페이지 입니다.
                	<!-- 타이틀 -->
                	<div class="row">
                		<div class="col">
	                		스타일리스트 카드 상세페이지
                		</div>
                	</div>
                	<!-- 스타일리스트 카드 -->
                	<div class="row">
                		<div class="col">
                			<!-- 스타일 카테고리/별점/찜 받은 횟수/목록버튼 -->
                			<div class="row">
		                		<div class="col">
		                			<span>스타일 카테고리</span>
		                		</div>
		                		<div class="col">
		                			<div class="row">
		                				<c:forEach items="#">
			                				<div class="col">
				                				<span>카테고리</span>
			                				</div>
		                				</c:forEach>
		                			</div>
		                		</div>
		                		<!-- 공란 -->
		                		<div class="col">
		                			별점
		                		</div>
		                		<div class="col">
		                			<span>찜 횟수 :  </span><span id="totalLikeCountBox"></span>
		                		</div>
		                		<div class="col d-grid">
		                			<i id="likeStylistCard" class="bi bi-postcard-heart text-danger" onclick="doLikeCard()"></i>
		                		</div>
		                	</div>
                		</div>
                	</div>
                	<div class="row">
                		<div class = "col">
                			<div class= "row">
                				<div class = "col">
		                			<span>${stylist_CardVo.stylist_card_subtitle }</span>
                				</div>
                			</div>
                			<div class= "row">
		                		<div class = "col text-center">
									<c:choose>
		                				<c:when test="${memberVo.member_profileimage_link == null}">
			                				<img id = "detailPageProfileImg" class="img-fluid center-block" src="../resources/img/noneProfileImg.jpg">
		                				</c:when>
		                				<c:otherwise>
		                					<img id = "detailPageProfileImg" class="img-fluid center-block" src="/uploadFiles/${memberVo.member_profileimage_link}">
		                				</c:otherwise>
		               				</c:choose>
								</div>
                			</div>
                		</div>
						<div class="col">
							<!-- 컨텐트 -->
							<div class="row">
								<div class="col">
									${stylist_CardVo.stylist_card_content }
								</div>
							</div>
							<!-- 태그 -->
							<div class="row">
								<div class="col">
									태그들
								</div>
							</div>
							<!-- 가격정보 -->
							<div class="row">
								<div class="col">
									${stylist_CardVo.stylist_card_price }
								</div>
							</div>
						</div>
                	</div>
					<!-- 스타일링 요청하기/수정하기 -->
					<div class="row">
						<div class="col-6">
						</div>
						<div class="col-6 d-grid">
							<c:choose>
                				<c:when test="${!empty sessionStylistInfo && stylist_CardVo.stylist_no == sessionStylistInfo.stylist_no }">
                				<div class="d-grid">
                					<a class="btn btn-success">카드 수정하기</a>
                					<a href="../stylist/myPage" class="btn btn-success">이전페이지</a>
                				</div>
                				</c:when>
                				<c:when test="${!empty sessionStylistInfo && stylist_CardVo.stylist_no != sessionStylistInfo.stylist_no }">
                				<div class="d-grid">
                					<a href="../member/mainPage" class="btn btn-success">이전페이지</a>
                				</div>
                				</c:when>
                				<c:when test="${!empty sessionUserInfo}">
                					<form action="../user/orderPage?stylist_card_no=${stylist_CardVo.stylist_card_no }" method="post">
                						<input type="hidden" name="stylist_card_no" value="${stylist_CardVo.stylist_card_no }">
                						<div class = "row">
	                						<div class="col d-grid">
	                							<button class="btn btn-success">스타일링 요청하기</button>
	                						</div>
	                						<div class="col d-grid">
					                			<c:choose>
					                				<c:when test="${!empty sessionMemberInfo }">
							                			<a href="../member/mainPage" class="btn btn-success">이전페이지</a>
					                				</c:when>
					                				<c:otherwise>
							                			<a href="./index" class="btn btn-success">이전페이지</a>
					                				</c:otherwise>
					                			</c:choose>
				                			</div>
			                			</div>
                					</form>
                				</c:when>
                				<c:otherwise>
                					<a href="./loginPage" class="btn btn-success">스타일링 요청하기</a>
                				</c:otherwise>
                			</c:choose>
						</div>
					</div>
                	<!-- 스타일리스트 코디 사진 -->
                	<div class="row">
                	</div>
		           	<!-- 스타일리스트 리뷰 및 평점 -->
		           	<div class="row border">
		           		<div class="col-2 border text-center">
		       				<h6> 닉네임 </h6>
		       			</div>
		       			<div class="col-6 border text-center">
		       				<h6> 내용 </h6>
		       			</div>
		       			<div class="col-2 border text-center">
		       				<h6> 별점 </h6>
		       			</div>
		       			<div class="col-2 border text-center">
		       				<h6> 날짜 </h6>
		       			</div>
		       		</div>
		         	<c:forEach items="${reviewList }" var="list">
		       			<div class="row border">
		           			<div class="col-2 border text-center">
		           				<span>${list.memberVo.member_nick}</span>
		           			</div>
		           			<div class="col-6 border text-center">
		           				<span>${list.styling_ReviewVo.styling_review_content}</span>
		           			</div>
		           			<div class="col-2 border text-center">
		           				<c:choose>
		           					<c:when test="${list.styling_ReviewVo.styling_review_starRatring == 0}">
		           						<i class="bi bi-star"></i>
		           						<i class="bi bi-star"></i>
		           						<i class="bi bi-star"></i>
		           						<i class="bi bi-star"></i>
		           						<i class="bi bi-star"></i>
		           					</c:when>
		           					<c:when test="${list.styling_ReviewVo.styling_review_starRatring == 1}">
		           						<i class="bi bi-star-fill"></i>
		           						<i class="bi bi-star"></i>
		           						<i class="bi bi-star"></i>
		           						<i class="bi bi-star"></i>
		           						<i class="bi bi-star"></i>
		           					</c:when>
		           					<c:when test="${list.styling_ReviewVo.styling_review_starRatring == 2}">
		           						<i class="bi bi-star-fill"></i>
		           						<i class="bi bi-star-fill"></i>
		           						<i class="bi bi-star"></i>
		           						<i class="bi bi-star"></i>
		           						<i class="bi bi-star"></i>
		           					</c:when>
		           					<c:when test="${list.styling_ReviewVo.styling_review_starRatring == 3}">
		           						<i class="bi bi-star-fill"></i>
		           						<i class="bi bi-star-fill"></i>
		           						<i class="bi bi-star-fill"></i>
		           						<i class="bi bi-star"></i>
		           						<i class="bi bi-star"></i>
		           					</c:when>
		           					<c:when test="${list.styling_ReviewVo.styling_review_starRatring == 4}">
		           						<i class="bi bi-star-fill"></i>
		           						<i class="bi bi-star-fill"></i>
		           						<i class="bi bi-star-fill"></i>
		           						<i class="bi bi-star-fill"></i>
		           						<i class="bi bi-star"></i>
		           					</c:when>
		           					<c:when test="${list.styling_ReviewVo.styling_review_starRatring == 5}">
		           						<i class="bi bi-star-fill"></i>
		           						<i class="bi bi-star-fill"></i>
		           						<i class="bi bi-star-fill"></i>
		           						<i class="bi bi-star-fill"></i>
		           						<i class="bi bi-star-fill"></i>
		           					</c:when>
		           					<c:otherwise>
		           						에러
									</c:otherwise>           						
		           				</c:choose>
		           			</div>
		           			<div class="col-2 border text-center">
		           				<span><fmt:formatDate value="${list.styling_ReviewVo.styling_review_date}" pattern="yy.MM.dd"/></span>
		           			</div>
		           		</div>
		           	</c:forEach>
                </div>
                <!-- ad 영역 -->
                <div class="col-2">ad 영역 ..?
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