package com.match.hgv.freeboard.mapper;

import java.util.ArrayList;

import com.match.hgv.vo.FreeBoardCommentVo;
import com.match.hgv.vo.FreeBoardVo;

public interface FreeBoardSQLMapper {

	
	public void insertBoard(FreeBoardVo freeBoardVo);
	public ArrayList<FreeBoardVo> selectAll(
			int pageNum
			);
	public FreeBoardVo selectBoardByNo(int boardNo); // 변수명 하고싶은대로 해도된다고함
	public void increaseReadCount(int boardNo);
	public void deleteByNo(int boardNo);
	public void updateTitleAndContent(FreeBoardVo freeBoardVo);
	
		
	
}
