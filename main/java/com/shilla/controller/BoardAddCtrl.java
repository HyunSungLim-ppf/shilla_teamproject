package com.shilla.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.shilla.dto.MemberDTO;

@WebServlet("/boardadd.do")
public class BoardAddCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		if (member == null) {
			out.println("<script>");
			out.println("alert('로그인해 주세요')");
			out.println("location.href='index.jsp?content=login.jsp'");
			out.println("</script>");
		} else {
			String name = member.getName_kr();
			String email = member.getEmail();
			String phone = member.getPhone();
			
			// 형섭추가
			String searchText = request.getParameter("searchText");
			String searchField = request.getParameter("searchField");
			System.out.println("보드add(get) searchText : " + searchText);
			System.out.println("보드add(get) searchField : " + searchField);
			
			// 형섭추가
			request.setAttribute("searchText", searchText);
			request.setAttribute("searchField", searchField);
			
			session.setAttribute("name", name);
			session.setAttribute("email", email);
			session.setAttribute("phone", phone);
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp?content=write.jsp");
			dis.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// 파라미터 값 받아오기
		HttpSession session = request.getSession();
		int brand = Integer.parseInt(request.getParameter("brand"));
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String name = member.getName_kr();
		String email = member.getEmail();
		String phone = member.getPhone();
		String board_id = member.getId();

		BoardDTO bean = new BoardDTO();
		bean.setBrand(brand);
		bean.setCategory(category);
		bean.setTitle(title);
		bean.setName(name);
		bean.setContent(content);
		bean.setEmail(email);
		bean.setPhone(phone);
		bean.setBoard_id(board_id);
		
		
		BoardDAO bdao = BoardDAO.getInstance();
		int num = bdao.addBoard(bean);
		System.out.println(num);
		// 이거 왜 있는거임?
		request.setAttribute("bean", bean );
		
		// 목록버튼 분기용 check
		String searchText = request.getParameter("searchText");
		String searchField = request.getParameter("searchField");
		
		String check = "1";
		if(searchText != "") {
			check = "2";
//			searchText = title.charAt(0) + "" + title.charAt(1);
			searchText= "  ";
			searchField = "title";
		}
		
		System.out.println("보드add(post) searchText : " + searchText);
		System.out.println("보드add(post) searchField : " + searchField);
		System.out.println("보드add(post) check : " + check);
		
		RequestDispatcher dis = request.getRequestDispatcher("boardread.do?num="+num+"&searchText="+searchText+"&searchField="+searchField+"&check="+check);
		dis.forward(request, response);
	}

}
