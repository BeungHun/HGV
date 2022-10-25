package com.match.hgv.randomBox.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.match.hgv.member.mapper.MemberSQLMapper;
import com.match.hgv.randomBox.mapper.RandomBoxSQLMapper;
import com.match.hgv.stylist.mapper.StylistSQLMapper;
import com.match.hgv.user.mapper.UserSQLMapper;
import com.match.hgv.vo.MemberVo;
import com.match.hgv.vo.RandomBoxOrderVo;
import com.match.hgv.vo.RandomBoxVo;
import com.match.hgv.vo.RandomBox_ImgVo;

@Service
public class RandomBoxServiceImpl {
	
	@Autowired
	private RandomBoxSQLMapper randomBoxSQLMapper;

	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	@Autowired
	private UserSQLMapper userSQLMapper;
	
	@Autowired
	private StylistSQLMapper stylistSQLMapper;
	
	public void RandomBoxContent(RandomBoxVo randomBoxVo , ArrayList<RandomBox_ImgVo> RandomBox_ImgVoList) {
		
		int randomPk = randomBoxSQLMapper.createRandomBoxPk();
		randomBoxVo.setRandomBox_no(randomPk);
		randomBoxSQLMapper.insertRandomBoxBoard(randomBoxVo);
		System.out.println(randomPk);
		for(RandomBox_ImgVo randomBox_ImgVo : RandomBox_ImgVoList) {
			randomBox_ImgVo.setRandomBox_no(randomPk);
			randomBoxSQLMapper.insertRandomBoxImage(randomBox_ImgVo);
			
		}
		
	}

	public ArrayList<HashMap<String, Object>> getRandomBoxList() {
	ArrayList<HashMap<String, Object>> randomBoxDataList = new ArrayList<HashMap<String,Object>>();
	ArrayList<RandomBoxVo> randomBoxList = randomBoxSQLMapper.randomBoxSelectAll();
	
	
		for(RandomBoxVo randomBoxVo : randomBoxList) {
		
			int memberNo = randomBoxVo.getMember_no();
			MemberVo memberVo = memberSQLMapper.selectByMemberNo(memberNo);
			
			HashMap<String, Object> RandomBoxmap = new HashMap<String, Object>();
			
			RandomBoxmap.put("memberVo", memberVo);
			RandomBoxmap.put("randomBoxVo", randomBoxVo);
			randomBoxDataList.add(RandomBoxmap);
		
		}
		return randomBoxDataList;
	}
	
	public HashMap<String, Object> getRandomBoxData(int randomboxNo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		RandomBoxVo randomBoxVo = randomBoxSQLMapper.randomBoxSelectByNo(randomboxNo);
		int memberNo = randomBoxVo.getMember_no();
		MemberVo memberVo = memberSQLMapper.selectByMemberNo(memberNo);
		
		ArrayList<RandomBox_ImgVo> randomBox_ImgVoList = randomBoxSQLMapper.selectRandomBoxImage(randomboxNo);
		
		map.put("randomBoxVo", randomBoxVo);
		map.put("memberVo", memberVo);
		map.put("randomBox_ImgVoList", randomBox_ImgVoList);
		
		return map;
	}
	
	public void randomBoxdelete(int randomNo) {
		randomBoxSQLMapper.randomBoxdeleteByNo(randomNo);
	}
	public void randomBoxUpdate(RandomBoxVo randomBoxVo) {
		randomBoxSQLMapper.randomBoxUpdate(randomBoxVo);
	}
	
	public void insertRandomBoxOrder() {
		RandomBoxOrderVo randomBoxOrderVo = new RandomBoxOrderVo();
		
		randomBoxSQLMapper.insertRandomBoxOrder(randomBoxOrderVo);
	}
	
}
