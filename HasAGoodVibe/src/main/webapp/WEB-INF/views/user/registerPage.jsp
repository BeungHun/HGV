<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" href="../resources/css/common.css">
	
    <style>
        .signUp_box{
    		max-width: 1000px;
    	}
    	
    	#signUp_user_info span {
    		text-align: center;
    	}


    </style>
    <!-- Jquery 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    const date_yy = new Date();
    
    function doSubmit(){
    	const signUp_user_info = document.getElementById("signUp_user_info");
		const idInput = document.getElementById("id");
		
		if(isChecked == false){
			alert("id 중복확인을 하셔야 합니다");
			idInput.focus();
			return;
		}
		//signUp_user_info.submit();
    }
    
	var isChecked = false;
	
	
	function checkId(){
		var idValue = document.getElementById("id").value;
		
		//ajax호출
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
					
					//rendering 및 추가 화면 로직
					var checkIdAlertBox = document.getElementById("checkIdAlert");
					if(result.data == true){
						isChecked = false;
						checkIdAlertBox.innerText = "존재하는 아이디 입니다.";
						checkIdAlertBox.classList.remove("text-success");
						checkIdAlertBox.classList.add("text-danger");
						checkIdAlertBox.classList.add("col-4")
					}else{
						isChecked = true;
						checkIdAlertBox.innerText = "사용 가능한 아이디 입니다.";
						checkIdAlertBox.classList.remove("text-danger");
						checkIdAlertBox.classList.add("text-success");
						checkIdAlertBox.classList.add("col-4")
					}
					
					
				}
			}
			
			xhr.open("get" , "./isExistId?member_id=" + idValue); //리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xhr.send(); 
	}
    
	function checkPw(){
		var pwValue = document.getElementById("pw").value;
		var pwValue2 = document.getElementById("pw2").value;
		
					
					//rendering 및 추가 화면 로직
					var checkPwAlertBox = document.getElementById("checkPwAlert");
					if(pwValue != pwValue2){
						isChecked = false;
						checkPwAlertBox.innerText = "비밀번호가 일치하지 않습니다.";
						checkPwAlertBox.classList.remove("text-success");
						checkPwAlertBox.classList.add("text-danger");
						checkPwAlertBox.classList.add("col-4")
					}else{
						isChecked = true;
						checkPwAlertBox.innerText = "비밀번호가 일치합니다.";
						checkPwAlertBox.classList.remove("text-danger");
						checkPwAlertBox.classList.add("text-success");
						checkPwAlertBox.classList.add("col-4")
					}

	}
	
	
    
    // On blur 후 주소 담기 
    function detailAddressWrite(){
    	
    	
    	//document.getElementById("userAddress").value = 
    	
    }
    
    // 다음 주소 API 
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	</script>
</head>

