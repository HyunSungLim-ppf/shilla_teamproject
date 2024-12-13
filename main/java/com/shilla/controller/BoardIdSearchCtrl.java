package com.shilla.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shilla.dao.BoardDAO;
import com.shilla.dto.BoardDTO;

@WebServlet("/boardidsearch.do")
public class BoardIdSearchCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
/* 해결책: 컨트롤러를 무의미하게 만든다. ---------------------------------------------------------------------- */		
		String user_id = request.getParameter("board_id");
		response.sendRedirect("index.jsp?content=boardSearch.jsp?user_id="+user_id);
/* 해결책: 컨트롤러를 무의미하게 만든다. ---------------------------------------------------------------------- */		
//		BoardDAO bdao = BoardDAO.getInstance();
//		ArrayList<BoardDTO> bean = bdao.idSearch(user_id);
				
//		request.setAttribute("searchlist", bean);		
//		RequestDispatcher dis = request.getRequestDispatcher("index.jsp?content=boardSearch.jsp");
//		dis.forward(request, response);	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
