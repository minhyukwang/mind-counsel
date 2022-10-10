package com.minhyuk.member.sf;

import java.util.Date;
import java.util.List;

import com.minhyuk.member.vo.MemberVO;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 회원정보 관련 service interface
 */
public interface MemberService
{
	public MemberVO getMember(String mem_id ) throws Exception;
	public List<MemberVO> getCounselerList()throws Exception;
	public void insertMember(MemberVO vo);
	public void modifyMember(MemberVO vo);
	public void changePic(String mem_pic, String mem_seq);
	public int checkID(String mem_id) throws Exception;
	public MemberVO login(MemberVO memVo)throws Exception;
	public void keepLogin(String mem_id, String sessionId, Date next);
	public MemberVO checkMember(String value);
	public List<MemberVO> recommend(int mem_seq) throws Exception;
	public String getFollower(int mem_seq) throws Exception;
	public String getFollowing(int mem_seq) throws Exception;
	public List<String> getID(String mem_email)throws Exception;
	public void changePwd(String mem_pwd, String mem_id) throws Exception;
	public void updateMemPic(String mem_pic, String mem_id) throws Exception;
	public MemberVO getView(String mem_id);
	public void updateMyInfo(MemberVO vo) throws Exception;
}
