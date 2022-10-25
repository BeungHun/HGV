package com.match.hgv.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.match.hgv.member.mapper.MemberSQLMapper;
import com.match.hgv.stylist.mapper.StylistSQLMapper;
import com.match.hgv.user.mapper.UserSQLMapper;
import com.match.hgv.vo.AttendVo;
import com.match.hgv.vo.BlogCommentVo;
import com.match.hgv.vo.FriendVo;
import com.match.hgv.vo.MemberVo;
import com.match.hgv.vo.MessageVo;
import com.match.hgv.vo.ReportVo;
import com.match.hgv.vo.Report_file_infoVo;
import com.match.hgv.vo.StylistVo;
import com.match.hgv.vo.UserVo;
import com.match.hgv.vo.blogCategoryVo;
import com.match.hgv.vo.blogVo;

@Service
public class MemberServiceImpl {
	
	@Autowired
	private MemberSQLMapper memberSQLmapper; 
	@Autowired
	private UserSQLMapper userSQLMapper; 
	@Autowired
	private StylistSQLMapper stylistSQLMapper; 
	
	public boolean isExistId(String member_id) {
		//중복확인
		if(memberSQLmapper.selectCountById(member_id) > 0) {
			return true;
		}else {
			return false;
		}
	}
	
	//멤버 로그인
	public HashMap<String,Object> loginProcess(MemberVo param) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		MemberVo memberVo = memberSQLmapper.selectHGVmemberIdAndPw(param);
		int member_no = memberVo.getMember_no();
		
		UserVo userVo = userSQLMapper.selectByMemberNo(member_no);
		StylistVo stylistVo = stylistSQLMapper.selectByMemberNo(member_no);
		
		map.put("memberVo", memberVo);
		map.put("userVo", userVo);
		map.put("stylistVo", stylistVo);
		
