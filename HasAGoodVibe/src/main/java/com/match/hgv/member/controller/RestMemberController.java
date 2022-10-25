package com.match.hgv.member.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.match.hgv.member.service.MemberServiceImpl;
import com.match.hgv.stylist.service.StylistServiceImpl;
import com.match.hgv.user.service.UserServiceImpl;
import com.match.hgv.vo.MemberVo;
import com.match.hgv.vo.StylistVo;
import com.match.hgv.vo.Stylist_CardVo;
import com.match.hgv.vo.UserVo;

@RestController
@RequestMapping("/member/*")
public class RestMemberController {
	
	@Autowired
	MemberServiceImpl memberService;
	@Autowired
	StylistServiceImpl stylistService;
	@Autowired
	UserServiceImpl userService;
	
	//로그인 한 사용자의 번호 추출
	@RequestMapping("getMemberNo")
	public HashMap<String, Object> getMemberNO(HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		MemberVo memberVo =(MemberVo)session.getAttribute("sessionMemberInfo");
		
		if(memberVo == null) {
			map.put("result", "fail");
			map.put("data", 0);
		}else {
			map.put("result", "success");
			map.put("member_no", memberVo.getMember_no());
			if(session.getAttribute("sessionUserInfo") != null) {
				UserVo userVo = (UserVo)session.getAttribute("sessionUserInfo");
				map.put("user_no", userVo.getUser_no());
				map.put("stylist_no", 0);
			}else {
				StylistVo stylistVo = (StylistVo)session.getAttribute("sessionStylistInfo");
				map.put("stylist_no", stylistVo.getStylist_no());
				map.put("user_no", 0);
			}
		}
		
		return map;
	}
	
	// 주문 응답 카드페이지로 이동 
	@RequestMapping("stylingResponseCard")
	public HashMap<String, Object> stylingResponeseCard(int order_no) {
		HashMap<String, Object> map = stylistService.getStylingResponse(order_no);
		
		map.put("result", "success");
		return map;
	}
	
	//스타일리스트 주문내역 리스트 출력/이동
	@RequestMapping("storeModalInfo")
	public HashMap<String, Object> storeModalInfo(int member_no, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(session.getAttribute("sessionStylistInfo") != null) {
			StylistVo stylistVo = (StylistVo)session.getAttribute("sessionStylistInfo");
			Stylist_CardVo stylist_CardVo = stylistService.selectStylistCardVo(stylistVo.getStylist_no());
			ArrayList<HashMap<String, Object>> dataList = userService.getReceivedRequestList(stylist_CardVo.getStylist_card_no());
			map.put("dataList", dataList);
		}else {
			UserVo userVo = (UserVo)session.getAttribute("sessionUserInfo");
			ArrayList<HashMap<String, Object>> dataList = userService.getStylingRequestList(userVo.getUser_no());
			map.put("dataList", dataList);
		}
		
		map.put("result", "success");
		return map;
	}
	
	//스타일리스트 리뷰 리스트
	@RequestMapping("callReview")
	public HashMap<String, Object> callReview(int stylist_card_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		map.put("reviewList", stylistService.getReviewList(stylist_card_no));
		return map;
	}
	
}
