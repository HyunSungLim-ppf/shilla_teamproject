package com.shilla.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shilla.dao.MemberDAO;
import com.shilla.dto.MemberDTO;


@WebServlet("/memberhandle.do")
public class MemberHandleCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		// id 정보 받아오기
		String id = request.getParameter("id");
		
		MemberDAO dao = new MemberDAO();
		dao.deleteMember(id);
		
		RequestDispatcher dis = request.getRequestDispatcher("logout.do");
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		// 세션 정보 받아오기
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		System.out.println("세션에 저장된 회원 정보 : ");
		System.out.println(member.toString());
		
		
		// 이메일 email
		String email_1 = request.getParameter("email_1");
		String email_2 = request.getParameter("email_2");
		String email = email_1+"@"+email_2;
		
		// 휴대전화 phone
		String phone_1 = request.getParameter("phone_1");
		String phone_2 = request.getParameter("phone_2");
		String phone_3 = request.getParameter("phone_3");
		String phone = phone_1+"-"+phone_2+"-"+phone_3;
		
		// 주소 address postnum + 나머지 주소1,2
		String postnum = request.getParameter("postnum");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		if(postnum == null || postnum == "") {
			postnum = " ";
		}
		if(address1 == null || address1 == "") {
			address1 = " ";
		}
		if(address2 == null || address2 == "") {
			address2 = " ";
		}
		String address = postnum+"-"+address1+"-"+address2;
		
		// 자택전화 tel
		String tel_1 = request.getParameter("tel_1");
		if(tel_1.equals("선택")) {
			tel_1 = " ";
		}
		String tel_2 = request.getParameter("tel_2");
		if(tel_2 == null || tel_2 == "") {
			tel_2 = " ";
		}
		String tel = tel_1+"-"+tel_2;

		/*
		// 비밀번호
		// 새 비밀번호 입력 값 (입력을 안하면 기존 사용자 비밀번호 값)
		String pwd1 = request.getParameter("pwd1"); // 12341234
		
		// 비밀번호 확인 입력 값
		String pwd2 = request.getParameter("pwd2"); // null
		
		System.out.println("기존 비밀번호 pwd : " + member.getPwd());
		System.out.println("변경된 비밀번호 pwd1 : " + pwd1);
		System.out.println("pwd1은 Null인가? pwd1 == null: " + (pwd1 == null));
		System.out.println("pwd1은 길이가 0인가? pwd1.length() : " + pwd1.length());
		// 만약 비밀번호 변경을 했다면 -> pwd1에 값이 들어겠지
		if(pwd1 != null || pwd1.length() != 0) {
			member.setPwd(pwd1);
		} 
		*/
		
		 // 비밀번호
			String pwd = member.getPwd();
			String pwd1 = request.getParameter("pwd1");
			String pwd2 = request.getParameter("pwd2");
			if (pwd1.equals(pwd2) && pwd1 != null && pwd1 != "") {
				pwd = pwd1;
			}

		
		// 프로모션, 추천 코드
		String promo = request.getParameter("promo");
	
		member.setEmail(email); 
		member.setPhone(phone);
		member.setAddress(address);
		member.setTel(tel);
		member.setPwd(pwd);

		// dao 생성
		MemberDAO dao = new MemberDAO();
		dao.updateMemember(member);

		
		// DB에 반영되기 전에 수정된 회원 정보 
		System.out.println("변경된 회원 정보 : ");
		System.out.println(member.toString());
		
		session.setAttribute("member", member);
		
		RequestDispatcher dis = request.getRequestDispatcher("memberhandleform.do");
		dis.forward(request, response);
		
	}

}
