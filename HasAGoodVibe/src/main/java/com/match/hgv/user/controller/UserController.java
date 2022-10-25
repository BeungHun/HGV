package com.match.hgv.user.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.match.hgv.stylist.service.StylistServiceImpl;
import com.match.hgv.user.service.UserServiceImpl;
import com.match.hgv.vo.MemberVo;
import com.match.hgv.vo.OrderVo;
import com.match.hgv.vo.StylingReview_ImgVo;
import com.match.hgv.vo.Styling_ReviewVo;
import com.match.hgv.vo.UserVo;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	private UserServiceImpl userService;
	@Autowired
	private StylistServiceImpl stylistService;
	
	@RequestMapping("registerPage")
	public String registerPage() {
		return "user/registerPage";
	}
	
	@RequestMapping("registerProcess")
	public String registerProcess(MemberVo memberVo, UserVo userVo) {
		userService.register(memberVo, userVo);
		return "redirect: ../member/loginPage";
	}
	
	@RequestMapping("mypage")
	public String mypage() {
		return "user/mypage";
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////
	////주문관련
	//주문페이지로 이동
//	@RequestMapping("orderPage")
//	public String orderPage(Model model, int stylist_card_no) {
//		HashMap<String, Object> map = stylistService.getReadStylistCard(stylist_card_no); 
//		
//		model.addAttribute("memberVo", map.get("memberVo"));
//		model.addAttribute("stylistVo", map.get("stylistVo"));
//		model.addAttribute("stylist_CardVo", map.get("stylist_CardVo"));
//		
//		return "user/orderPage";
//	}
	
	//결제 페이지로 이동
	@RequestMapping("paymentPage")
	public String paymentPage(Model model, OrderVo orderVo) {
		HashMap<String, Object> map = stylistService.getReadStylistCard(orderVo.getStylist_card_no());
		
		model.addAttribute("orderVo", orderVo);
		model.addAttribute("memberVo", map.get("memberVo"));
		model.addAttribute("stylistVo", map.get("stylistVo"));
		model.addAttribute("stylist_CardVo", map.get("stylist_CardVo"));
		return "user/paymentPage";
	}
	
	//결제 프로세스
	@RequestMapping("orderProcess")
	public String orderProcess (OrderVo orderVo, HttpSession session, RedirectAttributes redirectAttributes) {
		UserVo userVo = (UserVo)session.getAttribute("sessionUserInfo");
		orderVo.setUser_no(userVo.getUser_no());
		//오더 넣기
		HashMap<String, Object> map = userService.insertOrder(orderVo);
		MemberVo memberVo = (MemberVo) map.get("memberVo");
		session.setAttribute("sessionMemberInfo", memberVo);
		
		//리다이렉트시 파라미터 넘겨야할 경우
		int order_no = (int) map.get("order_no");
		redirectAttributes.addAttribute("order_no", order_no);
		return "redirect: ../user/paymentCompletePage";
	}
	
	//결제 완료 페이지 
	@RequestMapping("paymentCompletePage")
	public String paymentCompletePage(Model model, @RequestParam("order_no") int order_no) {
		OrderVo orderVo = userService.getOrderVoByOrderNo(order_no);
		HashMap<String, Object> map = stylistService.getReadStylistCard(orderVo.getStylist_card_no());
		
		model.addAttribute("orderVo", orderVo);
		model.addAttribute("memberVo", map.get("memberVo"));
		model.addAttribute("stylistVo", map.get("stylistVo"));
		model.addAttribute("stylist_CardVo", map.get("stylist_CardVo"));
		return "user/paymentCompletePage";
	}
	
	//리뷰 쓰기 페이지 
	@RequestMapping("writeReviewPage")
	public String writeReviewPage(Model model, @RequestParam("order_no") int order_no) {
		OrderVo orderVo = userService.getOrderVoByOrderNo(order_no);
		HashMap<String, Object> map = stylistService.getReadStylistCard(orderVo.getStylist_card_no());
		HashMap<String, Object> map2 = stylistService.getStylingResponse(order_no);
		
		model.addAttribute("orderVo", orderVo);
		model.addAttribute("memberVo", map.get("memberVo"));
		model.addAttribute("stylistVo", map.get("stylistVo"));
		model.addAttribute("stylist_CardVo", map.get("stylist_CardVo"));
		model.addAttribute("styling_ResponseVo", map2.get("styling_ResponseVo"));
		return "user/writeReviewPage";
	}
	
//	//리뷰 쓰기 프로세스 
//	@RequestMapping("writeReviewProcess")
//	public String writeReviewProcess(Styling_ReviewVo styling_ReviewVo, MultipartFile [] files, HttpSession session) {
//		ArrayList<StylingReview_ImgVo> stylingReviewImgVoList = new ArrayList<StylingReview_ImgVo>();
//		
//		for(MultipartFile file : files) {
//			
//			if(file.isEmpty()) {
//				continue;
//			}
//			String rootFilePath = "C:/uploadFiles/";
//			
//			String originalFilename = file.getOriginalFilename();
//			//저장 할때에 파일명을 중복배제 해야함
//			//random name + 시간 = 파일명 만듬
//			String randomName = UUID.randomUUID().toString();
//			randomName += "_" + System.currentTimeMillis();
//			
//			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
//			randomName += ext;
//			
//			//오늘 날짜 기준으로 폴더 생성
//			Date today = new Date();
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
//			String todayFolderName = sdf.format(today);
//			
//			File todayFolder = new File(rootFilePath + todayFolderName);
//			if(!todayFolder.exists()) {
//				todayFolder.mkdirs(); //todayFolderName폴더가 없으면 만들어주는 API
//			}
//			
//			try {
//				//실질적 저장 API
//				file.transferTo(new File(rootFilePath + todayFolderName + randomName));
//			}catch(Exception e){
//				e.printStackTrace();
//			}
//			StylingReview_ImgVo stylingReview_ImgVo = new StylingReview_ImgVo();
//			stylingReview_ImgVo.setStyling_review_img_link(todayFolderName + randomName);
//			stylingReview_ImgVo.setStyling_review_img_name(todayFolderName);
//			stylingReviewImgVoList.add(stylingReview_ImgVo);
//		}
//		
//		int stylist_card_no = userService.insertReview(styling_ReviewVo, stylingReviewImgVoList);
//		return "redirect:../member/readStylistCard?stylist_card_no="+stylist_card_no;
//	}
	
	
	//// 마이페이지 관련
	//요청리스트
	@RequestMapping("requestListPage")
	public String requestListPage(Model model, HttpSession session) {
		UserVo userVo = (UserVo)session.getAttribute("sessionUserInfo");
		ArrayList<HashMap<String, Object>> dataList = userService.getStylingRequestList(userVo.getUser_no());
		model.addAttribute("dataList", dataList);
		
		return "user/requestListPage";
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////
	
}
