<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
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
    <!-- Jquery 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <!-- 썸머노트 : 글쓰기지원 API -->
    <script src="../resources/js/summernote/summernote-lite.js"></script>
    <script src="../resources/js/summernote/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="../resources/css/summernote/summernote-lite.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

    <!-- 외부 css 로드  -->
    <link rel="stylesheet" type="text/css" href="../resources/css/commons.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/mainPage.css">
     
    <style>
/*     	body { */
/*             background-image: linear-gradient( */
/*                 rgba(0, 0, 0, 0.8), */
/*                 rgba(0, 0, 0, 0.8) */
/*                 ), url("../resources/img/projectimg(1).png"); */
/*             background-size: cover; */
/*         } */

		.star-rating {
            display: flex;
            flex-direction: row-reverse;
            font-size: 2.25rem;
            line-height: 2.5rem;
            justify-content: space-around;
            padding: 0 0.2em;
            text-align: center;
            width: 5em;
        }
        
        .star-rating input {
            display: none;
        }
        
        .star-rating label {
            -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
            -webkit-text-stroke-width: 2.3px;
            -webkit-text-stroke-color: #2b2a29;
            cursor: pointer;
        }
        
        .star-rating :checked ~ label {
            -webkit-text-fill-color: gold;
        }
        
        .star-rating label:hover,
        .star-rating label:hover ~ label {
            -webkit-text-fill-color: #fff58c;
        }
        
        
        

    </style>
    <!-- 외부 script 로드  -->
    <script src="../resources/js/main.js"></script>
    <script src="../resources/js/mainPage.js"></script>
    <script type="text/javascript">
    	
    	
    	
    	//썸머노트 사용
    	function summernoteSetting(){
	    	$('.summernote').summernote({
		  		height: 300,                 // 에디터 높이
		  		minHeight: 200,             // 최소 높이
		  		maxHeight: 400,             // 최대 높이
		  		focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  		lang: "ko-KR",					// 한글 설정
		  		placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	              
	    	});
    	};
    	
    	
    	
		//찜하기 여부 출력
		function refreshUserCardLike(){
			if(memberNo == 0 || userNo == 0 ) return;
			var cardNums = new Array();
			
			<c:forEach items="${cardList}" var="list">
            	cardNums.push(${list.stylist_CardVo.stylist_card_no});
	        </c:forEach>
	        
	        for(cardNum of cardNums){
	            var xhr = new XMLHttpRequest(); //AJAX 객체 생성
	            xhr.onreadystatechange = function () {
	                if(xhr.readyState == 4 && xhr.status == 200){
	                    var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
	                    
	                    var stylistCardBox = document.getElementById("stylistCard_"+cardNum);
	                    var cardModalBox = document.getElementById("cardModal_"+cardNum);
	                    
	                    var cardLikeBox = stylistCardBox.getElementsByClassName('likeStylistCard');
	                    var cardModalLikeBox = cardModalBox.getElementsByClassName('likeStylistCard');
	                    
	                    for(i of cardLikeBox){
	                        if (jsonObj.data == true){
	                            i.setAttribute("class", "likeStylistCard bi bi-postcard-heart-fill text-danger");
	                        }else{
	                            i.setAttribute("class", "likeStylistCard bi bi-postcard-heart text-danger");
	                        }
	                    }
	                    
	                    for(i of cardModalLikeBox){
	                        if (jsonObj.data == true){
	                            i.setAttribute("class", "likeStylistCard bi bi-postcard-heart-fill text-danger");
	                        }else{
	                            i.setAttribute("class", "likeStylistCard bi bi-postcard-heart text-danger");
	                        }
	                    }
	                }
	            }
	            xhr.open("post" , "../stylist/chkUserCardLike",false); //리퀘스트 세팅..
	            xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
	            xhr.send("stylist_card_no=" + cardNum); //AJAX로 리퀘스트함..
	        }
		}
		
		//토탈 찜 횟수 출력
		function totalCardLike(){
			var cardNums = new Array();
			<c:forEach items="${cardList}" var="list">
            	cardNums.push(${list.stylist_CardVo.stylist_card_no});
	        </c:forEach>
	        for(cardNum of cardNums){
	            var xhr = new XMLHttpRequest(); //AJAX 객체 생성
	            xhr.onreadystatechange = function () {
	                if(xhr.readyState == 4 && xhr.status == 200){
	                    var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
	                    
	                    var stylistCardBox = document.getElementById("stylistCard_"+cardNum);
	                    var cardLikeBox = stylistCardBox.getElementsByClassName('likeStylistCard');
	                    var totalLikeCountBox = stylistCardBox.getElementsByClassName("totalLikeCountBox");
						
						for(i of totalLikeCountBox){
							i.innerText = "";
							i.innerText = jsonObj.data;
						}
	                }
	            }
	            xhr.open("get" , "../stylist/totalCardLike?stylist_card_no=" + cardNum, false); //리퀘스트 세팅..
				//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
				xhr.send(); //AJAX로 리퀘스트함..
	        }
		}
		
	 	// AJAX 시작
	    var memberNo = 0;
		var userNo = 0;
		var stylistNo = 0;
		
	    
	    // 페이지 로드시 회원 번호 가져오기.
		function getMemberNo(){
			var xhr = new XMLHttpRequest(); //AJAX 객체 생성
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
					
					if(jsonObj.result == 'success'){
						memberNo = jsonObj.member_no;
						userNo = jsonObj.user_no;
						stylistNo = jsonObj.stylist_no;
					}
					refreshUserCardLike();
					totalCardLike();
					
				}
			}
			xhr.open("get" , "../member/getMemberNo"); //리퀘스트 세팅..
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
		
	    //Body 로딩 후 실행될 코드 모음
	    window.addEventListener("DOMContentLoaded" , function(){
	        changeMoneyUnit();
 	        modalBoxImgHeight();
	        getMemberNo();
	        summernoteSetting();
	        multipleImageEventSet();
	        
	    });
    </script>
</head>

