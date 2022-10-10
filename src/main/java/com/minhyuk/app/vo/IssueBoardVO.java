package com.minhyuk.app.vo;

import com.minhyuk.common.vo.CommonVO;

/**
 * 이슈게시판(issue_board) 관련 VO class
 */
public class IssueBoardVO extends CommonVO
{
	
	int issue_board_seq;
	String mem_nick;
	String title;
	String contents;
	int comment_count;
	int like_count;
	
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
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	String board_type;
	
	public int getIssue_board_seq() {
		return issue_board_seq;
	}
	public void setIssue_board_seq(int issue_board_seq) {
		this.issue_board_seq = issue_board_seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
