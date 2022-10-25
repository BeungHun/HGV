package com.match.hgv.admin.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.match.hgv.admin.mapper.AdminSQLMapper;
import com.match.hgv.member.mapper.MemberSQLMapper;
import com.match.hgv.vo.AdminVo;
import com.match.hgv.vo.MemberFreezeVo;
import com.match.hgv.vo.MemberVo;
import com.match.hgv.vo.ReportVo;
import com.match.hgv.vo.Report_file_infoVo;

@Service
public class AdminServiceImpl {

	@Autowired
	AdminSQLMapper adminSQLMapper;
	
	@Autowired
	MemberSQLMapper memberSQLMapper;
	
	public AdminVo adminLogin(AdminVo adminVo) {
		AdminVo result = adminSQLMapper.selectHGVadminIdAndPw(adminVo);
		
		return result;
	}
	
	public ArrayList<MemberVo> getMemberList(String searchType , String searchWord , int pageNum){
		ArrayList<MemberVo> memberList = adminSQLMapper.selectAllMember(searchType,searchWord,pageNum);
		
		return memberList;
	}
	
	public void updateMemberFreeze(MemberFreezeVo memberFreezeVo) {
		adminSQLMapper.updateMemberFreezeVo(memberFreezeVo);
	}
	
	public void insertMemberFreeze(MemberFreezeVo memberFreezeVo) {
		adminSQLMapper.insertMemberFreezeVo(memberFreezeVo);
	}
	
	public MemberFreezeVo getMemberFreezeVo (int member_no) {
		MemberFreezeVo memberFreezeVo = adminSQLMapper.selectMemberFreezeVoByNo(member_no);
		return memberFreezeVo;
	}
	
	public ArrayList<HashMap<String, Object>> getMemberFreezeVoAndMember(String searchType , String searchWord , int pageNum) {
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>();
		ArrayList<MemberVo> memberList = adminSQLMapper.selectAllMember(searchType , searchWord , pageNum);
		
		
		for(MemberVo memberVo : memberList) {
			MemberFreezeVo memberFreezeVo = adminSQLMapper.selectMemberFreezeVoByNo(memberVo.getMember_no());
			HashMap<String , Object> map = new HashMap<String , Object>();
			map.put("memberVo", memberVo);
			map.put("memberFreezeVo", memberFreezeVo);
			dataList.add(map);
			
		}
		
		return dataList;
	}
	
	// paging 위한 코드
	public int getMemberCount(String searchType , String searchWord) {
		
		int MemberCount = adminSQLMapper.selectCountByMember(searchType, searchWord);
		
		return MemberCount;
	}
	
	//정지 풀림 기능.. 바로 FreezeVo에서 지워지게 하는 것임.
	public void eraseMemberFreezeVo(int memberNo) {
		adminSQLMapper.deleteMemberFreezeVoByNo(memberNo);
	}
	
	
	// 신고리스트 불러오기
	public ArrayList<HashMap<String, Object>> getAllReport(){
		ArrayList<HashMap<String, Object>> allReportDataList = new ArrayList<HashMap<String, Object>>();
		ArrayList<ReportVo> reportList = adminSQLMapper.selectAllReport();
			
		for(ReportVo reportData : reportList) {
			HashMap<String , Object> map = new HashMap<String, Object>();
			MemberVo reportedMemberData = memberSQLMapper.selectByMemberNo(reportData.getReported_member_no());
			MemberVo reportingMemberData = memberSQLMapper.selectByMemberNo(reportData.getReporting_member_no());
				
			System.out.println("AdminService" + reportData.getReport_no());
				
			map.put("reportedMemberData", reportedMemberData);
			map.put("reportingMemberData", reportingMemberData);
			map.put("reportData", reportData);
			
			allReportDataList.add(map);
		}
			
			
			
			return allReportDataList;
			
		}
		
	//report_no로 report정보 따오기
	public HashMap<String, Object> getReportByNo(int report_no) {
		HashMap<String , Object> reportDataIncludePhoto = new HashMap<String , Object>(); 
		ArrayList <Report_file_infoVo> report_file_infoList = adminSQLMapper.selectReport_file_infoVoList(report_no);
		ReportVo reportVo = adminSQLMapper.selectReportByNo(report_no);
	
		reportDataIncludePhoto.put("reportVo", reportVo);
		reportDataIncludePhoto.put("report_file_infoList", report_file_infoList);
		return reportDataIncludePhoto;
	}
	
	//신고 반려하기(삭제기능)
	public void reportReject(int report_no) {
		adminSQLMapper.updateReportComplete(report_no);
		
	}
	
}
