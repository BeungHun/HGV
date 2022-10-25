<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>

<head>
	<meta charset="utf-8">
	<title>타이틀을 적어주세요 !</title>
	<!-- bootstrap 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

<!-- bootstrap_ICON 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

<!-- 외부 css 로드  -->
<link rel="stylesheet" type="text/css" href="../resources/css/commons.css">
<link rel="stylesheet" type="text/css" href="../resources/css/mainPage.css">
<style>
#logo_img {
	height: 100px;
	width: 160px;
	object-fit: cover;
}

#mainPageProfileImg {
	height: 300px;
	width: 200px;
	object-fit: cover;
	margin: auto 0;
}

#inputGroup-sizing-default{
	background: white;
}

body {
          background-image: linear-gradient(
              rgba(0, 0, 0, 0.8),
              rgba(0, 0, 0, 0.8)
              ), url("../resources/img/projectimg(1).png");
          background-size: cover;
          color: #fff;
 
        }
</style>
<!-- Jquery 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
</head>

<body>
	<div style="width: 1200px; margin: 0 auto">
		<div class="container-fluid">
			<jsp:include page="../commons/header.jsp"></jsp:include>
			<div class="row">
				<div class="col-1"></div>
				<form action="../randomBox/randomBoxOrderProcess" method="post">
				<div class="col">
					
	<!---------------------------------이미지 시작  ---------------------------------->
					<div class="row">
						<div class="col-6 mt-4">								
							<div class="row">
								<div class="col">
								<c:choose>
			             			<c:when test="${randomBoxdata.memberVo.member_profileimage_link == null}">
			       						<img class="img-fluid center-block" src="../resources/img/noneProfileImg.jpg">
			              			</c:when>
			              			<c:otherwise>
			              				<img class="img-fluid center-block" src="/uploadFiles/${randomBoxdata.memberVo.member_profileimage_link}"
			              				style="width:30em; height:35em" >
			              			</c:otherwise>
			             		</c:choose>
								</div>
							</div>
						</div>
						
