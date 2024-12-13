package com.shilla.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shilla.dao.BoardDAO;
import com.shilla.dto.BoardDTO;


@WebServlet("/boardlist.do")
public class BoardListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		BoardDAO bdao = BoardDAO.getInstance();
		ArrayList<BoardDTO> blist= bdao.getBoardList_1_a();
		ArrayList<BoardDTO> blist2= bdao.getBoardList_1_b();
		ArrayList<BoardDTO> blist3= bdao.getBoardList_1_c();
		ArrayList<BoardDTO> blist4= bdao.getBoardList_1_d();
		
		ArrayList<BoardDTO> blist5= bdao.getBoardList_2_a();
		ArrayList<BoardDTO> blist6= bdao.getBoardList_2_b();
		ArrayList<BoardDTO> blist7= bdao.getBoardList_2_d();
		ArrayList<BoardDTO> blist8= bdao.getBoardList_2_e();
		
		ArrayList<BoardDTO> blist9= bdao.getBoardList_3_a();
		ArrayList<BoardDTO> blist10= bdao.getBoardList_3_b();
		ArrayList<BoardDTO> blist11= bdao.getBoardList_3_e();
		ArrayList<BoardDTO> blist12= bdao.getBoardList_3_f();
		
		ArrayList<BoardDTO> blist13= bdao.getBoardList_4_a();
		ArrayList<BoardDTO> blist14= bdao.getBoardList_4_b();
		ArrayList<BoardDTO> blist15= bdao.getBoardList_4_f();
		
		
		request.setAttribute("blist", blist);
		request.setAttribute("blist2", blist2);
		request.setAttribute("blist3", blist3);
		request.setAttribute("blist4", blist4);
		request.setAttribute("blist5", blist5);
		request.setAttribute("blist6", blist6);
		request.setAttribute("blist7", blist7);
		request.setAttribute("blist8", blist8);
		request.setAttribute("blist9", blist9);
		request.setAttribute("blist10", blist10);
		request.setAttribute("blist11", blist11);
		request.setAttribute("blist12", blist12);
		request.setAttribute("blist13", blist13);
		request.setAttribute("blist14", blist14);
		request.setAttribute("blist15", blist15);
		
		
		request.getRequestDispatcher("index.jsp?content=board.jsp").forward(request, response);
		
		
		
		
		
		
		
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
