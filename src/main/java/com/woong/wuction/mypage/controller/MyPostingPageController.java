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
import com.woong.wuction.mypage.service.MyPageServiceImpl;
import com.woong.wuction.posting.model.dto.MainPagePosting;

/**
 * Servlet implementation class MyPostingPageController
 */
@WebServlet("/myPostingPage.me")
public class MyPostingPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPostingPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 마이페이지에서 경매게시물 페이지로 이동
		 * 회원번호를 통해 해당 회원이 작성한 경매게시물들을 나열
		 * 회원 번호는 session에서 가져옴
		 * dto로 만들어둔 클래스를 따라 객체리스트로 반환 받음
		 */
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		
		ArrayList<MainPagePosting> pList = new MyPageServiceImpl().selectPostingList(m);
		
		System.out.println(pList);
	      
	    request.setAttribute("postingList", pList);
		
		
		request.getRequestDispatcher("WEB-INF/views/member/myPostingPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
