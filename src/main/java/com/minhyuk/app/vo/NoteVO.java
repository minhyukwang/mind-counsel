package com.minhyuk.app.vo;

import com.minhyuk.common.vo.CommonVO;

/**
 * 쪽지보내기(note) 관련 VO class
 */
public class NoteVO extends CommonVO
{

	int note_seq;
	String send_mem_id;
	String reci_mem_id;
	String co_type;
	String note_title;
	String note_contents;
	String mem_name;
	String mem_nick;
	String confirm_yn;

	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public int getNote_seq() {
		return note_seq;
	}
	public void setNote_seq(int note_seq) {
		this.note_seq = note_seq;
	}

	public String getSend_mem_id() {
		return send_mem_id;
	}
	public void setSend_mem_id(String send_mem_id) {
		this.send_mem_id = send_mem_id;
	}
	public String getReci_mem_id() {
		return reci_mem_id;
	}
	public void setReci_mem_id(String reci_mem_id) {
		this.reci_mem_id = reci_mem_id;
	}
	public String getCo_type() {
		return co_type;
	}
	public void setCo_type(String co_type) {
		this.co_type = co_type;
	}
	public String getNote_title() {
		return note_title;
	}
	public void setNote_title(String note_title) {
		this.note_title = note_title;
	}
	public String getNote_contents() {
		return note_contents;
	}
	public void setNote_contents(String note_contents) {
		this.note_contents = note_contents;
	}
	public String getConfirm_yn() {
		return confirm_yn;
	}
	public void setConfirm_yn(String confirm_yn) {
		this.confirm_yn = confirm_yn;
	}




}
