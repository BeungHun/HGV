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


    </style>
    <!-- Jquery 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="../resources/js/moneyPattern.js"></script>
    <script>
	    


    </script>
</head>

<body>
    <div style="width : 1200px; margin: 0 auto">
        <div class="container-fluid">
        	<jsp:include page="../commons/header.jsp"></jsp:include>
            <div class="row">
                <div class="col">
                	<!-- 결제 페이지 타이틀 -->
                	<div class="row">
                		<div class="col">
                			<h2> 결제 페이지 </h2>
                		</div>
                	</div>
                	<!-- 본문 -->
                	<div class="row">
                		<!-- 스타일리스트 정보 -->
                		<div class="col">
                			<!-- 선택한 스타일리스트 카테고리 --> 
                			<div class= "row">
                				<div class="col">
									<span> 선택한 스타일 카테고리 </span>                					
                				</div>
                				<div class="col">
									<span> 선택한 스타일 카테고리 </span>                					
                				</div>
                			</div>
                			<!-- 선택한 스타일리스트 프로필 --> 
                			<div class= "row">
                				<div class="col">
									<c:choose>
		                				<c:when test="${memberVo.member_profileimage_link == null}">
			                				<img id = "mainPageProfileImg" class="img-fluid center-block" src="../resources/img/noneProfileImg.jpg">
		                				</c:when>
		                				<c:otherwise>
		                					<img id = "mainPageProfileImg" class="img-fluid center-block" src="/uploadFiles/${memberVo.member_profileimage_link}">
		                				</c:otherwise>
		               				</c:choose>                					
                				</div>
                			</div>
                		</div>
                		<!-- 예약 정보 -->
                		<div class="col">
                			<!-- 예약정보 타이틀 -->
                			<div class = "row">
                				<div class = "col">
                					<h4> 예약정보</h4>
                				</div>
                			</div>
                			<!-- 날짜 -->
                			<div class = "row">
                				<div class = "col">
                					날짜 : 날짜(이거도 암튼 API 있을텐데)
                				</div>
                			</div>
                			<!-- 예약정보 : 사이즈 -->
                			<div class = "row">
                				<div class = "col">
	               					<table class="table">
									    <tr>
										    <th scope="row">신장</th>
										    <td> ${orderVo.order_heigth }</td>
									    </tr>							  	
									    <tr>
										    <th scope="row">체중</th>
										    <td> ${orderVo.order_weight }</td>
									    </tr>							  	
									    <tr>
										    <th scope="row">상의</th>
										    <td> ${orderVo.order_top }</td>
									    </tr>							  	
									    <tr>
										    <th scope="row">하의</th>
										    <td> ${orderVo.order_bottom }</td>
									    </tr>							  	
									    <tr>
										    <th scope="row">신발</th>
										    <td> ${orderVo.order_shoes }</td>
									    </tr>							  	
									</table>	
                				</div>
                			</div>
                			<!-- 예약정보 : 컨텐트 -->
                			<div class = "row">
                				<div class = "col">
									<span>${orderVo.order_content }</span>	               						
                				</div>
                			</div>
                			<!-- 적립금 -->
                			<div class = "row">
                				<div class = "col">
                					<table class="table">
									    <tr>
										    <th scope="row">요청 가격</th>
										    <td> <span class="money">${orderVo.order_saleprice }</span></td>
									    </tr>							  	
									    <tr>
										    <th scope="row">보유 적립금</th>
										    <td> <span class="money">${sessionMemberInfo.member_cash }</span></td>
									    </tr>							  	
									    <tr>
										    <th scope="row">차액</th>
										    <td> 
										    	<c:choose>
										    		<c:when test="${orderVo.order_saleprice > sessionMemberInfo.member_cash}">
										    			<span class="money">${orderVo.order_saleprice - sessionMemberInfo.member_cash}</span>
										    		</c:when>
										    		<c:otherwise>
										    			<span class="money">${sessionMemberInfo.member_cash - orderVo.order_saleprice}</span>
										    		</c:otherwise>
										    	</c:choose>
										    </td>
									    </tr>							  	
									</table>
                				</div>
                			</div>
                			<!-- 결제/취소 버튼 -->
                			<div class = "row">
                				<div class = "col d-grid">
                					<a href="../user/orderPage?stylist_card_no=${orderVo.stylist_card_no }" class="btn btn-success"> 취소하기 </a>
                				</div>
                				<div class = "col d-grid">
                					<c:choose>
							    		<c:when test="${orderVo.order_saleprice > sessionMemberInfo.member_cash}">
							    			<a href="#" class="btn btn-success"> 충전하기 </a>
							    		</c:when>
							    		<c:otherwise>
							    			<form action="./orderProcess" method="post">
							    				<div class="d-grid">
				                					<input type="hidden" name="stylist_card_no" value="${orderVo.stylist_card_no }">
				                					<input type="hidden" name="order_heigth" value="${orderVo.order_heigth }">
				                					<input type="hidden" name="order_weight" value="${orderVo.order_weight }">
				                					<input type="hidden" name="order_top" value="${orderVo.order_top }">
				                					<input type="hidden" name="order_bottom" value="${orderVo.order_bottom }">
				                					<input type="hidden" name="order_shoes" value="${orderVo.order_shoes }">
				                					<input type="hidden" name="order_content" value="${orderVo.order_content }">
						                			<input type="hidden" name="order_saleprice" value="${orderVo.order_saleprice }">
						                			<button class="btn btn-success"> 결제하기 </button>
							    				</div>
		                					</form>
							    		</c:otherwise>
							    	</c:choose>
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