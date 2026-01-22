package com.woong.wuction.posting.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.woong.wuction.posting.model.vo.Bid;
import com.woong.wuction.posting.model.vo.Image;
import com.woong.wuction.posting.model.vo.Posting;
import com.woong.wuction.posting.service.PostingServiceImpl;

/**
 * Servlet implementation class ProductPageController
 */
@WebServlet("/detail.pr")
public class ProductPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postingNo = Integer.parseInt(request.getParameter("postingNo"));
		
		Posting p = new Posting();
		p.setPostingNo(postingNo);
		
		// 게시물 정보 조회
		Posting selectPost = new PostingServiceImpl().selectPosting(p);
		System.out.println("게시물 정보 조회 : " + selectPost);
		
		// 게시물 이미지 조회
		ArrayList<Image> imgList = new PostingServiceImpl().selectImgList(p);
		System.out.println("게시물 이미지 조회 : " + imgList);
		
		// 게시물 입찰 내역 조회
		ArrayList<Bid> bidList = new PostingServiceImpl().selectBidList(p);
		System.out.println("게시물 입찰 조회 : " + bidList);
		
		if(selectPost != null && imgList != null && bidList != null) {
			// 해당 번호에 해당하는 게시물이 조회가 되었을 때
			request.setAttribute("selectPost", selectPost);
			request.setAttribute("imgList", imgList);
			request.setAttribute("bidList", bidList);
			
			// 해당 게시물의 상세 페이지로 포워딩
			request.getRequestDispatcher("WEB-INF/views/product/productPage.jsp").forward(request, response);
		} else {
			// 게시물이 조회되지 않을 때
			request.setAttribute("errorMsg", "해당 게시물에 접근할 수 없습니다.");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
