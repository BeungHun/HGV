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

     <!-- 외부 css 로드  -->
	<link rel="stylesheet" type="text/css" href="../resources/css/common.css">
     
    <style>
         #logo_img{
        	height: 100px;
            width: 160px;
            object-fit: cover;
		}
		
		#stylistRequestPageProfileImg{
			height: 150px;
            width: 100px;
            object-fit: cover;  
            margin: auto 0;        
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
                <jsp:include page="../commons/stylistMyPageSideNav.jsp"></jsp:include>
                <div class="col-8">여기는 스타일리스트 요청내역입니다.
            		<!-- 타이틀 -->
                	<div class="row">
                		<div class="col">
             				<h3> 요청받은 내역 </h3>
             			</div>
             		</div>
             		<!-- 리스트  -->
                	<div class="row">
               			<div class="col">
               				<table class="table">
							  <thead>
							    <tr class = "text-center">
							      <th scope="col">요청 번호</th>
							      <th scope="col">유저</th>
							      <th scope="col">닉네임</th>
							      <th scope="col">요청 카테고리</th>
							      <th scope="col">주문 일자</th>
							      <th scope="col">주문 금액</th>
							      <th scope="col">주문 상태</th>
							      <th scope="col">바로 가기</th>
							    </tr>
							  </thead>
							  <tbody>
							  	<c:forEach items="${dataList }" var="data" varStatus="status"> 
								    <tr class = "text-center">
								      <td> ${fn:length(dataList) - status.index} </td>
								      <td>
								      	<c:choose>
			                				<c:when test="${data.memberVo.member_profileimage_link == null}">
				                				<img id = "stylistRequestPageProfileImg" class="img-fluid center-block" src="../resources/img/noneProfileImg.jpg">
			                				</c:when>
			                				<c:otherwise>
			                					<img id = "stylistRequestPageProfileImg" class="img-fluid center-block" src="/uploadFiles/${data.memberVo.member_profileimage_link}">
			                				</c:otherwise>
		               					</c:choose>
								      </td>
								      <td><a href="#">${data.memberVo.member_nick }</a></td>
								      <td><span>${data.card_category_name }</span></td>
								      <td><fmt:formatDate value="${data.orderVo.order_date}" pattern="yy.MM.dd"/></td>
								      <td class="money">${data.orderVo.order_saleprice }</td>
								      <c:choose>
								      	<c:when test="${data.orderVo.order_state eq 'order'}">
									      <td><span>요청 중</span></td>
									      <td><a href="./orderDetailPage?order_no=${data.orderVo.order_no}">상세보기</a></td>
								      	</c:when>
								      	<c:when test="${data.orderVo.order_state eq 'reject'}">
									      <td><span>거절됨</span></td>
									      <td><a href="./orderDetailPage?order_no=${data.orderVo.order_no}">상세보기</a></td>
								      	</c:when>
								      	<c:when test="${data.orderVo.order_state eq 'accept'}">
									      <td><span>진행 중</span></td>
									      <td><a href="./orderDetailPage?order_no=${data.orderVo.order_no}">상세보기</a></td>
								      	</c:when>
								      	<c:when test="${data.orderVo.order_state eq 'answer'}">
									      <td><span>답변 완료</span></td>
									      <td><a href="../member/stylingResponeseCard?order_no=${data.orderVo.order_no}">보낸 답변보기</a></td>
								      	</c:when>
								      	<c:when test="${data.orderVo.order_state eq 'complete'}">
									      <td><span>리뷰 완료</span></td>
									      <td><a href="../member/readStylistCard?stylist_card_no=${data.stylist_CardVo.stylist_card_no}">리뷰 보러가기</a></td>
								      	</c:when>
								      	<c:otherwise>
								      	  <td><span> 에러 </span></td>
								      	</c:otherwise>
								      </c:choose>
								    </tr>
								    
								    
								    
								    
								    
								    
								</c:forEach>
							  </tbody>
							</table>
                		</div>
                	</div>
                </div>
                <!-- 광고 영역 -->
                <div class="col">ad 영역 ..?
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