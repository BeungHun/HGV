package com.match.hgv.freeboard.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.match.hgv.freeboard.mapper.FreeBoardSQLMapper;
import com.match.hgv.freeboardcomment.mapper.FreeBoardCommentSQLMapper;
import com.match.hgv.member.mapper.MemberSQLMapper;
import com.match.hgv.vo.FreeBoardCommentVo;
import com.match.hgv.vo.FreeBoardVo;
import com.match.hgv.vo.MemberVo;

@Service
public class FreeBoardServiceImpl {

	@Autowired
	private FreeBoardSQLMapper freeBoardSQLMapper;
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	@Autowired
	private FreeBoardCommentSQLMapper freeBoardCommentSQLMapper;
	
	
	public void writeContent(FreeBoardVo freeBoardVo) {
		
		System.out.println("서비스.... 여기가 중요....");
		
		freeBoardSQLMapper.insertBoard(freeBoardVo);
		
	}
	
	public ArrayList<HashMap<String, Object>> getFreeBoardDataList(int pageNum) {
		
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>();
		
		ArrayList<FreeBoardVo> freeBoardList = freeBoardSQLMapper.selectAll(pageNum);
		
		
		for(FreeBoardVo freeBoardVo : freeBoardList) {
			int memberNo = freeBoardVo.getMember_no();
			MemberVo memberVo = memberSQLMapper.selectByMemberNo(memberNo);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("freeBoardVo", freeBoardVo);
			
			dataList.add(map);
			
		}
		return dataList;
		
	}
	
	public HashMap<String, Object> getFreeBoardData(int boardNo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> commentList = new ArrayList<HashMap<String, Object>>();
		
		FreeBoardVo freeBoardVo = freeBoardSQLMapper.selectBoardByNo(boardNo);
		int memberNo = freeBoardVo.getMember_no();
		MemberVo memberVo = memberSQLMapper.selectByMemberNo(memberNo);
		for (FreeBoardCommentVo freeBoardCommentVo : freeBoardCommentSQLMapper.selectCommentList(boardNo)) {
			HashMap<String, Object> commentMap = new HashMap<String, Object>();
			MemberVo commentMemberVo = memberSQLMapper.selectByMemberNo(freeBoardCommentVo.getMember_no());
			
			commentMap.put("commentVo", freeBoardCommentVo);
			commentMap.put("memberVo", commentMemberVo);
			commentList.add(commentMap);
		}
		
		map.put("commentList", commentList);
		map.put("freeBoardVo", freeBoardVo);
		map.put("memberVo", memberVo);
		
		return map;
	}
	
	public void increaseCount(int boardNo) {
		freeBoardSQLMapper.increaseReadCount(boardNo);
	}
	
	public void deleteContent(int boardNo) {
		freeBoardSQLMapper.deleteByNo(boardNo);
	}
	
	public void updateContent(FreeBoardVo freeBoardVo) {
		freeBoardSQLMapper.updateTitleAndContent(freeBoardVo);
	}
	
	public void writeComment(FreeBoardCommentVo freeBoardCommentVo) {
		freeBoardCommentSQLMapper.insertComment(freeBoardCommentVo);
	}
	
	
}
