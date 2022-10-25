package com.match.hgv.board.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.match.hgv.vo.FAQVo;
import com.match.hgv.vo.NoticeFileInfoVo;
import com.match.hgv.vo.NoticeVo;
import com.match.hgv.vo.QandABoardVo;

public interface BoardSQLMapper {
	
	// Q&A 관련
	public void insertQAndABoard(QandABoardVo qandABoardVo);
	public ArrayList<QandABoardVo> selectAll();
	public QandABoardVo qandAselectByNo(int qandABoardNo);
	public void qandAincreaseReadCount(int qandABoardNo);
	public void qandAdeleteByNo(int qandABoardNo);
	public void qandAupdateTitleAndContent(QandABoardVo qandABoardVo);
	
	// 공지사항 관련.
	public int createNoticePk();
	// notice-------------------------------------------------------------
	//notice데이터 가져오기
		public ArrayList<NoticeVo> selectNoticeAll(
				@Param("searchContentCategory") String searchContentCategory, 
				@Param("searchBoardCategory")String searchBoardCategory,
				@Param("searchWord")String searchWord,
				@Param("pageNum") int pageNum
				);
		public NoticeVo selectNoticeByNo(int NoticeNo);
	//notice페이징 처리 위한 메소드
		public int selectNoticeCount(
				@Param("searchContentCategory") String searchContentCategory, 
				@Param("searchBoardCategory")String searchBoardCategory,
				@Param("searchWord")String searchWord
				);
	//notice쓰기
		public void insertNotice(NoticeVo noticeVo);
	//notice 지우기
		public void deleteNoticeByNo(int NoticeNo);
	//업데이트
		public void updateNotice(NoticeVo noticeVo);
	//이미지
		public void insertNoticeFile(NoticeFileInfoVo noticeFileInfoVo);
		public ArrayList<NoticeFileInfoVo> selectNoticeFile(int noticeNo);
	//FAQ----------------------------------------------------------------------	
	//FAQ 리스트 뽑아오기
		public ArrayList<FAQVo> selectFAQAll();
	//FAQ 입력
		public void insertFAQ(FAQVo FaqVo);
}
