package com.minhyuk.app.activity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.inject.Inject;

import com.minhyuk.member.vo.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.minhyuk.app.dao.ChatDao;
import com.minhyuk.app.vo.MsgVO;

public class ChatWebSocketHandler extends TextWebSocketHandler {

	@Inject
	private ChatDao dao;
	private static Logger logger = LoggerFactory.getLogger(ChatWebSocketHandler.class);
	private List<WebSocketSession> connectedUsers;
	public ChatWebSocketHandler() {
		connectedUsers = new ArrayList<WebSocketSession>();
	}

	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		log(session.getId() + " 연결 됨!!");
		users.put(session.getId(), session);
		connectedUsers.add(session);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log(session.getId() + " 연결 종료됨");
		connectedUsers.remove(session);
		users.remove(session.getId());

	}

	// 클라이언트가 서버로 메시지를 전송했을 때 실행되는 메서드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
		Map<String, Object> map = null;
		MsgVO msgVo = MsgVO.convertMessage(message.getPayload());
		/*
		ChatVO chVO = new ChatVO();
		ChatVO chVO2 = new ChatVO();
		if (!msgVo.getMem_id().equals(msgVo.getTutor_mem_id())) {
			System.out.println("!msgVo.getMem_id().equals(msgVo.getTutor_mem_id()");
			if (dao.isRoom(chVO) == null) {
				System.out.println("dao.isRoom(chVO) == null");
				dao.createRoom(chVO);
			}else {
				System.out.println("dao.isRoom(chVO) != null");
				chVO2 = dao.isRoom(chVO2);
			}
		}else {
			chVO = dao.isRoom(chVO);
		}
		if (chVO2.getMem_id().equals(msgVo.getMem_id())) {
			msgVo.setTutor_mem_id(chVO.getTutor_mem_id());
		} else {
			msgVo.setTutor_mem_id(chVO.getMem_id());
		}
		*/

		for (WebSocketSession websocketSession : connectedUsers) {
			map = websocketSession.getAttributes();
	        MemberVO login = (MemberVO) map.get("login");
			// 받는사람
	        System.out.println("login.getMem_id(): "+login.getMem_id()+", msgVo.getMem_id(): "+msgVo.getMem_id());
	        Gson gson = new Gson();
	        String msgJson = gson.toJson(msgVo);
	        websocketSession.sendMessage(new TextMessage(msgJson));
	        if (login.getMem_id().equals(msgVo.getMem_id())) {
			dao.insertMsg(msgVo);
	        }
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());

	}
	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}
}