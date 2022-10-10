package com.minhyuk.app.vo;

import com.minhyuk.common.vo.CommonVO;

/**
 * 댓글(comment) 관련 VO class
 */
public class CommentVO extends CommonVO
{
	int comment_seq; 
	int parent_comment_seq; 
	int board_seq; 
    String anony_yn; 
    String board_type; 
    String contents;
	String mem_nick;
    String up_time;
    String mem_pic;
    
    
    
    public String getMem_pic() {
		return mem_pic;
	}
	public void setMem_pic(String mem_pic) {
		this.mem_pic = mem_pic;
	}
	public int getParent_comment_seq() {
    	return parent_comment_seq;
    }
    public void setParent_comment_seq(int parent_comment_seq) {
    	this.parent_comment_seq = parent_comment_seq;
    }
	public String getUp_time() {
		return up_time;
	}
	public void setUp_time(String up_time) {
		this.up_time = up_time;
	}
	public int getComment_seq() {
		return comment_seq;
	}
	public void setComment_seq(int comment_seq) {
		this.comment_seq = comment_seq;
	}
	public int getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}
	public String getAnony_yn() {
		return anony_yn;
	}
	public void setAnony_yn(String anony_yn) {
		this.anony_yn = anony_yn;
	}
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}



}
