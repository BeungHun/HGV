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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.match.hgv.admin.service.AdminServiceImpl;
import com.match.hgv.freeboard.service.FreeBoardServiceImpl;
import com.match.hgv.member.service.MemberServiceImpl;
import com.match.hgv.stylist.service.StylistServiceImpl;
import com.match.hgv.user.service.UserServiceImpl;
import com.match.hgv.vo.AttendVo;
import com.match.hgv.vo.BlogCommentVo;
import com.match.hgv.vo.Card_CategoryVo;
import com.match.hgv.vo.FriendVo;
import com.match.hgv.vo.MemberFreezeVo;
import com.match.hgv.vo.MemberVo;
import com.match.hgv.vo.MessageVo;
import com.match.hgv.vo.ReportVo;
import com.match.hgv.vo.Report_file_infoVo;
import com.match.hgv.vo.StylistVo;
import com.match.hgv.vo.Stylist_CardVo;
import com.match.hgv.vo.UserVo;
import com.match.hgv.vo.blogCategoryVo;
import com.match.hgv.vo.blogVo;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberServiceImpl memberService;
	@Autowired
	private StylistServiceImpl stylistService;
	@Autowired
	private UserServiceImpl userService;
	@Autowired
	private AdminServiceImpl adminService;
	@Autowired
	private FreeBoardServiceImpl freeBoardService;
	
	@RequestMapping("index")
	public String index() {
		return "member/index";
	}
	
	@RequestMapping("loginPage")
	public String loginPage() {
		
		return "member/loginPage";
	}
	
	@RequestMapping("registerPage")
	public String registerPage() {
		
		return "member/registerPage";
	}
	
