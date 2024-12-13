package com.shilla.controller;
/* 아이디 찾기 Ctrl */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shilla.dao.MemberDAO;

@WebServlet("/findid.do")
public class FindUserIdCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// doPost()
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 일단 한글처리는 해줘야 함
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		request.removeAttribute("resPwd");
		request.removeAttribute("findedPwd");

		// 일단 데이터 받아오기 
		String email = request.getParameter("user_email").toLowerCase();
		String name_en_first = request.getParameter("name_en_first").toLowerCase();
		String name_en_last = request.getParameter("name_en_last").toLowerCase();
		System.out.println(email);
		System.out.println(name_en_first);
		System.out.println(name_en_last);
		
		MemberDAO mDao = new MemberDAO();
		String findedId = mDao.getMemberId(name_en_first, name_en_last, email);
		System.out.println("findedId : " + findedId);
		System.out.println("findedId Is Null : " + (findedId == null));
		System.out.println("findedId Is \"\" : " + (findedId.equals("")));
		
		// 응답 처리할 변수 하나 더 만들자 
		String resId = "";
		if(findedId == "") {
			resId = "no";
		} else {
			resId = "ok";
		}
		System.out.println("-----------------");
		System.out.println("resId : " + resId);
		System.out.println("-----------------");
		// 아이디 찾기 -> 모달 
		request.setAttribute("resId", resId);
		request.setAttribute("findedId", findedId);
		request.getRequestDispatcher("index.jsp?content=login.jsp").forward(request, response);

		// DB에서 조회한 값이 없다면 findedId는 "" 임 -> 결과 판별
		/*
		PrintWriter out = response.getWriter();
		if(findedId.length() == 0) {
			out.println("<script>");
			out.println("alert('해당 아이디가 존재하지 않습니다.')");
			out.println("location.href='index.jsp?content=login.jsp'");
			out.println("</script>");
			out.close();
		} else {
			out.println("<script>");
			out.println("alert('아이디는 [" + findedId + "] 입니다.')");
			out.println("location.href='index.jsp?content=login.jsp'");
			out.println("</script>");
			out.close();
		}
		*/
	}

}
