package com.match.hgv.stylist.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.match.hgv.member.service.MemberServiceImpl;
import com.match.hgv.stylist.service.StylistServiceImpl;
import com.match.hgv.user.service.UserServiceImpl;
import com.match.hgv.vo.Card_CategoryVo;
import com.match.hgv.vo.Card_Category_Relate_FileVo;
import com.match.hgv.vo.Card_Category_RelationVo;
import com.match.hgv.vo.MemberVo;
import com.match.hgv.vo.OrderVo;
import com.match.hgv.vo.Styling_ResponseVo;
import com.match.hgv.vo.StylistVo;
import com.match.hgv.vo.Stylist_CardVo;
import com.match.hgv.vo.UserVo;

@Controller
@RequestMapping("/stylist/*")
public class StylistController {
	
	@Autowired
	private MemberServiceImpl memberService;
	@Autowired
	private StylistServiceImpl stylistService;
	@Autowired
	private UserServiceImpl userService;
	
	@RequestMapping("registerPage")
	public String registerPage() {
		return "stylist/registerPage";
	}
	
	@RequestMapping("registerProcess")
	public String registerProcess(MemberVo memberVo, StylistVo stylistVo) {
		stylistService.register(memberVo, stylistVo);
		return "redirect: ../member/loginPage";
	}
	
	@RequestMapping("mypage")
	public String mypage() {
		return "stylist/mypage";
	}
	
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////
	//////스타일리스트 마이페이지
	////스타일리스트 카드
	//스타일리스트 카드만들기 창으로
	@RequestMapping("createStylistCard")
	public String createStylistCard(Model model) {
		//카테고리 리스트 출력
		model.addAttribute("categoryList", stylistService.selectCardCategoryAll());
		return "stylist/stylistCard";
	}
	