//	//로그인
//	@RequestMapping("loginProcess")
//	public String loginProcess(MemberVo param, HttpSession session) {
//		
//		HashMap<String, Object> map = memberService.loginProcess(param);
//		MemberVo sessionMemberInfo = (MemberVo)map.get("memberVo");
//		UserVo sessionUserInfo = (UserVo)map.get("userVo");
//		StylistVo sessionStylistInfo = (StylistVo)map.get("stylistVo");
//		
//		boolean loginfail = false;
////프로필 사진 수정 고도화시 삭제 요함
//		boolean updateProfileImg = false;
//		
//		if(sessionMemberInfo == null) {
//			loginfail = true;
//		}else {
//			session.setAttribute("sessionMemberInfo", sessionMemberInfo);
////프로필 사진 수정 고도화시 삭제 요함
//			session.setAttribute("updateProfileImg", updateProfileImg);
//			
//			if (sessionUserInfo == null) {
//				session.setAttribute("sessionStylistInfo", sessionStylistInfo);
//			}else if (sessionStylistInfo == null) {
//				session.setAttribute("sessionUserInfo", sessionUserInfo);
//			}
//			return "redirect: ../member/mainPage";
//		}
//		
//		session.setAttribute("loginfail", loginfail);
//		return "member/loginPage";
//	}
	
	@RequestMapping("loginProcess")
	public String loginProcess(MemberVo param, HttpSession session, Model model) {
		
		
		HashMap<String, Object> map = memberService.loginProcess(param);
		MemberVo sessionMemberInfo = (MemberVo)map.get("memberVo");
		//===========테스트
		
		// 로그인 한 member_no가 memberFreezeVo에 없을때 아래가 실행됨.
		if(adminService.getMemberFreezeVo(sessionMemberInfo.getMember_no()) == null) {
			
			UserVo sessionUserInfo = (UserVo)map.get("userVo");
			StylistVo sessionStylistInfo = (StylistVo)map.get("stylistVo");
			
			boolean loginfail = false;
	//프로필 사진 수정 고도화시 삭제 요함
			boolean updateProfileImg = false;
			
			if(sessionMemberInfo == null) {
			}else {
				session.setAttribute("sessionMemberInfo", sessionMemberInfo);
	//프로필 사진 수정 고도화시 삭제 요함
				session.setAttribute("updateProfileImg", updateProfileImg);
				
				if (sessionUserInfo == null) {
					session.setAttribute("sessionStylistInfo", sessionStylistInfo);
				}else if (sessionStylistInfo == null) {
					session.setAttribute("sessionUserInfo", sessionUserInfo);
				}
				return "redirect: ../member/mainPage";
			}
			
			return "member/loginPage";
		}
		
		//member_freezeOrNot 이 N 상태(정지상태)라면?
		else {
			MemberFreezeVo memberFreezeVoForCheck = adminService.getMemberFreezeVo(sessionMemberInfo.getMember_no());
			Date date = new Date();
			
			try {
				// 만약 아직 정지 날짜가 지나지 않았다면 아래를 실행
				if(memberFreezeVoForCheck.getMember_canLoginDate().after(date)) {
					
					model.addAttribute("memberFreezeVoForCheck", memberFreezeVoForCheck);
					return "/member/loginFailCauseOfFreeze";
					
				}
				//정지날짜가 지났다면 아래를 실행.
				else {
					adminService.eraseMemberFreezeVo(sessionMemberInfo.getMember_no());
					return "/member/mainPage";
				}
			
			}catch(Exception e) {
				e.printStackTrace();
			}
		
		}
		return "member/index";
	}
	
	
	
	
	//로그아웃
	@RequestMapping("logoutProcess")
	public String logoutProcess(HttpSession session) {
		session.invalidate();
		return "redirect: ../member/index";
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping("mainPage")
	public String mainPage(Model model, HttpSession session) {
		ArrayList<HashMap<String, Object>> cardList = stylistService.selectCardAll();
		ArrayList<Card_CategoryVo> categoryList = stylistService.selectCardCategoryAll();
		
		if(session.getAttribute("sessionStylistInfo") != null) {
			StylistVo stylistVo = (StylistVo) session.getAttribute("sessionStylistInfo");
			Stylist_CardVo stylist_CardVo = stylistService.selectStylistCardVo(stylistVo.getStylist_no());
			if(stylist_CardVo != null) {
				ArrayList<HashMap<String, Object>> dataList = userService.getReceivedRequestList(stylist_CardVo.getStylist_card_no());
				model.addAttribute("dataList", dataList);
				model.addAttribute("stylist_CardVo", stylist_CardVo);
			}
		}else if(session.getAttribute("sessionUserInfo") != null) {
			UserVo userVo = (UserVo) session.getAttribute("sessionUserInfo");
			ArrayList<HashMap<String, Object>> requestList = userService.getStylingRequestList(userVo.getUser_no());
			model.addAttribute("requestList", requestList);
		}
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("cardList", cardList);
		return "member/mainPage";
	}
	
	
	// 프로필 사진 업데이트
	@RequestMapping("updateProfileImg")
	public String updateProfileImg(MultipartFile file, HttpSession session, HttpServletRequest request) {
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionMemberInfo");
		String requestPage = request.getHeader("referer");
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
		
		memberVo.setMember_profileimage_link(todayFolderName + randomName);
		memberService.updateMemberProfile(memberVo);
		
		boolean updateProfileImg = (boolean) session.getAttribute("updateProfileImg");
		updateProfileImg = false;
		session.setAttribute("updateProfileImg", updateProfileImg);
		
		return "redirect:" + requestPage;
	}
	
	// 프로필 사진 수정하기 (AJAX로 고도화시 삭제 필요)
	@RequestMapping("updateProfileImgButton")
	public String updateProfileImg(HttpSession session, HttpServletRequest request) {
		String requestPage = request.getHeader("referer");
		
		boolean updateProfileImg = true;
		session.setAttribute("updateProfileImg", updateProfileImg);
		
		return "redirect:" + requestPage;
	}
	
	// 프로필 사진 수정 취소
	@RequestMapping("cancelUpdateProfileImg")
	public String cancelUpdateProfileImg(HttpSession session, HttpServletRequest request) {
		String requestPage = request.getHeader("referer");
		
		boolean updateProfileImg = false;
		session.setAttribute("updateProfileImg", updateProfileImg);
		
		return "redirect:" + requestPage;
	}
	
	//스타일리스트 카드 상세페이지
	@RequestMapping("readStylistCard")
	public String readStylistCard(int stylist_card_no, Model model) {
		HashMap<String, Object> map = stylistService.getReadStylistCard(stylist_card_no); 
		
		ArrayList<HashMap<String, Object>> reviewList = stylistService.getReviewList(stylist_card_no);
		model.addAttribute("reviewList", reviewList);
		
		model.addAttribute("memberVo", map.get("memberVo"));
		model.addAttribute("stylistVo", map.get("stylistVo"));
		model.addAttribute("stylist_CardVo", map.get("stylist_CardVo"));
		return "member/readStylistCard";
	}
	
//	// 주문 응답 카드페이지로 이동 
//	@RequestMapping("stylingResponseCard")
//	public String stylingResponeseCard(Model model, @RequestParam("order_no") int order_no) {
//		HashMap<String, Object> map = stylistService.getStylingResponse(order_no);
//		
//		model.addAttribute("styling_ResponseVo", map.get("styling_ResponseVo"));
//		model.addAttribute("orderVo", map.get("orderVo"));
//		return "member/stylingResponseCard";
//	}
	////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping("freeboard")
	public String freeboard(Model model , @RequestParam(value = "pageNum",defaultValue = "1") int pageNum) {
		
		ArrayList<HashMap<String, Object>> dataList = freeBoardService.getFreeBoardDataList(pageNum);
		model.addAttribute("dataList", dataList);
		
		
		int startPage = ((pageNum-1)/5)*5 + 1;
		int endPage = ((pageNum-1)/5+1)*5;
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPageNum", pageNum);
		
		/////////////////////////////////////////////////////////////
		
		return "member/freeboard";
	}
	
	@RequestMapping("notice")
	public String notice() {
		return "member/notice";
	}
	
	@RequestMapping("qAnda")
	public String qAnda() {
		return "member/qAnda";
	}
	
	// 혜준씨 작업물 :: 메세지 & 이벤트
	@RequestMapping("message")
	public String message(Model model, String searchType, String searchWord) {
		
		ArrayList<HashMap<String, Object>> dataList = memberService.getMemberDataList(searchType, searchWord);
		model.addAttribute("dataList", dataList);
		return "member/message";
	}
	
	@RequestMapping("insertFriendProcess")
	public String insertFriendProcess(FriendVo param, HttpSession session) {
		memberService.insertFriend(param);
		
		return "redirect:./m_friendList";
	}
	
	
	@RequestMapping("m_friendList")
	public String m_friendList(Model model, HttpSession session) {
		
		MemberVo sessionMember= (MemberVo) session.getAttribute("sessionMemberInfo");

		int memberNo = sessionMember.getMember_no();
		
		ArrayList<HashMap<String, Object>> fdataList = memberService.getFriendDataList(memberNo);
		model.addAttribute("fdataList", fdataList);
		
		return "member/m_friendList";
	}
	
	//친구 삭제 
	@RequestMapping("DeleteFriendProcess")
	public String DeleteFriendProcess(int bfmember_no) {
		memberService.deleteFriend(bfmember_no);
		
		return "redirect: ./m_friendList";
	}
	
	//메시지 삭제
	@RequestMapping("deleteMessageProcess")
	public String deleteMessageProcess(int message_no) {
		memberService.deleteMessage(message_no);
		
		return "redirect:./sendMessage";
	}
	
	//쪽지쓰기 페이지 
	@RequestMapping("writeMessagePage")
	public String writeMessagePage(Model model, int bfmember_no){
		model.addAttribute("MemberInfo", memberService.getMemberInfo(bfmember_no));
		
		return "member/writeMessagePage";
	}
	
	@RequestMapping("writeMessageProcess")
	public String writeMessageProcess(MessageVo messageVo) {
			memberService.writeMessage(messageVo);
		
		return "redirect: ./m_friendList";
	}

	
	@RequestMapping("sendMessage")
	public String SendMessage(Model model, HttpSession session) {
		MemberVo sessionMember = (MemberVo) session.getAttribute("sessionMemberInfo");
		int memberNo = sessionMember.getMember_no();
		ArrayList<HashMap<String, Object>> datas = memberService.getSentMessageList(memberNo);
		model.addAttribute("sentList", datas);
		
		return "member/sendMessage";
	}
	
	
	@RequestMapping("recievedMessage")
	public String recievedMessage(Model model, HttpSession session) {
		
		MemberVo sessionMember = (MemberVo)session.getAttribute("sessionMemberInfo");
		int memberNo = sessionMember.getMember_no();
		memberService.updateReadDate(memberNo);
		ArrayList<HashMap<String, Object>> datas = memberService.getRecievedMessageList(memberNo);
		model.addAttribute("receivedList", datas);
		
		return "member/recievedMessage";
	}
	
	//출석이벤트 
	@RequestMapping("event")
	public String event(Model model, HttpSession session) {
		
		MemberVo sessionMember = (MemberVo)session.getAttribute("sessionMemberInfo");
		int memberNo = sessionMember.getMember_no();
		ArrayList<HashMap<String, Object>> datas = memberService.getCommentList(memberNo);
		
		model.addAttribute("dateCount",  memberService.isDateExists(memberNo));
		model.addAttribute("commentList", datas);
		
		
		return "member/event";
	}
	@RequestMapping("writeECommentProcess")
	public String writeECommentProcess(AttendVo attendVo, Model model) {
		memberService.insertEComment(attendVo);
		return "redirect: ./event";
	}
	@RequestMapping("deleteECommentProcess")
	public String deleteECommentProcess(int attendNo) {
		memberService.deleteEComment(attendNo);
		return "redirect: ./event";
	}
		
	@RequestMapping("updateECommentProcess")
	public String updateECommentProcess(AttendVo attendVo) {
		memberService.updateEComment(attendVo);
		return "redirect:./event";
	}
	
	// 신고페이지
	@RequestMapping("reportRequestPage")
	public String reportRequestPage(Model model) {
		return "member/reportRequestPage";
	}
	
	@RequestMapping("reportProcess")
	public String reportProcess(ReportVo reportVo , MultipartFile [] reportFiles) {
		ArrayList<Report_file_infoVo> Report_file_infoList = new ArrayList<Report_file_infoVo>();
		for(MultipartFile file : reportFiles) {
			if(file.isEmpty()) {
				continue;
			}
			
			String rootFilePath="C:/uploadFiles/";
			
			String originalFileName = file.getOriginalFilename();
			String randomName = UUID.randomUUID().toString();
			randomName += "_" + System.currentTimeMillis();
			
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			randomName += ext;
			
			//폴더 생성
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
			String todayFolderName = sdf.format(today);
			
			File todayFolder = new File(rootFilePath + todayFolderName);
			
			if(!todayFolder.exists()) {
				todayFolder.mkdirs();
			}
			
			try {
				file.transferTo(new File(rootFilePath + todayFolderName + randomName));
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			Report_file_infoVo reportFileVo = new Report_file_infoVo();
			reportFileVo.setReport_file_originalName(originalFileName);
			reportFileVo.setReport_file_link(todayFolderName + randomName);
			
			Report_file_infoList.add(reportFileVo);
			
		}
		memberService.insertReport(reportVo , Report_file_infoList);
		
		return "member/reportSuccessPage";
	}
	
	//---------블로그-----------
	
	//페이지
	
	
	@RequestMapping("blogIndex")
	public String blogIndex(Model model, HttpSession session) {
		StylistVo sessionStylist = (StylistVo)session.getAttribute("sessionStylistInfo");
		int stylistNo = sessionStylist.getStylist_no();
		ArrayList<HashMap<String, Object>> datas = memberService.getCategoryList(stylistNo);
		ArrayList<HashMap<String, Object>> datass = memberService.selectAll();
		model.addAttribute("categoryList", datas);
		model.addAttribute("boardList", datass);
		model.addAttribute("stylistInfo",sessionStylist);
		
	return "blog/blogIndex";
	}
	
	@RequestMapping("myBlog")
	public String myBlog(Model model, HttpSession session, int stylist_no) {
		StylistVo sessionStylist = (StylistVo)session.getAttribute("sessionStylistInfo");
		model.addAttribute("stylistInfo",sessionStylist);
		//StylistVo sessionStylist = (StylistVo)session.getAttribute("sessionStylistInfo");
		//int stylistNo = sessionStylist.getStylist_no();
		int stylistNo = stylist_no;
		
		//MemberVo sessionMember = (MemberVo)session.getAttribute("sessionMemberInfo");

		ArrayList<HashMap<String, Object>> datas = memberService.getCategoryList(stylistNo);
		ArrayList<HashMap<String, Object>> datass = memberService.getBoardList(stylistNo);
		model.addAttribute("categoryList", datas);
		model.addAttribute("boardList", datass);
		
		
	return "blog/myBlog";
	}
	
	@RequestMapping("createCategory")
	public String createCategory(Model model, HttpSession session) {
		StylistVo sessionStylist = (StylistVo)session.getAttribute("sessionStylistInfo");
		int stylistNo = sessionStylist.getStylist_no();
		ArrayList<HashMap<String, Object>> datas = memberService.getCategoryList(stylistNo);
		
		model.addAttribute("categoryList", datas);
		model.addAttribute("stylistInfo",sessionStylist);
		
	return "blog/createCategory";
	}
	
	@RequestMapping("boardWrite")
	public String boardWrite(Model model, HttpSession session, int c_no) {
			StylistVo sessionStylist = (StylistVo)session.getAttribute("sessionStylistInfo");
			blogCategoryVo data = memberService.getACategory(c_no);
			
			model.addAttribute("category", data);
			model.addAttribute("stylistInfo",sessionStylist);
			
	return "blog/boardWrite";
	}
	
	@RequestMapping("boardWriteAll")
	public String boardWriteAll(Model model, HttpSession session) {
		StylistVo sessionStylist = (StylistVo)session.getAttribute("sessionStylistInfo");
		int stylistNo = sessionStylist.getStylist_no();
		ArrayList<HashMap<String, Object>> datas = memberService.getCategoryList(stylistNo);
//			blogCategoryVo data = memberService.getACategory(c_no);
//			
//			model.addAttribute("category", data);
		model.addAttribute("stylistInfo",sessionStylist);
		model.addAttribute("categoryList", datas);
	return "blog/boardWriteAll";
	}
	
	@RequestMapping("boardUpdate")
	public String boardUpdate() {
	return "blog/boardUpdate";
	}
	
	@RequestMapping("boardView")
	public String boardView(Model model, HttpSession session, int blog_no) {
		HashMap<String, Object> data = memberService.getABoard(blog_no);
		MemberVo sessionMember=(MemberVo)session.getAttribute("sessionMemberInfo");
		StylistVo sessionStylist = (StylistVo)session.getAttribute("sessionStylistInfo");
		ArrayList<HashMap<String, Object>> datas = memberService.getCommentsList(blog_no);
		
		model.addAttribute("commentList",datas);
		model.addAttribute("memberInfo",sessionMember);
		model.addAttribute("data", data);
		model.addAttribute("stylistInfo",sessionStylist);
		
	return "blog/boardView";
	}
	
	@RequestMapping("categoryView")
	public String categoryView(Model model, HttpSession session, int cNo) {
		StylistVo stylistVo = (StylistVo)session.getAttribute("sessionStylistInfo");
		ArrayList<HashMap<String, Object>> datas = memberService.getCategoryBoardList(cNo);
		memberService.getACategory(cNo);
		ArrayList<HashMap<String, Object>> datass = memberService.getCategoryList(stylistVo.getStylist_no());
		
		model.addAttribute("categoryList", datass);
		model.addAttribute("categoryBoardList", datas);
		return "blog/categoryView";
	}
	
	@RequestMapping("Intro")
	public String Intro() {
		return "blog/Intro";
	}
	
	@RequestMapping("nokedCloset")
	public String nokedCloset() {
		return "blog/nokedCloset";
	}
	
	@RequestMapping("closetList")
	public String closetList() {
		return "blog/closetList";
	}
	
	@RequestMapping("commentListPage")
	public String commentListPage(Model model, HttpSession session, int blog_no) {
		ArrayList<HashMap<String, Object>> datas = memberService.getCommentsList(blog_no);
		HashMap<String, Object> data = memberService.getABoard(blog_no);
		MemberVo sessionMember=(MemberVo)session.getAttribute("sessionMemberInfo");
		model.addAttribute("data", data);
		model.addAttribute("commentList",datas);
		model.addAttribute("memberInfo",sessionMember);
		
		return "blog/commentListPage";
	}

	
	
	
	//process
	@RequestMapping("insertCategoryProcess")
	public String insertCategoryProcess(blogCategoryVo categoryVo) {
		memberService.insertCategory(categoryVo);
		return "redirect: ./createCategory";
	}
	

	@RequestMapping("deleteCategoryProcess")
	public String deleteCategoryProcess(int c_No) {
		memberService.deleteCategory(c_No);
		return "redirect: ./createCategory";
	}
	
	@RequestMapping("writeProcess")
	public String writeProcess(blogVo blogvo, HttpSession session) {
		memberService.writeProcess(blogvo);
		StylistVo stylistInfo = (StylistVo)session.getAttribute("sessionStylistInfo");
		int stylist_no = stylistInfo.getStylist_no();
		return "redirect: ./myBlog?stylist_no=" + stylist_no;
		
	}
	
	@RequestMapping("boardDelete")
	public String boardDelete(int blog_no, HttpSession session) {
		memberService.boardDelete(blog_no);
		StylistVo stylistInfo = (StylistVo)session.getAttribute("sessionStylistInfo");
		int stylist_no = stylistInfo.getStylist_no();
		return "redirect: ./myBlog?stylist_no=" + stylist_no;
	}
	
	//코멘트 작성 프로세스 
	@RequestMapping("writeComment")
	public String writeComment(BlogCommentVo commentVo, HttpSession session, HttpServletRequest request) {
		
		MemberVo sessionMember= (MemberVo)session.getAttribute("sessionMemberInfo");
		
		
		int memberNo = sessionMember.getMember_no();
		commentVo.setMember_no(memberNo);
		
		memberService.writeComment(commentVo);
		
		String referer = request.getHeader("referer");
		return "redirect: " + referer;
		//return "redirect:./boardView?blog_no=" + param.getBlog_no();
	}
	
	@RequestMapping("deleteCommentProcess")
	public String deleteCommentProcess(int commentNo, HttpServletRequest request) {
		memberService.deleteBComment(commentNo);
		String referer = request.getHeader("referer");
		return "redirect: " + referer;
	}
	
}
