package com.woong.wuction.posting.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.woong.wuction.common.MybatisTemplate;
import com.woong.wuction.posting.model.dao.PostingDao;
import com.woong.wuction.posting.model.dto.MainPagePosting;
import com.woong.wuction.posting.model.vo.Bid;
import com.woong.wuction.posting.model.vo.Image;
import com.woong.wuction.posting.model.vo.Posting;

public class PostingServiceImpl implements PostingService {
	private PostingDao pDao = new PostingDao();
	
	@Override
	public Posting insertPosting(Posting newPost) {

		SqlSession sqlSession = MybatisTemplate.getSqlSession();
		
		int result = pDao.insertPosting(sqlSession, newPost);
		
		if(result > 0) {
			sqlSession.commit();
		}
		
		sqlSession.close();
		
		return newPost;
	}

	public void insertImgFile(Image img) {
		SqlSession sqlSession = MybatisTemplate.getSqlSession();
		
		int result = pDao.insertImgFile(sqlSession, img);
		
		if(result > 0) {
			sqlSession.commit();
		}
		
		sqlSession.close();

	}

	@Override
	public ArrayList<MainPagePosting> loadPostingList() {
		SqlSession sqlSession = MybatisTemplate.getSqlSession();
		
		ArrayList<MainPagePosting> pArr = pDao.selectPostingList(sqlSession);
		
		sqlSession.close();
		
		return pArr;
	}

	@Override
	public Posting selectPosting(Posting selectPost) {
		SqlSession sqlSession = MybatisTemplate.getSqlSession();
		
		Posting p = pDao.selectPosting(sqlSession, selectPost);
		
		sqlSession.close();
		
		return p;
	}

	@Override
	public ArrayList<Image> selectImgList(Posting selectPost) {
		SqlSession sqlSession = MybatisTemplate.getSqlSession();
		
		ArrayList<Image> imgList = pDao.selectImgList(sqlSession, selectPost);
		
		sqlSession.close();
		
		return imgList;
	}

	@Override
	public ArrayList<Bid> selectBidList(Posting selectPost) {
		SqlSession sqlSession = MybatisTemplate.getSqlSession();
		
		ArrayList<Bid> bidList = pDao.selectBidList(sqlSession, selectPost);
		
		sqlSession.close();
		
		return bidList;
	}

	public int insertBid(Bid newBid) {
		SqlSession sqlSession = MybatisTemplate.getSqlSession();
		
		int result = pDao.insertBid(sqlSession, newBid);
		
		if(result > 0) {
			sqlSession.commit();
		}
		
		sqlSession.close();
		
		return result;
	}


	public ArrayList<MainPagePosting> loadTopPostingList() {
		SqlSession sqlSession = MybatisTemplate.getSqlSession();
		
		ArrayList<MainPagePosting> pList = pDao.selectTopPostingList(sqlSession);
    
    sqlSession.close();
		
		return pList;
  }
  
  public ArrayList<Posting> selectSearchList(String keyword) {
		
		SqlSession sqlSession = MybatisTemplate.getSqlSession();
		
		ArrayList<Posting> pList = pDao.selectSearchList(sqlSession, keyword);
		
		sqlSession.close();
		
		return pList;
	}	

	
}
