package com.match.hgv.randomBox.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.match.hgv.randomBox.service.RandomBoxServiceImpl;
import com.match.hgv.vo.MemberVo;
import com.match.hgv.vo.RandomBoxOrderVo;
import com.match.hgv.vo.RandomBoxVo;
import com.match.hgv.vo.RandomBox_ImgVo;

@Controller
@RequestMapping("/randomBox/*")
public class RandomBoxController {
	
	@Autowired
	private RandomBoxServiceImpl randomboxService;

	@RequestMapping("randomBoxListTotal")
	public String randomBoxListTotal(Model model) {
		
		ArrayList<HashMap<String, Object>> randomBoxdataList =randomboxService.getRandomBoxList();
		model.addAttribute("randomBoxdataList", randomBoxdataList);
		
		return"randomBox/randomBoxListTotal";
	}
	
	@RequestMapping("randomBoxCard")
	public String randomBoxCard() {
		
		return"randomBox/randomBoxCard";
	}
	@RequestMapping("CardContentProcess")
	public String CardContentProcess(RandomBoxVo param ,MultipartFile [] files, HttpSession session) {
		
		ArrayList<RandomBox_ImgVo> RandomBox_ImgVoList = new ArrayList<RandomBox_ImgVo>();
		
		for(MultipartFile file : files) {
			
			if(file.isEmpty()) {
				continue;
			}
			
			String rootFilePath = "C:/uploadFiles/";
			
			String originalFileName = file.getOriginalFilename();
			
			String randomName = UUID.randomUUID().toString();
			randomName += "_" + System.currentTimeMillis();
			
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			randomName += ext;
			
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
			String todayFolderName = sdf.format(today);
			
			
			
			File todayFolder = new File(rootFilePath + todayFolderName);
			if(!todayFolder.exists()) {
				todayFolder.mkdirs();
			}
			
			try {
				file.transferTo(new File(rootFilePath + todayFolderName + randomName));
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			RandomBox_ImgVo randomBox_ImgVo = new RandomBox_ImgVo();
			randomBox_ImgVo.setRandomBox_Img_link(todayFolderName + randomName);
			randomBox_ImgVo.setRandomBox_Img_name(originalFileName);
			
			RandomBox_ImgVoList.add(randomBox_ImgVo);
		}
		
		
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionMemberInfo");
		int memberNo = sessionUser.getMember_no();
		
		param.setMember_no(memberNo);
		
		randomboxService.RandomBoxContent(param, RandomBox_ImgVoList);
		
		return"redirect: ./randomBoxListTotal";
	}
	
	@RequestMapping("randomBoxReadPage")
	public String randomBoxReadPage(int randomBox_no, Model model) {
		
		HashMap<String, Object> randomBoxdata = randomboxService.getRandomBoxData(randomBox_no); 
		
		model.addAttribute("randomBoxdata", randomBoxdata);
		
		return "randomBox/randomBoxReadPage";
	}
	@RequestMapping("randomBoxdeleteProcess")
	public String randomBoxdeleteProcess (int randomBox_no) {

		randomboxService.randomBoxdelete(randomBox_no);
		return "redirect: ./randomBoxListTotal";
	}
	@RequestMapping("randomBoxUpdateCard")
	public String randomBoxUpdateCard(int randomBox_no, Model model) {
		HashMap<String, Object> randomBoxUpDateData =randomboxService.getRandomBoxData(randomBox_no);
		model.addAttribute("randomBoxUpDateData",randomBoxUpDateData);
		return "randomBox/randomBoxUpdateCard";
	}
	@RequestMapping("randomBoxUpdateCardProcess")
	public String randomBoxUpdateCardProcess(RandomBoxVo param) {
		randomboxService.randomBoxUpdate(param);
		return"redirect:./randomBoxListTotal";
	}
	@RequestMapping("randomBoxStore")
	public String randomBoxStore(int randomBox_no, Model model) {
	
		HashMap<String, Object> randomBoxdata = randomboxService.getRandomBoxData(randomBox_no); 
		
		ArrayList<HashMap<String, Object>> randomBoxdataList =randomboxService.getRandomBoxList();
		model.addAttribute("randomBoxdataList", randomBoxdataList);
		model.addAttribute("randomBoxdata", randomBoxdata);
	
		return"randomBox/randomBoxStore";
	}
	
	@RequestMapping("randomBoxOrderProcess")
	public String randomBoxOrderProcess (RandomBoxOrderVo randomBoxOrderVo, HttpSession session) {
		
		

		return "redirect: ./randomBoxListTotal";
	}
	
}