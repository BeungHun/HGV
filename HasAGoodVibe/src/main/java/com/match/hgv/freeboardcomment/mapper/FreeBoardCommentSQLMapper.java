package com.match.hgv.freeboardcomment.mapper;

import java.util.ArrayList;

import com.match.hgv.vo.FreeBoardCommentVo;

public interface FreeBoardCommentSQLMapper {

	//댓글 T
		public void insertComment(FreeBoardCommentVo freeBoardCommentVo);
		public ArrayList<FreeBoardCommentVo> selectCommentList(int freeboard_no);
		
		public void deleteComment(int freeboard_comment_no);
		public void updateComment(FreeBoardCommentVo freeBoardCommentVo);
	
	
	
}
