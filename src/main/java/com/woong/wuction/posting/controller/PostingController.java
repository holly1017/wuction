package com.woong.wuction.posting.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.woong.wuction.common.MyFileRenamePolicy;
import com.woong.wuction.posting.model.vo.Image;
import com.woong.wuction.posting.model.vo.Posting;
import com.woong.wuction.posting.service.PostingServiceImpl;

/**
 * Servlet implementation class PostingServlet
 */
@WebServlet("/posting.pr")
public class PostingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 설정
	    int maxSize = 10 * 1024 * 1024; // 최대 파일 크기 10MB
	    HttpSession session = request.getSession();
	    String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");

	    // MultipartRequest 객체 생성
	    MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());

	    // 폼 데이터 읽기
	    int memNo = Integer.parseInt(multiRequest.getParameter("userNo"));
	    String productName = multiRequest.getParameter("productName");
	    String productInfo = multiRequest.getParameter("productInfo");
	    long startPrice = Long.parseLong(multiRequest.getParameter("startPrice"));
	    int bidUnit = Integer.parseInt(multiRequest.getParameter("bidUnit"));
	    int categoryNo = Integer.parseInt(multiRequest.getParameter("categoryNo"));
	    String endTime = multiRequest.getParameter("endTime");

	    Posting newPost = new Posting(memNo, categoryNo, productInfo, productName, endTime, startPrice, bidUnit);
	    System.out.println(newPost);
	    Posting post = new PostingServiceImpl().insertPosting(newPost);

	    if (post != null) {
	        int postingNo = post.getPostingNo();
	        int imgNo = 1;
	        
	        // 파일 업로드 처리
	        Enumeration<String> files = multiRequest.getFileNames();
	        while (files.hasMoreElements()) {
	            String name = files.nextElement();
	            String fileName = multiRequest.getFilesystemName(name);

	            if (fileName != null) {
	                Image img = new Image(imgNo, postingNo, fileName);
	                System.out.println(img);
	                new PostingServiceImpl().insertImgFile(img);
	                imgNo++;
	            }
	        }
	        
	        // 성공 응답
	        session.setAttribute("alertMsg", "업로드 성공");
	        response.sendRedirect(request.getContextPath());
	} else {
		// 실패 응답
		request.setAttribute("errorMsg", "업로드 실패");
		request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
	}
	}


}