		return map; 
	}
	
	//멤버 프로필 업데이트
	public void updateMemberProfile(MemberVo param) {
		memberSQLmapper.updateHGVmemberProfile(param);
	}
	
	//------------------메세지---------------------------------
	//회원목록 출력 
	public ArrayList<HashMap<String, Object>> getMemberDataList(String searchType, String searchWord) {
		
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<MemberVo> memberList = memberSQLmapper.selectAll(searchType, searchWord);
		
		for(MemberVo memberVo : memberList) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			dataList.add(map);
			
		}
		return dataList;
	}
		
	//친구 추가
	public void insertFriend(FriendVo friendVo) {
		memberSQLmapper.insertFriend(friendVo);
		
	}
	
	//친구 목록 출력 
	public ArrayList<HashMap<String, Object>> getFriendDataList(int memberNo) {
		
		ArrayList<HashMap<String, Object>> fdataList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<FriendVo> friendList = memberSQLmapper.friendList(memberNo);
		
	
		for(FriendVo friendVo : friendList) {
			int bfmemberNo = friendVo.getBfmember_no();
			MemberVo memberVo = (MemberVo)memberSQLmapper.selectByMemberNo(bfmemberNo);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("friendVo", friendVo);
			map.put("memberVo", memberVo);
			
			//map.put("memberVo", memberSQLmapper.selectByNo(friendVo.getMember_no()));
			fdataList.add(map);
			
		}
		return fdataList;
	}
		
		
	//친구 삭제
	public void deleteFriend(int bfmemberNo) {
		memberSQLmapper.deleteFriend(bfmemberNo);
	}
		
		
	//쪽지 쓰기
	public void writeMessage(MessageVo messageVo) {
		memberSQLmapper.insertMessage(messageVo);
	}
		
	//쪽지보내기로 유저의 정보 가져오는 로직
	public MemberVo getMemberInfo(int bfmemberNo) {
		return memberSQLmapper.selectMemberInfo(bfmemberNo);
	}
	
	
	//보낸메세지 리스트 
	public ArrayList<HashMap<String, Object>> getSentMessageList(int memberNo){
		
		ArrayList<HashMap<String, Object>> sentMessageList = new ArrayList<HashMap<String, Object>>();
		ArrayList<MessageVo> sentList = memberSQLmapper.getSentMessageList(memberNo);
		
		for(MessageVo messageVo : sentList) {
			
			int bfMemberNo = messageVo.getBfmember_no();
			MemberVo memberVo = memberSQLmapper.selectByMemberNo(bfMemberNo);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("messageVo", messageVo);
			
			sentMessageList.add(map);
		}
		return sentMessageList; 
	}
		
	// 받은 메시지 리스트 
	public ArrayList<HashMap<String, Object>> getRecievedMessageList(int memberNo){

		ArrayList<HashMap<String, Object>> recievedMessageList = new ArrayList<HashMap<String, Object>>();
		ArrayList<MessageVo> recievedList = memberSQLmapper.getRecievedMessageList(memberNo);
		
		for(MessageVo messageVo : recievedList) {
			int sendMemberNo = messageVo.getMember_no();
			MemberVo sendMemberVo = memberSQLmapper.selectByMemberNo(sendMemberNo);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", sendMemberVo);
			map.put("messageVo", messageVo);

			recievedMessageList.add(map);
		}
		return recievedMessageList;
	}
	
	//읽음 확인 
	public void updateReadDate(int memberNo) {
		memberSQLmapper.updateReadDate(memberNo);
	}
	
	//메시지 삭제
	public void deleteMessage(int messageNo) {
		memberSQLmapper.deleteMessage(messageNo);
	}
	
	//------------------이벤트---------------------------------
	public void insertEComment(AttendVo attendVo) {
		if (memberSQLmapper.selectCountByNo(attendVo.getMember_no()) == 0) {
			MemberVo memberVo = memberSQLmapper.selectByMemberNo(attendVo.getMember_no());
			memberSQLmapper.updateMemberCash(memberVo, 20);
			memberSQLmapper.insertEComment(attendVo);
		}else {
			return;
		}
	}
		
	//이벤트 댓글리스트 출력 (닉네임, 댓글내용, 쓴 날짜) 
	public ArrayList<HashMap<String, Object>> getCommentList(int memberNo) {
		
		ArrayList<HashMap<String, Object>> datas = new ArrayList<HashMap<String,Object>>();
		ArrayList<AttendVo> e_commentList = memberSQLmapper.e_commentList(memberNo);
		
		for(AttendVo attendVo : e_commentList) {
			MemberVo memberVo = (MemberVo)memberSQLmapper.selectByMemberNo(attendVo.getMember_no());
		
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("attendVo", attendVo);
			map.put("memberVo", memberVo);
			
			datas.add(map);
		}
		
		return datas;
	}
	
	public int isDateExists(int member_no) {
		return memberSQLmapper.selectCountByNo(member_no);
	}

	public void deleteEComment(int attendNo) {
		memberSQLmapper.deleteEComment(attendNo);
	}
	
	public void updateEComment(AttendVo attendVo) {
		memberSQLmapper.updateEComment(attendVo);
	}
	
	//신고하기
	public void insertReport(ReportVo reportVo , ArrayList<Report_file_infoVo> report_file_infoList){
		int reportPk = memberSQLmapper.createReportNoPk();
		reportVo.setReport_no(reportPk);
		memberSQLmapper.insertReportVo(reportVo);
		
		for(Report_file_infoVo file : report_file_infoList) {
			file.setReport_no(reportPk);
			memberSQLmapper.insertReport_file_infoVo(file);
		}
	}
	
	//--------블로그----------------
	//카테고리 입력 
	public void insertCategory(blogCategoryVo categoryVo) {
		memberSQLmapper.insertCategory(categoryVo);
	}
	
	//카테고리 출력
	public ArrayList<HashMap<String, Object>> getCategoryList(int stylistNo) {
		
		ArrayList<HashMap<String, Object>> datas = new ArrayList<HashMap<String, Object>>();
		ArrayList<blogCategoryVo> categoryList = memberSQLmapper.categoryList(stylistNo);
		
		for(blogCategoryVo categoryVo : categoryList) {
			StylistVo stylistVo = (StylistVo)memberSQLmapper.selectByStylistNo(categoryVo.getStylist_no());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("categoryVo", categoryVo);
			map.put("stylistVo", stylistVo);
			
			datas.add(map);
		}
		return datas;
	}
	
	//카테고리 삭제
	public void deleteCategory(int c_No) {
		memberSQLmapper.deleteCategory(c_No);
	}
	
	//글 작성
	public void writeProcess(blogVo blogvo) {
		memberSQLmapper.insertBlog(blogvo);
	}
	
	public void boardDelete(int blog_no) {
		memberSQLmapper.deleteBoard(blog_no);
	}
	
	public blogCategoryVo getACategory(int c_no) {
		blogCategoryVo data = memberSQLmapper.selectCategoryByNo(c_no);
		return data;
	}
	
	//전체블로그 글 리스트 출력
		public ArrayList<HashMap<String, Object>> selectAll() {
	
		ArrayList<HashMap<String, Object>> datas = new ArrayList<HashMap<String, Object>>();
		ArrayList<blogVo> boardList = memberSQLmapper.boardList();
		
		for(blogVo blogvo : boardList) {
			StylistVo stylistVo = (StylistVo)memberSQLmapper.selectByStylistNo(blogvo.getStylist_no());
			blogCategoryVo categoryVo = (blogCategoryVo)memberSQLmapper.selectCategoryByNo(blogvo.getC_no());
			MemberVo memberVo = (MemberVo)memberSQLmapper.selectByMemberNo(stylistVo.getMember_no());
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("blogVo", blogvo);
			map.put("stylistVo", stylistVo);
			map.put("categoryVo", categoryVo);
			map.put("memberVo", memberVo);
			
			datas.add(map);
		}
		return datas;
	}
	
	//스타일리스트 블로그별 글 리스트 출력
	public ArrayList<HashMap<String, Object>> getBoardList(int stylistNo) {
		
		ArrayList<HashMap<String, Object>> datas = new ArrayList<HashMap<String, Object>>();
		ArrayList<blogVo> boardList = memberSQLmapper.myBoardList(stylistNo);
		
		for(blogVo blogvo : boardList) {
			StylistVo stylistVo = (StylistVo)memberSQLmapper.selectByStylistNo(blogvo.getStylist_no());
			blogCategoryVo categoryVo = (blogCategoryVo)memberSQLmapper.selectCategoryByNo(blogvo.getC_no());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("blogVo", blogvo);
			map.put("stylistVo", stylistVo);
			map.put("categoryVo", categoryVo);
			
			datas.add(map);
		}
		return datas;
	}
	
	//글 하나 출력
	public HashMap<String, Object> getABoard(int blog_no) {
		
		blogVo data = memberSQLmapper.selectBoard(blog_no);
		
		StylistVo stylistVo = (StylistVo)memberSQLmapper.selectByStylistNo(data.getStylist_no());
		blogCategoryVo categoryVo = (blogCategoryVo)memberSQLmapper.selectCategoryByNo(data.getC_no());
		MemberVo memberVo = (MemberVo)memberSQLmapper.selectByMemberNo(stylistVo.getMember_no());
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("blogVo", data);
		map.put("stylistVo", stylistVo);
		map.put("categoryVo", categoryVo);
		map.put("memberVo", memberVo);
		
		return map;
	}
	
	//카테고리별 글 리스트 출력
	public ArrayList<HashMap<String, Object>> getCategoryBoardList(int cNo){
		ArrayList<HashMap<String, Object>> datas = new ArrayList<HashMap<String, Object>>();
		ArrayList<blogVo> boardList = memberSQLmapper.selectBoardBycNo(cNo);

		for(blogVo blogvo : boardList) {
			StylistVo stylistVo = (StylistVo)memberSQLmapper.selectByStylistNo(blogvo.getStylist_no());
			blogCategoryVo categoryVo = (blogCategoryVo)memberSQLmapper.selectCategoryByNo(blogvo.getC_no());
			MemberVo memberVo = (MemberVo)memberSQLmapper.selectByMemberNo(stylistVo.getMember_no());
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("blogVo", blogvo);
			map.put("stylistVo", stylistVo);
			map.put("categoryVo", categoryVo);
			map.put("memberVo", memberVo);
			
			datas.add(map);
		}
		return datas;
	}
	
	//블로그 코멘트
	public void writeComment(BlogCommentVo commentVo) {
		memberSQLmapper.insertBlogComment(commentVo);
	}
	//코멘트 출력 (쓴 사람, 날짜, 좋아요)
	public ArrayList<HashMap<String, Object>> getCommentsList(int blog_no){
		ArrayList<HashMap<String, Object>> datas = new ArrayList<HashMap<String, Object>>();
		ArrayList<BlogCommentVo> commentList = memberSQLmapper.commentList(blog_no);
		
		for(BlogCommentVo commentVo : commentList) {
			MemberVo memberVo = (MemberVo)memberSQLmapper.selectByMemberNo(commentVo.getMember_no());
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("commentVo", commentVo);
			map.put("memberVo", memberVo);
			
			datas.add(map);
		}
		return datas;
	}
	
	public void deleteBComment(int commentNo) {
		memberSQLmapper.deleteBComment(commentNo);
	}
	
}
