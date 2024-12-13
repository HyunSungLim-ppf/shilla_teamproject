package com.shilla.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shilla.dao.BoardDAO;
import com.shilla.dto.BoardDTO;

@WebServlet("/boardupdate.do")
public class BoardUpdateCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// 파라미터 값 받기
		int num = Integer.parseInt(request.getParameter("num"));
/* 여기부터 리스트 / 서치리스트 작업한 부분 --------------------------------------------------------------------- */
		// 형섭추가
		String searchText = request.getParameter("searchText");
		String searchField = request.getParameter("searchField");
		System.out.println("보드update(get) searchText : " + searchText);
		System.out.println("보드update(get) searchField : " + searchField);
			
		// DAO 실행
		BoardDAO bdao = BoardDAO.getInstance();
		BoardDTO bean = bdao.getOneBoard(num);
		request.setAttribute("bean", bean);
		
		// 형섭추가
		request.setAttribute("searchText", searchText);
		request.setAttribute("searchField", searchField);
/* 여기부터 리스트 / 서치리스트 작업한 부분 --------------------------------------------------------------------- */
		RequestDispatcher dis = request.getRequestDispatcher("index.jsp?content=update.jsp");
		dis.forward(request, response);		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		// 파라미터 값 받기
		int num = Integer.parseInt(request.getParameter("num"));
		int brand = Integer.parseInt(request.getParameter("brand"));
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");	
		
		// DTO에 값 할당
		BoardDTO bean = new BoardDTO();
		bean.setNum(num);
		bean.setBrand(brand);
		bean.setCategory(category);
		bean.setTitle(title);
		bean.setContent(content);		
		
		// DAO로 실행
		BoardDAO bdao = BoardDAO.getInstance();
		bdao.updateBoard(bean);
		
/* 여기부터 리스트 / 서치리스트 작업한 부분 --------------------------------------------------------------------- */		
		// 목록버튼 분기용 check
		String searchText = request.getParameter("searchText");
		String searchField = request.getParameter("searchField");
		
		String check = "1";
		if(searchText != "") {
			check = "2";
//			searchText = title.charAt(0) + "" + title.charAt(1);
			searchText = "  ";
			searchField = "title";
		}
		
		// 콘솔확인용
		System.out.println("보드update(post) searchText : " + searchText);
		System.out.println("보드update(post) searchField : " + searchField);
		System.out.println("보드update(post) check : " + check);

		// 상세보기로
		RequestDispatcher dis = request.getRequestDispatcher("boardread.do?num="+num+"&searchText="+searchText+"&searchField="+searchField+"&check="+check);
		dis.forward(request, response);
/* 여기부터 리스트 / 서치리스트 작업한 부분 --------------------------------------------------------------------- */
	}

}
