package com.shilla.dto;

public class MemberDTO {
	private String id;
	private String email;
	private String pwd;
	private String name_kr;
	private String name_en_first;
	private String name_en_last;
	private String birth;
	private String phone;
	private String gender;
	private String address;
	private String tel;
	private String promo;
	private String reco;
	private String role;

	public MemberDTO(){};

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName_kr() {
		return name_kr;
	}

	public void setName_kr(String name_kr) {
		this.name_kr = name_kr;
	}

	public String getName_en_first() {
		return name_en_first;
	}

	public void setName_en_first(String name_en_first) {
		this.name_en_first = name_en_first;
	}

	public String getName_en_last() {
		return name_en_last;
	}

	public void setName_en_last(String name_en_last) {
		this.name_en_last = name_en_last;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPromo() {
		return promo;
	}

	public void setPromo(String promo) {
		this.promo = promo;
	}

	public String getReco() {
		return reco;
	}

	public void setReco(String reco) {
		this.reco = reco;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", email=" + email + ", pwd=" + pwd + ", name_kr=" + name_kr + ", name_en_first="
				+ name_en_first + ", name_en_last=" + name_en_last + ", birth=" + birth + ", phone=" + phone
				+ ", gender=" + gender + ", address=" + address + ", tel=" + tel + ", promo=" + promo + ", reco=" + reco
				+ ", role=" + role + "]";
	};
	
	
	
	
}
