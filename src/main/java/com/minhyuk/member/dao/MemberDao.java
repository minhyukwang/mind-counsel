package com.minhyuk.member.dao;

import java.util.Date;
import java.util.List;

import com.minhyuk.member.vo.MemberVO;

/**
 * 회원정보 관련 Dao Interface
 */
public interface MemberDao
{
	public MemberVO getMember(String mem_id);
	public List<MemberVO> getCounselerList();
	public void insertMember(MemberVO vo);
	public void modifyMember(MemberVO vo);
	public void changePic(String mem_pic, String mem_seq);
	public int checkID(String mem_id);
	public MemberVO login(MemberVO memVo);
	public void keepLogin(String mem_id, String sessionId, Date next);
	public MemberVO checkMember(String value);
	public List<MemberVO> recommend(int mem_seq);
	public void updateFollower(int mem_seq, int amount);
	public void updateFollowing(int mem_seq, int amount);
	public String getFollower(int mem_seq);
	public String getFollowing(int mem_seq);
	public List<String> getID(String mem_email);
	public void changePwd(String mem_pwd, String mem_id);
	public void updateMemPic(String mem_pic, String mem_id);
	public MemberVO getView(String mem_id);
	public void updateMyInfo(MemberVO vo);
}
