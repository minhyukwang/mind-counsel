package com.minhyuk.member.dao;

import java.util.HashMap;
import java.util.List;

import com.minhyuk.member.vo.FriendsVO;

/**
 * 회원정보 관련 Dao Interface
 */
public interface FriendsDao
{
	public int checkFollow(HashMap<String, String> param);
	public int checkBlock(HashMap<String, String> param);
	public List<FriendsVO> getFollowerList(String memId);
	public List<FriendsVO> getFollowingList(String memId);
	public List<FriendsVO> getBlockList(String memId);
	public void doFollow(HashMap<String, String> map);
	public void undoFollow(HashMap<String, String> map);
	public void doBlock(HashMap<String, String> map);
	public void undoBlock(HashMap<String, String> map);
}
