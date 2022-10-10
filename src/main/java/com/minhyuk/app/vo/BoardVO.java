package com.minhyuk.app.vo;

import com.minhyuk.common.vo.CommonVO;

/**
 * 타임라인게시판(board) 관련 VO class
 */
public class BoardVO extends CommonVO
{
	
	int board_seq;
	String category_id;
	String mem_nick;
	String contents;
	String anony_yn;
	String open_grade;
	String board_type;
	String up_time;
	int comment_count;
	int like_count;
	String mem_pic;
	
	public String getMem_pic() {
		return mem_pic;
	}
	public void setMem_pic(String mem_pic) {
		this.mem_pic = mem_pic;
	}
	public int getComment_count() {
		return comment_count;
	}
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public String getUp_time() {
		return up_time;
	}
	public void setUp_time(String up_time) {
		this.up_time = up_time;
	}
	public int getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getAnony_yn() {
		return anony_yn;
	}
	public void setAnony_yn(String anony_yn) {
		this.anony_yn = anony_yn;
	}
	public String getOpen_grade() {
		return open_grade;
	}
	public void setOpen_grade(String open_grade) {
		this.open_grade = open_grade;
	}
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	
	

}
