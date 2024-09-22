package com.woong.wuction.mypage.service;

import java.util.ArrayList;

import com.woong.wuction.member.model.vo.Member;
import com.woong.wuction.mypage.model.dto.MyBid;
import com.woong.wuction.posting.model.dto.MainPagePosting;

public interface MyPageService {
	
	/* 나의 입찰 목록 리스트 조회 */
	ArrayList<MyBid> selectBidList (Member m);
	
	/* 나의 경매 목록 리스트 조회 */
	ArrayList<MainPagePosting> selectPostingList(Member m);
}
