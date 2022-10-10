package com.minhyuk.app.sf;

import java.util.List;
import java.util.Map;

import com.minhyuk.app.dao.ChatDao;
import com.minhyuk.app.dao.CounselDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

@Service
/**
 * 상담 관련 service 구현 class
 */
public class CounselServiceImpl implements CounselService
{

	@Autowired
	private ChatDao chatDao;
	@Autowired
	private CounselDao counselDao;

	@Override
	public void updateConsCompYn(int cons_seq ) throws Exception{
		counselDao.updateConsCompYn(cons_seq);
	}

	@Override
	public List<MsgVO> getChatRecord(int chatSeq ) throws Exception{
		return counselDao.getChatRecord(chatSeq);
	}

	@Override
	public void insertCounsel(CounselVO counselVo) throws Exception{
		counselDao.insertCounsel(counselVo);
	}

	@Override
	public CounselCourseVO getCourseInfo(String courseId) throws Exception{
		return counselDao.getCourseInfo(courseId);
	}

	@Override
	public int getChatSeq(int cons_seq) throws Exception{
		return counselDao.getChatSeq(cons_seq);
	}

	@Override
	public List<NoteVO> getSendNoteList(Map<String,String> map) throws Exception
	{
		return counselDao.getSendNoteList(map);
	}

	@Override
	public void insertNote(NoteVO noteVo) throws Exception
	{
		counselDao.insertNote(noteVo);
	}

	@Override
	public List<CounselCourseVO> getCourseList() throws Exception
	{
		return counselDao.getCourseList();
	}

	@Override
	public List<CounselVO> getCounselList(Map<String,String> map) throws Exception
	{
		return counselDao.getCounselList(map);
	}

	@Override
	public void modifyNoteConfirm(int note_seq) throws Exception
	{
		counselDao.modifyNoteConfirm(note_seq);
	}

	@Override
	public SelfCheckVO getSelfCheck(String checkId) throws Exception {
		return counselDao.getSelfCheck(checkId);
	}

	@Override
	public List<SelfCheckAnsVO> getSelfCheckAnsList(String checkId) throws Exception {
		return counselDao.getSelfCheckAnsList(checkId);
	}

	@Override
	public List<SelfCheckQuVO> getSelfCheckQuList(String checkId) throws Exception {
		return counselDao.getSelfCheckQuList(checkId);
	}

	@Override
	public NoteVO getNoteContent(int note_seq) throws Exception
	{
		return counselDao.getNoteContent(note_seq);
	}

	@Override
	public void insertCounselPlan(String created_id, String mem_id) throws Exception
	{
		counselDao.insertCounselPlan(created_id, mem_id);
	}

	@Override
	public void updateCounsel(CounselVO counselVo) throws Exception
	{
		counselDao.updateCounsel(counselVo);
	}

	@Override
	public int hasCounsel(String mem_id) throws Exception{
		return counselDao.hasCounsel(mem_id);
	}

	@Override
	public int hasChatRoom(int chat_seq) throws Exception{
		return counselDao.hasChatRoom(chat_seq);
	}

	@Override
	public void insertChatRoom(ChatVO chRoomVo) throws Exception{
		chatDao.insertChatRoom(chRoomVo);
	}

	@Override
	public void updateChatSeq(CounselVO counselVO) throws Exception{
		counselDao.updateChatSeq(counselVO);
	}
	@Override
	public void saveSelfCheckResult(SelfCheckReVO reVo) throws Exception {
		counselDao.saveSelfCheckResult(reVo);
	}

	@Override
	public SelfCheckVO getSelfCheckAppr(String checkId) throws Exception {
		return counselDao.getSelfCheckAppr(checkId);
	}

	@Override
	public void insertSuccessNotePay(PayInfoVO payInfo) throws Exception {
		counselDao.insertSuccessNotePay(payInfo);
	}

	@Override
	public void insertCounselPayInfo(PayInfoVO payInfo) throws Exception {
		counselDao.insertCounselPayInfo(payInfo);

	}
	@Override
	public void updateSuccessCounselPay(PayInfoVO payInfo) throws Exception {
		counselDao.updateSuccessCounselPay(payInfo);

	}
	@Override
	public void updateSuccessCounsMgt(PayInfoVO payInfo) throws Exception {
		counselDao.updateSuccessCounsMgt(payInfo);

	}

	@Override
	public int getCounselPaySeq(String mem_id) throws Exception {
		return counselDao.getCounselPaySeq(mem_id);
	}

	@Override
	public PayInfoVO getCounselPayInfo(Map<String, Object> map) throws Exception {
		return counselDao.getCounselPayInfo(map);
	}

	@Override
	public void updateRefundPayInfo(Map<String,Object> map) throws Exception {
		counselDao.updateRefundPayInfo(map);
	}

	@Override
	public void updateRefundCounsel(Map<String,Object> map) throws Exception {
		counselDao.updateRefundCounsel(map);
	}

	@Override
	public List<CounselVO> getRefundCounselList(int pay_seq) throws Exception {
		return counselDao.getRefundCounselList(pay_seq);
	}
}
