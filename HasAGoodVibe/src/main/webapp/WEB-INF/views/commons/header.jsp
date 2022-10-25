<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">
 <style>
 	a{
 		color: black;
 		text-decoration:none;
 	}
 	
 	body {
	    font-family:'Lato', sans-serif !important;
		font-size: 13pt;
	}
	
	.navbar_title{
		font-size: 1.7em;
		font-weight: bold;
		font-family:"Jua";
	}
	
	.navbar_item1{
		font-size:1.2em;
		font-weight:bold;
		text-align: right;
	}
	
	.text_right{
		text-align:right;
	}
	
	.navv{
		padding-top: 30px;
	}
	
 </style>
 
<!-- 헤더 -->
<!-- header 및 메뉴바 -->
<header class="container-fluid">
	<div class="row">
		<div class="col">
			<!-- Navigation -->
			<nav id="menu" class="navbar-expand navbar-fixed-top">
				<!-- 메뉴바 -->
				<div class="row nav navbar-nav container-fluid navv">
					<div class="col-4">
						<!-- 로고 이미지 -->
						<c:choose>
							<c:when test="${!empty sessionMemberInfo }">
								<a href="../member/mainPage" class="navbar_title align-self-center"><img src="../resources/img/logogo.png" style="width:30px; border-radius:5px; margin-bottom:5px;">&nbspHasAGoodVibe</a>
							</c:when>
							<c:otherwise>
								<a href="../member/index" class="navbar_title align-self-center"><img src="../resources/img/logogo.png" style="width:30px; border-radius:5px;">&nbspHasAGoodVibe</a>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="col text_right align-self-center navbar_item1" style="margin-left:250px;">
						<a href="../member/freeboard" class="page-scroll">자유게시판</a>
					</div>
					<div class="col text_right align-self-center">
						<div class="dropdown  navbar_item1">
						  	<a class="dropdown-toggle" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false" style="text-decoration-line: none; color:black;">
						    	고객센터
						  	</a>
						  	<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						    	<li><a class="dropdown-item" href="../board/notice">공지사항</a></li>
						    	<li><a class="dropdown-item" href="../board/FAQPage">FAQ</a></li>
						    	<li><a class="dropdown-item" href="../board/qAnda">Q&A</a></li>
						  	</ul>
						</div>
					</div>
					
					
					<div class="col-1 text-center align-self-center">
						<!-- 메세지 --> 
						<a class="" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight" style="font-size:1.5em;">
				            <i class="bi bi-envelope"></i>
				        </a>
					</div>
					<div class="col-1 text-center align-self-center">
						<!-- 로그인 및 회원가입 -->
						<div class="btn-group">
							<i class="bi bi-list btnR" data-bs-toggle="dropdown"
								aria-expanded="false"
								style="border: 0px; background-color: transparent; font-size:1.5em;"></i>
							<ul class="dropdown-menu dropdown-menu-end">
								<c:choose>
									<c:when test="${!empty sessionMemberInfo }">
										<li><a class="dropdown-item page-scroll"
											href="../member/logoutProcess"> 로그아웃 </a></li>
										<c:choose>
											<c:when test="${!empty sessionUserInfo }">
												<li><a class="dropdown-item page-scroll"
													href="../user/mypage"> MYPAGE </a></li>
											</c:when>
											<c:otherwise>
												<li><a class="dropdown-item page-scroll"
													href="../stylist/mypage"> MYPAGE </a></li>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<li><a class="dropdown-item page-scroll"
											href="../member/loginPage">LOGIN</a></li>
										<li><a class="dropdown-item page-scroll"
											href="../member/registerPage">회원가입</a></li>
										<li><a class="dropdown-item page-scroll"
											href="../admin/loginPage">관리자페이지로</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<div class="row">
		<div class="col"><hr style="height:1px solid gray;"></div>
	</div>
</header>