<body>
    <div style="width : 1200px; margin: 0 auto">
        <div class="container-fluid">
            <div class="row p-3">
            	<div class="col"></div>
                <div class="col-7 main_content signUp_box p-3">
                	 <!-- 로고 및 타이틀 -->
		           	<div class="row py-3">
                		<div class="col">
                			<i class="bi bi-emoji-laughing"></i>
                			<span> Has a Good Vibes </span>
                		</div>
                	</div>
                	<!-- 회원가입 타이틀 -->
					<div class="row py-2">
						<div class="col-1"></div>
                		<div class="col d-grid" style="justify-content:center;">
                			<img src="../resources/img/HGV_banner.png" width="500px" height="500px">
                		</div>
                	</div>
		            <!-- 회원가입 인적사항 -->
		            <form id = "signUp_user_info" action="./registerProcess" method="get">
		            	<!-- 아이디 -->
			            <div class="row align-items-center">
			            	<div class= "col-3 text-center">
			            		<span class = ""> 아이디 </span>
			            	</div>
			                <div class="col d-grid form-control-lg">
			                	<input id="id" name="member_id" type="text" onblur="checkId()"> 
			                </div>
			                <br>			    
			            <div id="checkIdAlert"></div>
			            </div>
			            <!-- 패스워드 -->
			            <div class="row align-items-center">
			            	<div class= "col-3 text-center">
			            		<span class = ""> 비밀번호 </span>
			            	</div>
			                <div class="col d-grid form-control-lg">
			                	<input id="pw" name="member_pw" type="password"> 
			                </div>
			            </div>
			            <!-- 패스워드 확인-->
			            <div class="row align-items-center">
			            	<div class= "col-3 text-center">
			            		<span class = "">비밀번호 확인</span>
			            	</div>
			                <div class="col d-grid form-control-lg">
			                	<input id="pw2" name="member_pw_confirm" type="password" onblur="checkPw()"> 
			                </div>
			                <br>
			                <div id="checkPwAlert"></div>
			            </div>
			            <!-- 닉네임 -->
			            <div class="row align-items-center">
			            	<div class= "col-3 text-center">
			            		<span class = ""> 닉네임 </span>
			            	</div>
			                <div class="col d-grid form-control-lg">
			                	<input name="member_nick" type="text"> 
			                </div>
			            </div>
			             <!-- 이메일 -->
			            <div class="row align-items-center">
			            	<div class= "col-3 text-center">
			            		<span class = ""> 이메일 </span>
			            	</div>
			                <div class="col d-grid form-control-lg">
			                	<input type="email"> 
			                </div>
			            </div>
			            <!-- 생년월일 -->
			            <div class="row align-items-center">
			            	<div class= "col-3 text-center">
			            		<span class = ""> 생년월일 </span>
			            	</div>
			                <div class="col d-grid form-control-lg">
			                	<select class="" id="inputBirth_yy">
			                		<option selected="selected" value="non_select">선택</option>
			                		<%for(int i=2022; i>1922; i--){ %>
										<option value="<%=i%>"><%=i %>년</option>
									<%} %>
			                	</select> 
			                </div>
			                <div class="col d-grid form-control-lg">
			                	<select class="" id="inputBirth_MM">
			                		<option selected="selected" value="non_select">선택</option>
			                		<%for(int i=1; i<13; i++){ %>
										<option value="<%=i%>"><%=i %>월</option>
									<%} %>
			                	</select> 
			                </div>
			                <div class="col d-grid form-control-lg">
			                	<select class="" id="inputBirth_dd">
			                		<option selected="selected" value="non_select">선택</option>
									<%for(int i=1; i<32; i++){ %>
										<option value="<%=i%>"><%=i %>일</option>
									<%} %>
			                	</select> 
			                </div>
			            </div>
			            <!-- 성별 -->
			            <div class="row align-items-center">
			            	<div class= "col-3 text-center">
			            		<span class = ""> 성별 </span>
			            	</div>
			                <div class="col form-control-lg">
			                	<select>
			                		<option selected="selected" value="non_select">선택</option>
			                		<option value = "M"> 남자 
			                		<option value = "F"> 여자 
			                	</select> 
			                </div>
			            </div>
			            <!-- 연락처 -->
			            <div class="row align-items-center">
			            	<div class= "col-3 text-center">
			            		<span class = ""> 연락처 </span>
			            	</div>
			                <div class="col d-grid form-control-lg">
			                	<input type="text"> 
			                </div>
			            </div>
			            <!-- 키 -->
			            <div class="row align-items-center">
			            	<div class= "col-3 text-center">
			            		<span class = ""> 키 </span>
			            	</div>
			                <div class="col d-grid form-control-lg">
			                	<input name="user_heigth" type="text"> 
			                </div>
			            </div>
			            <!-- 몸무게 -->
			            <div class="row align-items-center">
			            	<div class= "col-3 text-center">
			            		<span class = ""> 몸무게 </span>
			            	</div>
			                <div class="col d-grid form-control-lg">
			                	<input name="user_weight" type="text"> 
			                </div>
			            </div>
			            <!-- 상의 -->
			            <div class="row align-items-center">
			            	<div class= "col-3 text-center">
			            		<span class = ""> 상의 </span>
			            	</div>
			                <div class="col d-grid form-control-lg">
			                	<input name="user_top" type="text"> 
			                </div>
			            </div>
			            <!-- 하의 -->
			            <div class="row align-items-center">
			            	<div class= "col-3 text-center">
			            		<span class = ""> 하의 </span>
			            	</div>
			                <div class="col d-grid form-control-lg">
			                	<input name="user_bottom" type="text"> 
			                </div>
			            </div>
			            <!-- 신발 -->
			            <div class="row align-items-center">
			            	<div class= "col-3 text-center">
			            		<span class = ""> 신발 </span>
			            	</div>
			                <div class="col d-grid form-control-lg">
			                	<input name="user_shoes" type="text"> 
			                </div>
			            </div>
			            
			           
			            
			            
<!-- 잠시동안 테스트 용으로 주석처리 -->
			            
			            <%--
			            <!-- 주소 -->
			            <div class="row">
			            	<div class= "col-2 text-center">
			            		<span class = ""> 주소 </span>
			            	</div>
			                <div class="col form-control-lg">
		                		<input type="text" id="sample6_postcode" placeholder="우편번호">
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
								<div class = "d-grid">
									<input type="text" id="sample6_address" placeholder="주소">
									<input onblur = "detailAddressWrite()" type="text" id="sample6_detailAddress" placeholder="상세주소">
								</div>
								<input type="hidden" id="sample6_extraAddress">
								<input type="hidden" id="userAddress">
			                </div>
			            </div> --%>

<!-- 잠시동안 테스트 용으로 주석처리 끝-->

			            <!-- 회원가입 버튼 -->
			            <div class="row">
			                <div class="col d-grid">
			                	<button class="btn btn-success" type="submit" onclick="doSubmit">회원가입</button>
			                </div>
			            </div>
		            </form>
		            <!-- 홈페이지 설명문 -->
		            <div class="row">
		                <div class="col">
		                </div>
		            </div>
                </div>
            	<div class="col"></div>
            </div> <!-- row -->
        </div>
    </div>
<!-- bootstrap_ICON 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
    crossorigin="anonymous"></script>
</body>

</html>