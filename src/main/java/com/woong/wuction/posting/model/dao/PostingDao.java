package com.woong.wuction.posting.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.woong.wuction.posting.model.dto.MainPagePosting;
import com.woong.wuction.posting.model.vo.Bid;
import com.woong.wuction.posting.model.vo.Image;
import com.woong.wuction.posting.model.vo.Posting;

public class PostingDao {

	public int insertPosting(SqlSession sqlSession, Posting newPost) {
		return sqlSession.insert("postingMapper.insertPosting", newPost);
	}

	public int insertImgFile(SqlSession sqlSession, Image img) {
		return sqlSession.insert("imageMapper.insertImgFile", img);
	}

	public Posting selectPosting(SqlSession sqlSession, Posting selectPost) {
		return sqlSession.selectOne("postingMapper.selectPosting", selectPost);
	}

	public ArrayList<Image> selectImgList(SqlSession sqlSession, Posting selectPost) {
		return (ArrayList)sqlSession.selectList("imageMapper.selectImgList", selectPost);
	}

	public ArrayList<Bid> selectBidList(SqlSession sqlSession, Posting selectPost) {
		return (ArrayList)sqlSession.selectList("bidMapper.selectBidList", selectPost);
	}

	public int insertBid(SqlSession sqlSession, Bid newBid) {
		return sqlSession.insert("bidMapper.insertBid", newBid);
	}

	public ArrayList<MainPagePosting> selectPostingList(SqlSession sqlSession) {
		
		return (ArrayList)sqlSession.selectList("postingMapper.selectPostingList");
	}

	public ArrayList<MainPagePosting> selectTopPostingList(SqlSession sqlSession) {
		
		return (ArrayList)sqlSession.selectList("postingMapper.selectTopPostingList");
	}

	public ArrayList<Posting> selectSearchList(SqlSession sqlSession, String keyword) {
    
		return (ArrayList)sqlSession.selectList("postingMapper.selectSearchList", keyword);
	}

}
