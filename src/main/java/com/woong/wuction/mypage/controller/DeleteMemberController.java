package com.woong.wuction.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.woong.wuction.member.model.vo.Member;
import com.woong.wuction.member.service.MemberServiceImpl;

/**
 * Servlet implementation class DeleteMemberController
 */
@WebServlet("/delete.me")
public class DeleteMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getMemId();
		String pwd = request.getParameter("userPwd");
		
		Member m = new Member();
		m.setMemId(id);
		m.setMemPwd(pwd);
		
		int result = new MemberServiceImpl().deleteMember(m);
		
		if(result > 0) {
			session.invalidate();
			
			response.sendRedirect(request.getContextPath());
		} else {
			session.setAttribute("alertMsg", "탈퇴 실패하였습니다.");
			
			response.sendRedirect(request.getContextPath());
		}
		
		
	}

}
