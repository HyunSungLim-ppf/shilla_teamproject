package com.shilla.dto;
/* shilla_board 테이블 DTO */
import java.sql.Date;

public class BoardDTO {
	// 필드
	private int num;
	private int brand;
	private String category;
	private String title;
	private String content;
	private String name;
	private String email;
	private String phone;
	private String board_id;
	private Date regdate;
	private String reply;
	// 생성자
	public BoardDTO() {}
	public BoardDTO(int num, int brand, String category, String title, String content, String name,
			String email, String phone, String board_id, Date regdate, String reply) {
		this.num = num;
		this.brand = brand;
		this.category = category;
		this.title = title;
		this.content = content;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.board_id = board_id;
		this.regdate = regdate;
		this.reply = reply;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getBrand() {
		return brand;
	}
	public void setBrand(int brand) {
		this.brand = brand;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
}
