package com.woong.wuction.mypage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.woong.wuction.member.model.vo.Member;
import com.woong.wuction.mypage.model.dto.MyBid;
import com.woong.wuction.posting.model.dto.MainPagePosting;

public class MyPageDao {

	public ArrayList<MyBid> selectBidList(SqlSession sqlSession, Member m) {
		return (ArrayList)sqlSession.selectList("bidMapper.selectMyBidList", m);
	}

	public ArrayList<MainPagePosting> selectPostingList(SqlSession sqlSession, Member m) {
		
		return (ArrayList)sqlSession.selectList("postingMapper.selectMyPostingList", m);
	}


}
