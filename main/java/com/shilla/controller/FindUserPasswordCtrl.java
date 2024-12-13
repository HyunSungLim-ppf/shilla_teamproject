package com.shilla.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shilla.dao.MemberDAO;

/**
 * Servlet implementation class FindUserPasswordCtrl
 */
@WebServlet("/findpassword.do")
public class FindUserPasswordCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 일단 한글처리는 해줘야 함
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		request.removeAttribute("resId");
		request.removeAttribute("findedId");
		
		// 일단 데이터 받아오기 
		String id = request.getParameter("id").toLowerCase();
		String email = request.getParameter("user_email").toLowerCase();
		String name_en_first = request.getParameter("name_en_first").toLowerCase();
		String name_en_last = request.getParameter("name_en_last").toLowerCase();
		
		MemberDAO mDao = new MemberDAO();
		String findedPwd = mDao.getMemberPwd(id, name_en_first, name_en_last, email);
		System.out.println("findedId : " + findedPwd);
		System.out.println("findedId Is Null : " + (findedPwd == null));
		System.out.println("findedId Is \"\" : " + (findedPwd.equals("")));
		// 응답 처리할 변수 하나 더 만들자 
				String resPwd = "";
				if(findedPwd == "") {
					resPwd = "no";
				} else {
					resPwd = "ok";
				}
		// 아이디 찾기 -> 모달 
		request.setAttribute("resPwd", resPwd);
		request.setAttribute("findedPwd", findedPwd);
		request.getRequestDispatcher("index.jsp?content=login.jsp").forward(request, response);
		// DB에서 조회한 값이 없다면 findedId는 "" 임 -> 결과 판별
		/*
		PrintWriter out = response.getWriter();
		if(findedPwd.length() == 0) {
			out.println("<script>");
			out.println("alert('해당 비밀번호가 존재하지 않습니다.')");
			out.println("location.href='index.jsp?content=login.jsp'");
			out.println("</script>");
			out.close();
		} else {
			out.println("<script>");
			out.println("alert('찾으시는 비밀번호는 [" + findedPwd + "] 입니다.')");
			out.println("location.href='index.jsp?content=login.jsp'");
			out.println("</script>");
			out.close();
		}*/		
	}

}
