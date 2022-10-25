package com.match.hgv.admin.mapper;

import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PatchMapping;

import com.match.hgv.vo.AdminVo;
import com.match.hgv.vo.MemberFreezeVo;
import com.match.hgv.vo.MemberVo;
import com.match.hgv.vo.ReportVo;
import com.match.hgv.vo.Report_file_infoVo;

public interface AdminSQLMapper {


	public AdminVo selectHGVadminIdAndPw(AdminVo adminVo);
	public AdminVo adminselectByNo(int adminNo);
	public MemberVo selectMemberByNo(int member_no);
	public ArrayList<MemberVo> selectAllMember(@Param("searchType") String searchType ,
												@Param("searchWord") String searchWord ,
												@Param("pageNum") int pageNum); 
	public ArrayList<MemberFreezeVo> selectAllMemberFreezeVo();
	public void insertMemberFreezeVo(MemberFreezeVo memberFreeze);
	public void updateMemberFreezeVo(MemberFreezeVo memberFreeze);
	public void deleteMemberFreezeVoByNo(int memberNo);
	public MemberFreezeVo selectMemberFreezeVoByNo(int member_no);
	//신고관련.
	public ArrayList<ReportVo> selectAllReport();
	public ReportVo selectReportByNo(int report_no);
	public ArrayList<Report_file_infoVo> selectReport_file_infoVoList(int report_no);
	public void deleteReport (int report_no);
	public void updateReportComplete(int report_no);
	
	public int selectCountByMember(@Param("searchType")String searchType, @Param("searchWord")String serarchWord);
	
}
