package com.match.hgv.user.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.match.hgv.member.service.MemberServiceImpl;
import com.match.hgv.stylist.service.StylistServiceImpl;
import com.match.hgv.user.service.UserServiceImpl;
import com.match.hgv.vo.Card_CategoryVo;
import com.match.hgv.vo.MemberVo;
import com.match.hgv.vo.OrderFileVo;
import com.match.hgv.vo.OrderVo;
import com.match.hgv.vo.StylingReview_ImgVo;
import com.match.hgv.vo.Styling_ReviewVo;
import com.match.hgv.vo.Stylist_CardVo;
import com.match.hgv.vo.UserCardBookMarkVo;
import com.match.hgv.vo.UserVo;

@RestController
@RequestMapping("/user/*")
public class RestUserController {

	@Autowired
	private MemberServiceImpl memberService;
	@Autowired
	private StylistServiceImpl stylistService;
	@Autowired
	private UserServiceImpl userService;
	
	@RequestMapping("isExistId")
	public HashMap<String, Object> isExistId(String member_id){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		map.put("data", memberService.isExistId(member_id));
		
		return map;
	}
	
	@RequestMapping("doLikeCard")
	public HashMap<String, Object> doLikeCard (UserCardBookMarkVo userCardBookMarkVo, HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		UserVo userVo = (UserVo)session.getAttribute("sessionUserInfo");
		userCardBookMarkVo.setUser_no(userVo.getUser_no());
		
		userService.userCardBookMark(userCardBookMarkVo);
		
		map.put("result", "success");
		return map;
	}
	
	// 오더 모달로 Data 제공
	@RequestMapping("orderPage")
	public HashMap<String, Object> orderPage(int stylist_card_no, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> userMap = new HashMap<String, Object>();
		HashMap<String, Object> stylistMap = stylistService.getReadStylistCard(stylist_card_no);
		
		UserVo userVo = (UserVo)session.getAttribute("sessionUserInfo");
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionMemberInfo");
		
		userMap.put("memberVo", memberVo);
		userMap.put("userVo", userVo);
		
		map.put("result", "success");
		map.put("stylist", stylistMap);
		map.put("user", userMap);
		return map;
	}
	
	// 주문확인(결제 프로세스)
	@RequestMapping("orderWriteProcess")
	public HashMap<String, Object> orderWriteProcess(OrderVo orderVo, MultipartFile[] files, Card_CategoryVo card_CategoryVo, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		//orderVo 채워넣기
		UserVo userVo = (UserVo)session.getAttribute("sessionUserInfo");
		orderVo.setUser_no(userVo.getUser_no());
		int card_category_no = stylistService.getCategoryNoByCategoryName(card_CategoryVo.getCard_category_name());
		orderVo.setCard_category_no(card_category_no);
		
		//오더 넣기 및 유저 적립금 갱신
		HashMap<String, Object> orderMap = userService.insertOrder(orderVo);
		MemberVo memberVo = (MemberVo) orderMap.get("memberVo");
		session.setAttribute("sessionMemberInfo", memberVo);
		
		int order_no = (int)orderMap.get("order_no");
		
		// 파일 업로드 관련
		ArrayList<OrderFileVo> orderFileVoList = new ArrayList<OrderFileVo>();
		
		// 파일 저장 코드
		for(MultipartFile file : files) {
			
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
			OrderFileVo orderFileVo = new OrderFileVo();
			orderFileVo.setOrder_no(order_no);
			orderFileVo.setOrder_file_link(todayFolderName + randomName);
			orderFileVo.setOrder_file_originalName(originalFilename);
			orderFileVoList.add(orderFileVo);
		}
		userService.insertorderFiles(orderFileVoList);		
		// 파일 업로드 종료
		
		map.put("result", "success");
		map.put("orderNo", order_no);
		return map;
	}
	
	//리뷰 쓰기 프로세스 
	@RequestMapping("writeReviewProcess")
	public HashMap<String, Object> writeReviewProcess(Styling_ReviewVo styling_ReviewVo, MultipartFile [] files) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<StylingReview_ImgVo> stylingReviewImgVoList = new ArrayList<StylingReview_ImgVo>();
		
		for(MultipartFile file : files) {
			
			if(file.isEmpty()) {
				continue;
			}
			String rootFilePath = "C:/uploadFiles/";
			
			String originalFilename = file.getOriginalFilename();
			//저장 할때에 파일명을 중복배제 해야함
			//random name + 시간 = 파일명 만듬
			String randomName = UUID.randomUUID().toString();
			randomName += "_" + System.currentTimeMillis();
			
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			randomName += ext;
			
			//오늘 날짜 기준으로 폴더 생성
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
			String todayFolderName = sdf.format(today);
			
			File todayFolder = new File(rootFilePath + todayFolderName);
			if(!todayFolder.exists()) {
				todayFolder.mkdirs(); //todayFolderName폴더가 없으면 만들어주는 API
			}
			
			try {
				//실질적 저장 API
				file.transferTo(new File(rootFilePath + todayFolderName + randomName));
			}catch(Exception e){
				e.printStackTrace();
			}
			StylingReview_ImgVo stylingReview_ImgVo = new StylingReview_ImgVo();
			stylingReview_ImgVo.setStyling_review_img_link(todayFolderName + randomName);
			stylingReview_ImgVo.setStyling_review_img_name(todayFolderName);
			stylingReviewImgVoList.add(stylingReview_ImgVo);
		}
		
		userService.insertReview(styling_ReviewVo, stylingReviewImgVoList);
		
		map.put("result", "success");
		map.put("orderNo", userService.getOrderNoByStylingNo(styling_ReviewVo.getStyling_no()));
		return map;
	}
	
}
