package com.match.hgv.freeboard.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.match.hgv.freeboard.service.FreeBoardServiceImpl;
import com.match.hgv.vo.FreeBoardCommentVo;
import com.match.hgv.vo.FreeBoardVo;
import com.match.hgv.vo.MemberVo;

@Controller
@RequestMapping("/freeboard/*")
public class FreeBoardController {
	
	@Autowired
	private FreeBoardServiceImpl freeBoardService;
	

	@RequestMapping("writeContentPage")
	public String writeContentPage() {
		System.out.println("글쓰기를 실행하였습니다.");
		System.out.println("글쓰기를 실행하였습니다.");
		System.out.println("글쓰기를 실행하였습니다.");
		
		return "freeboard/writeContentPage";
	}
	
	@RequestMapping("writeContentProcess")
	public String writeContentProcess(FreeBoardVo param, HttpSession session) {
		MemberVo sessionMember = (MemberVo)session.getAttribute("sessionMemberInfo");
		int memberNo = sessionMember.getMember_no();
		
		param.setMember_no(memberNo);
		
		freeBoardService.writeContent(param);
		
		return "redirect:../member/freeboard";
	}
	
	@RequestMapping("readContentPage")
	public String readContentPage(int board_no , Model model) {
		
		freeBoardService.increaseCount(board_no);
		HashMap<String, Object> data = freeBoardService.getFreeBoardData(board_no);
		
		// HTML escape .. 특수문자 처리 <br> &nbsp;
		FreeBoardVo freeBoardVo = (FreeBoardVo)data.get("freeBoardVo");
		String content = freeBoardVo.getBoard_content();
		content = StringEscapeUtils.escapeHtml4(content);
		content = content.replaceAll(" ", "&nbsp;"); 
		content = content.replaceAll("\n", "<br>");
		freeBoardVo.setBoard_content(content);
		
		
		
		model.addAttribute("data", data);
		
		
		return "freeboard/readContentPage";
	}
	
	@RequestMapping("deleteContentProcess")
	public String deleteContentProcess(int board_no) {
		
		freeBoardService.deleteContent(board_no);
		
		
		return "redirect:../member/freeboard";
	}
	
	@RequestMapping("updateContentPage")
	public String updateContentPage(int board_no , Model model) {
		HashMap<String, Object> data = freeBoardService.getFreeBoardData(board_no);
		model.addAttribute("data", data);
		
		
		
		
		return "freeboard/updateContentPage";
	}
	
	@RequestMapping("updateContentProcess")
	public String updateContentProcess(FreeBoardVo param) {
		freeBoardService.updateContent(param);
		return "redirect:../member/freeboard";
	}
	

	@RequestMapping("writeCommentProcess")
	public String writeCommentProcess(FreeBoardCommentVo param , HttpSession session) {
		MemberVo sessionMember = (MemberVo)session.getAttribute("sessionMemberInfo");
		int memberNo = sessionMember.getMember_no();
		param.setMember_no(memberNo);
		
		freeBoardService.writeComment(param);
		
		return "redirect:../member/freeboard";
	}	
	
}
