package com.woong.wuction.posting.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.woong.wuction.posting.model.vo.Bid;
import com.woong.wuction.posting.service.PostingServiceImpl;

/**
 * Servlet implementation class BidInsertController
 */
@WebServlet("/bid.bi")
public class BidInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BidInsertController() {
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
		int postingNo = Integer.parseInt(request.getParameter("postingNo"));
		String memNo = request.getParameter("memNo");
		long bidPrice = Long.parseLong(request.getParameter("bidPrice"));
		
		Bid newBid = new Bid();
		newBid.setPostingNo(postingNo);
		newBid.setMemNo(memNo);
		newBid.setBidPrice(bidPrice);
		
		int result = new PostingServiceImpl().insertBid(newBid);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "입찰이 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/detail.pr?postingNo=" + postingNo);
			
		} else {
			request.setAttribute("errorMsg", "입찰 등록 실패하였습니다.");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		}
		
	}

}
