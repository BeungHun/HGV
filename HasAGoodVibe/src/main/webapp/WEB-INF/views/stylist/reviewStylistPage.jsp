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

     
    <style>
         #logo_img{
        	height: 100px;
            width: 160px;
            object-fit: cover;
		}


    </style>
    <!-- Jquery 파일 로드 ::: 웹에 짜여진 자바스크립트 코드   -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
    /* 프로필 사진 AJAX 
		function refreshMemberProfileImg(){
			var xhr = new XMLHttpRequest(); //AJAX 객체 생성
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
					
					var memberPofileImgBox = document.getElementById("memberPofileImg");
					memberPofileImgBox.innerHTML = "";
					
					var memberPofileImgBox = document.createElement("div");
					memberPofileImgBox.classList.add("col");
					memberPofileImgBox.classList.add("d-grid");
					
					var imgBox = document.createElement("img");
					if(${sessionMemberInfo.member_profileimage_link == null}){
						imgBox.src="../resources/img/noneProfileImg.jpg";
					}else{
						imgBox.src="${sessionMemberInfo.member_profileimage_link}";
					}
					memberPofileImgBox.appendChild(imgBox);
					
					if(){
						var imgFormBox = document.createElement("form");
						imgFormBox.setAttribute("action","../member/updateProfileImg");
						imgFormBox.setAttribute("method","post");
						imgFormBox.setAttribute("enctype","multipart/form-data");
						memberPofileImgBox.appendChild(imgFormBox);
						
						var imgInputBox = document.createElement("input");
						imgInputBox.setAttribute("type","file");
						imgInputBox.setAttribute("name","file");
						imgInputBox.setAttribute("accept","image/*");
						imgFormBox.appendChild(imgInputBox);
						
						var updateCancelBox = document.createElement("a");
						updateCancelBox.classList.add("btn");
						updateCancelBox.classList.add("btn-success");
						updateCancelBox.setAttribute("onclick","#");
						updateCancelBox.innerText = "취소";
						imgFormBox.appendChild(updateCancelBox);
						
						var updateConfirmBox = document.createElement("a");
						updateConfirmBox.classList.add("btn");
						updateConfirmBox.classList.add("btn-success");
						updateConfirmBox.setAttribute("onclick","#");
						updateConfirmBox.innerText = "완료";
						imgFormBox.appendChild(updateConfirmBox);
					}else{
						var updatebuttonBox = document.createElement("botton");
						updatebuttonBox.classList.add("btn");
						updatebuttonBox.classList.add("success");
						updatebuttonBox.setAttribute("onclick", "#");
						updatebuttonBox.innerText = "수정";
						memberPofileImgBox.appendChild(updatebuttonBox);
					}
				}
			}
			xhr.open("post" , "./updateProfileImg); //리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
			xhr.send(); //AJAX로 리퀘스트함..		
		}
	 */
	 
	 	function completeUpdateProfileImg() {
	 		updateImgFrm.submit();
		}
	 
    </script>
</head>

<body>
    <div style="width : 1200px; margin: 0 auto">
        <div class="container-fluid">
        	<jsp:include page="../commons/header.jsp"></jsp:include>
            <div class="row">
                <jsp:include page="../commons/stylistMyPageSideNav.jsp"></jsp:include>
                <div class="col-8">여기는 리뷰페이지 입니다.
                	<div class="row">
                		<div class="col">
                			<h4>리뷰 내역</h4>
                		</div>                		               	
                	</div>  
                	<div class="row">
                		<div class="col">
                			등록된 리뷰
                		</div>                		               	
                	</div>   
                	<!-- 등록된 리뷰 이미지, 이미지는 바꿔야함 -->
                	<div class="row">
                		<div class="col">
                			<img alt="" src="/uploadFiles/${sessionMemberInfo.member_profileimage_link}">
                		</div>  
                		<div class="col-8">
                			별점<br>
                			상품정보<br>
                			스타일리스트 닉네임<br>
                			댄디<br>
                			20,000원
                		</div>
                		
                	</div>
                		
                	<div class="row">
                		<div class="col">
                			<img alt="" src="/uploadFiles/${sessionMemberInfo.member_profileimage_link}">
                		</div>  
                		<div class="col-8">
                			별점<br>
                			상품정보<br>
                			스타일리스트 닉네임<br>
                			캐쥬얼<br>
                			30,000원
                		</div>
                		
                	</div>
                	
                	<div class="row">
                		<div class="col">
                			<img alt="" src="/uploadFiles/${sessionMemberInfo.member_profileimage_link}">
                		</div>  
                		<div class="col-8">
                			별점<br>
                			상품정보<br>
                			스타일리스트 닉네임<br>
                			미니멀<br>
                			40,000원
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