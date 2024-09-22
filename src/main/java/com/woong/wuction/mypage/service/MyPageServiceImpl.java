package com.woong.wuction.mypage.service;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.woong.wuction.common.MybatisTemplate;
import com.woong.wuction.member.model.vo.Member;
import com.woong.wuction.mypage.model.dao.MyPageDao;
import com.woong.wuction.mypage.model.dto.MyBid;
import com.woong.wuction.posting.model.dto.MainPagePosting;
import com.woong.wuction.posting.model.vo.Bid;

public class MyPageServiceImpl implements MyPageService {
	
	private MyPageDao mpDao = new MyPageDao();

	public ArrayList<MyBid> selectBidList(Member m) {
		SqlSession sqlSession = MybatisTemplate.getSqlSession();
		
		ArrayList<MyBid> bidList = mpDao.selectBidList(sqlSession, m);
		
		sqlSession.close();
		
		return bidList;
	}

	public ArrayList<MainPagePosting> selectPostingList(Member m) {
		SqlSession sqlSession = MybatisTemplate.getSqlSession();
		
		ArrayList<MainPagePosting> pList = mpDao.selectPostingList(sqlSession, m);
		
		sqlSession.close();
		
		return pList;
	}
	
	
}
