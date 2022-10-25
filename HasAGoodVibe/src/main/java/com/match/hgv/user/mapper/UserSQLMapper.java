package com.match.hgv.user.mapper;

import java.util.ArrayList;

import com.match.hgv.vo.Card_Category_Relate_FileVo;
import com.match.hgv.vo.MemberVo;
import com.match.hgv.vo.OrderFileVo;
import com.match.hgv.vo.OrderVo;
import com.match.hgv.vo.StylingReview_ImgVo;
import com.match.hgv.vo.Styling_ReviewVo;
import com.match.hgv.vo.UserCardBookMarkVo;
import com.match.hgv.vo.UserVo;

public interface UserSQLMapper {
	
	public UserVo selectByMemberNo(int member_no);
	public UserVo selectUserVoByUserNo(int user_no);
	
	//회원가입
	public void insertUser(UserVo userVo);
	
	////주문 넣기
	//Order_PK 생성
	public int createOrderPk();
	//새 주문 INSERT
	public void insertOrder(OrderVo orderVo);
	//Order_no 로 OrderVo 찾기
	public OrderVo selectOrderVoByOrderNo(int order_no);
	//Order_no 로 OrderFileVos 찾기
	public ArrayList<OrderFileVo> selectOrderFileVoListByOrderNo(int order_no);
	
	////리뷰
	//리뷰 PK 생성
	public int createReviewPk();
	//새 리뷰 INSET
	public void insertReview(Styling_ReviewVo styling_ReviewVo);
	//리뷰 이미지
	public void insertReviewImg(StylingReview_ImgVo stylingReview_ImgVo);
	//리뷰작성 이미지 출력용 <수정중>
	public ArrayList<StylingReview_ImgVo> selectStylingReviewImg(int styling_review_no);
	
	////마이페이지
	//유저 - 스타일링 요청 리스트 출력
	public ArrayList<OrderVo> selectAllOrderVoByUserNo(int user_no);
	//스타일리스트 - 요청받은 스타일링 리스트 출력
	public ArrayList<OrderVo> selectAllOrderVoByStylistCardNo(int stylist_card_no);
	
	////유저 카드 찜하기
	//스타일리스트 카드 찜하기
	public void insertCardBookmark(UserCardBookMarkVo userCardBookMarkVo);
	//스타일리스트 카드 찜했는지 여부확인
	public int selectUserCardBookMark(UserCardBookMarkVo userCardBookMarkVo);
	//스타일리스트 카드 찜하기 취소
	public void deleteCardBookmark(UserCardBookMarkVo userCardBookMarkVo);
	//스타일리스트 카드 찜하기 횟수출력
	public int selectTotalCardBookMark(int stylist_card_no);
	
	
	
	//22.08.04 추가 
	public void insertOrderFile(OrderFileVo orderFileVo);
	public int selectOrderNoByStylingNo(int styling_no);
}
