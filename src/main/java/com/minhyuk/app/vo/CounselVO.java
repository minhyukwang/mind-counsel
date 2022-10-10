package com.minhyuk.app.vo;

import com.minhyuk.common.vo.CommonVO;

/**
 * 상담관리(cons_mgt) 관련 VO class
 */
public class CounselVO extends CommonVO
{
	int cons_seq;
	String mem_id;
	String mem_name;
	String mem_nick;
	String mem_pic;
	String cons_timestamp;
	String cons_course_id;
	String cons_course_nm;
    int cons_num;
    int total_cons_num;
	int price;
	int chat_seq;
	String pay_yn;
	String cons_reg_yn;
	String cons_comp_yn;
	int cons_pay_seq;
    String refund_yn;
    int timeGap;


	public int getTimeGap() {
		return timeGap;
	}
	public void setTimeGap(int timeGap) {
		this.timeGap = timeGap;
	}
	public String getRefund_yn() {
		return refund_yn;
	}
	public void setRefund_yn(String refund_yn) {
		this.refund_yn = refund_yn;
	}
	public int getCons_pay_seq() {
		return cons_pay_seq;
	}
	public void setCons_pay_seq(int cons_pay_seq) {
		this.cons_pay_seq = cons_pay_seq;
	}
	public String getMem_pic() {
		return mem_pic;
	}
	public void setMem_pic(String mem_pic) {
		this.mem_pic = mem_pic;
	}
	public String getCons_comp_yn() {
		return cons_comp_yn;
	}
	public void setCons_comp_yn(String cons_comp_yn) {
		this.cons_comp_yn = cons_comp_yn;
	}
	public String getCons_reg_yn() {
		return cons_reg_yn;
	}
	public void setCons_reg_yn(String cons_reg_yn) {
		this.cons_reg_yn = cons_reg_yn;
	}
	public int getCons_seq() {
		return cons_seq;
	}
	public void setCons_seq(int cons_seq) {
		this.cons_seq = cons_seq;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
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
	public String getCons_timestamp() {
		return cons_timestamp;
	}
	public void setCons_timestamp(String cons_timestamp) {
		this.cons_timestamp = cons_timestamp;
	}
	public String getCons_course_id() {
		return cons_course_id;
	}
	public void setCons_course_id(String cons_course_id) {
		this.cons_course_id = cons_course_id;
	}
	public String getCons_course_nm() {
		return cons_course_nm;
	}
	public void setCons_course_nm(String cons_course_nm) {
		this.cons_course_nm = cons_course_nm;
	}
	public int getCons_num() {
		return cons_num;
	}
	public void setCons_num(int cons_num) {
		this.cons_num = cons_num;
	}
	public int getTotal_cons_num() {
		return total_cons_num;
	}
	public void setTotal_cons_num(int total_cons_num) {
		this.total_cons_num = total_cons_num;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getChat_seq() {
		return chat_seq;
	}
	public void setChat_seq(int chat_seq) {
		this.chat_seq = chat_seq;
	}
	public String getPay_yn() {
		return pay_yn;
	}
	public void setPay_yn(String pay_yn) {
		this.pay_yn = pay_yn;
	}


}
