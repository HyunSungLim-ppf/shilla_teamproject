package com.shilla.controller;

/* 회원가입 -> 이메일 중복 검사 Ctrl */
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

@WebServlet("/emailoverlappingchk.do")
public class EmailOverlappingChk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// doGet() 요청
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청 한글처리 
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 전달 받은 데이터 (email)
		String chkEmail = request.getParameter("email");
		
		MemberDAO mDao = new MemberDAO();
		// 중복 검사 메서드 dao안에
		int result = mDao.chkMemberEmailOverLap(chkEmail);
		
		PrintWriter out = response.getWriter();
		if (result == 0) {	// 중복된 값이 없으면
			out.print("ok");
			out.close();
		} else {	// 중복된 값이 있으면
			System.out.println("중복된 email~~~");
			out.print("no");
			out.close();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청 한글처리 
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		// 전달 받은 데이터 (email)
		String chkEmail = request.getParameter("email");
		String type = request.getParameter("type");
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");

		
		MemberDAO mDao = new MemberDAO();
		// 중복 검사 메서드 dao안에
		int result = mDao.chkMemberEmailOverLap(chkEmail, member.getId());

		PrintWriter out = response.getWriter();
		
		
		if (result == 0) { // 중복된 값이 없으면
			out.print("ok");
			out.close();
		} else { // 중복된 값이 있으면
			System.out.println("중복된 email~~~");
			out.print("no");
			out.close();
		}
	}
}
