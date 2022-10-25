package com.match.hgv.user.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.match.hgv.member.mapper.MemberSQLMapper;
import com.match.hgv.stylist.mapper.StylistSQLMapper;
import com.match.hgv.user.mapper.UserSQLMapper;
import com.match.hgv.vo.Card_Category_Relate_FileVo;
import com.match.hgv.vo.MemberVo;
import com.match.hgv.vo.OrderFileVo;
import com.match.hgv.vo.OrderVo;
import com.match.hgv.vo.StylingReview_ImgVo;
import com.match.hgv.vo.Styling_ResponseVo;
import com.match.hgv.vo.Styling_ReviewVo;
import com.match.hgv.vo.StylistVo;
import com.match.hgv.vo.Stylist_CardVo;
import com.match.hgv.vo.UserCardBookMarkVo;
import com.match.hgv.vo.UserVo;

@Service
public class UserServiceImpl {
	
	@Autowired
	private UserSQLMapper userSQLMapper;
	@Autowired
	private MemberSQLMapper memberSQLMapper; 
	@Autowired
	private StylistSQLMapper stylistSQLMapper;
	
	//유저 회원가입
	public void register(MemberVo memberVo, UserVo userVo) {
		int memberPk = memberSQLMapper.createMemberPk();
		memberVo.setMember_no(memberPk);
		userVo.setMember_no(memberPk);
		
		memberSQLMapper.insertMember(memberVo);
		userSQLMapper.insertUser(userVo);
		
	}
	
	//// 오더
	//주문 넣기
	public HashMap<String, Object> insertOrder(OrderVo orderVo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int order_no = userSQLMapper.createOrderPk();
		orderVo.setOrder_no(order_no);
		
		//유저 돈 차감
		int userMemberNo = userSQLMapper.selectUserVoByUserNo(orderVo.getUser_no()).getMember_no();
		memberSQLMapper.updateMemberCash(memberSQLMapper.selectByMemberNo(userMemberNo), -orderVo.getOrder_saleprice());
		
		//스타일리스트 돈 증액
		int stylistNo = stylistSQLMapper.selectCardVoByCardNo(orderVo.getStylist_card_no()).getStylist_no();
		int stylistMemberNo = stylistSQLMapper.selectStylistVoByStylistNo(stylistNo).getMember_no();
		memberSQLMapper.updateMemberCash(memberSQLMapper.selectByMemberNo(stylistMemberNo), orderVo.getOrder_saleprice());
		
		userSQLMapper.insertOrder(orderVo);
		
		map.put("order_no", order_no);
		map.put("memberVo", memberSQLMapper.selectByMemberNo(userMemberNo));
		return map;
	}
	
	//OrderVo 찾기
	public OrderVo getOrderVoByOrderNo(int order_no) {
		return userSQLMapper.selectOrderVoByOrderNo(order_no);
	}
	
	//OrderFileVos 찾기
	public ArrayList<OrderFileVo> getOrderFileVoListByOrderNo(int order_no) {
		return userSQLMapper.selectOrderFileVoListByOrderNo(order_no);
	}
	
	//MemberVo 찾기
	public MemberVo getMemberVoByUserNo(int user_no) {
		UserVo userVo = userSQLMapper.selectUserVoByUserNo(user_no);
		return memberSQLMapper.selectByMemberNo(userVo.getMember_no()); 
	}
	
	// 리뷰 Insert
	public void insertReview (Styling_ReviewVo styling_ReviewVo, ArrayList<StylingReview_ImgVo> stylingReviewImgVoList) {
		int reviewPk =  userSQLMapper.createReviewPk();
		styling_ReviewVo.setStyling_review_no(reviewPk);
		userSQLMapper.insertReview(styling_ReviewVo);
		
		for(StylingReview_ImgVo stylingReview_ImgVo : stylingReviewImgVoList){
			stylingReview_ImgVo.setStyling_review_no(reviewPk);
			userSQLMapper.insertReviewImg(stylingReview_ImgVo);
		}
		
		Styling_ResponseVo styling_ResponseVo = stylistSQLMapper.selectStylingVoByStylingNo(styling_ReviewVo.getStyling_no());
		OrderVo orderVo = userSQLMapper.selectOrderVoByOrderNo(styling_ResponseVo.getOrder_no());
		orderVo.setOrder_state("complete");
		stylistSQLMapper.updateOrderStateProcess(orderVo);
		
	}
	
	////마이페이지
	// 유저 - 요청한 리스트 출력
	public ArrayList<HashMap<String, Object>> getStylingRequestList(int user_no){
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>();
		
		for(OrderVo orderVo : userSQLMapper.selectAllOrderVoByUserNo(user_no)) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			Stylist_CardVo stylist_CardVo = stylistSQLMapper.selectCardVoByCardNo(orderVo.getStylist_card_no());
			StylistVo stylistVo = stylistSQLMapper.selectStylistVoByStylistNo(stylist_CardVo.getStylist_no());
			MemberVo memberVo = memberSQLMapper.selectByMemberNo(stylistVo.getMember_no());
			String card_category_name = stylistSQLMapper.selectCategoryNameByCategoryNo(orderVo.getCard_category_no()).getCard_category_name();
			
			map.put("card_category_name", card_category_name);
			map.put("stylist_CardVo", stylist_CardVo);
			map.put("memberVo", memberVo);
			map.put("orderVo", orderVo);
			dataList.add(map);
		}
		
		return dataList;
	}
	
	// 스타일리스트 - 요청받은 리스트 출력
	public ArrayList<HashMap<String, Object>> getReceivedRequestList(int stylist_card_no){
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>();
		
		for(OrderVo orderVo : userSQLMapper.selectAllOrderVoByStylistCardNo(stylist_card_no)) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			UserVo userVo = userSQLMapper.selectUserVoByUserNo(orderVo.getUser_no());
			MemberVo memberVo = memberSQLMapper.selectByMemberNo(userVo.getMember_no());
			Stylist_CardVo stylist_CardVo = stylistSQLMapper.selectCardVoByCardNo(orderVo.getStylist_card_no());
			String card_category_name = stylistSQLMapper.selectCategoryNameByCategoryNo(orderVo.getCard_category_no()).getCard_category_name();
			
			map.put("card_category_name", card_category_name);
			map.put("stylist_CardVo", stylist_CardVo);
			map.put("memberVo", memberVo);
			map.put("userVo", userVo);
			map.put("orderVo", orderVo);
			dataList.add(map);
		}
		return dataList;
	}
	
	// 스타일리스트 카드 찜하기
	public void userCardBookMark(UserCardBookMarkVo userCardBookMarkVo) {
		if(userSQLMapper.selectUserCardBookMark(userCardBookMarkVo) > 0) {
			userSQLMapper.deleteCardBookmark(userCardBookMarkVo);
		}else {
			userSQLMapper.insertCardBookmark(userCardBookMarkVo);
		}
	}
	
	
	
	// 22.08.04 주문시 첨부된 사진 추가
	//파일 첨부
	public void insertorderFiles(ArrayList<OrderFileVo> orderFileVoList) {
		for(OrderFileVo orderFileVo : orderFileVoList) {
			userSQLMapper.insertOrderFile(orderFileVo);
		}	
	}
	
	//스타일링 NO로 OrderNo 찾기
	public int getOrderNoByStylingNo(int styling_no) {
		return userSQLMapper.selectOrderNoByStylingNo(styling_no);
	}
	
}
