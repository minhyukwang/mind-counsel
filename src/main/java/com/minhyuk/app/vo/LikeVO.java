package com.minhyuk.app.vo;

import com.minhyuk.common.vo.CommonVO;

/**
 * 좋아요(Like) 관련 VO class
 */
public class LikeVO extends CommonVO
{
	int board_seq; 
    String mem_id; 
    String mem_nick; 
    String mem_pic; 
    
	String board_type;
    
	public int getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}

	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public String getMem_pic() {
		return mem_pic;
	}
	public void setMem_pic(String mem_pic) {
		this.mem_pic = mem_pic;
	}
}
