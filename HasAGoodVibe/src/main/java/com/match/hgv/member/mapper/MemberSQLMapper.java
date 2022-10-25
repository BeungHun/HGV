package com.match.hgv.member.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.match.hgv.vo.AttendVo;
import com.match.hgv.vo.BlogCommentVo;
import com.match.hgv.vo.FriendVo;
import com.match.hgv.vo.MemberVo;
import com.match.hgv.vo.MessageVo;
import com.match.hgv.vo.ReportVo;
import com.match.hgv.vo.Report_file_infoVo;
import com.match.hgv.vo.StylistVo;
import com.match.hgv.vo.blogCategoryVo;
import com.match.hgv.vo.blogVo;

@Mapper
public interface MemberSQLMapper {
	
	public int createMemberPk();
	public MemberVo selectByMemberNo(int member_no);
	
	//회원가입
	public void insertMember(MemberVo memberVo);
	//아이디 중복제거AJAX 용도
	public int selectCountById(String member_id);
	//로그인
	public MemberVo selectHGVmemberIdAndPw(MemberVo memberVo);
	//회원 출력 
	public ArrayList<MemberVo> selectAll(
			@Param("searchType") String searchType, 
			@Param("searchWord") String searchWord);
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	//프로필 이미지 업데이트
	public void updateHGVmemberProfile(MemberVo memberVo);
	
	//회원 적립금 (증감)업데이트 프로세스
	public void updateMemberCash (@Param("memberVo") MemberVo memberVo, @Param("cashValue") int cashValue);
	
	//----------------------메시지--------------------------------
	//친구 추가 
	public void insertFriend(FriendVo friendVo);
	//친구 출력
	public ArrayList<FriendVo> friendList(int memberNo);
	//친구 삭제 
	public void deleteFriend(int memberNo);
	// 상대 친구번호로 내 친구Vo 찾기
	public FriendVo selectByFriendNo(int bfmemberNo);
	//쪽지 작성
	public void insertMessage(MessageVo messageVo);
	//쪽지 보내기를 했을때 유저의 정보를 가져오는 쿼리.
	//유저의 넘버를 파라미터로 받아옴.
	public MemberVo selectMemberInfo(int bfmemberNo);
	public ArrayList<MessageVo> getSentMessageList(int memberNo); //내가보낸 쪽지출력
	public ArrayList<MessageVo> getRecievedMessageList(int memberNo);//내가 받은쪽지 출력
	public void updateReadDate(int memberNo);
	public void deleteMessage(int messageNo);
	
	//----------------------이벤트--------------------------------
	public void insertEComment(AttendVo attendVo);
	public int selectCountByNo(int member_no);
	public ArrayList<AttendVo> e_commentList(int memberNo);
	public void deleteEComment(int attendNo);
	public void updateEComment(AttendVo attendVo);
	
	//신고
	public void insertReportVo(ReportVo reportVo);
	public void insertReport_file_infoVo(Report_file_infoVo report_file_info);
	public int createReportNoPk();
	
	//----------------------블로그--------------------------------
	public void insertCategory(blogCategoryVo categoryVo);
	//카테고리 출력 
	public ArrayList<blogCategoryVo> categoryList(int stylistNo);
	public StylistVo selectByStylistNo(int stylistNo);
	public void deleteCategory(int c_No);
	public void insertBlog(blogVo blogvo);
	public void deleteBoard(int blog_no);
	public blogCategoryVo selectCategoryByNo(int c_no);
	public ArrayList<blogVo> boardList();
	public ArrayList<blogVo> myBoardList(int stylistNo);
	public blogVo selectBoard(int blog_no);
	public ArrayList<blogVo> selectBoardBycNo(int cNo);
	public void insertBlogComment(BlogCommentVo commentVo);
	public ArrayList<BlogCommentVo> commentList(int blog_no);
	public void deleteBComment(int commentNo);
}


