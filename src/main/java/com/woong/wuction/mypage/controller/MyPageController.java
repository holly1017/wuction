package com.woong.wuction.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.woong.wuction.member.model.vo.Member;

/**
 * Servlet implementation class myPageController
 */
@WebServlet("/myPage.me")
public class MyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// address와 detailAddress는 /를 기준으로 fullAddress에 저장되어있음
        Member loginUser = (Member) request.getSession().getAttribute("loginUser"); // 로그인 정보를 세션에서 가져와야 함

        // fulladdress를 address와 detailAddress로 분리
        String fullAddress = loginUser.getFullAddress(); 
        String[] addressParts = fullAddress.split("/"); // 주소를 슬래시(/) 기준으로 분리

        String address = addressParts[0]; // address
        String detailAddress = addressParts[1]; // detailAddress

        // JSP에 주소와 상세주소를 전달
        request.setAttribute("address", address);
        request.setAttribute("detailAddress", detailAddress);
		
		request.getRequestDispatcher("WEB-INF/views/member/myInfoPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}