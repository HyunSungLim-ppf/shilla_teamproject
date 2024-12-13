package com.shilla.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shilla.dao.BoardDAO;
import com.shilla.dto.BoardDTO;

@WebServlet("/boardsearch.do")
public class BoardSearchCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
/* 해결책: 컨트롤러를 무의미하게 만든다. ---------------------------------------------------------------------- */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String searchText = request.getParameter("searchText");
		String searchField = request.getParameter("searchField");

		searchText = URLEncoder.encode(searchText, "UTF-8");
		searchField = URLEncoder.encode(searchField, "UTF-8");
		// 콘솔확인용 
		System.out.println("보드search(Post) searchText : " + searchText);
		System.out.println("보드search(Post) searchField : " + searchField);

		response.sendRedirect("index.jsp?content=boardSearch.jsp?searchText="+searchText+"&searchField="+searchField);
/* 해결책: 컨트롤러를 무의미하게 만든다. ---------------------------------------------------------------------- */
//		BoardDAO bdao = BoardDAO.getInstance();
//		ArrayList<BoardDTO> searchlist = bdao.searchBoard(searchField, searchText);
//		int searchResult = searchlist.size();

//		request.setAttribute("searchField", searchField);
//		request.setAttribute("searchText", searchText);
		
//		request.setAttribute("searchResult", searchlist.size());
//		request.setAttribute("searchlist", searchlist);
//		RequestDispatcher dis = request.getRequestDispatcher("index.jsp?content=boardSearch.jsp");
//		dis.forward(request, response);
		
	}

}
