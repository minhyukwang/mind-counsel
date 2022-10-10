package com.minhyuk.member.sf;

import java.util.Date;
import java.util.List;

import com.minhyuk.member.dao.MemberDao;
import com.minhyuk.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * @author Minhyuk
 * 회원정보 관련 service 구현 class
 * 2019. 7. 15.
 */
@Service
public class MemberServiceImpl implements MemberService
{

	@Autowired
	private MemberDao memberDao;

	@Override
	public MemberVO getMember(String mem_id ) throws Exception
	{
		return memberDao.getMember(mem_id);
	}
	@Override
	public List<MemberVO> getCounselerList()throws Exception
	{
		return memberDao.getCounselerList();
	}

	@Override
	public MemberVO login(MemberVO memVo) throws Exception
	{

		return memberDao.login(memVo);
	}

	@Override
	public void keepLogin(String mem_id, String sessionId, Date next)
	{
		memberDao.keepLogin(mem_id, sessionId, next);
	}

	@Override
	public void insertMember(MemberVO vo)
	{
		memberDao.insertMember(vo);
	}

	@Override
	public void modifyMember(MemberVO vo)
	{
		memberDao.modifyMember(vo);
	}

	@Override
	public void changePic(String mem_pic, String mem_seq)
	{
		memberDao.changePic(mem_pic, mem_seq);
	}

	@Override
	public int checkID(String mem_id) throws Exception
	{

		return memberDao.checkID(mem_id);
	}


	@Override
	public MemberVO checkMember(String value)
	{

		return memberDao.checkMember(value);
	}

	@Override
	public List<MemberVO> recommend(int mem_seq) throws Exception
	{

		return memberDao.recommend(mem_seq);
	}

	@Override
	public String getFollower(int mem_seq) throws Exception
	{

		return memberDao.getFollower(mem_seq);
	}

	@Override
	public String getFollowing(int mem_seq) throws Exception
	{

		return memberDao.getFollowing(mem_seq);
	}

	@Override
	public List<String> getID(String mem_email) throws Exception
	{

		return memberDao.getID(mem_email);
	}

	@Override
	public void changePwd(String mem_pwd, String mem_id) throws Exception
	{
		memberDao.changePwd(mem_pwd, mem_id);
	}

	@Override
	public void updateMemPic(String mem_pic, String mem_id) throws Exception
	{
		memberDao.updateMemPic(mem_pic, mem_id);
	}

	@Override
	public MemberVO getView(String mem_id)
	{

		return memberDao.getView(mem_id);
	}

	@Override
	public void updateMyInfo(MemberVO vo) throws Exception
	{
		memberDao.updateMyInfo(vo);
	}

}
