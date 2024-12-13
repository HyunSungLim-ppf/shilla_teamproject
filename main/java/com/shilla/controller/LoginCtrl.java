package com.shilla.controller;
/* 로그인 처리 Ctrl */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shilla.dao.MemberDAO;
import com.shilla.dto.MemberDTO;

@WebServlet("/login.do")
public class LoginCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	// doPost()
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 일단 모든 아이디와 비밀번호는 영문으로 되어 있음 => 한글 처리 필요 x
		String id = request.getParameter("user_id");
		String pwd = request.getParameter("user_password");
		
		// 응답은 한글(국문 이름, 주소 등은 한글이 있는데 혹시나)
		response.setContentType("text/html; charset=utf-8");
		
		// 요청 받은 아이디와 비밀번호
		System.out.println("요청 받은 id : " + id);
		System.out.println("요청 받은 pwd : " + pwd);
		
		// DAO : 입력받은 id(테이블에서 pk임)와 pwd를 가지고 회원 조회 
		// DTO인 MemberDTO에 담아 세션에 저장
		MemberDAO mDao = new MemberDAO();
		MemberDTO member = mDao.getMember(id, pwd);
		if(member.getId() == null) {	// 로그인 실패
			// 해당 회원이 DB에 존재하지 않는다면 경고창 출력후 로그인 페이지 이동
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 실패')");
			out.println("location.href='index.jsp?content=login.jsp'");
			out.println("</script>");
			out.close();
		} else {	// 로그인 성공
			// 해당 회원이 DB에 존재하면 세션에 담아서 index.jsp로 이동(바인딩, 포워딩)
			// 1. 세션에 저장후
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			// 2. index.jsp로 리다이렉트
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		
	}

}
