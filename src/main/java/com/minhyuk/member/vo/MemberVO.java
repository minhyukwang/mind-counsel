package com.minhyuk.member.vo;

import com.minhyuk.common.vo.CommonVO;

/**
 * 회원정보(mem_info) 관련 VO class
 */
public class MemberVO extends CommonVO
{
	private String mem_seq="";
	private String mem_id="";
	private String login_cd="";
	private String mem_pwd="";
	private String mem_name="";
	private String mem_nick="";
	private String mem_phone ="";
	private String mem_email ="";
	private String mem_pic="";
	private String mem_gender="";
	private String mem_date="";
	private String dormancy="";
	private String last_login_timestamp="";
	private int mem_point =0;
	private String auth="";
	private boolean useCookie;
	private String mem_intro="";


	public String getMem_intro() {
		return mem_intro;
	}

	public void setMem_intro(String mem_intro) {
		this.mem_intro = mem_intro;
	}

	public String getMem_seq() {
		return mem_seq;
	}

	public void setMem_seq(String mem_seq) {
		this.mem_seq = mem_seq;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getLogin_cd() {
		return login_cd;
	}
	public void setLogin_cd(String login_cd) {
		this.login_cd = login_cd;
	}
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_pic() {
		return mem_pic;
	}
	public void setMem_pic(String mem_pic) {
		this.mem_pic = mem_pic;
	}
	public String getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}
	public String getMem_date() {
		return mem_date;
	}
	public void setMem_date(String mem_date) {
		this.mem_date = mem_date;
	}
	public String getDormancy() {
		return dormancy;
	}
	public void setDormancy(String dormancy) {
		this.dormancy = dormancy;
	}
	public String getLast_login_timestamp() {
		return last_login_timestamp;
	}
	public void setLast_login_timestamp(String last_login_timestamp) {
		this.last_login_timestamp = last_login_timestamp;
	}
	public int getMem_point() {
		return mem_point;
	}
	public void setMem_point(int mem_point) {
		this.mem_point = mem_point;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}


}
