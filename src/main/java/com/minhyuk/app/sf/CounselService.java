package com.minhyuk.app.sf;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import com.minhyuk.app.vo.ChatVO;
import com.minhyuk.app.vo.CounselCourseVO;
import com.minhyuk.app.vo.CounselVO;
import com.minhyuk.app.vo.MsgVO;
import com.minhyuk.app.vo.NoteVO;
import com.minhyuk.app.vo.PayInfoVO;
import com.minhyuk.app.vo.SelfCheckAnsVO;
import com.minhyuk.app.vo.SelfCheckQuVO;
import com.minhyuk.app.vo.SelfCheckReVO;
import com.minhyuk.app.vo.SelfCheckVO;

/**
 * 상담 관련 service interface
 */
public interface CounselService
{
	public void updateConsCompYn(int cons_seq ) throws Exception;
	public List<MsgVO> getChatRecord(int chatSeq ) throws Exception;
	public void insertCounsel(CounselVO counselVo) throws Exception;
	public CounselCourseVO getCourseInfo(String courseId) throws Exception;
	public int getChatSeq(int cons_seq) throws Exception;
	public List<CounselCourseVO> getCourseList() throws Exception;
	public List<CounselVO> getCounselList(Map<String,String> map) throws Exception;
	public List<NoteVO> getSendNoteList(Map<String,String> map) throws Exception;
	public void insertNote(NoteVO noteVo) throws Exception;
	public void modifyNoteConfirm(int note_seq) throws Exception;
	public NoteVO getNoteContent(int note_seq) throws Exception;
	public void insertCounselPlan(String created_id, String mem_id) throws Exception;
	public void updateCounsel(CounselVO counselVo) throws Exception;
	public int hasCounsel(String mem_id) throws Exception;
	public int hasChatRoom(int chat_seq) throws Exception;
	public void insertChatRoom(ChatVO chRoomVo) throws Exception;
	public void updateChatSeq(CounselVO couselVo) throws Exception;
	public void insertSuccessNotePay(PayInfoVO payInfo) throws Exception;
	public void insertCounselPayInfo(PayInfoVO payInfo) throws Exception;
	public void updateSuccessCounselPay(PayInfoVO payInfo) throws Exception;
	public void updateSuccessCounsMgt(PayInfoVO payInfo) throws Exception;
	public int getCounselPaySeq(String mem_id) throws Exception;
	public PayInfoVO getCounselPayInfo(Map<String,Object> map) throws Exception;
	public void updateRefundPayInfo(Map<String,Object> map) throws Exception;
	public void updateRefundCounsel(Map<String,Object> map) throws Exception;
	public List<CounselVO> getRefundCounselList(int pay_seq) throws Exception;

	public SelfCheckVO getSelfCheck(String checkId) throws Exception;
	public List<SelfCheckAnsVO> getSelfCheckAnsList(String checkId) throws Exception;
	public List<SelfCheckQuVO> getSelfCheckQuList(String checkId) throws Exception;
	public void saveSelfCheckResult(SelfCheckReVO reVo) throws Exception;
	public SelfCheckVO getSelfCheckAppr(String checkId) throws Exception;
}
