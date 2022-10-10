package com.minhyuk.member.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.minhyuk.member.vo.FriendsVO;


/**
 * @author Minhyuk
 * 회원정보 관련 Dao 구현 class
 * 2019. 7. 15.
 */
@Repository
public class FriendsDaoImpl implements FriendsDao
{
	@Autowired
	private SqlSessionTemplate sm;

	@Override
	public int checkFollow(HashMap<String, String> param) {
		return sm.selectOne("Friends.checkFollow", param);
	}

	@Override
	public int checkBlock(HashMap<String, String> param) {
		return sm.selectOne("Friends.checkBlock", param);
	}

	@Override
	public List<FriendsVO> getFollowerList(String memId){
		return sm.selectList("Friends.selectFollowerList", memId);
	}
	@Override
	public List<FriendsVO> getFollowingList(String memId){
		return sm.selectList("Friends.selectFollowingList", memId);
	}
	@Override
	public List<FriendsVO> getBlockList(String memId){
		return sm.selectList("Friends.selectblockList", memId);
	}
	@Override
	public void doFollow(HashMap<String, String> map){
		sm.insert("Friends.insertFollow", map);
	}

	@Override
	public void undoFollow(HashMap<String, String> map) {
		sm.delete("Friends.deleteFollow", map);
	}

	@Override
	public void doBlock(HashMap<String, String> map){
		sm.insert("Friends.insertblock", map);
	}

	@Override
	public void undoBlock(HashMap<String, String> map) {
		sm.insert("Friends.updateblock", map);
	}
}
