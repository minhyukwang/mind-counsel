package com.minhyuk.app.dao;

import java.util.List;

import com.minhyuk.app.vo.ChatVO;
import com.minhyuk.app.vo.MsgVO;

public interface ChatDao {

	public void insertChatRoom(ChatVO vo);
	public void insertMsg(MsgVO vo);

	public void createRoom(ChatVO vo);
	public ChatVO isRoom(ChatVO vo);
	// public String getPartner(ChatVO vo);
	public String getProfile(String str);
	public String getName(String str);
	public List<MsgVO> getMessageList(String str);
	public List<ChatVO> getRoomList(String str);
	public List<ChatVO> getRoomList2(String str);
	public MsgVO getRecentMessage(String str);
	//public String isGetMessageList(String str);

	public String getTutorId(String str);
	public List<ChatVO> getRoomListTutor(String str);
	public void updateReadTime(int class_id , String user_id , String TUTOR_USER_user_id);
	public void updateReadTimeTutor(int class_id , String user_id , String TUTOR_USER_user_id);

	public int getUnReadCount(String TUTOR_USER_user_id, int class_id, String user_id);
	public int getUnReadCountTutor(String TUTOR_USER_user_id, int class_id, String user_id);

	public int getAllCount(String str);

}