package com.match.hgv.comment.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.match.hgv.board.service.BoardServiceImpl;
import com.match.hgv.comment.service.CommentServiceImpl;
import com.match.hgv.vo.AdminVo;
import com.match.hgv.vo.MemberVo;
import com.match.hgv.vo.QandACommentVo;

@Controller
@RequestMapping("/comment/*")
public class CommentController {

	@Autowired
	private BoardServiceImpl boardService;
	
	@Autowired
	private CommentServiceImpl commentService;
	//코멘트 프로세스
	@RequestMapping("WriteCommentProcess")
	public String WriteCommentProcess(int qAndABoard_no, QandACommentVo param , HttpSession session) {
		AdminVo adminsessionUser = (AdminVo)session.getAttribute("adminInfo");
		int adminNo = adminsessionUser.getAdmin_no();
		param.setAdmin_no(adminNo);
		commentService.writeComment(param);	
		return "redirect:../board/adminQAndAReadPage?qAndABoard_no=" + qAndABoard_no;
	}
}
