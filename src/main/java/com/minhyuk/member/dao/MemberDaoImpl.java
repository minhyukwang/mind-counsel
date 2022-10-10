package com.minhyuk.member.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.minhyuk.member.vo.MemberVO;


/**
 * @author Minhyuk
 * 회원정보 관련 Dao 구현 class
 * 2019. 7. 15.
 */
@Repository
public class MemberDaoImpl implements MemberDao
{
	@Autowired
	private SqlSessionTemplate sm;

	@Override
	public MemberVO getMember(String mem_id)
	{
		return sm.selectOne("Member.selectMember", mem_id);
	}

	@Override
	public List<MemberVO> getCounselerList()
	{
		return sm.selectList("Member.selectCounselerList");
	}

	@Override
	public MemberVO login(MemberVO memVo)
	{

		return sm.selectOne("Member.login", memVo);
	}


	@Override
	public void insertMember(MemberVO vo)
	{
		sm.insert("Member.insert", vo);
	}

	@Override
	public void modifyMember(MemberVO vo)
	{
		sm.update("Member.modify", vo);
	}

	@Override
	public void changePic(String mem_pic, String mem_seq)
	{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("mem_seq", mem_seq);
		paramMap.put("mem_pic", mem_pic);

		sm.update("Member.changePic", paramMap);
	}

	@Override
	public int checkID(String mem_id)
	{

		return sm.selectOne("Member.checkID", mem_id);
	}


	@Override
	public void keepLogin(String mem_id, String sessionId, Date next)
	{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("mem_id", mem_id);
		paramMap.put("sessionId", sessionId);
		paramMap.put("next", next);

		sm.update("Member.keepLogin", paramMap);
	}

	@Override
	public MemberVO checkMember(String value)
	{

		return sm.selectOne("Member.checkMember", value);
	}

	public List<MemberVO> recommend(int mem_seq)
	{

		return sm.selectList("Member.recommend", mem_seq);
	}

	@Override
	public void updateFollower(int mem_seq, int amount)
	{

		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("mem_seq", mem_seq);
		paramMap.put("amount", amount);

		sm.update("Member.updateFollower", paramMap);
	}

	@Override
	public void updateFollowing(int mem_seq, int amount)
	{

		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("mem_seq", mem_seq);
		paramMap.put("amount", amount);

		sm.update("Member.updateFollowing", paramMap);
	}

	@Override
	public String getFollower(int mem_seq)
	{

		return sm.selectOne("Member.getFollower", mem_seq);
	}

	@Override
	public String getFollowing(int mem_seq)
	{

		return sm.selectOne("Member.getFollowing", mem_seq);
	}

	@Override
	public List<String> getID(String mem_email)
	{

		return sm.selectList("Member.getID", mem_email);
	}

	@Override
	public void changePwd(String mem_pwd, String mem_id)
	{

		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("mem_pwd", mem_pwd);
		paramMap.put("mem_id", mem_id);

		sm.update("Member.changePwd", paramMap);
	}

	@Override
	public void updateMemPic(String mem_pic, String mem_id)
	{

		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("mem_pic", mem_pic);
		paramMap.put("mem_id", mem_id);
		sm.update("Member.updateMemPic", paramMap);
	}
	@Override
	public MemberVO getView(String mem_id)
	{

		return sm.selectOne("Member.getView", mem_id);
	}

	@Override
	public void updateMyInfo(MemberVO vo) {
		sm.update("Member.updateMyInfo", vo);
	}

}
