package com.minhyuk.app.dao;

import java.util.List;
import java.util.Map;

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
 * 상담 관련 Dao Interface
 */
public interface CounselDao
{
	public void updateConsCompYn(int cons_seq );
	public List<MsgVO> getChatRecord(int chatSeq );
	public void insertCounsel(CounselVO counselVo);
	public CounselCourseVO getCourseInfo(String courseId);
	public int getChatSeq(int cons_seq);
	public List<CounselCourseVO> getCourseList();
	public List<CounselVO> getCounselList(Map<String,String> map);
	public List<NoteVO> getSendNoteList(Map<String,String> map);
	public void insertNote(NoteVO noteVo);
	public void updateCounsel(CounselVO counselVo);
	public void modifyNoteConfirm(int note_seq);
	public NoteVO getNoteContent(int note_seq);
	public void insertCounselPlan(String created_id, String mem_id);
	public int hasCounsel(String mem_id);
	public int hasChatRoom(int chat_seq);
	public void updateChatSeq(CounselVO counselVO);
	public void insertSuccessNotePay(PayInfoVO payInfo);
	public void insertCounselPayInfo(PayInfoVO payInfo);
	public void updateSuccessCounselPay(PayInfoVO payInfo);
	public void updateSuccessCounsMgt(PayInfoVO payInfo);
	public int getCounselPaySeq(String mem_id);
	public PayInfoVO getCounselPayInfo(Map<String,Object> map);
	public void updateRefundPayInfo(Map<String,Object> map);
	public void updateRefundCounsel(Map<String,Object> map);
	public List<CounselVO> getRefundCounselList(int pay_seq);

	public SelfCheckVO getSelfCheck(String checkId);
	public List<SelfCheckAnsVO> getSelfCheckAnsList(String checkId);
	public List<SelfCheckQuVO> getSelfCheckQuList(String checkId);
	public void saveSelfCheckResult(SelfCheckReVO reVo);
	public SelfCheckVO getSelfCheckAppr(String checkId);
}
