package com.match.hgv.admin.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.match.hgv.admin.service.AdminServiceImpl;
import com.match.hgv.board.service.BoardServiceImpl;
import com.match.hgv.member.service.MemberServiceImpl;
import com.match.hgv.vo.AdminVo;
import com.match.hgv.vo.MemberFreezeVo;
import com.match.hgv.vo.MemberVo;
import com.match.hgv.vo.ReportVo;





@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	
	@Autowired
	AdminServiceImpl adminService;
	
	@Autowired
	MemberServiceImpl memberService;
	
	@Autowired
	BoardServiceImpl boardService;
	
	//Admin로그인페이지
	@RequestMapping("loginPage")
	public String loginPage() {
		
		return "admin/loginPage";
	}
	@RequestMapping("adminMainPage")
	public String adminMainPage() {
		
		return "admin/adminMainPage";
	}
	//Admin로그인프로세스
	@RequestMapping("adminloginProcess")
	public String adminloginProcess(AdminVo param, HttpSession session) {
		
		AdminVo adminInfo = adminService.adminLogin(param); 
		
		if(adminInfo == null) {
			return "admin/loginPage";
		}else {
			session.setAttribute("adminInfo", adminInfo);
			return "redirect: ../admin/adminMainPage";
		}
	}
	//Admin로그아웃페이지
	@RequestMapping("logoutProcess")
	public String logoutProcess(HttpSession session) {
		session.invalidate();
		return "redirect: ../admin/loginPage";
	}
	
	//회원관리 페이지
	@RequestMapping("memberManagePage")
	public String memberManagePage(Model model , String searchType , String searchWord , @RequestParam(value = "pageNum",defaultValue="1")int pageNum) {
		ArrayList<MemberVo> memberList = adminService.getMemberList(searchType,searchWord,pageNum);
		model.addAttribute("memberList", memberList);
		
		ArrayList<HashMap<String , Object>> dataList = adminService.getMemberFreezeVoAndMember(searchType,searchWord,pageNum);
		
		int memberCount = adminService.getMemberCount(searchType, searchWord);
		
		int totalPageCount = (int)Math.ceil(memberCount/10.0);
		int startPage = ((pageNum-1)/5)*5+1;
		int endPage = ((pageNum-1)/5+1)*5;
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("currentPageNum", totalPageCount);
		
		//링크... 유지
		String additionalParam = "";
		if(searchType != null && searchWord != null) {
			additionalParam += "&searchType=" + searchType;
			additionalParam += "&searchWord=" + searchWord;
		}
		
		model.addAttribute("additionalParam", additionalParam);
		
		model.addAttribute("dataList",dataList);
		return "admin/memberManagePage";
	}
	
	//제재 프로세스
	@RequestMapping("memberFreezePage") 
	public String memberFreezePage(Model model , int member_no) {
		MemberVo memberInfo = memberService.getMemberInfo(member_no);
		
		model.addAttribute("memberInfo", memberInfo);
		
 		
		
		return "/admin/memberFreezePage";
	}
	
	@RequestMapping("memberFreezeProcess")
	public String memberFreezeProcess(MemberFreezeVo memberFreezeVo, @RequestParam(value="FreezeDate" , defaultValue="0")int FreezeDate) {
		
		//해당 멤버no가 freezeVo에 존재하지 않는다면(정지 안먹었다면) 현재 날짜를 기준으로 canLoginDate에 정지시킬 일수를 추가한다.
		if(adminService.getMemberFreezeVo(memberFreezeVo.getMember_no()) == null) {
			Date date = new Date();
			Calendar cal = Calendar.getInstance();
			System.out.println("정지안먹은상태로 들어옴"+ date);
			cal.setTime(date);
			cal.add(Calendar.DATE, FreezeDate);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			try {
				date = sdf.parse(sdf.format(cal.getTime()));
			}catch(Exception e) {
				e.printStackTrace();
			}
			memberFreezeVo.setMember_canLoginDate(date);
			
			adminService.insertMemberFreeze(memberFreezeVo);
		//해당 멤버no가 freezeVo에 존재한다면(정지를 먹었었다면) 정지먹어서 로그인 할 수 없는 날짜를 기준으로 canLoginDate에 정지시킬 일수를 추가한다.
		}else {
			MemberFreezeVo memberFreezeVoInfo = adminService.getMemberFreezeVo(memberFreezeVo.getMember_no());
			Date date = memberFreezeVoInfo.getMember_canLoginDate();
			Calendar cal = Calendar.getInstance();
			System.out.println("정지먹은상태로 들어옴"+date);
			cal.setTime(date);
			cal.add(Calendar.DATE, FreezeDate);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				date = sdf.parse(sdf.format(cal.getTime()));
			}catch(Exception e) {
				e.printStackTrace();
			}
			memberFreezeVo.setMember_canLoginDate(date);
			adminService.updateMemberFreeze(memberFreezeVo);
		}
		
		return "redirect:../admin/memberManagePage";
	}
	
	@RequestMapping("deleteMemberFreezeVoProcess")
	public String deleteMemberFreezeVoProcess(HttpSession session , int member_no) {
		
		adminService.eraseMemberFreezeVo(member_no);
		
		return "redirect:./memberManagePage";
		
	}
	
	@RequestMapping("memberPostManagePage")
	public String memberPostManagePage() {
		
		
		return"";
	}
	
	//신고페이지
	@RequestMapping("reportManagePage")
	public String reportManagePage(Model model) {
		
		ArrayList<HashMap<String, Object>> reportList = adminService.getAllReport();
		model.addAttribute("reportList", reportList);
		
		return "admin/reportManagePage";
	}
	
	@RequestMapping("reportContentPage")
	public String reportContentPage(Model model , @RequestParam(value="report_no", defaultValue="0")int report_no) {
		
		HashMap<String, Object> reportData = adminService.getReportByNo(report_no);
		
		ReportVo reportVo = (ReportVo)reportData.get("reportVo");
		
		
		MemberVo reportedMember = memberService.getMemberInfo(reportVo.getReported_member_no());
		MemberVo reportingMember = memberService.getMemberInfo(reportVo.getReported_member_no());
		
		model.addAttribute("reportData", reportData);
		model.addAttribute("reportingMember", reportingMember);
		model.addAttribute("reportedMember", reportedMember);
		
		return "admin/reportContentPage";
	}
	
	@RequestMapping("reportRejectingProcess")
	public String reportRejectingProcess(ReportVo reportVo) {
		
		adminService.reportReject(reportVo.getReport_no());
		
		
		return "redirect:./reportManagePage";
	}
	
}
