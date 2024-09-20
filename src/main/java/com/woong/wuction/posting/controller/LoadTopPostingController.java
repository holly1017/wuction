package com.woong.wuction.posting.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.woong.wuction.posting.model.dto.MainPagePosting;
import com.woong.wuction.posting.service.PostingServiceImpl;

/**
 * Servlet implementation class LoadTopPostingController
 */
@WebServlet("/loadTopPosting.pr")
public class LoadTopPostingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadTopPostingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<MainPagePosting> posts = new PostingServiceImpl().loadTopPostingList();
		
		Gson gson = new Gson();
		
		String jsonResponse = gson.toJson(posts);
		response.setContentType("application/json; charset=UTF-8"); // 응답할 때 타입
		PrintWriter out = response.getWriter();
		out.print(jsonResponse);
		out.flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
