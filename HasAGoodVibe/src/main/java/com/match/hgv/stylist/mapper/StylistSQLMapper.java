package com.match.hgv.stylist.mapper;

import java.util.ArrayList;

import com.match.hgv.vo.Card_CategoryVo;
import com.match.hgv.vo.Card_Category_Relate_FileVo;
import com.match.hgv.vo.Card_Category_RelationVo;
import com.match.hgv.vo.MemberVo;
import com.match.hgv.vo.OrderVo;
import com.match.hgv.vo.StylingReview_ImgVo;
import com.match.hgv.vo.Styling_ResponseImgVo;
import com.match.hgv.vo.Styling_ResponseVo;
import com.match.hgv.vo.Styling_ReviewVo;
import com.match.hgv.vo.StylistVo;
import com.match.hgv.vo.Stylist_CardVo;

public interface StylistSQLMapper {
	
	public StylistVo selectByMemberNo(int member_no);
	
	//회원가입
	public void insertStylist(StylistVo stylistVo);
	//카테고리 출력
	public ArrayList<Card_CategoryVo> selectCardCategoryAll();
	
	//스타일리스트 카드생성
	public void insertStylistCard(Stylist_CardVo stylist_CardVo);
	//스타일리스트 카드수정
	public void updateStylistCard(Stylist_CardVo stylist_CardVo);
	//스타일리스트 카드번호 추출
	public Stylist_CardVo selectCardVoByStylistNo(int stylist_no);
	//스타일리스트 카드/카테고리 관계 주입
	public void insertCardCategoryRelation(Card_Category_RelationVo card_Category_RelationVo);
	//카드별 스타일리스트 카드/카테고리 관계 추출
	public ArrayList<Card_Category_RelationVo> selectCardCategoryRelation (int stylist_card_no);
	//카테고리번호로 카테고리 이름 호출
	public Card_CategoryVo selectCategoryNameByCategoryNo(int card_category_no);
	
	////스타일리스트 카드 상세보기
	//스타일리스트 카드넘버로 Stylist_CardVo 가져오기
	public Stylist_CardVo selectCardVoByCardNo (int stylist_card_no);
	//스타일리스트 넘버로 StylistVo 가져오기
	public StylistVo selectStylistVoByStylistNo (int stylist_no);
	
	////메인페이지
	//카드 리스트 출력
	public ArrayList<Stylist_CardVo> selectCardAll();
	
	////오더관련
	//스타일리스트 주문 반응 (반려(reject), 수락(accept), 요청완료(answer), 리뷰완료(complete))
	public void updateOrderStateProcess (OrderVo orderVo);
	//주문요청 응답카드
	public int createStylingResponsePk();
	public void insertStylingResponse (Styling_ResponseVo styling_ResponseVo);
	public void insertinsertStylingResponseImg (Styling_ResponseImgVo styling_ResponseImgVo);
	//응답번호로 응답카드 찾기
	public Styling_ResponseVo selectStylingVoByStylingNo(int styling_no);
	//오더번호로 응답카드 찾기 
	public Styling_ResponseVo selectStylingVoByOrderNo(int order_no);
	public ArrayList<Styling_ResponseImgVo> selectResponseImgListByStylingNo(int styling_no);
	//카드별 리뷰들 찾아오기
	public ArrayList<Styling_ReviewVo> selectReviewListByCardNo(int stylist_card_no);
	public ArrayList<StylingReview_ImgVo> selectReviewImgListByReviewNo(int styling_review_no);
	public String selectTotalReviewStarRating (int stylist_card_no);
	
	//카테고리별 파일 첨부 
	public void insertCategoryRelateFile(Card_Category_Relate_FileVo card_Category_Relate_FileVo);
	public ArrayList<Card_Category_Relate_FileVo> selectCategoryRelateFile(int card_category_relate_no);
	
	//추가 8/4 카테고리 이름으로 카테고리 번호 출력
	public int selectCategoryNoByCategoryName(String card_category_name);
	
	
}
