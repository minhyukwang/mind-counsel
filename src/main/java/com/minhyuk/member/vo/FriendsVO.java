package com.minhyuk.member.vo;

import com.minhyuk.common.vo.CommonVO;

/**
 * 친구관리정보(friend_info) 관련 VO class
 */
public class FriendsVO extends CommonVO
{
	String mem_id;
	String friend_id;
	String block_yn;
	String push_yn;
	String mem_nick;
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
	String mem_pic;
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getFriend_id() {
		return friend_id;
	}
	public void setFriend_id(String friend_id) {
		this.friend_id = friend_id;
	}
	public String getBlock_yn() {
		return block_yn;
	}
	public void setBlock_yn(String block_yn) {
		this.block_yn = block_yn;
	}
	public String getPush_yn() {
		return push_yn;
	}
	public void setPush_yn(String push_yn) {
		this.push_yn = push_yn;
	}
}
