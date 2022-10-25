package com.match.hgv.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.match.hgv.board.mapper.BoardSQLMapper;
import com.match.hgv.comment.mapper.CommentSQLMapper;
import com.match.hgv.member.mapper.MemberSQLMapper;
import com.match.hgv.vo.FAQVo;
import com.match.hgv.vo.MemberVo;
import com.match.hgv.vo.NoticeFileInfoVo;
import com.match.hgv.vo.NoticeVo;
import com.match.hgv.vo.QandABoardVo;
import com.match.hgv.vo.QandACommentVo;

@Service
public class BoardServiceImpl {

	@Autowired
	private BoardSQLMapper boardSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	@Autowired
	private CommentSQLMapper commentSQLMapper;
	
	
	public void QandAContent(QandABoardVo qandABoardVo) {
		boardSQLMapper.insertQAndABoard(qandABoardVo);
	}

	
	//처리중 하려고 member board comment admin 다 묶어놓음
	public ArrayList<HashMap<String, Object>> getBoardDataList() {
		ArrayList<HashMap<String, Object>> qandADataList = new ArrayList<HashMap<String, Object>>();
		ArrayList<QandABoardVo> qandABoardList = boardSQLMapper.selectAll();

		for(QandABoardVo qandABoardVo : qandABoardList) {

			int memberNo = qandABoardVo.getMember_no();
			int boardNo = qandABoardVo.getqAndABoard_no();
			MemberVo memberVo =  memberSQLMapper.selectByMemberNo(memberNo);
			
			HashMap<String, Object> QandAmap = new HashMap<String, Object>();
			QandACommentVo qandACommentVo = commentSQLMapper.qAndAselectByNo(boardNo);
		
			
			QandAmap.put("memberVo", memberVo);
			QandAmap.put("qandABoardVo", qandABoardVo);
			QandAmap.put("qandACommentVo", qandACommentVo);
			qandADataList.add(QandAmap);
			
			
		}
		return qandADataList;
	}
	
	public HashMap<String, Object> getBoardData(int qandABoardNo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		QandABoardVo qandABoardVo = boardSQLMapper.qandAselectByNo(qandABoardNo);
		int memberNo = qandABoardVo.getMember_no();
		MemberVo memberVo = memberSQLMapper.selectByMemberNo(memberNo);
		
		map.put("qandABoardVo", qandABoardVo);
		map.put("memberVo", memberVo);
		
		return map;
	}
	
	public void qandAincreaseReadCount(int qandABoardNo) {
		boardSQLMapper.qandAincreaseReadCount(qandABoardNo);
	}
	
	public void qandAdeleteContent(int qandABoardNo) {
		boardSQLMapper.qandAdeleteByNo(qandABoardNo);
		
	}
	
	public void qAndAupdateContent(QandABoardVo qandABoardVo) {
		boardSQLMapper.qandAupdateTitleAndContent(qandABoardVo);
	}				
	
	//// 공지사항 관련
	//공지사항 전체 리스트 불러오기
	public ArrayList<NoticeVo> getNoticeBoardList(String searchContentCategory, String searchBoardCategory , String searchWord, int pageNum) {
		
			ArrayList<NoticeVo> NoticeList = boardSQLMapper.selectNoticeAll(searchContentCategory, searchBoardCategory ,searchWord, pageNum);
			return NoticeList;
	}
	
	public int getNoticeCount(String searchContentCategory, String searchBoardCategory , String searchWord) {
		
		return boardSQLMapper.selectNoticeCount(searchContentCategory, searchBoardCategory, searchWord);
	}
	
	//공지사항 상세페이지
	public HashMap<String , Object> getNoticeBoardData(int NoticeNo) {
		HashMap<String , Object> map = new HashMap<String , Object>(); 
		NoticeVo noticeVo = boardSQLMapper.selectNoticeByNo(NoticeNo);
		ArrayList<NoticeFileInfoVo> noticeFileInfoVoList = boardSQLMapper.selectNoticeFile(NoticeNo);
		
		map.put("noticeVo", noticeVo);
		map.put("noticeFileInfoVoList", noticeFileInfoVoList);
		return map;
	}
	
	//공지사항 지우기
	public void deleteNotice(int NoticeNo) {
		boardSQLMapper.deleteNoticeByNo(NoticeNo);
	}
	
	//공지사항 작성하기
	public void writeNotice(NoticeVo noticeVo , ArrayList<NoticeFileInfoVo> noticeFileInfoVoList) {
		
		int noticePk = boardSQLMapper.createNoticePk();
		noticeVo.setNotice_no(noticePk);
		boardSQLMapper.insertNotice(noticeVo);
		
		for(NoticeFileInfoVo noticeFileInfoVo : noticeFileInfoVoList) {
			noticeFileInfoVo.setNotice_no(noticePk);
			boardSQLMapper.insertNoticeFile(noticeFileInfoVo);
		}
	}
	
	//공지사항 수정
	public void changeNoticeContent(NoticeVo noticeVo) {
		boardSQLMapper.updateNotice(noticeVo);
	}
	
	//FAQ 가져오기
	public ArrayList<FAQVo> getFAQBoardList() {
		ArrayList<FAQVo> FAQLs = boardSQLMapper.selectFAQAll();
				
		return FAQLs;
	}
	
	//FAQ 작성
	public void writeFAQ(FAQVo FaqVo) {
		boardSQLMapper.insertFAQ(FaqVo);
	}
}
