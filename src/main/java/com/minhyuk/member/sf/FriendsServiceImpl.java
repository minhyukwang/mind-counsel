package com.minhyuk.member.sf;

import java.util.HashMap;
import java.util.List;

import com.minhyuk.member.dao.FriendsDao;
import com.minhyuk.member.vo.FriendsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Minhyuk 회원정보 관련 service 구현 class 2019. 7. 15.
 */
@Service
public class FriendsServiceImpl implements FriendsService {

	@Autowired
	private FriendsDao friendsDao;

	@Override
	public int checkFollow(HashMap<String, String> param) throws Exception{
		return friendsDao.checkFollow(param);
	}
	@Override
	public int checkBlock(HashMap<String, String> param) throws Exception{
		return friendsDao.checkBlock(param);
	}

	@Override
	public List<FriendsVO> getFollowingList(String memId) throws Exception {
		return friendsDao.getFollowingList(memId);
	}

	@Override
	public List<FriendsVO> getBlockList(String memId) throws Exception {
		return friendsDao.getBlockList(memId);
	}

	@Override
	public List<FriendsVO> getFollowerList(String memId) throws Exception {
		return friendsDao.getFollowerList(memId);
	}

	@Override
	public void doFollow(HashMap<String, String> map) throws Exception {
		friendsDao.doFollow(map);
	}

	@Override
	public void undoFollow(HashMap<String, String> map) throws Exception{
		friendsDao.undoFollow(map);
	}

	@Override
	public void doBlock(HashMap<String, String> map) throws Exception {
		friendsDao.doBlock(map);
	}
	@Override
	public void undoBlock(HashMap<String, String> map) throws Exception{
		friendsDao.undoBlock(map);
	}
}
