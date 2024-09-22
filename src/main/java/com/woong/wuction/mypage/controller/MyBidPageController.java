package com.woong.wuction.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.woong.wuction.member.model.vo.Member;
import com.woong.wuction.mypage.model.dto.MyBid;
import com.woong.wuction.mypage.service.MyPageServiceImpl;
import com.woong.wuction.posting.model.vo.Bid;

/**
 * Servlet implementation class MyBidPageController
 */
@WebServlet("/myBidPage.me")
public class MyBidPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyBidPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  request.setCharacterEncoding("UTF-8");
		   
	      HttpSession session = request.getSession();
	      Member user = (Member)session.getAttribute("loginUser");
	      
	      // DB에서 해당 사용자의 입찰 내역 조회
	      //  => 사용자 아이디 user.getMemId()
	      
	      ArrayList<MyBid> bidList = new MyPageServiceImpl().selectBidList(user);
	      
	      System.out.println(bidList);
	      
	      request.setAttribute("bidList", bidList);
	      
	      
	      request.getRequestDispatcher("WEB-INF/views/member/myBidPage.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
