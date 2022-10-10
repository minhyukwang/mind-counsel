package com.minhyuk.app.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.minhyuk.app.vo.ChatVO;
import com.minhyuk.app.vo.MsgVO;



@Repository
public class ChatDaoImpl implements ChatDao{

	@Inject
	private SqlSessionTemplate sm;

	private static String namespace = "Chat";

	@Override
	public void insertMsg(MsgVO vo){
		// TODO Auto-generated method stub

		sm.insert(namespace+".insertMsg" , vo);
	}
	@Override
	public void insertChatRoom(ChatVO vo){
		// TODO Auto-generated method stub
		sm.insert(namespace+".insertChatRoom" , vo);
	}

	@Override
	public void createRoom(ChatVO vo){
		// TODO Auto-generated method stub
		sm.insert(namespace+".createRoom" , vo);
	}

	@Override
	public ChatVO isRoom(ChatVO vo){
		// TODO Auto-generated method stub

		ChatVO roomvo = null;
		roomvo = sm.selectOne(namespace+".isRoom", vo);
		System.out.println("ss");
		System.out.println(roomvo);

		return roomvo;
	}






	/*@Override
	public String getPartner(ChatVO vo){
		// TODO Auto-generated method stub

		List<MsgVO> mvo = sm.selectList(namespace+".getPartner", vo);

		return mvo.get(0).getUSER_user_id();
	}*/



	@Override
	public String getProfile(String str){
		// TODO Auto-generated method stub
		return sm.selectOne(namespace+".getProfile" , str);
	}



	@Override
	public String getName(String str){
		// TODO Auto-generated method stub
		return sm.selectOne(namespace+".getName" , str);
	}



	@Override
	public List<MsgVO> getMessageList(String str){
		// TODO Auto-generated method stub

			return sm.selectList(namespace+".getMessageList" , str);


	}



	@Override
	public List<ChatVO> getRoomList(String str){
		// TODO Auto-generated method stub
		return sm.selectList(namespace+".getRoomList",str);
	}



	@Override
	public List<ChatVO> getRoomList2(String str){
		// TODO Auto-generated method stub
		return sm.selectList(namespace+".getRoomList2" , str);
	}



	@Override
	public MsgVO getRecentMessage(String str){
		// TODO Auto-generated method stub
		return sm.selectOne(namespace+".getRecentMessage" , str);
	}



	@Override
	public String getTutorId(String str){
		// TODO Auto-generated method stub
		return sm.selectOne(namespace+".getTutorId" , str) ;
	}



	@Override
	public List<ChatVO> getRoomListTutor(String str){
		// TODO Auto-generated method stub
		return sm.selectList(namespace+".getRoomListTutor" , str);
	}



	@Override
	public void updateReadTime(int class_id, String user_id, String TUTOR_USER_user_id){
		// TODO Auto-generated method stub

		HashMap<String, Object> map = new HashMap<String, Object> ();

		map.put("TUTOR_USER_user_id", TUTOR_USER_user_id);
		map.put("USER_user_id", user_id);
		map.put("CLASS_class_id", class_id);
		sm.update(namespace+".updateReadTime" , map);
	}



	@Override
	public int getUnReadCount(String TUTOR_USER_user_id, int class_id, String user_id){
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object> ();

		map.put("TUTOR_USER_user_id", TUTOR_USER_user_id);
		map.put("USER_user_id", user_id);
		map.put("CLASS_class_id", class_id);


		return sm.selectOne(namespace+".getUnReadCount" , map);
	}



	@Override
	public int getAllCount(String str) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object> ();

		map.put("USER_user_id", str);
		map.put("TUTOR_USER_user_id", str);
		if(sm.selectOne(namespace+".getAllCount" ,map) ==null) {
			return 0;
		}else {

			return sm.selectOne(namespace+".getAllCount" ,map);
		}

	}



	@Override
	public void updateReadTimeTutor(int class_id , String user_id , String TUTOR_USER_user_id){
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object> ();

		map.put("TUTOR_USER_user_id", TUTOR_USER_user_id);
		map.put("USER_user_id", user_id);
		map.put("CLASS_class_id", class_id);
		sm.update(namespace+".updateReadTimeTutor" , map);
	}



	@Override
	public int getUnReadCountTutor(String TUTOR_USER_user_id, int class_id, String user_id){
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object> ();

		map.put("TUTOR_USER_user_id", TUTOR_USER_user_id);
		map.put("USER_user_id", user_id);
		map.put("CLASS_class_id", class_id);


		return sm.selectOne(namespace+".getUnReadCountTutor" , map);
	}





}