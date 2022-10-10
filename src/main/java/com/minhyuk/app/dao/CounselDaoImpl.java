package com.minhyuk.app.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
 * 상담 관련 Dao 구현 class
 */
@Repository
public class CounselDaoImpl implements CounselDao
{

	@Autowired
	private SqlSessionTemplate sm;

	@Override
	public void updateConsCompYn(int cons_seq ){
		sm.update("Counsel.updateConsCompYn", cons_seq);
	}

	@Override
	public List<MsgVO> getChatRecord(int chatSeq ){
		return sm.selectList("Chat.selectChatRecord", chatSeq);
	}

	@Override
	public void insertCounsel(CounselVO counselVo) {
		sm.insert("Counsel.insertCounsel",counselVo);
	}

	@Override
	public CounselCourseVO getCourseInfo(String courseId) {
		return sm.selectOne("Counsel.selectCounselCourse", courseId);
	}

	@Override
	public int getChatSeq(int cons_seq) {
		return sm.selectOne("Counsel.selectChatSeq", cons_seq);
	}
	@Override
	public void insertNote(NoteVO vo)
	{
		sm.insert("Note.insertNote",vo);
	}

	@Override
	public NoteVO getNoteContent(int note_seq)
	{
		return sm.selectOne("Note.selectNote", note_seq);
	}

	@Override
	public List<NoteVO> getSendNoteList(Map<String, String> map)
	{
		return sm.selectList("Note.selectNoteList", map);
	}

	@Override
	public void modifyNoteConfirm(int note_seq)
	{
		sm.update("Note.updateNoteConfirm", note_seq);
	}

	@Override
	public List<CounselCourseVO> getCourseList()
	{
		return sm.selectList("Counsel.selectCourseList");
	}

	@Override
	public List<CounselVO> getCounselList(Map<String,String> map)
	{
		return sm.selectList("Counsel.selectCounselList", map);
	}

	@Override
	public List<SelfCheckAnsVO> getSelfCheckAnsList(String checkId) {
		return sm.selectList("Counsel.selectSelfCheckAnsList", checkId);
	}

	@Override
	public List<SelfCheckQuVO> getSelfCheckQuList(String checkId) {
		return sm.selectList("Counsel.selectSelfCheckQuList", checkId);
	}

	@Override
	public SelfCheckVO getSelfCheck(String checkId) {
		return sm.selectOne("Counsel.selectSelfCheck", checkId);
	}

	@Override
	public void insertCounselPlan(String created_id,  String mem_id)
	{
		HashMap<String, String> map = new HashMap();
		map.put("created_id", created_id);
		map.put("mem_id", mem_id);
		sm.insert("Counsel.insertCounselPlan", map);
	}

	@Override
	public void updateCounsel(CounselVO counselVo)
	{
		System.out.println(counselVo.getCons_seq());
		sm.insert("Counsel.updateCounsel", counselVo);
	}

	@Override
	public int hasCounsel(String mem_id){
		return sm.selectOne("Counsel.selectCounsel", mem_id);
	}
	@Override
	public void saveSelfCheckResult(SelfCheckReVO reVo) {
		sm.insert("Counsel.insertSelfCheckRe", reVo);
	}

	@Override
	public SelfCheckVO getSelfCheckAppr(String checkId) {
		return sm.selectOne("Counsel.selectSelfCheckAppr", checkId);
	}

	@Override
	public int hasChatRoom(int chat_seq)
	{
		System.out.println(chat_seq);
		return sm.selectOne("Chat.hasChatRoom",chat_seq);
	}

	@Override
	public void updateChatSeq(CounselVO couselVo) {
		sm.insert("Counsel.updateChatSeq",couselVo);
	}

	@Override
	public void insertSuccessNotePay(PayInfoVO payInfo) {
		sm.insert("Counsel.insertSuccessNotePay",payInfo);
	}

	@Override
	public void insertCounselPayInfo(PayInfoVO payInfo) {
		sm.insert("Counsel.insertCounselPayInfo",payInfo);

	}
	@Override
	public void updateSuccessCounselPay(PayInfoVO payInfo) {
		sm.update("Counsel.updateSuccessCounselPay",payInfo);

	}
	@Override
	public void updateSuccessCounsMgt(PayInfoVO payInfo) {
		sm.update("Counsel.updateSuccessCounsMgt",payInfo);

	}

	@Override
	public int getCounselPaySeq(String mem_id) {
		return sm.selectOne("Counsel.selectCounselPaySeq",mem_id);

	}

	@Override
	public PayInfoVO getCounselPayInfo(Map<String, Object> map) {
		return sm.selectOne("Counsel.selectCounselPayInfo",map);
	}

	@Override
	public void updateRefundPayInfo(Map<String,Object> map) {
		sm.update("Counsel.updateRefundPayInfo",map);
	}

	@Override
	public void updateRefundCounsel(Map<String,Object> map) {
		sm.update("Counsel.updateRefundCounsel",map);
	}

	@Override
	public List<CounselVO> getRefundCounselList(int pay_seq) {
		return sm.selectList("Counsel.selectRefundCounselList", pay_seq);
	}
}
