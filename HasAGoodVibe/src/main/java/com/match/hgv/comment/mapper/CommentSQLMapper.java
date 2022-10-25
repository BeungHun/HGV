package com.match.hgv.comment.mapper;

import java.util.ArrayList;

import com.match.hgv.vo.QandACommentVo;

public interface CommentSQLMapper {
	public void qAndAinsertComment (QandACommentVo qandACommentVo);
	public ArrayList<QandACommentVo> qAndAcontentAll();
	public QandACommentVo qAndAselectByNo(int qAndABoardNo);
}
