package com.match.hgv.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.match.hgv.report.service.ReportServiceImpl;
import com.match.hgv.vo.ReportVo;

@Controller
@RequestMapping("/report/*")
public class ReportController {

	@Autowired
	ReportServiceImpl reportService;
	
	
	@RequestMapping("reportPage")
	public String reportPage() {
		
		return "report/reportPage";
	}
	
	
	@RequestMapping("reportProcess")
	public String reportProcess(ReportVo reportVo) {
	
		System.out.println(reportVo.getReport_confirm());
		
		reportService.insertReportVo(reportVo);
		
		return "report/reportSuccessPage";
	}
	
	
	
	
}
