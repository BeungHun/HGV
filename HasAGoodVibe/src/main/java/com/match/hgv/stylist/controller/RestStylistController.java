package com.match.hgv.stylist.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.match.hgv.member.service.MemberServiceImpl;
import com.match.hgv.stylist.service.StylistServiceImpl;
import com.match.hgv.user.service.UserServiceImpl;
import com.match.hgv.vo.MemberVo;
import com.match.hgv.vo.OrderFileVo;
import com.match.hgv.vo.OrderVo;
import com.match.hgv.vo.Styling_ResponseImgVo;
import com.match.hgv.vo.Styling_ResponseVo;
import com.match.hgv.vo.StylistVo;
import com.match.hgv.vo.Stylist_CardVo;
import com.match.hgv.vo.UserCardBookMarkVo;
import com.match.hgv.vo.UserVo;

@RestController
@RequestMapping("/stylist/*")
public class RestStylistController {
	
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
	
	@RequestMapping("chkUserCardLike")
	public HashMap<String, Object> chkCardLike (UserCardBookMarkVo userCardBookMarkVo, HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		UserVo userVo = (UserVo)session.getAttribute("sessionUserInfo");
		userCardBookMarkVo.setUser_no(userVo.getUser_no());
		
		map.put("result", "success");
		map.put("data", stylistService.chkUserCardLike(userCardBookMarkVo));
		return map;
	}
	
	@RequestMapping("totalCardLike")
	public HashMap<String, Object> totalCardLike (int stylist_card_no){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		map.put("data", stylistService.getCardLike(stylist_card_no));
		return map;
	}
	
//	//스타일리스트 주문내역 리스트 출력/이동
//	@RequestMapping("storeModalInfo")
//	public HashMap<String, Object> storeModalInfo(int stylist_no) {
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		Stylist_CardVo stylist_CardVo = stylistService.selectStylistCardVo(stylist_no);
//		ArrayList<HashMap<String, Object>> dataList = userService.getReceivedRequestList(stylist_CardVo.getStylist_card_no());
//		
//		map.put("result", "success");
//		map.put("dataList", dataList);
//		return map;
//	}
	
	// 상세 요청페이지 이동
	@RequestMapping("orderDetailPage")
	public HashMap<String, Object> orderDetailPage(int order_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		OrderVo orderVo = userService.getOrderVoByOrderNo(order_no);
		ArrayList<OrderFileVo> orderFileVoList = userService.getOrderFileVoListByOrderNo(order_no);
		MemberVo memberVo = userService.getMemberVoByUserNo(orderVo.getUser_no());
		String card_category_name = stylistService.getCategoryNameByCategoryno(orderVo.getCard_category_no()).getCard_category_name();
		
		map.put("result", "success");
		map.put("card_category_name", card_category_name);
		map.put("memberVo", memberVo);
		map.put("orderFileVoList", orderFileVoList);
		map.put("orderVo", orderVo);
		return map;
	}
	
	// 주문 반려 프로세스
	@RequestMapping("orderRejectProcess")
	public HashMap<String, Object> orderRejectProcess(int order_no, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		MemberVo stylistMemberVo = stylistService.orderRejectProcess(order_no);
		session.setAttribute("sessionMemberInfo", stylistMemberVo);
		
		map.put("result", "success");
		return map;
	}
	
	// 주문 수락 프로세스
	@RequestMapping("orderAcceptProcess")
	public HashMap<String, Object> orderAcceptProcess(int order_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		stylistService.orderAcceptProcess(order_no);
		
		map.put("result", "success");
		return map;
	}
	
	// 주문 응답 페이지 이동
	@RequestMapping("writeResponsePage")
	public HashMap<String, Object> writeResponsePage(int order_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		OrderVo orderVo = userService.getOrderVoByOrderNo(order_no);
		MemberVo memberVo = userService.getMemberVoByUserNo(orderVo.getUser_no()); 
		
		map.put("result", "success");
		map.put("memberVo", memberVo);
		map.put("orderVo", orderVo);
		return map;
	}
	
	// 주문 응답카드 작성 프로세스
	@RequestMapping("stylingResponseProcess")
	public HashMap<String, Object> stylingResponseProcess(Styling_ResponseVo styling_ResponseVo, MultipartFile[] files) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int styling_no = stylistService.getResponsePk();
		
		// 파일 업로드 관련
		ArrayList<Styling_ResponseImgVo> styling_ResponseImgVoList = new ArrayList<Styling_ResponseImgVo>();
		
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
			Styling_ResponseImgVo styling_ResponseImgVo = new Styling_ResponseImgVo();
			styling_ResponseImgVo.setStyling_no(styling_no);
			styling_ResponseImgVo.setStyling_img_link(todayFolderName + randomName);
			styling_ResponseImgVo.setStyling_img_originalName(originalFilename);
			styling_ResponseImgVoList.add(styling_ResponseImgVo);
		}
		stylistService.insertinsertStylingResponseImgList(styling_ResponseImgVoList);		
		// 파일 업로드 종료
		
		styling_ResponseVo.setStyling_no(styling_no);
		stylistService.insertStylingResponse(styling_ResponseVo);
		
		map.put("result", "success");
		map.put("styling_ResponseVo", styling_ResponseVo);
		return map;
	}

}
