package com.shilla.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shilla.dao.BoardDAO;
import com.shilla.dto.BoardDTO;

@WebServlet("/boardread.do")
public class BoardReadCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// 파라미터 값 받기
		int num = Integer.parseInt(request.getParameter("num"));
		
		// DAO 실행
		BoardDAO bdao = BoardDAO.getInstance();
		BoardDTO bean = bdao.getOneBoard(num);

// 테스트용 세션 추가
		/*
		 * HttpSession session = request.getSession();
		 * 
		 * MemberDTO bto = new MemberDTO(
		 * "bang9","123","123","123","123","123","123","123","123","123","123","123",
		 * "123","123" );
		 */
		
		//session.setAttribute("member", bto);
/* 여기부터 리스트 / 서치리스트 작업한 부분 --------------------------------------------------------------------- */
		// 목록버튼 분기용 check
		String searchText = request.getParameter("searchText");
		String searchField = request.getParameter("searchField");
		String check = request.getParameter("check");

		// 콘솔확인용
		System.out.println("보드read(get) searchText : " + searchText);
		System.out.println("보드read(get) searchField : " + searchField);
		System.out.println("보드read(get) check : " + check);
		
	   	LocalDate localeToday = LocalDate.now();
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	    String admindate = localeToday.plusDays(+1).format(formatter);
	    request.setAttribute("admindate", admindate);
		
		request.setAttribute("searchText", searchText);
		request.setAttribute("searchField", searchField);		
		request.setAttribute("check", check); 
		request.setAttribute("bean", bean);
		RequestDispatcher dis = request.getRequestDispatcher("index.jsp?content=read.jsp");
		dis.forward(request, response);	
/* 여기부터 리스트 / 서치리스트 작업한 부분 --------------------------------------------------------------------- */
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		doGet(request, response);
	}

}
