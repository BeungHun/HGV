package com.match.hgv.stylist.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.match.hgv.member.mapper.MemberSQLMapper;
import com.match.hgv.stylist.mapper.StylistSQLMapper;
import com.match.hgv.user.mapper.UserSQLMapper;
import com.match.hgv.vo.Card_CategoryVo;
import com.match.hgv.vo.Card_Category_Relate_FileVo;
import com.match.hgv.vo.Card_Category_RelationVo;
import com.match.hgv.vo.MemberVo;
import com.match.hgv.vo.OrderFileVo;
import com.match.hgv.vo.OrderVo;
import com.match.hgv.vo.StylingReview_ImgVo;
import com.match.hgv.vo.Styling_ResponseImgVo;
import com.match.hgv.vo.Styling_ResponseVo;
import com.match.hgv.vo.Styling_ReviewVo;
import com.match.hgv.vo.StylistVo;
import com.match.hgv.vo.Stylist_CardVo;
import com.match.hgv.vo.UserCardBookMarkVo;
import com.match.hgv.vo.UserVo;

@Service
public class StylistServiceImpl {
	
	@Autowired
	private MemberSQLMapper memberSQLMapper; 
	@Autowired
	private StylistSQLMapper stylistSQLMapper;
	@Autowired
	private UserSQLMapper userSQLMapper;
	
	//스타일리스트 회원가입
	public void register(MemberVo memberVo, StylistVo stylistVo) {
		int memberPk = memberSQLMapper.createMemberPk();
		memberVo.setMember_no(memberPk);
		stylistVo.setMember_no(memberPk);
		
		memberSQLMapper.insertMember(memberVo);
		stylistSQLMapper.insertStylist(stylistVo);
	}
	
