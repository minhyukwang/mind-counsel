package com.minhyuk.app.vo;

public class ChatVO {

	private String chat_seq;
	private String created_id;
	private String created_timestamp;
	private String last_up_id;
	private String last_up_timestamp;
	private String data_end_id;
	private String data_end_timestamp;
	private String chat_topic;
	private int cons_seq;
	private String mem_id;
	private String tutor_mem_id;

	@Override
	public String toString() {
		return "ChatVO [chat_seq=" + chat_seq + ", created_id=" + created_id + ", created_timestamp="
				+ created_timestamp + ", last_up_id=" + last_up_id + ", last_up_timestamp=" + last_up_timestamp +
				", data_end_id=" + data_end_id + ", chat_topic=" + chat_topic+
				", mem_id=" + mem_id+", tutor_mem_id=" + tutor_mem_id+"]";
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getTutor_mem_id() {
		return tutor_mem_id;
	}
	public void setTutor_mem_id(String tutor_mem_id) {
		this.tutor_mem_id = tutor_mem_id;
	}

	public int getCons_seq() {
		return cons_seq;
	}
	public void setCons_seq(int cons_seq) {
		this.cons_seq = cons_seq;
	}
	public String getChat_seq() {
		return chat_seq;
	}

	public void setChat_seq(String chat_seq) {
		this.chat_seq = chat_seq;
	}

	public String getCreated_id() {
		return created_id;
	}

	public void setCreated_id(String created_id) {
		this.created_id = created_id;
	}

	public String getCreated_timestamp() {
		return created_timestamp;
	}

	public void setCreated_timestamp(String created_timestamp) {
		this.created_timestamp = created_timestamp;
	}

	public String getLast_up_id() {
		return last_up_id;
	}

	public void setLast_up_id(String last_up_id) {
		this.last_up_id = last_up_id;
	}

	public String getLast_up_timestamp() {
		return last_up_timestamp;
	}

	public void setLast_up_timestamp(String last_up_timestamp) {
		this.last_up_timestamp = last_up_timestamp;
	}

	public String getData_end_id() {
		return data_end_id;
	}

	public void setData_end_id(String data_end_id) {
		this.data_end_id = data_end_id;
	}

	public String getData_end_timestamp() {
		return data_end_timestamp;
	}

	public void setData_end_timestamp(String data_end_timestamp) {
		this.data_end_timestamp = data_end_timestamp;
	}

	public String getChat_topic() {
		return chat_topic;
	}

	public void setChat_topic(String chat_topic) {
		this.chat_topic = chat_topic;
	}



}
