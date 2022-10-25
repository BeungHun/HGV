<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-2">
	<div class="row">
		<div class="col">
			<h3><a href="./mypage">MY PAGE</a></h3>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<ul>
				<li><a> 내 정보 수정 </a></li>
				<li><a href="./createStylistCard"> 카드작성, 수정 </a></li>
				<li><a href="./receivedRequestList?stylist_no=${sessionStylistInfo.stylist_no}"> 내가 받은 요청 </a></li>
				<li><a> 일정관리 </a></li>
				<li><a> 스타일머니 관리 </a></li>
				<li><a> 리뷰관리 </a></li>
				<li><a> 신고현황 </a></li>
			</ul>
		</div>
	</div>
</div>