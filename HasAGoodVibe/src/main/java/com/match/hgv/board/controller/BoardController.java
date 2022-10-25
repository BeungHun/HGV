package com.match.hgv.board.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.match.hgv.admin.service.AdminServiceImpl;
import com.match.hgv.board.mapper.BoardSQLMapper;
import com.match.hgv.board.service.BoardServiceImpl;
import com.match.hgv.comment.service.CommentServiceImpl;
import com.match.hgv.member.service.MemberServiceImpl;
import com.match.hgv.vo.FAQVo;
import com.match.hgv.vo.MemberVo;
import com.match.hgv.vo.NoticeFileInfoVo;
import com.match.hgv.vo.NoticeVo;
import com.match.hgv.vo.QandABoardVo;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardServiceImpl boardService;
	
	@Autowired
	private CommentServiceImpl commentService;
	
	@Autowired
	private AdminServiceImpl adminService;
	
	@RequestMapping("freeboard")
	public String freeboard() {
		return "board/freeboard";
	}
	
	@RequestMapping("message")
	public String message() {
		return "board/message";
	}
	
	//유저게시판
	@RequestMapping("qAnda")
	public String qAnda(Model model) {
		ArrayList<HashMap<String, Object>> qandADataList = boardService.getBoardDataList();
		model.addAttribute("qandADataList", qandADataList);
		return "board/qAnda";
	}
	//관리자게시판 처리중 QandA
	@RequestMapping("adminQandA")
	public String adminqAnaA(Model model) {
		
		ArrayList<HashMap<String, Object>> qandADataList = boardService.getBoardDataList();
		
		model.addAttribute("qandADataList", qandADataList);
		
		model.addAttribute("commentDataList", commentService.getCommentList());
		return "board/adminQandA";
	}
	//관리자페이지 완료된 QandA
	@RequestMapping("adminQandAComplete")
	public String adminQandAComplete(Model model) {
		
		ArrayList<HashMap<String, Object>> qandADataList = boardService.getBoardDataList();
		
		model.addAttribute("qandADataList", qandADataList);
		
		model.addAttribute("commentDataList", commentService.getCommentList());
		return "board/adminQandAComplete";
	}
	//유저글쓰기
	@RequestMapping("qAndAWritePage")
	public String qAndAWritePage() {
		return "board/qAndAWritePage";
	}
	//유저글쓰기프로세스
	@RequestMapping("qAndAWriteProcess")
	public String qAndAWriteProcess(QandABoardVo param, HttpSession session) {
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionMemberInfo");
		int memberNo = sessionUser.getMember_no();
		
		param.setMember_no(memberNo);
		boardService.QandAContent(param);
		return "redirect:./qAnda";
	}
	//유저글보기
	@RequestMapping("qAndAReadPage")
	public String qAndAReadPage(int qAndABoard_no, Model model) {
		
		boardService.qandAincreaseReadCount(qAndABoard_no);
		HashMap<String, Object> data = boardService.getBoardData(qAndABoard_no);
		
		
		model.addAttribute("data", data);
		model.addAttribute("commentDataList", commentService.getCommentList());
		
		return "board/qAndAReadPage";
	}
	//admin 글보기
	@RequestMapping("adminQAndAReadPage")
	public String adminQAndAReadPage(int qAndABoard_no, Model model) {
		
		boardService.qandAincreaseReadCount(qAndABoard_no);
		HashMap<String, Object> data = boardService.getBoardData(qAndABoard_no);
		
		model.addAttribute("data", data);
		model.addAttribute("commentDataList", commentService.getCommentList());
		
		return "board/adminQAndAReadPage";
	}
	//qand글 삭제프로세스
	@RequestMapping("qAndAdeleteContentProcess")
	public String qAndAdeleteContentProcess(int qAndABoard_no) {
		boardService.qandAdeleteContent(qAndABoard_no);

		return "redirect:./qAnda";
	}
	
	//qand글 수정페이지이동
	@RequestMapping("qAndAupdateContentPage")
	public String qAndAupdateContentPage(int qAndABoard_no, Model model) {
		
		HashMap<String, Object> data = boardService.getBoardData(qAndABoard_no);
		model.addAttribute("data", data);
		
		return"board/qAndAupdateContentPage";
	}
	//qanda글 수정프로세스
	@RequestMapping("qAndAupdateContentProcess")
	public String qAndAupdateContentProcess(QandABoardVo param) {
		boardService.qAndAupdateContent(param);

		return "redirect:./qAnda";
	}
	
	//// 공지사항 관련
	//공지사항 관련
	@RequestMapping("notice")
	public String notice(HttpSession session, Model model, String searchContentCategory, String searchBoardCategory, String searchWord, @RequestParam(value ="pageNum",defaultValue="1")int pageNum) {
		
		ArrayList<NoticeVo> NoticeBoardList = boardService.getNoticeBoardList(searchContentCategory,searchBoardCategory ,searchWord,pageNum);
		model.addAttribute("NoticeBoardList", NoticeBoardList);
		
		int boardCount = boardService.getNoticeCount(searchContentCategory, searchBoardCategory, searchWord);
		
		int totalPageCount = (int)Math.ceil(boardCount/10.0);
		int startPage = ((pageNum-1)/5)*5 + 1;
		int endPage = ((pageNum-1)/5+1)*5;
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPageNum", pageNum);
		model.addAttribute("totalPageCount", totalPageCount);
		
		//링크 유지
		String additionalParam = "";
		if(searchContentCategory != null && searchBoardCategory != null && searchWord != null) {
			additionalParam += "&searchContentCategory=" + searchContentCategory;
			additionalParam += "&searchBoardCategory=" + searchBoardCategory;
			additionalParam += "&searchWord=" + searchWord;
		}
		
		model.addAttribute("additionalParam", additionalParam);
		
		
		return "board/notice";
	}
	
	@RequestMapping("noticeContentPage")
	public String noticeContentPage(int NoticeNo, Model model) {
		HashMap<String , Object> noticeData = boardService.getNoticeBoardData(NoticeNo);
		
		//HTML escape.. 특수문자 처라 <br> &nbsp;
		NoticeVo noticeV = (NoticeVo)noticeData.get("noticeVo");
		System.out.println(noticeV.getNotice_content());
		String content = noticeV.getNotice_content();
		content = StringEscapeUtils.escapeHtml4(content);
		content = content.replaceAll("\n", "<br>");
		content = content.replaceAll(" ", "&nbsp");
		noticeV.setNotice_content(content);
		
		model.addAttribute("noticeVo", noticeV);
		model.addAttribute("noticeData", noticeData);
		
		return "board/noticeContentPage";
	}
	
	@RequestMapping("noticeWritePage")
	public String noticeWritePage() {
		
		return "board/noticeWritePage";
	}
	
	@RequestMapping("noticeWriteProcess")
	public String noticeWriteProcess(NoticeVo noticeVo, MultipartFile [] noticeFiles) {
		
		ArrayList<NoticeFileInfoVo> noticeFileInfoVoList = new ArrayList<NoticeFileInfoVo>();
		
		// 이미지 파일 저장 
		for(MultipartFile file : noticeFiles) {
			if(file.isEmpty()) {
				continue;
			}
			
			String rootFilePath = "C:/uploadFiles/";
			
			String originalFilename = file.getOriginalFilename();
			String randomName = UUID.randomUUID().toString();
			randomName += "_" + System.currentTimeMillis();
			
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			randomName += ext;
			
			// 폴더 생성
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
			String todayFolderName = sdf.format(today);
			
			//todayFolderName = "C:/uploadFiles/" + todayFolderName;
			
			File todayFolder = new File(rootFilePath + todayFolderName);
			System.out.println(rootFilePath + todayFolderName);
			if(!todayFolder.exists()) {
				//하위폴더까지 만듬.
				todayFolder.mkdirs();
			}
			
			try {
				file.transferTo(new File(rootFilePath + todayFolderName + randomName));
				System.out.println("파일경로랑 이름 : " + rootFilePath + todayFolderName + randomName);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			NoticeFileInfoVo noticeFileInfoVo = new NoticeFileInfoVo();
			noticeFileInfoVo.setNotice_file_link(todayFolderName + randomName);
			noticeFileInfoVo.setNotice_file_originalName(originalFilename);
			
			noticeFileInfoVoList.add(noticeFileInfoVo);
		}
		
		System.out.println(noticeVo.getNotice_category()); 
		boardService.writeNotice(noticeVo,noticeFileInfoVoList);
		
		return "redirect:./notice";
	}
	
	@RequestMapping("noticeDeleteProcess")
	public String noticeDeleteProcess(int NoticeNo) {
		boardService.deleteNotice(NoticeNo);
		
		return"redirect:./notice";
	}
	
	@RequestMapping("noticeUpdatePage")
	public String noticeUpdatePage(int NoticeNo, Model model) {
		
		HashMap<String , Object> noticeData = boardService.getNoticeBoardData(NoticeNo);
		model.addAttribute("noticeVo", noticeData.get("noticeVo"));
		model.addAttribute("noticeFileInfoVoList", noticeData.get("noticeFileInfoVoList"));
		
		return "board/noticeUpdatePage";
	}
	
	@RequestMapping("noticeUpdateProcess")
	public String noticeUpdateProcess(NoticeVo noticeVo) {
		boardService.changeNoticeContent(noticeVo);
		
		return "redirect:./notice";
	}
	
	@RequestMapping("noticeSearchProcess")
	public String noticeSearchProcess(String searchContentCategory, String searchBoardCategory) {
		System.out.println(searchBoardCategory);
		return "board/notice";
	}
	
	@RequestMapping("noticeLogoutProcess")
	public String noticeLogoutProcess(HttpSession session) {
		session.invalidate();
		
		return "redirect:notice";
	}

	@RequestMapping("FAQPage")
	public String FAQPage(Model model) {
		ArrayList<String> NumString = new ArrayList<String>();
		NumString.add("One");
		NumString.add("Two");
		NumString.add("Three");
		NumString.add("Four");
		NumString.add("Five");
		NumString.add("Six");
		NumString.add("Seven");
		NumString.add("Eight");
		NumString.add("Nine");
		NumString.add("Ten");
		
		ArrayList<FAQVo> FAQList = boardService.getFAQBoardList();
		model.addAttribute("FAQList", FAQList);
		model.addAttribute("NumString", NumString);
		return "board/FAQPage";
	}
	
	@RequestMapping("FAQWritePage")
	public String FAQWritePage(FAQVo faqVo) {
		
		
		return "board/FAQWritePage";
	}
	
	@RequestMapping("FAQWriteProcess")
	public String FAQWriteProcess(FAQVo FaqVo) {
		
		boardService.writeFAQ(FaqVo);
		
		return "redirect:./FAQPage";
	}
	
	@RequestMapping("BasicFormOfMenuAndNav")
	public String BasicFormOfMenuAndNav() {
		return "commons/BasicFormOfMenuAndNav";
	}
}
