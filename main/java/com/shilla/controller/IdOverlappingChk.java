package com.shilla.controller;

/* 회원 가입시 아이디 중복검사 Ctrl */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shilla.dao.MemberDAO;

@WebServlet("/idoverlappingchk.do")
public class IdOverlappingChk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// doGet()
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String chkId = request.getParameter("id");
		System.out.println("중복 검사할 id : " + chkId);
		// DB에서 중복할 값이 있는지 
		MemberDAO mDao = new MemberDAO();
		int result = mDao.chkMemberIdOverLap(chkId);
		if (result > 0) {	// 중복된 아이디가 있다면 : 0 이상
			System.out.println("중복된 id~~~");
			PrintWriter out = response.getWriter();
			out.print("no");
			out.close();
		} else {	// 중복된 아이디가 없다면 : 0
			PrintWriter out = response.getWriter();
			out.print("ok");
			out.close();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
