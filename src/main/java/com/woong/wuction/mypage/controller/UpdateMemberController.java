package com.woong.wuction.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.woong.wuction.member.model.vo.Member;
import com.woong.wuction.member.service.MemberService;
import com.woong.wuction.member.service.MemberServiceImpl;

/**
 * Servlet implementation class UpdateMemberController
 */
@WebServlet("/updateInfo.me")
public class UpdateMemberController extends HttpServlet {
   private static final long serialVersionUID = 1L;

   private MemberService memberService = new MemberServiceImpl();

   /**
    * @see HttpServlet#HttpServlet()
    */
   public UpdateMemberController() {
      super();
   }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
	   
	   request.setCharacterEncoding("UTF-8");
	   
      HttpSession session = request.getSession();
      Member loginUser = (Member) session.getAttribute("loginUser");

      String memPwd = request.getParameter("memPwd");

      if (loginUser.getMemPwd().equals(memPwd)) {
         String name = request.getParameter("userName");
         String birthDate = request.getParameter("birthDate");
         String postCode = request.getParameter("postCode");
         String address = request.getParameter("address");
 		 String adDetail = request.getParameter("detailAddress");
         String email = request.getParameter("email");
         
         String fullAddress = address + "/" + adDetail;
         
         
         
         // TODO : 이메일 , 우편번호, 주소, 상세주소 수정 기능 추가필요

         loginUser.setName(name);
         loginUser.setBirthDate(birthDate);
         loginUser.setPostCode(postCode);
         loginUser.setFullAddress(fullAddress);
         loginUser.setEmail(email);

         Member updateMem = memberService.updateMember(loginUser);

         if (updateMem == null) {
            request.setAttribute("errorMsg", "정보 수정을 실패했습니다.");
            request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
         } else {
            session.setAttribute("alertMsg", "정보 수정에 성공하였습니다.");
            session.setAttribute("loginUser", updateMem);
            response.sendRedirect(request.getContextPath() + "/myPage.me");
         }
      } else {
    	  // TODO : 잘못 입력했을 경우 알림창(비밀번호를 확인해주세요) 띄우고 마이페이지로 리다이렉트 
         session.setAttribute("alertMsg", "비밀번호를 확인해주세요.");
         request.getRequestDispatcher("WEB-INF/views/common/myInfoPage.jsp").forward(request, response);
      }
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      doGet(request, response);
   }
}
