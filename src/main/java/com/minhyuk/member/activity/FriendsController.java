package com.minhyuk.member.activity;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.minhyuk.common.constants.CodeValueConstants;
import com.minhyuk.member.sf.FriendsService;
import com.minhyuk.member.vo.FriendsVO;


/**
 * @author Minhyuk
 * 친구 관리 Control Class
 * 팔로우, 친구차단 기능을 가진 클래스이다
 * 2019. 7. 24.
 */
@Controller
@RequestMapping("/friends/*")
public class FriendsController implements CodeValueConstants{

	@Autowired
	private FriendsService service;


	@RequestMapping(value = "/checkFriend", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Boolean> checkFriend(@RequestParam("mem_id") String mem_id,
												@RequestParam("friend_id") String friend_id) throws Exception
	{
		HashMap<String, String> param = new HashMap<>();
		HashMap<String, Boolean> result = new HashMap<>();
		param.put("mem_id", mem_id);
		param.put("friend_id", friend_id);
		int checkFollow = service.checkFollow(param);
		int checkBlock = service.checkBlock(param);
		if(checkFollow>0)
			result.put("checkFollow", true);
		else
			result.put("checkFollow", false);
		if(checkBlock>0)
			result.put("checkBlock", true);
		else
			result.put("checkBlock", false);
		return result;
	}

	@RequestMapping(value = "/doFollow", method = RequestMethod.POST)
	@ResponseBody
	public void doFollow(@RequestParam("mem_id") String memId, @RequestParam("friend_id") String friend_id
						,@RequestParam("flag") String flag) throws Exception
	{

		HashMap<String, String> map = new HashMap<>();
		map.put("mem_id", memId);
		map.put("friend_id", friend_id);
		if(flag.equals("following"))
			service.undoFollow(map);
		else{
			service.undoFollow(map);
			service.doFollow(map);
		}
	}

	@RequestMapping(value = "/doBlock", method = RequestMethod.POST)
	@ResponseBody
	public void doBlock(@RequestParam("mem_id") String memId, @RequestParam("friend_id") String friend_id
						,@RequestParam("flag") String flag) throws Exception
	{
		HashMap<String, String> map = new HashMap<>();
		map.put("mem_id", memId);
		map.put("friend_id", friend_id);
		if(flag.equals("block")) {
			service.undoFollow(map);
			service.doBlock(map);
		}
		else
			service.undoFollow(map);

	}

	@RequestMapping(value = "/getFollowerList", method = RequestMethod.POST)
	@ResponseBody
	public List<FriendsVO> getFollowerListPOST(@RequestParam("mem_id") String memId) throws Exception
	{
		List<FriendsVO> followers = service.getFollowerList(memId);
		return followers;
	}
	@RequestMapping(value = "/getFollowingList", method = RequestMethod.POST)
	@ResponseBody
	public List<FriendsVO> getFollowingListPOST(@RequestParam("mem_id") String memId) throws Exception
	{
		List<FriendsVO> followings = service.getFollowingList(memId);
		return followings;
	}
	@RequestMapping(value = "/getBlockList", method = RequestMethod.POST)
	@ResponseBody
	public List<FriendsVO> getBlockListPOST(@RequestParam("mem_id") String memId) throws Exception
	{
		List<FriendsVO> blockList = service.getBlockList(memId);
		return blockList;
	}
}
