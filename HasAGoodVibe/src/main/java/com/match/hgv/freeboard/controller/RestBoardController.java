package com.match.hgv.freeboard.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.match.hgv.freeboard.service.FreeBoardServiceImpl;
import com.match.hgv.vo.FreeBoardCommentVo;
import com.match.hgv.vo.MemberVo;


@Controller
@RequestMapping("/freeboard/*")
public class RestBoardController {
	
	@Autowired
	private FreeBoardServiceImpl freeBoardService;
	
	
	@RequestMapping("writeComment")
	public HashMap<String, Object> writeComment(FreeBoardCommentVo param, HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
			
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUserInfo");
		int memberNo = memberVo.getMember_no();
		param.setMember_no(memberNo);
		
		freeBoardService.writeComment(param);
		
		map.put("result", "success");
		
			
		return map;  
	}
	
	
	
	
	
	
	
	
	
}