<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight">
    <div class="offcanvas-header">
        <h5 id="offcanvasRightLabel">Message</h5>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">

        <div class="row">
            <div class="col">
                <div class="row nav nav-tabs nav-pills">
                    <div class="col nav-link text-center active" data-bs-target="#messageCarousel" data-bs-slide-to="0" onclick="storeTabs(this)">
                        <span>MAIN</span>
                    </div>
                    <div class="col nav-link text-center" data-bs-target="#messageCarousel" data-bs-slide-to="1" onclick="storeTabs(this);" >
                        <span>LIST</span>
                    </div>
                    <div class="col nav-link text-center" data-bs-target="#messageCarousel" data-bs-slide-to="2" onclick="storeTabs(this)">
                        <span>STATS</span>
                    </div>
                </div>
            </div>
        </div>
        
        
        <div class="row my-4">
            <div id="messageCarousel" class="col carousel slide carousel-fade" data-bs-interval="false">
                <div class="row">
                    <div class="col">
                        <div class="carousel-inner">
                            <!-- Message : 친구목록 -->
                            <div class="carousel-item active">
        
                                <div class="row">
                                    <div class="col">
                                        <div class="row">
                                            <div class="col">
                                                <h4>친구</h4>
                                            </div>
                                            <div class="col" style="align-content: right;">
                                                <i class="bi bi-search"></i>
                                            </div>
                                        </div>
        
                                        <div class="row">
                                            <div class="col">
                                                <hr class="my-1">
                                                <h1 class="display-1"></h1>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                내 프로필
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <hr class="my-1">
                                                <h1 class="display-1"></h1>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-3">
                                                <img src="../resources/img/messegeImg/messegeImg(1).jpg"
                                                    class="rounded-circle"
                                                    style="width:4em; height:4em">
                                            </div>
                                            <div class="col mt-4">
                                                Moon_J
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <hr class="my-1">
                                                <h1 class="display-1"></h1>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                친구 목록 <small>5명</small>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <hr class="my-1">
                                                <h1 class="display-1"></h1>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-3">
                                                <img src="../resources/img/messegeImg/messegeImg(2).jpg"
                                                    class="rounded-circle"
                                                    style="width:4em; height:4em">
                                            </div>
                                            <div class="col mt-4">
                                                Lee_h
                                            </div>
                                            <div class="col mt-3">
                                                <small><button type="button"
                                                        class="btn btn-outline-warning"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#staticBackdrop">
                                                        쪽지
                                                    </button></small>
                                                <small><button
                                                        class="btn btn-outline-warning ">삭제</button></small>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-3">
                                                <img src="../resources/img/messegeImg/messegeImg(3).jpg"
                                                    class="rounded-circle"
                                                    style="width:4em; height:4em">
                                            </div>
                                            <div class="col mt-4">
                                                Kim_H
                                            </div>
                                            <div class="col mt-3">
                                                <small><button type="button"
                                                        class="btn btn-outline-warning"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#staticBackdrop">
                                                        쪽지
                                                    </button></small>
                                                <small><button
                                                        class="btn btn-outline-warning ">삭제</button></small>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-3">
                                                <img src="../resources/img/messegeImg/messegeImg(4).jpg"
                                                    class="rounded-circle"
                                                    style="width:4em; height:4em">
                                            </div>
                                            <div class="col mt-4">
                                                Im_B
                                            </div>
                                            <div class="col mt-3">
                                                <small><button type="button"
                                                        class="btn btn-outline-warning"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#staticBackdrop">
                                                        쪽지
                                                    </button></small>
                                                <small><button
                                                        class="btn btn-outline-warning ">삭제</button></small>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-3">
                                                <img src="../resources/img/messegeImg/messegeImg(5).jpg"
                                                    class="rounded-circle"
                                                    style="width:4em; height:4em">
                                            </div>
                                            <div class="col mt-4">
                                                An_Y
                                            </div>
                                            <div class="col mt-3">
                                                <small><button type="button"
                                                        class="btn btn-outline-warning"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#staticBackdrop">
                                                        쪽지
                                                    </button></small>
                                                <small><button
                                                        class="btn btn-outline-warning ">삭제</button></small>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-3">
                                                <img src="../resources/img/messegeImg/messegeImg(6).jpg"
                                                    class="rounded-circle"
                                                    style="width:4em; height:4em">
                                            </div>
                                            <div class="col mt-4">
                                                Song_s
                                            </div>
                                            <div class="col mt-3">
                                                <small><button type="button"
                                                        class="btn btn-outline-warning"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#staticBackdrop">
                                                        쪽지
                                                    </button></small>
                                                <small><button
                                                        class="btn btn-outline-warning ">삭제</button></small>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col mt-4">
                                                <hr class="my-1">
                                                <h1 class="display-1"></h1>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                친구 추가
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <hr class="my-1">
                                                <h1 class="display-1"></h1>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-3">
                                                <img src="../resources/img/messegeImg/messegeImg(7).jpg"
                                                    class="rounded-circle"
                                                    style="width:4em; height:4em">
                                            </div>
                                            <div class="col mt-4">
                                                Han-hee
                                            </div>
                                            <div class="col mt-2">
                                                <button class="btn btn-outline-warning mt-2">친구
                                                    추가</button>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-3">
                                                <img src="../resources/img/messegeImg/messegeImg(12).jpg"
                                                    class="rounded-circle"
                                                    style="width:4em; height:4em">
                                            </div>
                                            <div class="col mt-4">
                                                minjoo
                                            </div>
                                            <div class="col mt-2">
                                                <button class="btn btn-outline-warning mt-2">친구
                                                    추가</button>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-3">
                                                <img src="../resources/img/messegeImg/messegeImg(8).jpg"
                                                    class="rounded-circle"
                                                    style="width:4em; height:4em">
                                            </div>
                                            <div class="col mt-4">
                                                YongJin
                                            </div>
                                            <div class="col mt-2">
                                                <button class="btn btn-outline-warning mt-2">친구
                                                    추가</button>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-3">
                                                <img src="../resources/img/messegeImg/messegeImg(11).jpg"
                                                    class="rounded-circle"
                                                    style="width:4em; height:4em">
                                            </div>
                                            <div class="col mt-4">
                                                Chan_woo
                                            </div>
                                            <div class="col mt-2">
                                                <button class="btn btn-outline-warning mt-2">친구
                                                    추가</button>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-3">
                                                <img src="../resources/img/messegeImg/messegeImg(9).jpg"
                                                    class="rounded-circle"
                                                    style="width:4em; height:4em">
                                            </div>
                                            <div class="col mt-4">
                                                JunH
                                            </div>
                                            <div class="col mt-2">
                                                <button class="btn btn-outline-warning mt-2">친구
                                                    추가</button>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-3">
                                                <img src="../resources/img/messegeImg/messegeImg(10).jpg"
                                                    class="rounded-circle"
                                                    style="width:4em; height:4em">
                                            </div>
                                            <div class="col mt-4">
                                                Ks
                                            </div>
                                            <div class="col mt-2">
                                                <button class="btn btn-outline-warning mt-2">친구
                                                    추가</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
        
                            </div>
                            <!-- Message : 받은쪽지함 -->
                            <div class="carousel-item">
        
                                <div class="row">
                                    <div class="col">
                                        <div class="row">
                                            <div class="col">
                                                받은 쪽지
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <hr class="my-1">
                                                <h1 class="display-1"></h1>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-4">
                                                <img src="../resources/img/messegeImg/messegeImg(2).jpg"
                                                    class="rounded-circle"
                                                    style="width:4em; height:4em">
                                            </div>
                                            <div class="col mt-4">
                                                Lee_h
                                            </div>
                                            <div class="col mt-3">
                                                <small><button type="button"
                                                        class="btn btn-outline-warning"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#staticBackdropread">
                                                        보기
                                                    </button></small>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-4">
                                                <img src="../resources/img/messegeImg/messegeImg(6).jpg"
                                                    class="rounded-circle"
                                                    style="width:4em; height:4em">
                                            </div>
                                            <div class="col mt-4">
                                                Song_Y
                                            </div>
                                            <div class="col mt-3">
                                                <small><button type="button"
                                                        class="btn btn-outline-warning"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#staticBackdropread">
                                                        보기
                                                    </button></small>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-4">
                                                <img src="../resources/img/messegeImg/messegeImg(10).jpg"
                                                    class="rounded-circle"
                                                    style="width:4em; height:4em">
                                            </div>
                                            <div class="col mt-4">
                                                KS
                                            </div>
                                            <div class="col mt-3">
                                                <small>
                                                	<button type="button"
                                                        class="btn btn-outline-warning"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#staticBackdropread">
                                                        보기
                                                    </button>
                                                </small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
        
                            </div>    
                            <!-- Message : 보낸쪽지함 -->
                            <div class="carousel-item">
                                
                                <div class="row">
                                    <div class="col">
                                        <div class="row">
                                            <div class="col">
                                                보낸 쪽지
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <hr class="my-1">
                                                <h1 class="display-1"></h1>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-4">
                                                <img src="../resources/img/messegeImg/messegeImg(1).jpg"
                                                    class="rounded-circle" style="width:4em; height:4em">
                                            </div>
                                            <div class="col mt-4">
                                                Moon_J
                                            </div>
                                            <div class="col mt-3">
                                                <small><button type="button" class="btn btn-outline-warning"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#staticBackdropsend">
                                                        보기
                                                    </button></small>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-4">
                                                <img src="../resources/img/messegeImg/messegeImg(1).jpg"
                                                    class="rounded-circle" style="width:4em; height:4em">
                                            </div>
                                            <div class="col mt-4">
                                                Moon_J
                                            </div>
                                            <div class="col mt-3">
                                                <small><button type="button" class="btn btn-outline-warning"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#staticBackdropsend">
                                                        보기
                                                    </button></small>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-4">
                                                <img src="../resources/img/messegeImg/messegeImg(1).jpg"
                                                    class="rounded-circle" style="width:4em; height:4em">
                                            </div>
                                            <div class="col mt-4">
                                                Moon_J
                                            </div>
                                            <div class="col mt-3">
                                                <small><button type="button" class="btn btn-outline-warning"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#staticBackdropsend">
                                                        보기
                                                    </button></small>
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