	//스타일리스트 카드/카테고리 관계테이블 생성
	public void insertCardCategoryRelation(Card_Category_RelationVo card_Category_RelationVo) {
		stylistSQLMapper.insertCardCategoryRelation(card_Category_RelationVo);
	}
	
		
	//스타일리스트 카드별 카테고리 리스트 출력
	public ArrayList<HashMap<String, Object>> selectCardCategoryRelation(int stylist_card_no){
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		ArrayList<Card_Category_RelationVo> relationlist = stylistSQLMapper.selectCardCategoryRelation(stylist_card_no);
		
		for(Card_Category_RelationVo card_Category_RelationVo : relationlist) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			
			Card_CategoryVo card_CategoryVo = stylistSQLMapper.selectCategoryNameByCategoryNo(card_Category_RelationVo.getCard_category_no());
			map.put("cardCategoryVo", card_CategoryVo);
			map.put("cardCategoryRelationVo", card_Category_RelationVo);
			//System.out.println(card_CategoryVo.getCard_category_no());
			list.add(map);
		}
		return list;
	}

	//스타일리스트 카테고리 출력
	public ArrayList<Card_CategoryVo> selectCardCategoryAll(){
		return stylistSQLMapper.selectCardCategoryAll();
	}

	//스타일리스트 카드 생성
	public int insertStylistCard(Stylist_CardVo stylist_CardVo) {
		stylistSQLMapper.insertStylistCard(stylist_CardVo);
		int stylist_card_no = stylistSQLMapper.selectCardVoByStylistNo(stylist_CardVo.getStylist_no()).getStylist_card_no();
		return stylist_card_no;
	}
	
	//스타일리스트 카드 번호 찾기
	public Stylist_CardVo selectStylistCardVo(int stylist_no) {
		return stylistSQLMapper.selectCardVoByStylistNo(stylist_no);
	}
	
	//파일 첨부
	public void insertCategoryRelateFile(ArrayList<Card_Category_Relate_FileVo> categoryCardImageList) {
		for(Card_Category_Relate_FileVo card_Category_Relate_FileVo : categoryCardImageList) {
			stylistSQLMapper.insertCategoryRelateFile(card_Category_Relate_FileVo);
		}	
	}
	
	//카드 수정
	public void updateStylistCard(Stylist_CardVo stylist_CardVo) {
		stylistSQLMapper.updateStylistCard(stylist_CardVo);
	}
	
	//// 스타일리스트 카드 상세페이지
	//// 유저 오더페이지
	//스타일리스트 카드 번호로 Vo들 추출 후 map에 담기
	public HashMap<String, Object> getReadStylistCard(int stylist_card_no){
		HashMap<String, Object> map = new HashMap<String, Object>();
		Stylist_CardVo stylist_CardVo = stylistSQLMapper.selectCardVoByCardNo(stylist_card_no);
		StylistVo stylistVo = stylistSQLMapper.selectStylistVoByStylistNo(stylist_CardVo.getStylist_no());
		MemberVo memberVo = memberSQLMapper.selectByMemberNo(stylistVo.getMember_no());
		
		map.put("stylist_CardVo", stylist_CardVo);
		map.put("stylistVo", stylistVo);
		map.put("memberVo", memberVo);
		
		return map;
	}
	
	//리뷰리스트 가져오기
	public ArrayList<HashMap<String, Object>> getReviewList(int stylist_card_no){
		ArrayList<HashMap<String, Object>> reviewList = new ArrayList<HashMap<String, Object>>();
		
		for(Styling_ReviewVo styling_ReviewVo : stylistSQLMapper.selectReviewListByCardNo(stylist_card_no)) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			Styling_ResponseVo styling_ResponseVo = stylistSQLMapper.selectStylingVoByStylingNo(styling_ReviewVo.getStyling_no());
			OrderVo orderVo = userSQLMapper.selectOrderVoByOrderNo(styling_ResponseVo.getOrder_no());
			UserVo userVo = userSQLMapper.selectUserVoByUserNo(orderVo.getUser_no());
			MemberVo memberVo = memberSQLMapper.selectByMemberNo(userVo.getMember_no());
			ArrayList<StylingReview_ImgVo> reviewImgList = stylistSQLMapper.selectReviewImgListByReviewNo(styling_ReviewVo.getStyling_review_no());
			
			map.put("totalRating", stylistSQLMapper.selectTotalReviewStarRating(stylist_card_no));
			map.put("reviewImgList", reviewImgList);
			map.put("styling_ReviewVo", styling_ReviewVo);
			map.put("memberVo", memberVo);
			reviewList.add(map);
		}
		
		return reviewList;
	}
	
	// 유저가 스타일리스트 찜하기했는지 check
	public boolean chkUserCardLike (UserCardBookMarkVo userCardBookMarkVo) {
		if(userSQLMapper.selectUserCardBookMark(userCardBookMarkVo) > 0) {
			return true; 
		}else {
			return false;
		}
	}
	
	// 스타일리스트 찜 횟수 출력
	public int getCardLike (int stylist_card_no) {
		return userSQLMapper.selectTotalCardBookMark(stylist_card_no); 
	}
	
	
	//// 메인페이지 
	// 스타일리스트 카드리스트 전부 출력
	public ArrayList<HashMap<String, Object>> selectCardAll(){
		ArrayList<HashMap<String, Object>> cardList = new ArrayList<HashMap<String, Object>>();
		
		for(Stylist_CardVo stylist_CardVo : stylistSQLMapper.selectCardAll()) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			double totalRating = 0;
			double totalRatingPersent = 0;
			StylistVo stylistVo = stylistSQLMapper.selectStylistVoByStylistNo(stylist_CardVo.getStylist_no());
			MemberVo memberVo = memberSQLMapper.selectByMemberNo(stylistVo.getMember_no());
			
			ArrayList<HashMap<String, Object>> categoryList = new ArrayList<HashMap<String, Object>>();
			ArrayList<Card_Category_Relate_FileVo> categoryFileList = new ArrayList<Card_Category_Relate_FileVo>();
			for(Card_Category_RelationVo card_Category_RelationVo : stylistSQLMapper.selectCardCategoryRelation (stylist_CardVo.getStylist_card_no())) {
				HashMap<String, Object> categoryMap = new HashMap<String, Object>();
				Card_CategoryVo card_CategoryVo = stylistSQLMapper.selectCategoryNameByCategoryNo(card_Category_RelationVo.getCard_category_no());
				
				for(Card_Category_Relate_FileVo card_Category_Relate_FileVo : stylistSQLMapper.selectCategoryRelateFile(card_Category_RelationVo.getCard_category_relation_no())){
					categoryFileList.add(card_Category_Relate_FileVo);
				}
				
				categoryMap.put("card_CategoryVo", card_CategoryVo);
				categoryList.add(categoryMap);
				
			}
			
			if(stylistSQLMapper.selectTotalReviewStarRating(stylist_CardVo.getStylist_card_no()) == null) {
			}else {
				totalRatingPersent = Double.parseDouble(stylistSQLMapper.selectTotalReviewStarRating(stylist_CardVo.getStylist_card_no()));
				totalRating = totalRatingPersent/20;
			}
			
			
			map.put("memberVo", memberVo);
			map.put("stylistVo", stylistVo);
			map.put("stylist_CardVo", stylist_CardVo);
			map.put("totalRating", totalRating);
			map.put("totalRatingPersent", totalRatingPersent);
			map.put("bookMarkCount", userSQLMapper.selectTotalCardBookMark(stylist_CardVo.getStylist_card_no()));
			map.put("categoryList", categoryList);
			map.put("categoryFileList", categoryFileList);
			cardList.add(map);
		}
		
		return cardList;
	}
	
	//// 주문 관련
	// 주문 반려 Reject
	public MemberVo orderRejectProcess (int order_no) {
		OrderVo orderVo = userSQLMapper.selectOrderVoByOrderNo(order_no);
		// 스타일리스트 적립금 감소
		Stylist_CardVo stylist_CardVo = stylistSQLMapper.selectCardVoByCardNo(orderVo.getStylist_card_no());
		StylistVo stylistVo = stylistSQLMapper.selectStylistVoByStylistNo(stylist_CardVo.getStylist_no());
		memberSQLMapper.updateMemberCash(memberSQLMapper.selectByMemberNo(stylistVo.getMember_no()), orderVo.getOrder_saleprice());
		// 유저 적립금 증가
		UserVo userVo = userSQLMapper.selectUserVoByUserNo(orderVo.getUser_no());
		memberSQLMapper.updateMemberCash(memberSQLMapper.selectByMemberNo(userVo.getMember_no()), -orderVo.getOrder_saleprice());
		
		// 주문 상태 변경
		orderVo.setOrder_state("reject");
		stylistSQLMapper.updateOrderStateProcess(orderVo);
		
		// 초기화를 위한 재호출
		return memberSQLMapper.selectByMemberNo(stylistVo.getMember_no());
	}
	
	// 주문 수락 Accept
	public void orderAcceptProcess (int order_no) {
		OrderVo orderVo = userSQLMapper.selectOrderVoByOrderNo(order_no);
		orderVo.setOrder_state("accept");
		stylistSQLMapper.updateOrderStateProcess(orderVo);
	}
	
	// 주문 응답 (카드송부)
	public void insertStylingResponse(Styling_ResponseVo styling_ResponseVo) {
		stylistSQLMapper.insertStylingResponse(styling_ResponseVo);
		OrderVo orderVo = userSQLMapper.selectOrderVoByOrderNo(styling_ResponseVo.getOrder_no());
		orderVo.setOrder_state("answer");
		stylistSQLMapper.updateOrderStateProcess(orderVo);
	}
	
	public void insertinsertStylingResponseImgList(ArrayList<Styling_ResponseImgVo> styling_ResponseImgVoList) {
		for(Styling_ResponseImgVo styling_ResponseImgVo : styling_ResponseImgVoList) {
			stylistSQLMapper.insertinsertStylingResponseImg(styling_ResponseImgVo);
		}	
	}
	
	// 응답카드로 이동
	public int getResponsePk() {
		return stylistSQLMapper.createStylingResponsePk();
	}
	
	public HashMap<String, Object> getStylingResponse(int order_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Styling_ResponseVo styling_ResponseVo = stylistSQLMapper.selectStylingVoByOrderNo(order_no);
		OrderVo orderVo = userSQLMapper.selectOrderVoByOrderNo(order_no);
		Stylist_CardVo stylist_CardVo = stylistSQLMapper.selectCardVoByCardNo(orderVo.getStylist_card_no());
		StylistVo stylistVo = stylistSQLMapper.selectStylistVoByStylistNo(stylist_CardVo.getStylist_no()); 		
		MemberVo memberVo = memberSQLMapper.selectByMemberNo(stylistVo.getMember_no());
		Card_CategoryVo card_CategoryVo = stylistSQLMapper.selectCategoryNameByCategoryNo(orderVo.getCard_category_no());
		ArrayList<Styling_ResponseImgVo> Styling_ResponseImgVoList = stylistSQLMapper.selectResponseImgListByStylingNo(styling_ResponseVo.getStyling_no());
		int size = Styling_ResponseImgVoList.size();
		
		map.put("size", size);
		map.put("card_category_name", card_CategoryVo.getCard_category_name());
		map.put("responseImgVoList", Styling_ResponseImgVoList);
		map.put("styling_ResponseVo", styling_ResponseVo);
		map.put("memberVo", memberVo);
		map.put("orderVo", orderVo);
		return map;
	}
	
	////추가분
	// 카테고리 Name 으로 카테고리 No 찾기
	public int getCategoryNoByCategoryName(String card_category_name) {
		return stylistSQLMapper.selectCategoryNoByCategoryName(card_category_name);
	}
	
	// 카테고리 Name 으로 카테고리 No 찾기
	public Card_CategoryVo getCategoryNameByCategoryno(int card_category_no) {
		return stylistSQLMapper.selectCategoryNameByCategoryNo(card_category_no);
	}
	
	
	
}