<!---------------------------------카드부분 끝  ---------------------------------->
<!---------------------------------유저 바디스팩  ---------------------------------->
						<div class="col mt-1">
							<div class="row">
								<div class="col">
									<div class="row">
										<div class="col mt-4">
											<h3>RandomBox 구매</h3>
										</div>
									</div>
									<div class="row">
										<div class="col mb-1">
											<hr class="my-1">
											<h1 class="display-1"></h1>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<small>Stylist Info</small>
										</div>
									</div>
									<div class="row">
										<div class="col-4">
											<h5>판매자</h5>
										</div>
										<div class="col">
											<i class="bi bi-person"></i> ${randomBoxdata.memberVo.member_nick }
										</div>
									</div>
									<div class="row">
										<div class="col-4">
											<h5>카테고리</h5>
										</div>
										<div class="col">
											${randomBoxdata.randomBoxVo.randomBox_category}
										</div>
									</div>
									<div class="row">
										<div class="col mb-1">
											<hr class="my-1">
											<h1 class="display-1"></h1>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col">
								<div class="row">
									<div class="col">
										<small>Customer Info</small>
									</div>
								</div>
								<div class="row">
									<div class="col-3">
										<div class="input-group mb-1">
											<span class="input-group-text" id="inputGroup-sizing-default">신장 </span> 
											<input name="randomBoxOrder_heigth" type="text" class="form-control" aria-label="Sizing example input"
											aria-describedby="inputGroup-sizing-default" value="${sessionUserInfo.user_heigth }">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-3">
										<div class="input-group mb-1">
											<span class="input-group-text" id="inputGroup-sizing-default">체중 </span> 
											<input name="randomBoxOrder_weight" type="text" class="form-control" aria-label="Sizing example input"
												aria-describedby="inputGroup-sizing-default" value="${sessionUserInfo.user_weight }">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-3">
										<div class="input-group mb-1">
											<span class="input-group-text" id="inputGroup-sizing-default">
												상의 </span> <input name="randomBoxOrder_top" type="text" class="form-control"
												aria-label="Sizing example input"
												aria-describedby="inputGroup-sizing-default"
												value="${sessionUserInfo.user_top }">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-3">
										<div class="input-group mb-1">
											<span class="input-group-text" id="inputGroup-sizing-default">
												하의 </span> <input name="randomBoxOrder_bottom" type="text"
												class="form-control" aria-label="Sizing example input"
												aria-describedby="inputGroup-sizing-default"
												value="${sessionUserInfo.user_bottom }">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-3">
										<div class="input-group mb-1">
											<span class="input-group-text" id="inputGroup-sizing-default">
												신발 </span> <input name="randomBoxOrder_shoes" type="text"
												class="form-control" aria-label="Sizing example input"
												aria-describedby="inputGroup-sizing-default"
												value="${sessionUserInfo.user_shoes }">
										</div>
									</div>
								</div>
							
									<div class="row">
										<hr class="my-1">
	       								<h1 class="display-1"></h1>
										<div class="col"><small>Delivery Info</small></div>
									</div>
									<div class="row">
										<div class="col">출고 정보 </div>
										<div class="col"><small>결제 3일 이내 출고</small></div>
									</div>
									<div class="row">
										<div class="col">배송정보 </div>
										<div class="col"><small>HGV통운</small></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				
		<!---------------------------------유저바디스팩끝  ---------------------------------->
		<!-- -------------------------------요청사항 ------------------------------------ -->
					<div class="row">
						<div class="col mt-4 mb-4">
							<div class="form-floating">
								<textarea name="randomBoxOrder_content" class="form-control"
									placeholder="Leave a comment here" id="floatingTextarea2"
									style="height: 100px"></textarea>
								<label for="floatingTextarea2">요청사항</label>
							</div>
						</div>
					</div>
		<!-- -------------------------------요청사항끝  ------------------------------------ -->
			<!-------------------------------우편api---------------------------------->
					<div class="row">
						<div class="col">
							<div class="row">
								<div class="col mb-2">	<hr class="my-1">
	       						<h1 class="display-1"></h1></div>
							</div>
							<div class="row">
								<div class="col mb-2"><h4>주소</h4></div>
							</div>
							<div class="row">
								<div class="col-3 mb-2 mr-2">
									<input name="postcode" type="text" id="sample4_postcode" placeholder="우편번호">
								</div>
								<div class="col-3 mb-2 ml-2">
									<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
								</div>
							</div>	
							<div class="row">
								<div class="col-5 mb-2">
									<input name="roadAddress" type="text" id="sample4_roadAddress" placeholder="도로명주소" style="width:100%">
								</div>
								<div class="col-5 mb-2">
									<input name="jibunAddress" type="text" id="sample4_jibunAddress" placeholder="지번주소" style="width:100%">
									<span id="guide" style="color:#999;display:none"></span>
								</div>
							</div>		
							<div class="row">
								<div class="col-7 mb-2">
									<input name="detailAddress" type="text" id="sample4_detailAddress" placeholder="상세주소" style="width:100%">
								</div>
							</div>	
							<div class="row">
								<div class="col-7 mb-2">
									<input name="extraAddress" type="hidden" id="sample4_extraAddress" placeholder="참고항목">
								</div>
							</div>	
						</div>
					</div>
		<!-------------------------------우편api 끝---------------------------------->
		<!----------------------------- 취소/완료 버튼 ------------------------------->
					<div class="row">
						<div class="col">
							<div class="row">
								<div class="col mb-2">	<hr class="my-1">
	       						<h1 class="display-1"></h1></div>
							</div>
							<div class="row">
								<div class="col mr-3" style="text-align: right;">
									<h3>최종 결제금액</h3>	       						
									<h5 style="color: red">${randomBoxdata.randomBoxVo.randomBox_price}원</h5>
								</div>
							</div>
							<div class="row">
								<div class="col mb-2">	<hr class="my-1">
	       						<h1 class="display-1"></h1></div>
							</div>
							<div class="row">
								<!-- 완료 -->
								<div class="col-8"></div>
								<div class="col mb-4">
									<a href="./randomBoxListTotal">
									<span class="d-grid gap-2"><button type="submit" class="btn btn-outline-danger">결제</button></span></a>
								</div>
								<!-- 뒤로가기 -->
								<div class="col mb-4">
									<a href="./randomBoxReadPage?randomBox_no=${randomBoxdata.randomBoxVo.randomBox_no }">
									<span class="d-grid gap-2"><button type="button" class="btn btn-outline-danger">이전</button></span></a>
									
								</div>
							</div>	
						</div>
					</div>
				</div>
				<div class="col-1"></div>
				</form>
			</div>
		</div>
	</div>
	<!-- bootstrap_ICON 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
</body>

</html>