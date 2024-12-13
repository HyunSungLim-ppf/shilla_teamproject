package com.shilla.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shilla.dao.MemberDAO;
import com.shilla.dto.MemberDTO;


@WebServlet("/signup.do")
public class SignUpCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String name_kr = request.getParameter("name_kr");
		String gender = request.getParameter("gender");
		
		// 영문이름 name_en
		String name_en_f = request.getParameter("name_en_f");
		String name_en_l = request.getParameter("name_en_l");
		
		// 날짜 YYYY/MM/DD birth
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String day2 =null;
		if(Integer.parseInt(day) <10) {
				day2 = "0"+day;
		}else {
			day2 = day;
		}
		String birth = year+"/"+month+"/"+day2;
		
		// 이메일 email
		String email_1 = request.getParameter("email_1");
		String email_2 = request.getParameter("email_2");
		System.out.println("email_2 : " + email_2);
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
		if(address1 == null || address1 =="") {
			address1 = " ";
		}
		if(address2== null || address2 =="") {
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
		
	
		String id = request.getParameter("id");
		
		// 비밀번호
		String pwd1 = request.getParameter("pwd1");
		String pwd2 = request.getParameter("pwd2");
		String pwd = pwd2;
		if(pwd1.equals(pwd2)) {
			pwd = pwd1;
		}
		// 프로모션, 추천 코드
		String promo = request.getParameter("promo");
		String reco = request.getParameter("reco");
		
		MemberDTO bean = new MemberDTO();
		bean.setId(id);
		bean.setEmail(email);
		bean.setPwd(pwd);
		bean.setName_kr(name_kr);
		bean.setName_en_first(name_en_f);
		bean.setName_en_last(name_en_l);
		bean.setBirth(birth);
		bean.setPhone(phone);
		bean.setGender(gender);
		bean.setAddress(address);
		bean.setTel(tel);
		bean.setPromo(promo);
		bean.setReco(reco);
		bean.setRole(reco);
		
		MemberDAO sdao = new MemberDAO();
		sdao.addMember(bean);
		
		/*
		 RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		 dis.forward(request, response);
		 */
		
		// 변경 -> 회원 가입 완료시 회원 가입 완료됬다고 일단 경고창 알림과 동시에 로그인 페이지로 이동 
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('회원가입이 완료 되었습니다.!!')");
		out.println("location.href='index.jsp?contetn=login.jsp'");
		out.println("</script>");
		out.close();
}
	
}