<body>
    <div style="width : 1200px; margin: 0 auto; background-color:#fff;">
        <div class="container-fluid">
        	<jsp:include page="../commons/header.jsp"></jsp:include>
        	<div class="row main_content" style="border:none; margin-top:1em;">
        		<div class="col">
		            <c:choose>
						<c:when test="${!empty stylist_CardVo && !empty sessionStylistInfo}">
							<div class="row">
								<div class="col">
									<!-- 메인페이지 개인 영역 -->
									<div class="row" style="border:4px solid gray; border-radius:10px;">
										<!-- 스타일리스트 카드 -->
										<c:forEach items="${cardList }" var="list" varStatus="status">
											<c:if test="${list.memberVo.member_no == sessionMemberInfo.member_no }">
							            		<div class="col-3 my-3">
								                    <figure id="stylistCard_${list.stylist_CardVo.stylist_card_no }" class="mouseOverBox modalBox" data-bs-toggle="modal" data-bs-target="#cardModal_${list.stylist_CardVo.stylist_card_no }" onclick="carouseBoxImgHeight('cardModal_${list.stylist_CardVo.stylist_card_no }'), callReview(${list.stylist_CardVo.stylist_card_no })">
								                        <!-- 카테고리 -->
								                        <div class="row">
								                        	<c:forEach items="${list.categoryList }" var="categoryList">
									                            <div class="col-4">
									                                <span>${categoryList.card_CategoryVo.card_category_name }</span>
									                            </div>
								                        	</c:forEach>
								                        </div>
								                        <!-- 사진 및 프로필 -->
								                        <div class="row">
								                            <div class="col modal_imageBox">
								                                <c:choose>
									                                <c:when test="${list.memberVo.member_profileimage_link == null}">
									                                    <img class="modal_mainPageImg" src="../resources/img/comming.jpg">
									                                </c:when>
									                                <c:otherwise>
									                                    <img class="modal_mainPageImg" src="/uploadFiles/${list.memberVo.member_profileimage_link}">
									                                </c:otherwise>
								                               	</c:choose>
								                            </div>
								                        </div>
								                        <div class = "row">
								                            <!-- 닉네임/북마크/별점 -->
								                            <div class="col-5">
								                                <div class="row">
								                                    <!-- 닉네임 -->
								                                    <div class="col">
								                                        <span>${list.memberVo.member_nick }</span>
								                                    </div>
								                                </div>
								                                <div class="row">
								                                    <!-- 북마크 -->
								                                    <div class="col text-danger">
								                                        <i onclick="doLikeCard(${list.stylist_CardVo.stylist_card_no })" class="likeStylistCard bi bi-postcard-heart"></i> 
								                                        <span class = "totalLikeCountBox"> ${list.bookMarkCount }</span>
								                                    </div>
								                                </div>
								                                <!-- 별점 -->
								                                <div class="row">
								                                    <div class="col">
								                                        <div class="starRatingBox">
								                                            <!-- *20% 곱해야함 -->
								                                            <div class="starRatingFill" style=" width: ${list.totalRatingPersent}% ">  
								                                                <span>★★★★★</span>
								                                            </div>
								                                            <div class="starRatingEmpty">
								                                                <span>★★★★★</span>
								                                            </div>
								                                        </div>
								                                    </div>
								                                </div>
								                            </div>
								                            <!-- 가격 -->
								                            <div class="col text-center align-self-center">
								                                <h4 class="money">${list.stylist_CardVo.stylist_card_price }</h4>
								                            </div>
								                        </div>
								                        <!-- 마우스 오버시 나오는 창 -->
								                        <figcaption>
								                            <div class="row container-fluid">
								                                <div class="col">
								                                    <!-- CardSubTitle -->
								                                    <div class="row">
								                                        <div class="col">
								                                            <h3> ${list.stylist_CardVo.stylist_card_subtitle } </h3>
								                                        </div>
								                                    </div>
								                                    <!-- CardContent -->
								                                    <div class="row">
								                                        <div class="col">
								                                            <p> ${list.stylist_CardVo.stylist_card_content }</p>
								                                        </div>
								                                    </div>
								                                    <!-- footer :: 찜하기랑 아이콘-->
								                                    <div class="row">
								                                        <div class="col">
								                                            <i class="bi bi-arrow-right-circle"></i>
								                                        </div>
								                                    </div>
								                                </div>
								                            </div>
								                        </figcaption>
								                    </figure>
								                </div>
											</c:if>
						            	</c:forEach>
										
						                <!-- Cards -->
						                <div class="col m-3">
						                    <!-- 1층 3개  -->
						                    <div class="row h-50">
						                        <!-- STORE -->
						                        <div class="col card m-3 position-relative" data-bs-toggle="modal" data-bs-target="#storeModal">
						                        	<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
													    <span>99+</span>
													</span>
						                            <div class="row h-100">
						                                <div class="col align-self-center text-center">
						                                    <h1 class="display-3">
						                                        <i class="bi bi-shop"></i>
						                                    </h1>
						                                </div>
						                                <div class="col align-self-center ">
						                                    <span class="fs-6"> STORE </span>
						                                </div>
						                            </div>
						                        </div>
						                        <!-- RANDOM BOX -->
						                        <div class="col card m-3 position-relative" data-bs-toggle="modal" data-bs-target="#randomBoxModal">
						                        	<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
													    <span>99+</span>
													</span>
						                            <div class="row h-100" onclick = "location.href='../randomBox/randomBoxListTotal'">
						                                <div class="col align-self-center text-center">
						                                    <h1 class="display-3">
						                                    	<i class="bi bi-gift"></i>
						                                    </h1>
						                                </div>
						                                <div class="col align-self-center">
						                                    <span class="fs-6"> RANDOM </span>
						                                    <span class="fs-6"> BOX </span>
						                                </div>
						                            </div>
						                        </div>
						                        <!-- BLOG -->
						                        <div class="col card m-3 position-relative">
						                        	<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
													    <span>99+</span>
													</span>
						                            <div class="row h-100">
						                                <div class="col align-self-center text-center">
						                                    <h1 class="display-3">
						                                    	<i class="bi bi-instagram"></i>
						                                    </h1>
						                                </div>
						                                <div class="col align-self-center">
						                                    <span class="fs-6"> BLOG </span>
						                                </div>
						                            </div>
						                        </div>
						                    </div>
						                    <!-- 2층 3개  -->
						                    <div class="row h-50">
						                        <div class="col card m-3 position-relative">
						                        	<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
													    <span>99+</span>
													</span>
						                            <div class="row h-100">
						                                <div class="col align-self-center text-center">
						                                    <h1 class="display-3">
						                                        <i class="bi bi-card-list"></i>
						                                    </h1>
						                                </div>
						                                <div class="col align-self-center">
						                                    <span class="fs-6"> FREE &nbsp;&nbsp;&nbsp;</span>
						                                    <span class="fs-6"> BOARD </span>
						                                </div>
						                            </div>
						                        </div>
						                        <div class="col card m-3 position-relative">
						                        	<span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle">
													</span>
						                            <div class="row h-100">
						                                <div class="col align-self-center text-center">
						                                    <h1 class="display-3">
						                                        <i class="bi bi-cash-coin"></i>
						                                    </h1>
						                                </div>
						                                <div class="col align-self-center">
						                                    <span class="fs-6"> CASH </span>
						                                </div>
						                            </div>
						                        </div>
						                        <div class="col card m-3 position-relative">
						                        	<span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle">
													</span>
						                            <div class="row h-100">
						                                <div class="col align-self-center text-center">
						                                    <h1 class="display-3">
						                                        <i class="bi bi-flag"></i>
						                                    </h1>
						                                </div>
						                                <div class="col align-self-center">
						                                    <span class="fs-6"> REPORT </span>
						                                </div>
						                            </div>
						                        </div>
						                    </div>
						                </div>
									</div>
								</div>
		               		</div>
						</c:when>
						<c:when test="${!empty sessionStylistInfo}">
							<div class="row">
								<div class="col">
									<!-- 타이틀 영역 -->
									<div class="row">
										<div class="col">
					               			<h4></h4>
										</div>
									</div>
									<!-- 메인페이지 개인 영역 -->
									<div class="row text-center justify-content-center">
										<!-- 카드 만들기 바로가기 -->
										<div class="col-3">
											현재 카드가 없어요!!<br> 
											<a href="../stylist/createStylistCard" class="btn btn-success"> 카드 만들기 </a> 
										</div>
									</div>
								</div>
							</div>
						</c:when>
						<c:when test="${!empty sessionUserInfo}">
							<!-- User MainPage -->
							<div class="row">
								<div class="col">
									<!-- 현재 받은 스타일링 -->
									<div class="row" style="border:4px solid gray; border-radius:10px;">
										<div class="col-3 my-3 modalBox ms-3">
					                        <!-- 사진 및 프로필 -->
					                        <div class="row ">
					                            <div class="col modal_imageBox">
					                                <c:choose>
						                                <c:when test="${sessionMemberInfo.member_profileimage_link == null}">
						                                    <img class="modal_mainPageImg" src="../resources/img/profile.jpg">
						                                </c:when>
						                                <c:otherwise>
						                                    <img class="modal_mainPageImg" src="/uploadFiles/${sessionMemberInfo.member_profileimage_link}">
						                                </c:otherwise>
					                               	</c:choose>
					                            </div>
					                        </div>
					                        <div class = "row">
					                            <!-- 닉네임/북마크/별점 -->
					                            <div class="col">
					                                <div class="row">
					                                    <!-- 닉네임 -->
					                                    <div class="col" style="font-size:1.2em; font-weight:bold; padding-left: 65px; padding-top:5px;">
					                                        <i class="bi bi-person-fill"></i>&nbsp;<span>${sessionMemberInfo.member_nick }</span>
					                                    </div>
					                                </div>
					                            </div>
					                        </div>
					                        <div class="row">
					                        	<!-- 가격 -->
					                            <div class="col align-self-center" style="font-size:1.2em; font-weight:bold; padding-top:5px; padding-left: 65px;">
					                               <i class="bi bi-cash-stack"></i>&nbsp;<span class="money"> ${sessionMemberInfo.member_cash }</span>
					                            </div>
					                        </div>
						                </div>
										<!-- Cards -->
						                <div class="col m-3">
						                    <!-- 1층 3개  -->
						                    <div class="row h-50">
						                        <!-- STORE -->
						                        <div class="col card m-3 position-relative" data-bs-toggle="modal" data-bs-target="#storeModal">
						                        	<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
													    <span>99+</span>
													</span>
						                            <div class="row h-100">
						                                <div class="col align-self-center text-center">
						                                    <h1 class="display-3">
						                                        <i class="bi bi-shop"></i>
						                                    </h1>
						                                </div>
						                                <div class="col align-self-center ">
						                                    <span class="fs-6"> STORE </span>
						                                </div>
						                            </div>
						                        </div>
						                        <!-- RANDOM BOX -->
						                        <div class="col card m-3 position-relative">
						                        	<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
													    <span>99+</span>
													</span>
						                            <div class="row h-100" onclick = "location.href='../randomBox/randomBoxListTotal'">
						                                <div class="col align-self-center text-center">
						                                    <h1 class="display-3">
						                                    	<i class="bi bi-gift"></i>
						                                    </h1>
						                                </div>
						                                <div class="col align-self-center">
						                                    <span class="fs-6"> RANDOM </span>
						                                    <span class="fs-6"> BOX </span>
						                                </div>
						                            </div>
						                        </div>
						                        <!-- BLOG -->
						                        <div class="col card m-3 position-relative">
						                        	<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
													    <span>99+</span>
													</span>
						                            <div class="row h-100">
						                                <div class="col align-self-center text-center">
						                                    <h1 class="display-3">
						                                    	<i class="bi bi-instagram"></i>
						                                    </h1>
						                                </div>
						                                <div class="col align-self-center">
						                                    <span class="fs-6"> BLOG </span>
						                                </div>
						                            </div>
						                        </div>
						                    </div>
						                    <!-- 2층 3개  -->
						                    <div class="row h-50">
						                        <div class="col card m-3 position-relative">
						                        	<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
													    <span>99+</span>
													</span>
						                            <div class="row h-100">
						                                <div class="col align-self-center text-center">
						                                    <h1 class="display-3">
						                                        <i class="bi bi-card-list"></i>
						                                    </h1>
						                                </div>
						                                <div class="col align-self-center">
						                                    <span class="fs-6"> FREE &nbsp;&nbsp;&nbsp;</span>
						                                    <span class="fs-6"> BOARD </span>
						                                </div>
						                            </div>
						                        </div>
						                        <div class="col card m-3 position-relative">
						                        	<span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle">
													</span>
						                            <div class="row h-100">
						                                <div class="col align-self-center text-center">
						                                    <h1 class="display-3">
						                                        <i class="bi bi-cash-coin"></i>
						                                    </h1>
						                                </div>
						                                <div class="col align-self-center">
						                                    <span class="fs-6"> CASH </span>
						                                </div>
						                            </div>
						                        </div>
						                        <div class="col card m-3 position-relative">
						                        	<span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle">
													</span>
						                            <div class="row h-100">
						                                <div class="col align-self-center text-center">
						                                    <h1 class="display-3">
						                                        <i class="bi bi-flag"></i>
						                                    </h1>
						                                </div>
						                                <div class="col align-self-center">
						                                    <span class="fs-6"> REPORT </span>
						                                </div>
						                            </div>
						                        </div>
						                    </div>
						                </div>
									</div>	
								</div>
							</div>
						</c:when>
						<c:otherwise>
						</c:otherwise>	                	
					</c:choose>
					
					<!-- AD -->
		            <div class="row my-4">
		                <div class="col">
		                	<img class="shadow-lg rounded" src="../resources/img/ad/6468799.jpg" style="margin-left: -2%; width: 104%;">
		                </div>
		            </div>
					
					<!-- 소개 -->
					<div class="row">
						<div class="col" style="font-size:2.6em; font-weight:bold">
							<span style="color:#ECDD53">오로지 당신만</span>을 위한 공간
						</div>
					</div>
					<div class="row">
						<div class="col" style="font-size:2em; font-weight:bold">
							스타일링 맞춤<br>스타일리스트를 찾아보세요.
						</div>
					</div>
					
		            <!-- Content Title -->
					<div class="row m-3">
						<div class="col">
							<h4>스타일리스트 목록</h4>
						</div>
						<!-- 드롭다운 1 : 테마 -->
						<div class="col-2 text-center align-self-center">
							<div class="collapse stylistSearchCollapse">
								<span class="col-1 text-center fw-semibold" style="color: #262626;">테마 &nbsp;&nbsp;</span>
								<select name="card_category_no" style="border: 0px; color: #747474; font-size:0.9rem;">
									<option selected="selected">ALL</option>
									<c:forEach items="${categoryList }" var="list">
										<option value="${list.card_category_no }">${list.card_category_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<!-- 드롭다운 2 : 정렬 -->
						<div class="col-2 text-center align-self-center">
							<div class="collapse stylistSearchCollapse">
								<span class="col-1 text-center fw-semibold" style="color: #262626;">정렬 &nbsp;&nbsp;</span>
								<select name="card_category_no" style="border: 0px; color: #747474; font-size:0.9rem;">
									<option selected="selected">추천 순</option>
									<option value="">찜 많은 순</option>
									<option value="">별점 높은 순</option>
									<option value="">높은 가격 순</option>
									<option value="">낮은 가격 순</option>
								</select>
							</div>
						</div>
						<div class="col-2 align-self-center">
							<div class="row justify-content-end">
								<div class="col collapse stylistSearchCollapse px-1">
									<input class="form-control" type="text">
								</div>
								<div class="col-2 text-center px-1">
									<h4>
										<a class="" data-bs-toggle="collapse"
											href=".stylistSearchCollapse" role="button" aria-expanded="false"
											aria-controls="collapseExample"> <i class="bi bi-search"></i> 
										</a>
									</h4>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 스타일리스트 카드들 -->
		            <div class="row">
		            	<c:forEach items="${cardList }" var="list" varStatus="status">
		            		<div class="col-3 my-3">
			                    <figure id="stylistCard_${list.stylist_CardVo.stylist_card_no }" class="mouseOverBox modalBox" data-bs-toggle="modal" data-bs-target="#cardModal_${list.stylist_CardVo.stylist_card_no }" onclick="carouseBoxImgHeight('cardModal_${list.stylist_CardVo.stylist_card_no }'), callReview(${list.stylist_CardVo.stylist_card_no })">
			                        <!-- 카테고리 -->
			                        <div class="row">
			                        	<c:forEach items="${list.categoryList }" var="categoryList">
				                            <div class="col-4">
				                                <span>${categoryList.card_CategoryVo.card_category_name }</span>
				                            </div>
			                        	</c:forEach>
			                        </div>
			                        <!-- 사진 및 프로필 -->
			                        <div class="row">
			                            <div class="col modal_imageBox">
			                                <c:choose>
				                                <c:when test="${list.memberVo.member_profileimage_link == null}">
				                                    <img class="modal_mainPageImg" src="../resources/img/noneProfileImg.jpg">
				                                </c:when>
				                                <c:otherwise>
				                                    <img class="modal_mainPageImg" src="/uploadFiles/${list.memberVo.member_profileimage_link}">
				                                </c:otherwise>
			                               	</c:choose>
			                            </div>
			                        </div>
			                        <div class = "row">
			                            <!-- 닉네임/북마크/별점 -->
			                            <div class="col-5">
			                                <div class="row">
			                                    <!-- 닉네임 -->
			                                    <div class="col">
			                                        <span> ${list.memberVo.member_nick}</span>
			                                    </div>
			                                </div>
			                                <div class="row">
			                                    <!-- 북마크 -->
			                                    <div class="col text-danger">
			                                        <i onclick="doLikeCard(${list.stylist_CardVo.stylist_card_no })" class="likeStylistCard bi bi-postcard-heart"></i> 
			                                        <span class = "totalLikeCountBox"> ${list.bookMarkCount }</span>
			                                    </div>
			                                </div>
			                                <!-- 별점 -->
			                                <div class="row">
			                                    <div class="col">
			                                        <div class="starRatingBox">
			                                            <!-- *20% 곱해야함 -->
			                                            <div class="starRatingFill" style=" width: ${list.totalRatingPersent}% ">  
			                                                <span>★★★★★</span>
			                                            </div>
			                                            <div class="starRatingEmpty">
			                                                <span>★★★★★</span>
			                                            </div>
			                                        </div>
			                                    </div>
			                                </div>
			                            </div>
			                            <!-- 가격 -->
			                            <div class="col text-center align-self-center">
			                                <h4 class="money">${list.stylist_CardVo.stylist_card_price }</h4>
			                            </div>
			                        </div>
			                        <!-- 마우스 오버시 나오는 창 -->
			                        <figcaption>
			                            <div class="row container-fluid">
			                                <div class="col">
			                                    <!-- CardSubTitle -->
			                                    <div class="row">
			                                        <div class="col">
			                                            <h3> ${list.stylist_CardVo.stylist_card_subtitle } </h3>
			                                        </div>
			                                    </div>
			                                    <!-- CardContent -->
			                                    <div class="row">
			                                        <div class="col">
			                                            <p> ${list.stylist_CardVo.stylist_card_content }</p>
			                                        </div>
			                                    </div>
			                                    <!-- footer :: 찜하기랑 아이콘-->
			                                    <div class="row">
			                                        <div class="col">
			                                            <i class="bi bi-arrow-right-circle"></i>
			                                        </div>
			                                    </div>
			                                </div>
			                            </div>
			                        </figcaption>
			                    </figure>
			                </div>
		            	</c:forEach>
		            </div>
		            <jsp:include page="../commons/footer.jsp"></jsp:include>
		
		            <!-- Modal-->
		            <c:forEach items="${cardList }" var="list" varStatus="status">
			            <div class="modal fade" id="cardModal_${list.stylist_CardVo.stylist_card_no }" tabindex="-1" aria-hidden="true">
			                <div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable">
			                    <div class="modal-content">
			                        <div class="modal-header ms-3">
			                            <div class="col">
			                                <h5 class="modal-title"> ${list.memberVo.member_nick } 님의 카드 상세페이지</h5>
			                            </div>
			                            <!-- 찜 이모티콘 -->
			                            <div class="col-1">
			                                <span><i onclick="doLikeCard(${list.stylist_CardVo.stylist_card_no })" class="likeStylistCard bi bi-postcard-heart"></i></span>
			                            </div>
			                            <!-- 별 이모티콘 -->
			                            <div class="col-1">
			                                <span><i class="bi bi-star-fill"></i></span>
			                                <span><fmt:parseNumber value="${list.totalRating }" pattern="0.0"/></span>
			                            </div>
			                            <!-- 닫기버튼 -->
			                            <div class="col-1 text-center">
			                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			                            </div>
			                        </div>
			                        <div class="modal-body container-md ms-3">
			                            <div class="container-fluid">
			                                <div class="row">
			                                    <div class="col">
			                                        <!-- 스타일리스트 Info -->
			                                        <div class="row">
			                                            <!-- 스타일리스트 프로필 사진/닉네임 -->
			                                            <div class="col gx-5">
			                                                <div class="row my-2">
			                                                    <div class="col-5">
			                                                        <c:choose>
										                                <c:when test="${list.memberVo.member_profileimage_link == null}">
										                                    <img src="../resources/img/noneProfileImg.jpg">
										                                </c:when>
										                                <c:otherwise>
										                                    <img src="/uploadFiles/${list.memberVo.member_profileimage_link}">
										                                </c:otherwise>
									                               	</c:choose>
			                                                    </div>
			                                                    <div class="col align-self-center">
			                                                        <div class="row">
			                                                            <div class="col">
			                                                                <h5> 요청금액 </h5>
			                                                            </div>
			                                                        </div>
			                                                        <div class="row">
			                                                            <div class="col">
			                                                                <h4 class="money">${list.stylist_CardVo.stylist_card_price }</h4>
			                                                            </div>
			                                                        </div>
			                                                    </div>
			                                                </div>
			                                                <div class="row my-4 justify-content-around">
			                                                    <!-- CardSubTitle -->
			                                                    <div class="row my-2">
			                                                        <div class="col">
			                                                            <h3> ${list.stylist_CardVo.stylist_card_subtitle } </h3>
			                                                        </div>
			                                                    </div>
			                                                    <!-- CardContent -->
			                                                    <div class="row">
			                                                        <div class="col">
			                                                            <p> ${list.stylist_CardVo.stylist_card_content }</p>
			                                                        </div>
			                                                    </div>
			                                                    <div class="col-md-auto">
			                                                        <span>#구현대기</span>
			                                                    </div>
			                                                    <div class="col-md-auto">
			                                                        <span>#태그</span>
			                                                    </div>
			                                                    <div class="col-md-auto">
			                                                        <span>#태그</span>
			                                                    </div>
			                                                    <div class="col-md-auto">
			                                                        <span>#태그</span>
			                                                    </div>
			                                                    <div class="col-md-auto">
			                                                        <span>#태그</span>
			                                                    </div>
			                                                    <div class="col-md-auto">
			                                                        <span>#태그</span>
			                                                    </div>
			                                                    <div class="col-md-auto">
			                                                        <span>#태그</span>
			                                                    </div>
			                                                    <div class="col-md-auto">
			                                                        <span>#태그</span>
			                                                    </div>
			                                                    <div class="col-md-auto">
			                                                        <span>#태그</span>
			                                                    </div>
			                                                </div>
			                                            </div>
			                                            <!-- 스타일리스트 카테고리별 사진 -->
			                                            <div class="col-7 gx-5 me-3">
			                                                <!-- 스타일리스트 카테고리 -->
			                                                <div class="row text-center my-2">
			                                                	<c:forEach items="${list.categoryList }" var="categoryList">
										                            <div class="col-4">
										                                <span>${categoryList.card_CategoryVo.card_category_name }</span>
										                            </div>
									                        	</c:forEach>
			                                                </div>
			                                                <!-- 태그별 사진 모음 -->
			                                                <div class="row">
			                                                    <div class="col">
			                                                    	<c:choose>
			                                                    		<c:when test="${list.categoryFileList.size() == 0}" >
																			<img class="img-fluid mx-auto d-block" src="../resources/img/HGV_logo.png">
			                                                    		</c:when>
			                                                    		<c:otherwise>
																			<div class="imageBox_full">
																				<img class="pd-img d-block represImg" src="/uploadFiles/${list.categoryFileList[0].card_category_relate_file_link }">
																			</div>
			                                                    		</c:otherwise>
			                                                    	</c:choose>
																</div>
			                                                </div>
			                                                <div class="row my-2">
			                                                    <div class="col">
			                                                        <!-- Carousel Navigation -->
			                                                        <div id="carouselControls${list.stylist_CardVo.stylist_card_no }" class="carousel carousel-dark slide carousel-thumbs" data-ride="carousel">
		                                                            	<c:choose>
		                                                            		<c:when test="${list.categoryFileList.size() == 0}" >
		                                                            			<div class="carousel-inner">
				                                                                    <div class="row">
					                                                                    <div class="col text-center">
					                                                                    	<span> 참고 이미지가 없습니다 !</span>
					                                                                    </div>
				                                                                    </div>
				                                                                </div>
		                                                            		</c:when>
		                                                            		<c:when test="${list.categoryFileList.size() < 5}" >
					                                                            <div class="carousel-inner">
			                                                                    	<div class="row mx-0">
			                                                                    		<c:forEach items="${list.categoryFileList}" var="fileList">
			                                                                    			<div class="sub-img thumb col-4 col-sm-3 px-1 py-2 selected" onclick="showTargetImg(this, ${status.index});">
					                                                                            <img src="/uploadFiles/${fileList.card_category_relate_file_link}">
					                                                                        </div>
			                                                                    		</c:forEach>
			                                                            			</div>
			                                                            		</div>
		                                                            		</c:when>
		                                                            		
		                                                            		<c:when test="${list.categoryFileList.size() >= 5 && list.categoryFileList.size() < 9}">
		                                                            			<div class="carousel-inner">
			                                                            			<div class="carousel-item active">
				                                                                    	<div class="row mx-0">
				                                                                    		<c:forEach items="${list.categoryFileList}" var="fileList" begin="0" end="3">
				                                                                    			<div class="sub-img thumb col-4 col-sm-3 px-1 py-2 selected" onclick="showTargetImg(this, ${status.index});">
						                                                                            <img src="/uploadFiles/${fileList.card_category_relate_file_link}">
						                                                                        </div>
				                                                                    		</c:forEach>
				                                                            			</div>
			                                                            			</div>
			                                                            			<div class="carousel-item">
			                                                                    		<div class="row mx-0">
		                                                                    				<c:forEach items="${list.categoryFileList}" var="fileList" begin="4" end="7">
				                                                                    			<div class="sub-img thumb col-4 col-sm-3 px-1 py-2 selected" onclick="showTargetImg(this, ${status.index});">
						                                                                            <img src="/uploadFiles/${fileList.card_category_relate_file_link}">
						                                                                        </div>
			                                                                    			</c:forEach>
			                                                                    		</div>
			                                                                		</div>
		                                                                		</div>
					                                                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselControls${list.stylist_CardVo.stylist_card_no }" data-bs-slide="prev">
					                                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					                                                            </button>
					                                                            <button class="carousel-control-next" type="button" data-bs-target="#carouselControls${list.stylist_CardVo.stylist_card_no }" data-bs-slide="next">
					                                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
					                                                            </button>
		                                                            		</c:when>
		                                                            		
		                                                            		<c:when test="${list.categoryFileList.size() >= 9 && list.categoryFileList.size() < 13}">
		                                                            			<div class="carousel-inner">
			                                                            			<div class="carousel-item active">
				                                                                    	<div class="row mx-0">
				                                                                    		<c:forEach items="${list.categoryFileList}" var="fileList" begin="0" end="3">
				                                                                    			<div class="sub-img thumb col-4 col-sm-3 px-1 py-2 selected" onclick="showTargetImg(this, ${status.index});">
						                                                                            <img src="/uploadFiles/${fileList.card_category_relate_file_link}">
						                                                                        </div>
				                                                                    		</c:forEach>
				                                                            			</div>
			                                                            			</div>
			                                                            			<div class="carousel-item">
			                                                                    		<div class="row mx-0">
		                                                                    				<c:forEach items="${list.categoryFileList}" var="fileList" begin="4" end="7">
				                                                                    			<div class="sub-img thumb col-4 col-sm-3 px-1 py-2 selected" onclick="showTargetImg(this, ${status.index});">
						                                                                            <img src="/uploadFiles/${fileList.card_category_relate_file_link}">
						                                                                        </div>
			                                                                    			</c:forEach>
			                                                                    		</div>
			                                                                		</div>
			                                                            			<div class="carousel-item">
			                                                                    		<div class="row mx-0">
		                                                                    				<c:forEach items="${list.categoryFileList}" var="fileList" begin="8" end="11">
				                                                                    			<div class="sub-img thumb col-4 col-sm-3 px-1 py-2 selected" onclick="showTargetImg(this, ${status.index});">
						                                                                            <img src="/uploadFiles/${fileList.card_category_relate_file_link}">
						                                                                        </div>
			                                                                    			</c:forEach>
			                                                                    		</div>
			                                                                		</div>
		                                                                		</div>
					                                                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselControls${list.stylist_CardVo.stylist_card_no }" data-bs-slide="prev">
					                                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					                                                            </button>
					                                                            <button class="carousel-control-next" type="button" data-bs-target="#carouselControls${list.stylist_CardVo.stylist_card_no }" data-bs-slide="next">
					                                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
					                                                            </button>
		                                                            		</c:when>
		                                                            		
		                                                            		<c:when test="${list.categoryFileList.size() >= 13 && list.categoryFileList.size() < 17}">
		                                                            			<div class="carousel-inner">
			                                                            			<div class="carousel-item active">
				                                                                    	<div class="row mx-0">
				                                                                    		<c:forEach items="${list.categoryFileList}" var="fileList" begin="0" end="3">
				                                                                    			<div class="sub-img thumb col-4 col-sm-3 px-1 py-2 selected" onclick="showTargetImg(this, ${status.index});">
						                                                                            <img src="/uploadFiles/${fileList.card_category_relate_file_link}">
						                                                                        </div>
				                                                                    		</c:forEach>
				                                                            			</div>
			                                                            			</div>
			                                                            			<div class="carousel-item">
			                                                                    		<div class="row mx-0">
		                                                                    				<c:forEach items="${list.categoryFileList}" var="fileList" begin="4" end="7">
				                                                                    			<div class="sub-img thumb col-4 col-sm-3 px-1 py-2 selected" onclick="showTargetImg(this, ${status.index});">
						                                                                            <img src="/uploadFiles/${fileList.card_category_relate_file_link}">
						                                                                        </div>
			                                                                    			</c:forEach>
			                                                                    		</div>
			                                                                		</div>
			                                                            			<div class="carousel-item">
			                                                                    		<div class="row mx-0">
		                                                                    				<c:forEach items="${list.categoryFileList}" var="fileList" begin="8" end="11">
				                                                                    			<div class="sub-img thumb col-4 col-sm-3 px-1 py-2 selected" onclick="showTargetImg(this, ${status.index});">
						                                                                            <img src="/uploadFiles/${fileList.card_category_relate_file_link}">
						                                                                        </div>
			                                                                    			</c:forEach>
			                                                                    		</div>
			                                                                		</div>
			                                                            			<div class="carousel-item">
			                                                                    		<div class="row mx-0">
		                                                                    				<c:forEach items="${list.categoryFileList}" var="fileList" begin="12" end="15">
				                                                                    			<div class="sub-img thumb col-4 col-sm-3 px-1 py-2 selected" onclick="showTargetImg(this, ${status.index});">
						                                                                            <img src="/uploadFiles/${fileList.card_category_relate_file_link}">
						                                                                        </div>
			                                                                    			</c:forEach>
			                                                                    		</div>
			                                                                		</div>
		                                                                		</div>
					                                                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselControls${list.stylist_CardVo.stylist_card_no }" data-bs-slide="prev">
					                                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					                                                            </button>
					                                                            <button class="carousel-control-next" type="button" data-bs-target="#carouselControls${list.stylist_CardVo.stylist_card_no }" data-bs-slide="next">
					                                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
					                                                            </button>
		                                                            		</c:when>
		                                                            		
		                                                            		<c:when test="${list.categoryFileList.size() >= 17 && list.categoryFileList.size() < 21}">
		                                                            			<div class="carousel-inner">
			                                                            			<div class="carousel-item active">
				                                                                    	<div class="row mx-0">
				                                                                    		<c:forEach items="${list.categoryFileList}" var="fileList" begin="0" end="3">
				                                                                    			<div class="sub-img thumb col-4 col-sm-3 px-1 py-2 selected" onclick="showTargetImg(this, ${status.index});">
						                                                                            <img src="/uploadFiles/${fileList.card_category_relate_file_link}">
						                                                                        </div>
				                                                                    		</c:forEach>
				                                                            			</div>
			                                                            			</div>
			                                                            			<div class="carousel-item">
			                                                                    		<div class="row mx-0">
		                                                                    				<c:forEach items="${list.categoryFileList}" var="fileList" begin="4" end="7">
				                                                                    			<div class="sub-img thumb col-4 col-sm-3 px-1 py-2 selected" onclick="showTargetImg(this, ${status.index});">
						                                                                            <img src="/uploadFiles/${fileList.card_category_relate_file_link}">
						                                                                        </div>
			                                                                    			</c:forEach>
			                                                                    		</div>
			                                                                		</div>
			                                                            			<div class="carousel-item">
			                                                                    		<div class="row mx-0">
		                                                                    				<c:forEach items="${list.categoryFileList}" var="fileList" begin="8" end="11">
				                                                                    			<div class="sub-img thumb col-4 col-sm-3 px-1 py-2 selected" onclick="showTargetImg(this, ${status.index});">
						                                                                            <img src="/uploadFiles/${fileList.card_category_relate_file_link}">
						                                                                        </div>
			                                                                    			</c:forEach>
			                                                                    		</div>
			                                                                		</div>
			                                                            			<div class="carousel-item">
			                                                                    		<div class="row mx-0">
		                                                                    				<c:forEach items="${list.categoryFileList}" var="fileList" begin="12" end="15">
				                                                                    			<div class="sub-img thumb col-4 col-sm-3 px-1 py-2 selected" onclick="showTargetImg(this, ${status.index});">
						                                                                            <img src="/uploadFiles/${fileList.card_category_relate_file_link}">
						                                                                        </div>
			                                                                    			</c:forEach>
			                                                                    		</div>
			                                                                		</div>
			                                                            			<div class="carousel-item">
			                                                                    		<div class="row mx-0">
		                                                                    				<c:forEach items="${list.categoryFileList}" var="fileList" begin="16" end="19">
				                                                                    			<div class="sub-img thumb col-4 col-sm-3 px-1 py-2 selected" onclick="showTargetImg(this, ${status.index});">
						                                                                            <img src="/uploadFiles/${fileList.card_category_relate_file_link}">
						                                                                        </div>
			                                                                    			</c:forEach>
			                                                                    		</div>
			                                                                		</div>
		                                                                		</div>
					                                                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselControls${list.stylist_CardVo.stylist_card_no }" data-bs-slide="prev">
					                                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					                                                            </button>
					                                                            <button class="carousel-control-next" type="button" data-bs-target="#carouselControls${list.stylist_CardVo.stylist_card_no }" data-bs-slide="next">
					                                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
					                                                            </button>
		                                                            		</c:when>
		                                                            		
		                                                            	</c:choose>
			                                                        </div>
			                                                    </div>
			                                                </div>
			                                            </div>
			                                        </div>
			                                        
			                                        
			                                        <!-- 리뷰 -->
			                                        <div class="row">
			                                            <div class="col">
			                                                <!-- 타이틀 -->
			                                                <div class="row my-3">
			                                                    <div class="col">
			                                                        <h4> 리뷰(구현대기) </h4>
			                                                    </div>
			                                                    <div class="col-2 px-0">
			                                                        <div class="collapse multi-collapse collapse-horizontal">
			                                                            <div class="d-grid">
			                                                                <select class="form-select">
			                                                                    <option selected>선택</option>
			                                                                    <option>닉네임</option>
			                                                                    <option>내용</option>
			                                                                </select>
			                                                            </div>
			                                                        </div>
			                                                    </div>
			                                                    <div class="col-4">
			                                                        <div class="collapse multi-collapse collapse-horizontal">
			                                                            <div class="d-grid">
			                                                                <input type="text" class="form-control">
			                                                            </div>
			                                                        </div>
			                                                    </div>
			                                                    <div class="col-1" style="align-self: center">
			                                                        <a data-bs-toggle="collapse" data-bs-target=".multi-collapse" aria-expanded="false" aria-controls="multi-collapse">
			                                                            <i class="bi bi-search"></i>
			                                                        </a>
			                                                    </div>
			                                                </div>
			                                                <!-- 리뷰  -->
			                                                <div class="row">
			                                                	<div class="reviewBox col">
					                                                <div class="row">
					                                                    <div class="col m-3">
					                                                        <!-- 프로필/ 닉네임/ 신고 -->
					                                                        <div class="row reviewProfile">
					                                                            <!-- 프로필 사진 -->
					                                                            <div class="col-2">
					                                                                <img class="rounded-circle" src="../resources/img/projectimg(1).png">
					                                                            </div>
					                                                            <!-- 닉네임/신고/별점 -->
					                                                            <div class="col-5" style="align-self: center;">
					                                                                <!-- 닉네임/신고 -->
					                                                                <div class="row">
					                                                                    <div class="col col-md-auto">
					                                                                        <span>사슴사슴님</span>
					                                                                    </div>
					                                                                </div>
					                                                                <!-- 별점 -->
					                                                                <div class="row">
					                                                                    <div class="col">
					                                                                        <div class="starRatingBox">
					                                                                            <!-- *20% 곱해야함 -->
					                                                                            <div class="starRatingFill" style=" width: 20% ">  
					                                                                                <span>★★★★★</span>
					                                                                            </div>
					                                                                            <div class="starRatingEmpty">
					                                                                                <span>★★★★★</span>
					                                                                            </div>
					                                                                        </div>
					                                                                    </div>
					                                                                </div>
					                                                            </div>
					                                                            <!-- 작성일자 -->
					                                                            <div class="col text-end">
					                                                                <div class="row">
					                                                                    <div class="col">
					                                                                        <span>2022/07/29 11:30</span>
					                                                                    </div>
					                                                                    <div class="col">
					                                                                        <span>신고</span>
					                                                                    </div>
					                                                                </div>
					                                                            </div>
					                                                        </div>
					                                                        <!-- 리뷰 본문 -->
					                                                        <div class="row my-3" >
					                                                            <!-- 리뷰 사진들 -->
					                                                            <div class="col">
					                                                                <div class="row">
					                                                                   
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
			                        </div>
			                        <div class="modal-footer">
			                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			                            <c:choose>
			                        		<c:when test="${!empty sessionUserInfo && !empty sessionMemberInfo}">
			                            		<button onclick="requestOrder(${list.stylist_CardVo.stylist_card_no })" class="btn btn-primary" data-bs-target="#requestModal" data-bs-toggle="modal" data-bs-dismiss="modal"> 요청 </button>
			                            	</c:when>
			                            	<c:otherwise>
			                            	</c:otherwise>
			                            </c:choose>
			                        </div>
			                    </div>
			                </div>
			            </div>
					</c:forEach>
					
		            <!-- Modal2 : 요청하기 -->
		            <form id="orderWriteProcess" method="post" enctype="multipart/form-data">
			            <div class="modal fade" id="requestModal" data-bs-backdrop="static" aria-hidden="true" tabindex="-1">
			            	<input id="requestStylistCardNo" name="stylist_card_no" value="" type="hidden">
			            	<input id="requestPrice" name="order_saleprice" value="" type="hidden">
			                <div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable">
			                  <div class="modal-content">
			                    <div class="modal-header">
			                        <h5 class="modal-title">OO님에게 요청하기</h5>
			                        <a type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></a>
			                    </div>
			                    <div class="modal-body container-md px-4">
			                        <div class="container-fluid">
			                            <div class="row">
			                                <div class="col">
			                                    <!-- 최소 요청사항 -->
		                                        <div class="row">
		                                            <div class="col card mx-3">
		                                                <img class="rounded mx-auto d-block" src="../resources/img/reviewBase.png">
		                                            </div>
		                                            <div class="col-5 my-2">
		                                                <!-- 카테고리 선택 -->
		                                                <div class="row my-2">
		                                                    <div class="col requestStylingGuide">
		                                                        <span>*필수사항</span>
		                                                    </div>
		                                                </div>
		                                                <div class="row my-2">
		                                                    <div class="col-md-auto">
		                                                        <span> 카테고리 </span>
		                                                    </div>
		                                                    <div class="col">
		                                                        <select name="card_category_name" class="form-select">
		                                                            <option class="selected">선택</option>
		                                                            <c:forEach items="${categoryList}" var="list">
			                                                            <option value="${list.card_category_name }">${list.card_category_name }</option>
		                                                            </c:forEach>
		                                                        </select>
		                                                    </div>
		                                                </div>
		                                                <div class="row my-2">
		                                                    <div class="col-3">
		                                                        <span> 신장 </span>
		                                                    </div>
		                                                    <div class="col">
		                                                        <input id="requestHeight" class="form-control" type="text" name="order_heigth">
		                                                    </div>
		                                                </div>
		                                                <div class="row my-2">
		                                                    <div class="col-3">
		                                                        <span> 체중 </span>
		                                                    </div>
		                                                    <div class="col">
		                                                        <input id="requestWeight" class="form-control" type="text" name="order_weight">
		                                                    </div>
		                                                </div>
		                                                <div class="row my-2">
		                                                    <div class="col-3">
		                                                        <span> 상의 </span>
		                                                    </div>
		                                                    <div class="col">
		                                                        <input id="requestTop" class="form-control" type="text" name="order_top">
		                                                    </div>
		                                                </div>
		                                                <div class="row my-2">
		                                                    <div class="col-3">
		                                                        <span> 하의 </span>
		                                                    </div>
		                                                    <div class="col">
		                                                        <input id="requestBottom" class="form-control" type="text" name="order_bottom">
		                                                    </div>
		                                                </div>
		                                                <div class="row my-2">
		                                                    <div class="col-3">
		                                                        <span> 신발 </span>
		                                                    </div>
		                                                    <div class="col">
		                                                        <input id="requestShoes" class="form-control" type="text" name="order_shoes">
		                                                    </div>
		                                                </div>
		                                                <!-- 타이틀 -->
		                                                <div class="row">
		                                                    <div class="col my-3 requestStylingGuide">
		                                                        <span>* 스타일링 이미지는 모니터 해상도, 색상 설정에 따라 이미지가 왜곡되거나 실제 색상과 차이가 있을 수 있습니다.
		                                                            <br> * 스타일링 사이즈 실측은 의류의 특성 및 측정방식에 따라 오차가 발생할 수 있습니다.
		                                                            <br> * 구매고객과 스타일리스트에서 거래되는 내용은 현페이지에서 보증하지 않습니다.
		                                                            <br> * 구매 후 스타일링은 평균 3일 정도 소요됨을 알려드립니다.
		                                                            <br> * 구매고객의 단순변심의 의한 환불요청은 불가함을 알려드립니다.
		                                                        </span>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                        </div>
		                                        <!-- 요청사항 글쓰기 -->
		                                        <div class="row my-3">
		                                            <div class="col">
		                                                <textarea class="summernote" name="order_content"></textarea>    
		                                            </div>
		                                        </div>
		                                        <!-- 파일첨부 -->
		                                        <div class="row my-2">
		                                            <div class="col requestStylingGuide">
		                                                <span> * 파일은 이미지파일만 첨부할 수 있습니다.</span>
		                                            </div>
		                                        </div>
		                                        <div class="row my-2">
		                                            <div class="col-md-auto">
		                                                <input id="fileUpload" class="form-control input-multiple-image" style="display: block;" type="file" name = "files" multiple="multiple" accept="image/*">
		                                            </div>
		                                        </div>
                                                <div class="multiple-container2 row">
                                                </div>
			                               	</div>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="modal-footer">
			                        <button class="btn btn-primary" data-bs-target="#cardModal_card_no" data-bs-toggle="modal" data-bs-dismiss="modal"> 이전 </button>
			                        <c:choose>
			                        	<c:when test="${!empty sessionUserInfo && !empty sessionMemberInfo}">
					                        <a onclick="orderWriteProcess()" class="btn btn-primary" data-bs-target="#ordertModal" data-bs-toggle="modal" data-bs-dismiss="modal">확인</a> 
			                        	</c:when>
			                        	<c:otherwise>
			                        	</c:otherwise>
			                        </c:choose>
			                    </div>
			                  </div>
			                </div>
			            </div>
		            </form>
		
		            <!-- Modal3 : 결제하기 -->
		            <div class="modal fade" id="ordertModal" data-bs-backdrop="static" aria-hidden="true" tabindex="-1">
		                <div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable">
		                  <div class="modal-content">
		                    <div class="modal-header">
		                        <h5 class="modal-title">결제 확인</h5>
		                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		                    </div>
		                    <div class="modal-body container-md px-4">
		                        <div class="container-fluid">
		                            <div class="row">
		                                <div class="col">
		                                    <div class="row">
		                                        <!-- 최소 요청사항 -->
		                                        <div class="col">
		                                            <div class="row">
		                                                <div class="col mx-3">
		                                                    <h6>요청정보</h6>
		                                                </div>
		                                            </div>
		                                            <div class="row">
		                                                <div class="col-5 my-2">
		                                                    <span>카테고리</span>
		                                                </div>
		                                                <div class="col-md-auto">
		                                                    <span id="orderCategory"></span>
		                                                </div>
		                                            </div>
		                                            <div class="row">
		                                                <div class="col-5 my-2">
		                                                    <span>신장</span>
		                                                </div>
		                                                <div class="col-md-auto">
		                                                    <span id="orderHeight">${sessionUserInfo.user_heigth }</span>
		                                                </div>
		                                            </div>
		                                            <div class="row">
		                                                <div class="col-5 my-2">
		                                                    <span>체중</span>
		                                                </div>
		                                                <div class="col-md-auto">
		                                                    <span id="orderWeight">${sessionUserInfo.user_weight }</span>
		                                                </div>
		                                            </div>
		                                            <div class="row">
		                                                <div class="col-5 my-2">
		                                                    <span>상의</span>
		                                                </div>
		                                                <div class="col-md-auto">
		                                                    <span id="orderTop">${sessionUserInfo.user_top }</span>
		                                                </div>
		                                            </div>
		                                            <div class="row">
		                                                <div class="col-5 my-2">
		                                                    <span>하의</span>
		                                                </div>
		                                                <div class="col-md-auto">
		                                                    <span id="orderBottom">${sessionUserInfo.user_bottom }</span>
		                                                </div>
		                                            </div>
		                                            <div class="row">
		                                                <div class="col-5 my-2">
		                                                    <span>신발</span>
		                                                </div>
		                                                <div class="col-md-auto">
		                                                    <span id="orderShoes">${sessionUserInfo.user_shoes }</span>
		                                                </div>
		                                            </div>
		                                        </div>
		                                        <!-- 결제정보 -->
		                                        <div class="col">
		                                            <div class="row">
		                                                <div class="col mx-3">
		                                                    <h6>결제 정보</h6>
		                                                </div>
		                                            </div>
		                                            <div class="row">
		                                                <div class="col-5 my-2">
		                                                    <span>날짜</span>
		                                                </div>
		                                                <div class="col-md-auto">
		                                                    <span id="orderDate">여기에 EL문 써야함</span>
		                                                </div>
		                                            </div>
		                                            <div class="row">
		                                                <div class="col-5 my-2">
		                                                    <span>누가</span>
		                                                </div>
		                                                <div class="col-md-auto">
		                                                    <span id="orderUser">여기에 EL문 써야함</span>
		                                                </div>
		                                            </div>
		                                            <div class="row">
		                                                <div class="col-5 my-2">
		                                                    <span>누구에게</span>
		                                                </div>
		                                                <div class="col-md-auto">
		                                                    <span id="orderStylist">여기에 EL문 써야함</span>
		                                                </div>
		                                            </div>
		                                            <div class="row">
		                                                <div class="col-5 my-2">
		                                                    <span>요청 금액</span>
		                                                </div>
		                                                <div class="col-md-auto">
		                                                    <span class="money" id="orderSaleprice">여기에 EL문 써야함</span>
		                                                </div>
		                                            </div>
		                                            <div class="row">
		                                                <div class="col-5 my-2">
		                                                    <span>소지 금액</span>
		                                                </div>
		                                                <div class="col-md-auto">
		                                                    <span class="money" id="userCash">${sessionMemberInfo.member_cash }</span>
		                                                </div>
		                                            </div>
		                                            <div class="row">
		                                                <div class="col-5 my-2">
		                                                    <span>거래 후 잔액</span>
		                                                </div>
		                                                <div class="col-md-auto">
		                                                    <span class="money" id="afterCash">${sessionMemberInfo.member_cash }</span>
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <br>
		                                    <div class="row card">
		                                    	<div class="col">
				                                    <div class="row">
				                                    	<div class="col">
				                                    		<h5> 요청 사항 </h5>
				                                    	</div>
				                                    </div>
				                                    <div class="row multiple-container2">
			                                        </div>
			                                        <div class="row">
				                                        <div id="orderContent" class="col card g-3" style = "height: 200px">
				                                            써머노트 적은거 미리보기 불러오기
				                                        </div>
				                                    </div>
		                                    	</div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="modal-footer">
		                        <button class="btn btn-primary" data-bs-target="#requestModal" data-bs-toggle="modal" data-bs-dismiss="modal"> 이전 </button>
		                        <button onclick="requestOrderProcess()" class="btn btn-primary" data-bs-target="#ordertCompleteModal" data-bs-toggle="modal" data-bs-dismiss="modal"> 확인 </button>
		                    </div>
		                  </div>
		                </div>
		            </div>
		
		            <!-- Modal4 : 결제완료 -->
		            <div class="modal fade" id="ordertCompleteModal" data-bs-backdrop="static" aria-hidden="true" tabindex="-1">
		                <div class="modal-dialog modal-dialog-centered modal-sm modal-dialog-scrollable">
		                  <div class="modal-content">
		                    <div class="modal-header">
		                        <h5 class="modal-title">결제 확인</h5>
		                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		                    </div>
		                    <div class="modal-body container-md px-4">
		                        <div class="container-fluid">
		                            <!-- 헤더 -->
		                            <div class="row text-center">
		                                <div class="col">
		                                    <div class="row">
		                                        <div class="col">
		                                            <h6> GOOD VIBE를 이용해 주셔서 감사합니다. </h6>
		                                        </div>
		                                    </div>
		                                    <div class="row">
		                                        <div class="col">
		                                            <h6> 요청하신 주문이 완료되었습니다. </h6>
		                                        </div>
		                                    </div>
		                                    <div class="row">
		                                        <div class="col">
		                                            <h6> 주문의 내역은 마이페이지에서 조회 가능합니다. </h6>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                            <!-- 내용 -->
		                            <div class="row text-center">
		                                <div class="col">
		                                    <div class="row">
		                                        <div class="col">
		                                            <span>고객님이 주문하신 주문번호는</span>
		                                        </div>
		                                    </div>
		                                    <div class="row">
		                                        <div class="col">
		                                            <span>el문 써야함</span><span> 입니다.</span>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="modal-footer">
		                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-dismiss="modal"> 메인페이지 </button>
		                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-dismiss="modal"> 마이페이지(경로 추가해야함) </button>
		                    </div>
		                  </div>
		                </div>
		            </div>
		            
		            <!-- Modal5 : STORE Modal -->
					<div class="modal fade" id="storeModal" tabindex="-1" aria-hidden="true">
					    <div class="modal-dialog modal-lg modal-dialog-scrollable">
					        <div class="modal-content">
					            <div id="storeModalCarousel" class="modal-body carousel slide carousel-fade">
					                <!-- 타이틀 및 X 버튼 -->
					                <div class="row">
					                    <div class="col">
					                        <h5>STORE</h5>
					                    </div>
					                    <div class="col text-end">
					                        <a class="fs-4" type="button"><i class="bi bi-gear"></i></a>
					                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					                    </div>
					                </div>
					                <div class="row">
					                    <div class="col">
					                        <div class="row nav nav-tabs nav-pills">
					                            <div class="col nav-link text-center active" data-bs-target="#storeModalCarousel" data-bs-slide-to="0" onclick="storeTabs(this)">
					                                <span>STYLING</span>
					                            </div>
					                            <div class="col nav-link text-center" data-bs-target="#storeModalCarousel" data-bs-slide-to="1" onclick="storeTabs(this); storeModalInfo(${sessionMemberInfo.member_no})" >
<%-- 					                            <div class="col nav-link text-center" data-bs-target="#storeModalCarousel" data-bs-slide-to="1" onclick="storeTabs(this); storeModalInfo(${sessionStylistInfo.stylist_no})" > --%>
					                                <span>LIST</span>
					                            </div>
					                        </div>
					                    </div>
					                </div>
					                <div class="row my-4">
					                    <div id="storeModalCarousel" class="col carousel slide carousel-fade" data-bs-interval="false">
					                        <div class="row">
					                            <div class="col">
					                                <div class="carousel-inner">
					                                    <!-- STORE : Main -->
					                                    <div class="carousel-item active">
					                                        <div class="row">
					                                            <div class="col">
					                                                <!-- 새 요청/진행 중 -->
					                                                <div class="row m-3">
					                                                    <!-- 새요청 -->
					                                                    <div class="col">
					                                                        <div class="row m-2 card" style="border-left: 5px solid #dc3545;">
					                                                            <div class="col my-3">
					                                                                <div class="row">
					                                                                    <div class="col-3 text-center align-self-center">
					                                                                        <h1><i class="bi bi-bag-plus" style="color: #dc3545;"></i></h1>
					                                                                    </div>
					                                                                    <div class="col">
					                                                                        <div class="row mb-2">
					                                                                            <div class="col text-center align-self-center">
					                                                                                <h3> 3 New Order </h3> 
					                                                                                <span>Awating processing</span>
					                                                                            </div>
					                                                                        </div>
					                                                                        <div class="row text-end">
					                                                                            <div class="col text-center align-self-center" style="font-size: 0.8rem; color: #555;">
					                                                                                <span><i class="bi bi-arrow-up-short"></i> 5 from last week </span>
					                                                                            </div>
					                                                                        </div>
					                                                                    </div>
					                                                                </div>
					                                                            </div>
					                                                        </div>
					                                                    </div>
					                                                    <!-- 진행중 -->
					                                                    <div class="col">
					                                                        <div class="row m-2 card" style="border-left: 5px solid #ffc107;">
					                                                            <div class="col my-3">
					                                                                <div class="row">
					                                                                    <div class="col-3 text-center align-self-center">
					                                                                        <h1><i class="bi bi-bag-check" style="color: #ffc107;"></i></h1>
					                                                                    </div>
					                                                                    <div class="col">
					                                                                        <div class="row mb-2">
					                                                                            <div class="col text-center align-self-center">
					                                                                                <h3> 5 Order </h3> 
					                                                                                <span>On hold</span>
					                                                                            </div>
					                                                                        </div>
					                                                                        <div class="row text-end">
					                                                                            <div class="col text-center align-self-center" style="font-size: 0.8rem; color: #555;">
					                                                                                <span><i class="bi bi-arrow-up-short"></i> 5 from last week </span>
					                                                                            </div>
					                                                                        </div>
					                                                                    </div>
					                                                                </div>
					                                                            </div>
					                                                        </div>
					                                                    </div>
					                                                </div>
					                                                <!-- 완료됨/취소됨 -->
					                                                <div class="row m-3">
					                                                    <!-- 완료 -->
					                                                    <div class="col ">
					                                                        <div class="row m-2 card" style="border-left: 5px solid #119911;">
					                                                            <div class="col my-3">
					                                                                <div class="row">
					                                                                    <div class="col-3 text-center align-self-center">
					                                                                        <h1><i class="bi bi-bag-heart" style="color: #119911;"></i></h1>
					                                                                    </div>
					                                                                    <div class="col">
					                                                                        <div class="row mb-2">
					                                                                            <div class="col text-center align-self-center">
					                                                                                <h3> 3 Complete </h3> 
					                                                                                <span>Request response</span>
					                                                                            </div>
					                                                                        </div>
					                                                                        <div class="row text-end">
					                                                                            <div class="col text-center align-self-center" style="font-size: 0.8rem; color: #555;">
					                                                                                <span><i class="bi bi-arrow-up-short"></i> 5 from last week </span>
					                                                                            </div>
					                                                                        </div>
					                                                                    </div>
					                                                                </div>
					                                                            </div>
					                                                        </div>
					                                                    </div>
					                                                    <!-- 취소 -->
					                                                    <div class="col">
					                                                        <div class="row m-2 card" style="border-left: 5px solid #454545;">
					                                                            <div class="col my-3">
					                                                                <div class="row">
					                                                                    <div class="col-3 text-center align-self-center">
					                                                                        <h1><i class="bi bi-bag-x" style="color: #454545;"></i></h1>
					                                                                    </div>
					                                                                    <div class="col">
					                                                                        <div class="row mb-2">
					                                                                            <div class="col text-center align-self-center">
					                                                                                <h3> 15 Cancel </h3> 
					                                                                                <span>Out of stock</span>
					                                                                            </div>
					                                                                        </div>
					                                                                        <div class="row text-end">
					                                                                            <div class="col text-center align-self-center" style="font-size: 0.8rem; color: #555;">
					                                                                                <span><i class="bi bi-arrow-up-short"></i> 5 from last week </span>
					                                                                            </div>
					                                                                        </div>
					                                                                    </div>
					                                                                </div>
					                                                            </div>
					                                                        </div>
					                                                    </div>
					                                                </div>
					                                                <!-- 리뷰/조회수 -->
					                                                <div class="row m-3">
					                                                    <!-- 리뷰 -->
					                                                    <div class="col ">
					                                                        <div class="row m-2 card" style="border-left: 5px solid #454545;">
					                                                            <div class="col my-3">
					                                                                <div class="row">
					                                                                    <div class="col-3 text-center align-self-center">
					                                                                        <h1><i class="bi bi-journal-plus" style="color: #454545;"></i></h1>
					                                                                    </div>
					                                                                    <div class="col">
					                                                                        <div class="row mb-2">
					                                                                            <div class="col text-center align-self-center">
					                                                                                <h3> 3 Review </h3> 
					                                                                                <span>&nbsp;</span>
					                                                                            </div>
					                                                                        </div>
					                                                                        <div class="row text-end">
					                                                                            <div class="col text-center align-self-center" style="font-size: 0.8rem; color: #555;">
					                                                                                <span><i class="bi bi-arrow-up-short"></i> 5 from last week </span>
					                                                                            </div>
					                                                                        </div>
					                                                                    </div>
					                                                                </div>
					                                                            </div>
					                                                        </div>
					                                                    </div>
					                                                    <!-- 북마크 -->
					                                                    <div class="col">
					                                                        <div class="row m-2 card" style="border-left: 5px solid #454545;">
					                                                            <div class="col my-3">
					                                                                <div class="row">
					                                                                    <div class="col-3 text-center align-self-center">
					                                                                        <h1><i class="bi bi-postcard-heart" style="color: #454545;"></i></h1>
					                                                                    </div>
					                                                                    <div class="col">
					                                                                        <div class="row mb-2">
					                                                                            <div class="col text-center align-self-center">
					                                                                                <h3> 15 Bookmark </h3> 
					                                                                                <span>Card favorites</span>
					                                                                            </div>
					                                                                        </div>
					                                                                        <div class="row text-end">
					                                                                            <div class="col text-center align-self-center" style="font-size: 0.8rem; color: #555;">
					                                                                                <span><i class="bi bi-arrow-down-short"></i> 5 from last week </span>
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
					                                    <!-- STORE : List -->
					                                    <div class="carousel-item">
					                                        <div class="row">
					                                            <div id="receivedRequestList" class="col">
																	<!-- 테이블 -->
														            <div class="row text-center align-self-center fs-4 my-3">
														                <!-- 번호 -->
														                <div class="col">
														                    <span>번호</span>
														                </div>
														                <!-- 임시 -->
														                <div class="col">
														                    <span>분류</span>
														                </div>
														                <!-- 닉네임 -->
														                <div class="col">
														                    <span>닉네임</span>
														                </div>
														                <!-- 카테고리 -->
														                <div class="col">
														                    <span>카테고리</span>
														                </div>
														                <!-- 금액 -->
														                <div class="col">
														                    <span>금액</span>
														                </div>
														                <!-- 일자 -->
														                <div class="col">
														                    <span>일자</span>
														                </div>
														                <!-- 상태 -->
														                <div class="col">
														                    <span>상태</span>
														                </div>
														            </div>
														            <c:forEach items="${dataList }" var="data" varStatus="status">
														                <div class="row text-center align-self-center">
														                    <div class="col">
														                        <a onclick="readOrderDetailModal(${data.orderVo.order_no })" data-bs-target="#readOrderDetailModal" data-bs-toggle="modal">${fn:length(dataList) - status.index}</a>
														                    </div>
														                    <!-- 임시 -->
														                    <div class="col">
														                        <span>${data.card_category_name }</span>
														                    </div>
														                    <div class="col">
														                        <!-- 프로필 사진 넣어 말아? -->
														                        <div class="row">
														                            <div class="col">
														                                
														                            </div>
														                        </div>
														                        <div class="row">
														                            <div class="col">
														                                <span>${data.memberVo.member_nick }</span>
														                            </div>
														                        </div>
														                    </div>
														                    <div class="col">
														                        <span>${data.card_category_name }</span>
														                    </div>
														                    <div class="col">
														                        <span class="money">${data.orderVo.order_saleprice }</span>
														                    </div>
														                    <div class="col">
														                        <span><fmt:formatDate value="${data.orderVo.order_date}" pattern="yy.MM.dd"/></span>
														                    </div>
														                    <div class="col">
														                        <c:choose>
														                            <c:when test="${data.orderVo.order_state eq 'order'}">
														                                <span>요청 중</span>
														                            </c:when>
														                            <c:when test="${data.orderVo.order_state eq 'reject'}">
														                                <span>거절됨</span>
														                            </c:when>
														                            <c:when test="${data.orderVo.order_state eq 'accept'}">
														                                <span>진행 중</span>
														                            </c:when>
														                            <c:when test="${data.orderVo.order_state eq 'answer'}">
														                                <span>답변 완료</span>
														                            </c:when>
														                            <c:when test="${data.orderVo.order_state eq 'complete'}">
														                                <span>리뷰 완료</span>
														                            </c:when>
														                            <c:otherwise>
														                                <span> 에러 </span>
														                            </c:otherwise>
														                        </c:choose>
														                    </div>
														                </div>
														            </c:forEach>
					                                            </div>
					                                        </div>
					                                	</div>    
						                            </div>
						                        </div>
						                    </div>
						                </div>
						            </div>
						            <div class="modal-footer">
						                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						            </div>
						        </div>
						    </div>
						</div>
		            </div>
		            
		            <!-- Modal5-2 : RandomBox Modal -->
					<div class="modal fade" id="randomBoxModal" tabindex="-1" aria-hidden="true">
					    <div class="modal-dialog modal-lg modal-dialog-scrollable">
					        <div class="modal-content">
					            <div id="storeModalCarousel" class="modal-body carousel slide carousel-fade">
					                <!-- 타이틀 및 X 버튼 -->
					                <div class="row">
					                    <div class="col">
					                        <h5>STORE</h5>
					                    </div>
					                    <div class="col text-end">
					                        <a class="fs-4" type="button"><i class="bi bi-gear"></i></a>
					                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					                    </div>
					                </div>
					                <div class="row">
					                    <div class="col">
					                        <div class="row nav nav-tabs nav-pills">
					                            <div class="col nav-link text-center" data-bs-target="#storeModalCarousel" data-bs-slide-to="0" onclick="storeTabs(this)">
												    <span>RANDOM BOX</span>
												</div>
					                            <div class="col nav-link text-center" data-bs-target="#storeModalCarousel" data-bs-slide-to="1" onclick="storeTabs(this); storeModalInfo(${sessionMemberInfo.member_no})" >
<%-- 					                            <div class="col nav-link text-center" data-bs-target="#storeModalCarousel" data-bs-slide-to="1" onclick="storeTabs(this); storeModalInfo(${sessionStylistInfo.stylist_no})" > --%>
					                                <span>LIST</span>
					                            </div>
					                        </div>
					                    </div>
					                </div>
					                <div class="row my-4">
					                    <div id="storeModalCarousel" class="col carousel slide carousel-fade" data-bs-interval="false">
					                        <div class="row">
					                            <div class="col">
					                                <div class="carousel-inner">
					                                    <!-- STORE : Main -->
					                                    <div class="carousel-item active">
					                                        <div class="row">
														        <div class="col">
														            <!-- 새 요청/진행 중 -->
														            <div class="row m-3">
														                <!-- 새요청 -->
														                <div class="col">
														                    <div class="row m-2 card" style="border-left: 5px solid #dc3545;">
														                        <div class="col my-3">
														                            <div class="row">
														                                <div class="col-3 text-center align-self-center">
														                                    <h1><i class="bi bi-box-seam" style="color: #dc3545;"></i></h1>
														                                </div>
														                                <div class="col">
														                                    <div class="row mb-2">
														                                        <div class="col text-center align-self-center">
														                                            <h3> 3 New Order </h3> 
														                                            <span>Awating processing</span>
														                                        </div>
														                                    </div>
														                                    <div class="row text-end">
														                                        <div class="col text-center align-self-center" style="font-size: 0.8rem; color: #555;">
														                                            <span><i class="bi bi-arrow-up-short"></i> 5 from last week </span>
														                                        </div>
														                                    </div>
														                                </div>
														                            </div>
														                        </div>
														                    </div>
														                </div>
														                <!-- 진행중 -->
														                <div class="col">
														                    <div class="row m-2 card" style="border-left: 5px solid #ffc107;">
														                        <div class="col my-3">
														                            <div class="row">
														                                <div class="col-3 text-center align-self-center">
														                                    <h1><i class="bi bi-box-seam" style="color: #ffc107;"></i></h1>
														                                </div>
														                                <div class="col">
														                                    <div class="row mb-2">
														                                        <div class="col text-center align-self-center">
														                                            <h3> 5 Order </h3> 
														                                            <span>On hold</span>
														                                        </div>
														                                    </div>
														                                    <div class="row text-end">
														                                        <div class="col text-center align-self-center" style="font-size: 0.8rem; color: #555;">
														                                            <span><i class="bi bi-arrow-up-short"></i> 5 from last week </span>
														                                        </div>
														                                    </div>
														                                </div>
														                            </div>
														                        </div>
														                    </div>
														                </div>
														            </div>
														            <!-- 완료됨/취소됨 -->
														            <div class="row m-3">
														                <!-- 완료 -->
														                <div class="col ">
														                    <div class="row m-2 card" style="border-left: 5px solid #119911;">
														                        <div class="col my-3">
														                            <div class="row">
														                                <div class="col-3 text-center align-self-center">
														                                    <h1><i class="bi bi-box-seam" style="color: #119911;"></i></h1>
														                                </div>
														                                <div class="col">
														                                    <div class="row mb-2">
														                                        <div class="col text-center align-self-center">
														                                            <h3> 3 Complete </h3> 
														                                            <span>Request response</span>
														                                        </div>
														                                    </div>
														                                    <div class="row text-end">
														                                        <div class="col text-center align-self-center" style="font-size: 0.8rem; color: #555;">
														                                            <span><i class="bi bi-arrow-up-short"></i> 5 from last week </span>
														                                        </div>
														                                    </div>
														                                </div>
														                            </div>
														                        </div>
														                    </div>
														                </div>
														                <!-- 취소 -->
														                <div class="col">
														                    <div class="row m-2 card" style="border-left: 5px solid #454545;">
														                        <div class="col my-3">
														                            <div class="row">
														                                <div class="col-3 text-center align-self-center">
														                                    <h1><i class="bi bi-box-seam" style="color: #454545;"></i></h1>
														                                </div>
														                                <div class="col">
														                                    <div class="row mb-2">
														                                        <div class="col text-center align-self-center">
														                                            <h3> 15 Cancel </h3> 
														                                            <span>Out of stock</span>
														                                        </div>
														                                    </div>
														                                    <div class="row text-end">
														                                        <div class="col text-center align-self-center" style="font-size: 0.8rem; color: #555;">
														                                            <span><i class="bi bi-arrow-up-short"></i> 5 from last week </span>
														                                        </div>
														                                    </div>
														                                </div>
														                            </div>
														                        </div>
														                    </div>
														                </div>
														            </div>
														            <!-- 리뷰/조회수 -->
														            <div class="row m-3">
														                <!-- 리뷰 -->
														                <div class="col ">
														                    <div class="row m-2 card" style="border-left: 5px solid #454545;">
														                        <div class="col my-3">
														                            <div class="row">
														                                <div class="col-3 text-center align-self-center">
														                                    <h1><i class="bi bi-journal-plus" style="color: #454545;"></i></h1>
														                                </div>
														                                <div class="col">
														                                    <div class="row mb-2">
														                                        <div class="col text-center align-self-center">
														                                            <h3> 3 Review </h3> 
														                                            <span>&nbsp;</span>
														                                        </div>
														                                    </div>
														                                    <div class="row text-end">
														                                        <div class="col text-center align-self-center" style="font-size: 0.8rem; color: #555;">
														                                            <span><i class="bi bi-arrow-up-short"></i> 5 from last week </span>
														                                        </div>
														                                    </div>
														                                </div>
														                            </div>
														                        </div>
														                    </div>
														                </div>
														                <!-- 북마크 -->
														                <div class="col">
														                    <div class="row m-2 card" style="border-left: 5px solid #454545;">
														                        <div class="col my-3">
														                            <div class="row">
														                                <div class="col-3 text-center align-self-center">
														                                    <h1><i class="bi bi-postcard-heart" style="color: #454545;"></i></h1>
														                                </div>
														                                <div class="col">
														                                    <div class="row mb-2">
														                                        <div class="col text-center align-self-center">
														                                            <h3> 15 Bookmark </h3> 
														                                            <span>Card favorites</span>
														                                        </div>
														                                    </div>
														                                    <div class="row text-end">
														                                        <div class="col text-center align-self-center" style="font-size: 0.8rem; color: #555;">
														                                            <span><i class="bi bi-arrow-down-short"></i> 5 from last week </span>
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
					                                    <!-- STORE : List -->
					                                    <div class="carousel-item">
					                                        <div class="row">
					                                            <div id="receivedRequestList" class="col">
																	<!-- 테이블 -->
														            <div class="row text-center align-self-center fs-4 my-3">
														                <!-- 번호 -->
														                <div class="col">
														                    <span>번호</span>
														                </div>
														                <!-- 임시 -->
														                <div class="col">
														                    <span>분류</span>
														                </div>
														                <!-- 닉네임 -->
														                <div class="col">
														                    <span>닉네임</span>
														                </div>
														                <!-- 카테고리 -->
														                <div class="col">
														                    <span>카테고리</span>
														                </div>
														                <!-- 금액 -->
														                <div class="col">
														                    <span>금액</span>
														                </div>
														                <!-- 일자 -->
														                <div class="col">
														                    <span>일자</span>
														                </div>
														                <!-- 상태 -->
														                <div class="col">
														                    <span>상태</span>
														                </div>
														            </div>
														            <c:forEach items="${dataList }" var="data" varStatus="status">
														                <div class="row text-center align-self-center">
														                    <div class="col">
														                        <a onclick="readOrderDetailModal(${data.orderVo.order_no })" data-bs-target="#readOrderDetailModal" data-bs-toggle="modal">${fn:length(dataList) - status.index}</a>
														                    </div>
														                    <!-- 임시 -->
														                    <div class="col">
														                        <span>${data.card_category_name }</span>
														                    </div>
														                    <div class="col">
														                        <!-- 프로필 사진 넣어 말아? -->
														                        <div class="row">
														                            <div class="col">
														                                
														                            </div>
														                        </div>
														                        <div class="row">
														                            <div class="col">
														                                <span>${data.memberVo.member_nick }</span>
														                            </div>
														                        </div>
														                    </div>
														                    <div class="col">
														                        <span>${data.card_category_name }</span>
														                    </div>
														                    <div class="col">
														                        <span class="money">${data.orderVo.order_saleprice }</span>
														                    </div>
														                    <div class="col">
														                        <span><fmt:formatDate value="${data.orderVo.order_date}" pattern="yy.MM.dd"/></span>
														                    </div>
														                    <div class="col">
														                        <c:choose>
														                            <c:when test="${data.orderVo.order_state eq 'order'}">
														                                <span>요청 중</span>
														                            </c:when>
														                            <c:when test="${data.orderVo.order_state eq 'reject'}">
														                                <span>거절됨</span>
														                            </c:when>
														                            <c:when test="${data.orderVo.order_state eq 'accept'}">
														                                <span>진행 중</span>
														                            </c:when>
														                            <c:when test="${data.orderVo.order_state eq 'answer'}">
														                                <span>답변 완료</span>
														                            </c:when>
														                            <c:when test="${data.orderVo.order_state eq 'complete'}">
														                                <span>리뷰 완료</span>
														                            </c:when>
														                            <c:otherwise>
														                                <span> 에러 </span>
														                            </c:otherwise>
														                        </c:choose>
														                    </div>
														                </div>
														            </c:forEach>
					                                            </div>
					                                        </div>
					                                	</div>    
						                            </div>
						                        </div>
						                    </div>
						                </div>
						            </div>
						            <div class="modal-footer">
						                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						            </div>
						        </div>
						    </div>
						</div>
		            </div>
		            
		            <!-- Modal6 : 주문 확인 하기 -->
					<div class="modal fade" id="readOrderDetailModal" data-bs-backdrop="static" aria-hidden="true" tabindex="-1">
					    <div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable">
					        <div class="modal-content">
					            <div class="modal-header">
					                <h5 class="modal-title">주문 확인</h5>
					                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					            </div>
					            <div class="modal-body container-md px-4">
					                <div class="container-fluid">
					                    <div class="row">
					                        <div class="col">
					                        
					                            <!-- 누구에게 어떤 카테고리의 스타일을 요청하는지 확인 문구 -->
					                            <div class="row mb-2">
					                                <div class="col">
					                                	<div class="row">
					                                		<div class="col-3">
							                                	<img id="orderDetailProfileBox" class="rounded-circle" src="../resources/img/noneProfileImg.jpg">
					                                		</div>
					                                		<div class="col align-self-center">
							                                    <h5 id="orderDetailNameBox"> </h5>
							                                    <h6> 님으로부터</h6>
							                                    <h5 id="orderDetailCategoryBox">"" </h5>
							                                    <h6> 의 스타일링을 요청 받았습니다 !</h6>
					                                		</div>
					                                	</div>
					                                </div>
					                                <div class="col-4 align-self-center">
					                                    <div class="row">
					                                        <div class="col text-center">
					                                            <h5> 현재 상태 </h5>										
					                                        </div>
					                                        <div class="col text-center">
					                                        	<h5 id="orderDetailStateBox"> 에러 </h5>
					                                        </div>
					                                    </div>
					                                    <div class="row">
					                                        <div class="col text-center">
					                                            <span> 요청 일자 </span>										
					                                        </div>
					                                        <div class="col text-center">
					                                            <span id="orderDetailDateBox"></span>										
					                                        </div>
					                                    </div>
					                                    <div class="row">
					                                        <div class="col text-center">
					                                            <span> 요청 비용 </span>										
					                                        </div>
					                                        <div class="col text-center">
					                                            <span id="orderDetailPriceBox" class="money"> </span>										
					                                        </div>
					                                    </div>
					                                 </div>
					                            </div>
					                            <hr>
					                            <!-- 스타일리스트 프로필사진//스타일리스트 닉네임/카테고리/태그 -->
			                                    <!-- 유저 스펙 -->
			                                    <div class="row bg-secondary text-white text-center my-3">
			                                    	<div class="col" style="border-right: 1px #fff solid;">
			                                    		<h5> 신체 정보 </h5>
			                                    	</div>
			                                    	<div class="col-6">
			                                    		<h5> 요구 사항 </h5>
			                                    	</div>
			                                    </div>
					                            <div class="row">
					                                <div class = "col text-center" style="border-right: 1px #000 solid;">
					                                    <div class="row">
					                                        <div class = "col-7 text-center" style="align-self: center;">
					                                            <img class="img-fluid center-block" src="../resources/img/orderSize.jpg">
					                                        </div>
					                                        <div class="col-5 fs-7" style="align-self: center;">
					                                            <div class="row" >
					                                                <div class="col-5 text-center">
					                                                    <span>신장 :</span>
					                                                </div>
					                                                <div class="col text-center">
					                                                    <span id="orderDetailHeigthBox"></span>
					                                                </div>
					                                            </div>
					                                            <div class="row">
					                                                <div class="col-5 text-center">
					                                                    <span>체중 :</span>
					                                                </div>
					                                                <div class="col text-center">
					                                                    <span id="orderDetailWeightBox"></span>
					                                                </div>
					                                            </div>
					                                            <div class="row">
					                                                <div class="col-5 text-center">
					                                                    <span>상의 :</span>
					                                                </div>
					                                                <div class="col text-center">
					                                                    <span id="orderDetailTopBox"></span>
					                                                </div>
					                                            </div>
					                                            <div class="row">
					                                                <div class="col-5 text-center">
					                                                    <span>하의 :</span>
					                                                </div>
					                                                <div class="col text-center">
					                                                    <span id="orderDetailBottomBox"></span>
					                                                </div>
					                                            </div>
					                                            <div class="row">
					                                                <div class="col-5 text-center">
					                                                    <span>신발 :</span>
					                                                </div>
					                                                <div class="col text-center">
					                                                    <span id="orderDetailShoesBox"></span>
					                                                </div>
					                                            </div>
					                                        </div>
					                                    </div>
					                                </div>
					                                <div class="col-6">
					                                    <!-- 요청사항 기재 -->
					                                    <div class="row">
					                                        <div id="orderDetailContentBox" class="col">
					                                        
					                                        </div>
					                                    </div>
					                                </div>
					                            </div>
					                            
					                            
					                            <!-- 요청 사항 파일첨부 -->
					                            <div class="row bg-secondary text-white my-3">
			                                    	<div class="col">
			                                    		<h5> 참고사진 </h5>
			                                    	</div>
					                            </div>
					                            <div class="row">
					                                <div class="col">
					                                	<div id="orderDetailOrderFileBox" class="row">
					                                	</div>
					                                </div>
					                            </div>
					                            
					                            <!-- 회신상자 -->
					                            <div class="row">
					                            	<div class="col closestPoint">
					                            	</div>
					                            </div>
					                            
					                            
					                            
					                        </div>
					                    </div>
					
					                </div>
					            </div>
					            <div class="modal-footer">
					                <button class="btn btn-primary" onclick="storeModalInfo(${sessionMemberInfo.member_no})" data-bs-target="#storeModal" data-bs-toggle="modal"
					                    data-bs-dismiss="modal"> 이전 </button>
					            </div>
					        </div>
					    </div>
					</div>
		            
		            <!-- Modal7 : Response Detail -->
					<div class="modal fade" id="responseResultModal" data-bs-backdrop="static" aria-hidden="true" tabindex="-1">
					    <div class="modal-dialog modal-dialog-scrollable modal-lg">
					        <div class="modal-content">
					            <div class="modal-header">
					                <h5 class="modal-title"> 스타일링 </h5>
					                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					            </div>
					            <div class="modal-body ms-3">
					                <div class="row">
					                    <div class="col">
					                        <!-- 누구에게 어떤 카테고리의 스타일을 요청하는지 확인 문구 -->
					                        <div class="row mb-2">
					                            <div class="col">
					                                <div class="row">
					                                    <div class="col-3">
					                                        <img id="responseProfileBox" class="rounded-circle"
					                                            src="../resources/img/noneProfileImg.jpg">
					                                    </div>
					                                    <div class="col align-self-center">
					                                        <h5 id="responseNameBox"> </h5>
					                                        <h6> 님으로부터</h6>
					                                        <h5 id="responseCategoryBox">"" </h5>
					                                        <h6> 의 스타일링을 회신 받았습니다 !</h6>
					                                    </div>
					                                </div>
					                            </div>
					                            <div class="col-4 align-self-center">
					                                <div class="row">
					                                    <div class="col text-center">
					                                        <span> 회신 일자 </span>
					                                    </div>
					                                    <div class="col text-center">
					                                        <span id="responseDateBox"></span>
					                                    </div>
					                                </div>
					                                <div class="row">
					                                    <div class="col text-center">
					                                        <span> 요청 일자 </span>
					                                    </div>
					                                    <div class="col text-center">
					                                        <span id="orderDetailDateBox"></span>
					                                    </div>
					                                </div>
					                                <div class="row">
					                                    <div class="col text-center">
					                                        <span> 요청 비용 </span>
					                                    </div>
					                                    <div class="col text-center">
					                                        <span id="orderDetailPriceBox" class="money"> </span>
					                                    </div>
					                                </div>
					                            </div>
					                        </div>
					                        <hr>
					                        <!-- 회신 타이틀 -->
					                        <div class="row bg-secondary text-white my-3">
					                        	<div class="col"> 
					                        		<h5> 스타일링 </h5>
					                        	</div>
					                        </div>
					                        <!-- 회신 본문 -->
					                        <div class="row">
					                            <!-- 회신 카드 캐러셀 -->
					                            <div class="col">
					                            	<div class="row">
					                            		<div id="responseMainImgBox" class="col">
					                            			
					                            		</div>
					                            	</div>
					                            	<div class="row my-2">
					                                    <div class="col">
					                                        <div id="responseCarousel" class="carousel carousel-dark slide carousel-thumbs" data-ride="carousel">
					                                        
					                                        </div>
					                                    </div>
					                                </div>
					                            </div>
					                            <!-- 회신 멘트 -->
					                            <div id="responseContent" class="col">
					
					                            </div>
					                        </div>
					                        <!-- 리뷰 랜더링 영역 -->
					                        <div class="row">
					                            <div class="col reviewTarget"> 
					                                
					                            </div>
					                        </div>
					                    </div>
					                </div>
					            </div>
					            <div id="responseModalButtonBox" class="modal-footer">
					                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">이전</button>
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