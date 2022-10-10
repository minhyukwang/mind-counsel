package com.minhyuk.app.vo;

import com.google.gson.Gson;

public class MsgVO {

	private int msg_seq;
	private String msg_timestamp;
	private String msg_text;
	private int chat_seq;
	private String mem_id;
	private String mem_nick;
	private String tutor_mem_id;

	public String getTutor_mem_id() {
		return tutor_mem_id;
	}
	public void setTutor_mem_id(String tutor_mem_id) {
		this.tutor_mem_id = tutor_mem_id;
	}
	public int getMsg_seq() {
		return msg_seq;
	}
	public void setMsg_seq(int msg_seq) {
		this.msg_seq = msg_seq;
	}
	public String getMsg_timestamp() {
		return msg_timestamp;
	}
	public void setMsg_timestamp(String msg_timestamp) {
		this.msg_timestamp = msg_timestamp;
	}
	public String getMsg_text() {
		return msg_text;
	}
	public void setMsg_text(String msg_text) {
		this.msg_text = msg_text;
	}
	public int getChat_seq() {
		return chat_seq;
	}
	public void setChat_seq(int chat_seq) {
		this.chat_seq = chat_seq;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}

	public static MsgVO convertMessage(String source) {
		MsgVO message = new MsgVO();
		Gson gson = new Gson();
		message = gson.fromJson(source,  MsgVO.class);
		return message;
	}

	@Override
	public String toString() {
		return "MsgVO [msg_seq=" + msg_seq + ", msg_timestamp=" + msg_timestamp + ", msg_text="
				+ msg_text + ", chat_seq=" + chat_seq + ", mem_id=" + mem_id
				+ ", mem_nick=" + mem_nick+"]";
	}

}