package com.shilla.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shilla.dao.BoardDAO;

@WebServlet("/boarddelete.do")
public class BoardDeleteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터 값 받기
		int num = Integer.parseInt(request.getParameter("num"));
		// DAO 실행
		BoardDAO bdao = BoardDAO.getInstance();
		bdao.deleteBoard(num);
		
		String searchText = request.getParameter("searchText");
		String searchField = request.getParameter("searchField");
		
		System.out.println("searchText(delete) : " + searchText);
		System.out.println("searchField(delete) : " + searchField);
		
		if(searchText != "") {
			System.out.println("나는 boardidsearch");
			RequestDispatcher dis = request.getRequestDispatcher("boardsearch.do?searchText="+searchText+"&searchField="+searchField);
			dis.forward(request, response);
		} else {
			System.out.println("나는 boardlist");
			RequestDispatcher dis = request.getRequestDispatcher("boardlist.do");
			dis.forward(request, response);
		}	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
