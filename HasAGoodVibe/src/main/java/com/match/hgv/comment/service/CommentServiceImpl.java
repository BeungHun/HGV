package com.match.hgv.comment.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.match.hgv.admin.mapper.AdminSQLMapper;
import com.match.hgv.board.mapper.BoardSQLMapper;
import com.match.hgv.comment.mapper.CommentSQLMapper;
import com.match.hgv.member.mapper.MemberSQLMapper;
import com.match.hgv.vo.AdminVo;
import com.match.hgv.vo.MemberVo;
import com.match.hgv.vo.QandACommentVo;

@Service
public class CommentServiceImpl {

	@Autowired
	private AdminSQLMapper adminSQLMapper;

	@Autowired
	private CommentSQLMapper commentSQLMapper;
	
	@Autowired
	private BoardSQLMapper boardSQLMapper;
	
	public void writeComment(QandACommentVo qandAcommentVo) {
		commentSQLMapper.qAndAinsertComment(qandAcommentVo);
	}
	
	public HashMap<String, Object> getBoardData(int qAndABoardNo){
		
		HashMap<String, Object> map = new HashMap<>();
		
		QandACommentVo qandAcommentVo = commentSQLMapper.qAndAselectByNo(qAndABoardNo);;
		int adminNo = qandAcommentVo.getAdmin_no();
		AdminVo adminVo = adminSQLMapper.adminselectByNo(adminNo);
		
		
		map.put("adminVo", adminVo);
		map.put("qandAcommentVo", qandAcommentVo);
		
		
		return map;
	}
	
	public ArrayList<HashMap<String, Object>> getCommentList() {
		ArrayList<HashMap<String, Object>> commentDataList = new ArrayList<HashMap<String, Object>>();
		ArrayList<QandACommentVo> commentList = commentSQLMapper.qAndAcontentAll();
		
		for(QandACommentVo qandAcommentVo : commentList) {
			int adminNo = qandAcommentVo.getAdmin_no();
			AdminVo adminVo = adminSQLMapper.adminselectByNo(adminNo);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("adminVo", adminVo);
			map.put("qandAcommentVo", qandAcommentVo);
			commentDataList.add(map);
		}
		
		return commentDataList;
		
	}
	
}
