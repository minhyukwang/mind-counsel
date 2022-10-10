package com.minhyuk.member.sf;

import java.util.HashMap;
import java.util.List;

import com.minhyuk.member.vo.FriendsVO;

/**
 * 회원정보 관련 service interface
 */
public interface FriendsService
{
	public int checkFollow(HashMap<String, String> param) throws Exception;
	public int checkBlock(HashMap<String, String> param) throws Exception;
	public List<FriendsVO> getFollowingList(String memId) throws Exception;
	public List<FriendsVO> getBlockList(String memId) throws Exception;
	public List<FriendsVO> getFollowerList(String memId) throws Exception;
	public void doFollow(HashMap<String, String> map) throws Exception;
	public void undoFollow(HashMap<String, String> map) throws Exception;
	public void doBlock(HashMap<String, String> map) throws Exception;
	public void undoBlock(HashMap<String, String> map) throws Exception;
}
