package com.match.hgv.report.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.match.hgv.report.mapper.ReportSQLMapper;
import com.match.hgv.vo.ReportVo;

@Service
public class ReportServiceImpl {

	@Autowired
	ReportSQLMapper reportSQLMapper;
	
	public void insertReportVo(ReportVo reportVo) {
		reportSQLMapper.insertReportVo(reportVo);
	}
}
