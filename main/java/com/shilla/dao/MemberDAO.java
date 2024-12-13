package com.shilla.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.shilla.dto.MemberDTO;

public class MemberDAO {

	Connection conn;
	ResultSet rs;
	PreparedStatement pstmt;
	
	private void dbConn() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context)initctx.lookup("java:comp/env");
			DataSource ds = (DataSource)envctx.lookup("jdbc/pool");
			conn = ds.getConnection();
			System.out.println("DB연결!!!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// #1. 회원 추가 메서드
	public void addMember(MemberDTO bean) {
		System.out.println("addMember 메서드 호출 완!");
		dbConn();
		try {
			String sql = "insert into shilla_member VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,default)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bean.getId());
		pstmt.setString(2, bean.getEmail());
		pstmt.setString(3, bean.getPwd());
		pstmt.setString(4, bean.getName_kr());
		pstmt.setString(5, bean.getName_en_first());
		pstmt.setString(6, bean.getName_en_last());
		pstmt.setString(7, bean.getBirth());
		pstmt.setString(8, bean.getPhone());
		pstmt.setString(9, bean.getGender());
		pstmt.setString(10, bean.getAddress());
		pstmt.setString(11, bean.getTel());
		pstmt.setString(12, bean.getPromo());
		pstmt.setString(13, bean.getReco());
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 이메일 중복 검사(해당 이메일을 인자값으로 DB에 해당 이메일이 존재하는지) => 중복된 이메일 겟수 반환
	public int chkMemberEmailOverLap(String email) {
		int result = 0;
		dbConn();
		try {
			String sql = "SELECT COUNT(*) FROM shilla_member WHERE email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
			conn.close();
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int chkMemberEmailOverLap(String email, String id) {
		int result = 0;
		dbConn();
		try {
			String sql = "SELECT COUNT(*) FROM shilla_member WHERE email = ? AND id != ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
			conn.close();
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	// 아이디 중복 검사(해당 아이디를 인자값으로 DB에 해당 아이디가 존재하는지) => 중복된 아이디 겟수 반환
	public int chkMemberIdOverLap(String id) {
		int result = 0;
		dbConn();
		try {
			String sql = "SELECT COUNT(*) FROM shilla_member WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
			conn.close();
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// #2. 아이디(pk)와 pwd를 가지고 회원 조회 
	public MemberDTO getMember(String id, String pwd) {
		MemberDTO bean = new MemberDTO();
		dbConn();
		try {
			String sql = "SELECT * FROM shilla_member WHERE id = ? AND pwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setId(rs.getString(1));
				bean.setEmail(rs.getString(2));
				bean.setPwd(rs.getString(3));
				bean.setName_kr(rs.getString(4));
				bean.setName_en_first(rs.getString(5));
				bean.setName_en_last(rs.getString(6));
				bean.setBirth(rs.getString(7));
				bean.setPhone(rs.getString(8));
				bean.setGender(rs.getString(9));
				bean.setAddress(rs.getString(10));
				bean.setTel(rs.getString(11));
				bean.setPromo(rs.getString(12));
				bean.setReco(rs.getString(13));
				bean.setRole(rs.getString(14));
			}
			conn.close();
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	// #3. id 찾기 메서드 
	public String getMemberId(String name_en_first, String name_en_last, String email) {
		String result = "";
		dbConn();
		try {
			String sql = "SELECT id FROM shilla_member WHERE name_en_first = ? AND name_en_last = ? AND email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name_en_first);
			pstmt.setString(2, name_en_last);
			pstmt.setString(3, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString(1);
			}
			conn.close();
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public String getMemberPwd(String id, String name_en_first, String name_en_last, String email) {
		String result = "";
		dbConn();
		try {
			String sql = "SELECT pwd FROM shilla_member WHERE id = ? AND name_en_first = ? AND name_en_last = ? AND email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name_en_first);
			pstmt.setString(3, name_en_last);
			pstmt.setString(4, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString(1);
			}
			conn.close();
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public void updateMemember(MemberDTO member) {
		dbConn();
		try {
			String sql ="update shilla_member set email =?,phone=?,address=?,tel=?, pwd=?, promo=? where id = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getPhone());
			pstmt.setString(3, member.getAddress());
			pstmt.setString(4, member.getTel());
			pstmt.setString(5, member.getPwd());
			pstmt.setString(6, member.getPromo());
			pstmt.setString(7, member.getId());
			pstmt.executeUpdate();
			
			conn.close();
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	// #
	public void deleteMember(String id) {
		dbConn();
		try {
			String sql = "DELETE FROM shilla_member WHERE id =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
			conn.close();
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
