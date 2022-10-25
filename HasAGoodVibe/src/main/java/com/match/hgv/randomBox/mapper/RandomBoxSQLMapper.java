package com.match.hgv.randomBox.mapper;

import java.util.ArrayList;

import com.match.hgv.vo.PostVo;
import com.match.hgv.vo.RandomBoxOrderVo;
import com.match.hgv.vo.RandomBoxVo;
import com.match.hgv.vo.RandomBox_ImgVo;

public interface RandomBoxSQLMapper {
	
	public int createRandomBoxPk();
	
	public void insertRandomBoxBoard(RandomBoxVo randomBoxVo);
	public ArrayList<RandomBoxVo> randomBoxSelectAll();
	public RandomBoxVo randomBoxSelectByNo(int randomBoxNo);
	public void randomBoxdeleteByNo(int randomBoxNo);
	public void randomBoxUpdate(RandomBoxVo randomBoxVo);
	public void insertRandomBoxImage(RandomBox_ImgVo randomBox_ImgVo);
	public ArrayList<RandomBox_ImgVo> selectRandomBoxImage(int randomBoxNo);
	public void insertPost(PostVo postVo);
	public ArrayList<RandomBox_ImgVo> selectpost(int postNo);
	public void insertRandomBoxOrder(RandomBoxOrderVo randomBoxOrderVo);
	
	
}