<!-- 쪽지보내기 -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">
                    <div class="row">
                        <div class="col">
                            쪽지
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col">
                            <img src="../resources/img/messegeImg/messegeImg(1).jpg" class="rounded-circle"
                                style="width:4em; height:4em">
                        </div>
                        <div class="col mt-4">
                            Moon_J
                        </div>
                    </div>
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="form-floating">
                    <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2"
                        style="height: 100px"></textarea>
                    <label for="floatingTextarea2"></label>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">보내기</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<!-- 받은쪽지읽기-->
<div class="modal fade" id="staticBackdropread" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">
                    <div class="row">
                        <div class="col">
                            쪽지
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col">
                            <img src="../resources/img/messegeImg/messegeImg(6).jpg" class="rounded-circle"
                                style="width:4em; height:4em">
                        </div>
                        <div class="col mt-4">
                            Song_Y
                        </div>
                    </div>
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="form-floating">
                    <h4>안녕하세요.<br>
                        처음 뵙겠습니다.<br>
                        친하게 지내요!!</h4>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">보내기</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<!-- 보낸쪽지읽기-->
<div class="modal fade" id="staticBackdropsend" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">
                    <div class="row">
                        <div class="col">
                            쪽지
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col">
                            <img src="../resources/img/messegeImg/messegeImg(1).jpg" class="rounded-circle"
                                style="width:4em; height:4em">
                        </div>
                        <div class="col mt-4">
                            Moon_J
                        </div>
                    </div>
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="form-floating">
                    <h4>언제나 행복하세요!!<br>
                        친하게 지내요!!</h4>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">보내기</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