	@RequestMapping("stylistCardCreateProcess")
	public String stylistCardCreateProcess(int[] card_category_nos, Stylist_CardVo stylist_CardVo, HttpSession session, RedirectAttributes redirectAttributes) {
		//1. 카드생성
		StylistVo stylistVo = (StylistVo)session.getAttribute("sessionStylistInfo");
		stylist_CardVo.setStylist_no(stylistVo.getStylist_no());
		int stylist_card_no = stylistService.insertStylistCard(stylist_CardVo);

		//2. 카테고리릴레이션들 생성
		for(int card_category_no : card_category_nos) {
			Card_Category_RelationVo card_Category_RelationVo = new Card_Category_RelationVo();
			card_Category_RelationVo.setStylist_card_no(stylist_card_no);
			card_Category_RelationVo.setCard_category_no(card_category_no);
			stylistService.insertCardCategoryRelation(card_Category_RelationVo);
		}
		
		redirectAttributes.addAttribute("stylist_card_no", stylist_card_no);
		return "redirect: ../stylist/stylistCard2";
	}
	
	
	@RequestMapping("stylistCard2")
	public String stylistCard2(Model model, @RequestParam("stylist_card_no") int stylist_card_no){
		ArrayList<HashMap<String, Object>> categoryList = stylistService.selectCardCategoryRelation(stylist_card_no);
		model.addAttribute("categoryList", categoryList);
		return "stylist/stylistCard2";
	}
	
	
	@RequestMapping("CategoryRelateFile")
	public String CategoryRelateFile(int[] card_category_relation_nos,
			MultipartFile [] files1, MultipartFile [] files2, MultipartFile [] files3, HttpSession session) {
	////////////////현재는 카테고리( files[] )를 3개로 한정, 방법을 더 찾아볼 것
		
		
		// 파일 업로드 관련
		ArrayList<Card_Category_Relate_FileVo> categoryCardImageList = new ArrayList<Card_Category_Relate_FileVo>();
		
		// 파일 저장 코드
		ArrayList<MultipartFile[]> x = new ArrayList<MultipartFile[]>();
		x.add(files1);
		x.add(files2);
		x.add(files3);
		
		for(MultipartFile file : files1) {
			if(file.isEmpty()) {
				continue;
			}
			
			String rootFilePath = "C:/uploadFiles/";
			
			String originalFilename = file.getOriginalFilename();
			String randomName = UUID.randomUUID().toString();
			randomName += "_" + System.currentTimeMillis();
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			randomName += ext;
			
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/"); 
			String todayFolderName = sdf.format(today); 	//DATE 타입 문자열로 변환
			File todayFolder = new File(rootFilePath + todayFolderName);
			
			if(!todayFolder.exists()) {
				todayFolder.mkdirs();
			}
			try {
				file.transferTo(new File(rootFilePath + todayFolderName + randomName));
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			//DB에 넣을 데이터를 구성
			Card_Category_Relate_FileVo card_Category_Relate_FileVo = new Card_Category_Relate_FileVo();
			card_Category_Relate_FileVo.setcard_category_relation_no(card_category_relation_nos[0]);
			card_Category_Relate_FileVo.setCard_category_relate_file_link(todayFolderName + randomName);
			card_Category_Relate_FileVo.setCard_category_relate_file_name(originalFilename);
			
			categoryCardImageList.add(card_Category_Relate_FileVo);
		}
		for(MultipartFile file : files2) {
			if(file.isEmpty()) {
				continue;
			}
			
			String rootFilePath = "C:/uploadFiles/";
			
			String originalFilename = file.getOriginalFilename();
			String randomName = UUID.randomUUID().toString();
			randomName += "_" + System.currentTimeMillis();
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			randomName += ext;
			
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/"); 
			String todayFolderName = sdf.format(today); 	//DATE 타입 문자열로 변환
			File todayFolder = new File(rootFilePath + todayFolderName);
			
			if(!todayFolder.exists()) {
				todayFolder.mkdirs();
			}
			try {
				file.transferTo(new File(rootFilePath + todayFolderName + randomName));
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			//DB에 넣을 데이터를 구성
			Card_Category_Relate_FileVo card_Category_Relate_FileVo = new Card_Category_Relate_FileVo();
			card_Category_Relate_FileVo.setcard_category_relation_no(card_category_relation_nos[1]);
			card_Category_Relate_FileVo.setCard_category_relate_file_link(todayFolderName + randomName);
			card_Category_Relate_FileVo.setCard_category_relate_file_name(originalFilename);
			categoryCardImageList.add(card_Category_Relate_FileVo);
		}
		for(MultipartFile file : files3) {
			if(file.isEmpty()) {
				continue;
			}
			
			String rootFilePath = "C:/uploadFiles/";
			
			String originalFilename = file.getOriginalFilename();
			String randomName = UUID.randomUUID().toString();
			randomName += "_" + System.currentTimeMillis();
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			randomName += ext;
			
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/"); 
			String todayFolderName = sdf.format(today); 	//DATE 타입 문자열로 변환
			File todayFolder = new File(rootFilePath + todayFolderName);
			
			if(!todayFolder.exists()) {
				todayFolder.mkdirs();
			}
			try {
				file.transferTo(new File(rootFilePath + todayFolderName + randomName));
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			//DB에 넣을 데이터를 구성
			Card_Category_Relate_FileVo card_Category_Relate_FileVo = new Card_Category_Relate_FileVo();
			card_Category_Relate_FileVo.setcard_category_relation_no(card_category_relation_nos[2]);
			card_Category_Relate_FileVo.setCard_category_relate_file_link(todayFolderName + randomName);
			card_Category_Relate_FileVo.setCard_category_relate_file_name(originalFilename);
			
			categoryCardImageList.add(card_Category_Relate_FileVo);
		}

		stylistService.insertCategoryRelateFile(categoryCardImageList);
		return "redirect:../member/mainPage";
	}
	
	//수정
	@RequestMapping("updateStylistCard")
	public String updateStylistCard(Model model, int stylist_card_no) {
		
		return "updateStylistCard";
	}
	
//	//스타일리스트 주문내역 리스트 출력/이동
//	@RequestMapping("receivedRequestList")
//	public String receivedRequestList(Model model, HttpSession session) {
//		StylistVo stylistVo = (StylistVo) session.getAttribute("sessionStylistInfo");
//		Stylist_CardVo stylist_CardVo = stylistService.selectStylistCardVo(stylistVo.getStylist_no());
//		ArrayList<HashMap<String, Object>> dataList = userService.getReceivedRequestList(stylist_CardVo.getStylist_card_no());
//		
//		model.addAttribute("dataList", dataList);
//		return "stylist/receivedRequestList";
//	}
	
//	// 상세 요청페이지 이동
//	@RequestMapping("orderDetailPage")
//	public String orderDetailPage(Model model, @RequestParam("order_no") int order_no) {
//		OrderVo orderVo = userService.getOrderVoByOrderNo(order_no);
//		MemberVo memberVo = userService.getMemberVoByUserNo(orderVo.getUser_no());
//		
//		model.addAttribute("memberVo", memberVo);
//		model.addAttribute("orderVo", orderVo);
//		return "stylist/orderDetailPage";
//	}
//	
//	// 주문 반려 프로세스
//	@RequestMapping("orderRejectProcess")
//	public String orderRejectProcess(int order_no, HttpSession session) {
//		MemberVo stylistMemberVo = stylistService.orderRejectProcess(order_no);
//		session.setAttribute("sessionMemberInfo", stylistMemberVo);
//		
//		return "redirect:../stylist/orderDetailPage?order_no=" + order_no;
//	}
//	
//	// 주문 수락 프로세스
//	@RequestMapping("orderAcceptProcess")
//	public String orderAcceptProcess(int order_no, HttpSession session) {
//		stylistService.orderAcceptProcess(order_no);
//		return "redirect:../stylist/orderDetailPage?order_no=" + order_no;
//	}
	
//	// 주문 응답 페이지 이동
//	@RequestMapping("writeResponsePage")
//	public String writeResponsePage(Model model, @RequestParam("order_no") int order_no) {
//		OrderVo orderVo = userService.getOrderVoByOrderNo(order_no);
//		MemberVo memberVo = userService.getMemberVoByUserNo(orderVo.getUser_no()); 
//		
//		model.addAttribute("memberVo", memberVo);
//		model.addAttribute("orderVo", orderVo);
//		return "stylist/writeResponsePage";
//	}
//	
//	// 주문 응답카드 작성 프로세스
//	@RequestMapping("stylingResponseProcess")
//	public String stylingResponseProcess(Styling_ResponseVo styling_ResponseVo) {
//		stylistService.insertStylingResponse(styling_ResponseVo);
//		return "redirect:../member/stylingResponseCard?order_no="+styling_ResponseVo.getOrder_no();
//	}
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////
}
