package com.minhyuk.app.activity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.minhyuk.common.constants.CodeValueConstants;
import com.minhyuk.member.vo.MemberVO;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.minhyuk.app.sf.CounselService;
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
 * 상담 관련 Control class
 */

@Controller
@RequestMapping("/counsel/*")
public class CounselController implements CodeValueConstants
{
	@Autowired
	private CounselService counselService;
	private MemberVO memberVO;


	/*상담완료처리*/
	@RequestMapping(value = "/completeCounsel", method = RequestMethod.POST)
	@ResponseBody
	public void completeCounsel(@RequestParam("cons_seq") int cons_seq ) throws Exception
	{
		counselService.updateConsCompYn(cons_seq);
	}

	/*chatSeq 가져오기*/
	@RequestMapping(value = "/getChatSeq", method = RequestMethod.POST)
	@ResponseBody
	public int getChatSeq(@RequestParam("cons_seq") int cons_seq ) throws Exception
	{
		int chatSeq = counselService.getChatSeq(cons_seq);
		return chatSeq;
	}

	/*채팅내역 가져오기*/
	@RequestMapping(value = "/getChatRecord", method = RequestMethod.POST)
	@ResponseBody
	public List<MsgVO> getChatRecord(@RequestParam("chat_seq") int chat_seq ) throws Exception
	{
		List<MsgVO> chatRecord = counselService.getChatRecord(chat_seq);
		return chatRecord;
	}

	/*
	 * Note(메세지) 관련 메서드
	 */
	@RequestMapping(value = "/getSendNoteList", method = RequestMethod.POST)
	@ResponseBody
	public List<NoteVO> sendNoteListPOST(@ModelAttribute("dto") MemberVO vo,@RequestParam("flag") String flag ) throws Exception
	{
		String memId=vo.getMem_id();
		Map<String, String> map=new HashMap<String, String>();
		map.put("mem_id", memId);
		map.put("flag", flag);
		List<NoteVO> titleList = counselService.getSendNoteList(map);
		return titleList;
	}

	@RequestMapping(value = "/mngNote", method = RequestMethod.GET)
	public void mngNote(HttpSession session){
		Object obj = session.getAttribute(LOGIN);
		memberVO = (MemberVO) obj;
	}

	/**
	 * <pre>
	 * 1. 개요: 쪽지보내기
	 * 2. 처리내용: 관리자에게 쪽지를 보내는 메소드이다.
	 *
	 * </pre>
	 * @Method Name: sendNotePOST
	 * @param vo
	 * @param session
	 */
	@RequestMapping(value = "/mngNote", method = RequestMethod.POST)
	public String sendNotePOST(NoteVO vo, HttpSession session) {
		memberVO = (MemberVO) session.getAttribute(LOGIN);
		vo.setSend_mem_id(memberVO.getMem_id());
		try {
			counselService.insertNote(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/counsel/mngNote";
	}

	/**
	 * <pre>
	 * 1. 개요: Note
	 * 2. 처리내용: 쪽지 읽음처리
	 */
	@RequestMapping(value = "/noteContents", method = RequestMethod.GET)
	public void noteContentsGET(@RequestParam("note_seq") int note_seq, @RequestParam("mem_id") String mem_id,
			@RequestParam("mem_name") String mem_name, @RequestParam("co_type") String co_type) throws Exception
	{
		if (mem_id.equals(memberVO.getMem_id()))
			return;
		else
			counselService.modifyNoteConfirm(note_seq);
	}

	@RequestMapping(value = "/getNoteContents",  method = RequestMethod.POST)
	@ResponseBody
	public NoteVO getNoteContents(@RequestParam("note_seq") int note_seq) throws Exception
	{
		return counselService.getNoteContent(note_seq);
	}


/*	@RequestMapping(value = "/sendNote", method = RequestMethod.GET)
	public void sendNote(){}
*/
	@RequestMapping(value = "/sendNote", method = RequestMethod.POST)
	@ResponseBody
	public void sendNotePOST(@RequestParam("note_title") String note_title, @RequestParam("send_mem_id") String send_mem_id,
			@RequestParam("reci_mem_id") String reci_mem_id, @RequestParam("note_contents") String note_contents, @RequestParam("co_type") String co_type) {
		NoteVO vo = new NoteVO();
		vo.setNote_title(note_title);
		vo.setNote_contents(note_contents);
		vo.setSend_mem_id(send_mem_id);
		vo.setReci_mem_id(reci_mem_id);
		vo.setCo_type(co_type);
		try {
			counselService.insertNote(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/*
	 * 자가진단 관련 메소드
	*/
	@RequestMapping(value = "/selfCheck", method = RequestMethod.GET)
	public void selfCheckGET()
	{

	}

	/*
	 * 자가진단 관련 메소드
	*/
	@RequestMapping(value = "/selfCheckResult", method = RequestMethod.GET)
	public void selfCheckResultGET()
	{

	}

/*
	@RequestMapping(value = "/selfCheckDetail", method = RequestMethod.GET)
	public void selfCheckDetailGET()
	{
	}*/

	@RequestMapping(value = "/selfCheckDetail", method = RequestMethod.GET)
	public void selfCheckDetailGET(String tdId)
	{
		//System.out.println("tdId : "+ tdId);
		//return "redirect:/counsel/selfCheckDetail";
	}

	/**
	 * 자가진단 내용 불러오기
	 * @param checkId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getSelfCheckDetail", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selfCheckDetailPOST(@RequestParam("checkId") String checkId) throws Exception
	{
		Map<String, Object> map = new HashMap<String, Object>();
		SelfCheckVO selfCheckVo = counselService.getSelfCheck(checkId);
		List<SelfCheckAnsVO> selfCheckAnsVoList = counselService.getSelfCheckAnsList(checkId);
		List<SelfCheckQuVO> selfCheckQuVoList = counselService.getSelfCheckQuList(checkId);
		map.put("selfCheck", selfCheckVo);
		map.put("selfCheckAns", selfCheckAnsVoList);
		map.put("selfCheckQu", selfCheckQuVoList);
		map.put("selfCheckCnt", selfCheckQuVoList.size());
		map.put(DATA_YN, FLAG_Y);

		return map;
	}

	/**
	 * 자가진단 결과 저장
	 * @param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/writeSelfCheck", method = RequestMethod.POST)
	public String writeSelfCheckPOST(HttpServletRequest request, HttpSession session) throws Exception
	{
		SelfCheckReVO reVo = new SelfCheckReVO();
		MemberVO memberVO = (MemberVO) session.getAttribute(LOGIN);
		reVo.setCreated_id(memberVO.getMem_id());
		reVo.setMem_id(memberVO.getMem_id());
		reVo.setLast_up_id(memberVO.getMem_id());
		reVo.setCheck_id(request.getParameter("checkId"));

		reVo.setRe1(request.getParameter("ans0re0")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans0re0")));
		reVo.setRe2(request.getParameter("ans1re1")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans1re1")));
		reVo.setRe3(request.getParameter("ans2re2")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans2re2")));
		reVo.setRe4(request.getParameter("ans3re3")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans3re3")));
		reVo.setRe5(request.getParameter("ans4re4")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans4re4")));
		reVo.setRe6(request.getParameter("ans5re5")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans5re5")));
		reVo.setRe7(request.getParameter("ans6re6")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans6re6")));
		reVo.setRe8(request.getParameter("ans7re7")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans7re7")));
		reVo.setRe9(request.getParameter("ans8re8")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans8re8")));
		reVo.setRe9(request.getParameter("ans9re9")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans9re9")));
		reVo.setRe10(request.getParameter("ans10re10")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans10re10")));
		reVo.setRe11(request.getParameter("ans11re11")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans11re11")));
		reVo.setRe12(request.getParameter("ans12re12")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans12re12")));
		reVo.setRe13(request.getParameter("ans13re13")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans13re13")));
		reVo.setRe14(request.getParameter("ans14re14")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans14re14")));
		reVo.setRe15(request.getParameter("ans15re15")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans15re15")));
		reVo.setRe16(request.getParameter("ans16re16")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans16re16")));
		reVo.setRe17(request.getParameter("ans17re17")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans17re17")));
		reVo.setRe18(request.getParameter("ans18re18")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans18re18")));
		reVo.setRe19(request.getParameter("ans19re19")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans19re19")));
		reVo.setRe21(request.getParameter("ans20re20")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans20re20")));
		reVo.setRe22(request.getParameter("ans21re21")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans21re21")));
		reVo.setRe23(request.getParameter("ans22re22")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans22re22")));
		reVo.setRe24(request.getParameter("ans23re23")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans23re23")));
		reVo.setRe25(request.getParameter("ans24re24")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans24re24")));
		reVo.setRe26(request.getParameter("ans25re25")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans25re25")));
		reVo.setRe27(request.getParameter("ans26re26")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans26re26")));
		reVo.setRe28(request.getParameter("ans27re27")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans27re27")));
		reVo.setRe29(request.getParameter("ans28re28")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans28re28")));
		reVo.setRe30(request.getParameter("ans29re29")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans29re29")));
		reVo.setRe32(request.getParameter("ans30re30")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans30re30")));
		reVo.setRe33(request.getParameter("ans31re31")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans31re31")));
		reVo.setRe34(request.getParameter("ans32re32")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans32re32")));
		reVo.setRe35(request.getParameter("ans33re33")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans33re33")));
		reVo.setRe36(request.getParameter("ans34re34")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans34re34")));
		reVo.setRe37(request.getParameter("ans35re35")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans35re35")));
		reVo.setRe38(request.getParameter("ans36re36")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans36re36")));
		reVo.setRe39(request.getParameter("ans37re37")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans37re37")));
		reVo.setRe40(request.getParameter("ans38re38")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans38re38")));
		reVo.setRe40(request.getParameter("ans39re39")==null ? Integer.parseInt("0") : Integer.parseInt(request.getParameter("ans39re39")));

		int sum = 0;
		int last = Integer.parseInt(request.getParameter("lastAns"));
		for( int i = 0; i <= last; i++ )
		{
			sum += Integer.parseInt(request.getParameter("ans"+i+"re"+i));
		}

		reVo.setRe_score(sum);

		counselService.saveSelfCheckResult(reVo);
		return "redirect:/counsel/selfCheckResult?check_id="+reVo.getCheck_id()+"&score="+sum;
	}

	/**
	 * 자가진단 결과평가 불러오기
	 * @param checkId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getSelfCheckAppr", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selfCheckApprPOST(@RequestParam("checkId") String checkId) throws Exception
	{
		Map<String, Object> map = new HashMap<String, Object>();
		SelfCheckVO selfCheckVo = counselService.getSelfCheckAppr(checkId);

		map.put("selfCheck", selfCheckVo);
		map.put(DATA_YN, FLAG_Y);
		return map;
		}
	/*
	 * 상담관리 관련 메소드
	 */
	@RequestMapping(value = "/mngCounsel", method = RequestMethod.GET)
	public void mngCounsel(){}

	@RequestMapping(value = "/regCounsel", method = RequestMethod.GET)
	public void regCounsel(){}

	@RequestMapping(value = "/getCourseList", method = RequestMethod.POST)
	@ResponseBody
	public List<CounselCourseVO> courseList() throws Exception
	{
		List<CounselCourseVO> titleList = counselService.getCourseList();
		return titleList;
	}

	@RequestMapping(value = "/getCounselList", method = RequestMethod.POST)
	@ResponseBody
	public List<CounselVO> counselListPOST(@RequestParam("auth") String auth, @RequestParam("mem_id") String mem_id) throws Exception
	{
		Map<String, String> map = new HashMap<String, String>();
		map.put("auth",auth);
		map.put("mem_id",mem_id);
		List<CounselVO> titleList = counselService.getCounselList(map);
//		System.out.println(titleList.get(1).getCons_seq());
		return titleList;
	}
	/**
	 * <pre>
	 * 1. 개요: 상담을 등록한다
	 * 2. 처리내용: 상담을 등록하는 메소드이다.
	 *
	 * </pre>
	 * @Method Name: insertCounsel
	 * @param vo
	 * @param session
	 */
	@RequestMapping(value = "/mngCounsel", method = RequestMethod.POST)
	public String insertCounsel(CounselVO counselVo, HttpSession session)
	{
		try {
			String courseId = counselVo.getCons_course_id();
			memberVO = (MemberVO) session.getAttribute(LOGIN);
			counselVo.setCreated_id(memberVO.getMem_id());
			counselVo.setLast_up_id(memberVO.getMem_id());
			if(counselVo.getCons_timestamp()=="")
			{
				CounselCourseVO courseVO = counselService.getCourseInfo(courseId);
				int totalConsNum = courseVO.getTotal_cons_num();

				/* 결제 관련 추가 */
				PayInfoVO payInfoVo = new PayInfoVO();
				payInfoVo.setManager_id(memberVO.getMem_id());
				payInfoVo.setMem_id(counselVo.getMem_id());
				payInfoVo.setPaid_amount(courseVO.getPrice());
				counselService.insertCounselPayInfo(payInfoVo);
				int pay_seq = counselService.getCounselPaySeq(counselVo.getMem_id());
				counselVo.setCons_pay_seq(pay_seq);

				System.out.println(courseVO.getCons_course_nm()+","+courseVO.getTotal_cons_num());
				int cons_num=1;
				for (int i=0; i<totalConsNum; i++)
				{
					if(i==0)
					{
						counselVo.setCons_num(cons_num);
						counselService.updateCounsel(counselVo);
					}else
					{
						counselVo.setCons_num(cons_num);
						counselService.insertCounsel(counselVo);
					}
					cons_num++;
				}
			}else {
				counselService.updateCounsel(counselVo);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/counsel/mngCounsel";
	}
	/**
	 * <pre>
	 * 1. 개요: 상담등록예정을 등록하는 메서드이다.
	 * 2. 처리내용:
	 *
	 * </pre>
	 * @Method Name: regCounelPlan
	 */
	@RequestMapping(value = "/regCounelPlan", method = RequestMethod.POST)
	@ResponseBody
	public void regCounelPlan(@RequestParam("created_id") String created_id, @RequestParam("mem_id") String mem_id) throws Exception {
		/*if(counselService.hasCounsel(mem_id)==0) {
		counselService.insertCounselPlan(mem_id);
		return "success";
		}else
		return "already register.";*/
		counselService.insertCounselPlan(created_id, mem_id);
	}

	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public void chat(){}



	/**
	 * <pre>
	 * 1. 개요: 채팅방생성
	 * 2. 처리내용: 상담시작을 클릭하면 채팅방이 생성된다.
	 *
	 * </pre>
	 * @Method Name: regChatRoom
	 * @param created_id
	 * @param chat_topic
	 * @param chat_seq
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/regChatRoom", method = RequestMethod.POST)
	@ResponseBody
	public int regChatRoom(@RequestParam("created_id") String created_id,
							@RequestParam("chat_topic") String chat_topic,
							@RequestParam("chat_seq") int chat_seq,
							@RequestParam("cons_seq") int cons_seq) throws Exception
	{
		ChatVO chRoom = new ChatVO();
		CounselVO counselVo = new CounselVO();
		counselVo.setCons_seq(cons_seq);
		counselVo.setChat_seq(chat_seq);
		chRoom.setCons_seq(cons_seq);
		chRoom.setChat_topic(chat_topic);
		chRoom.setCreated_id(created_id);
		chRoom.setMem_id(created_id);
		chRoom.setTutor_mem_id(chat_topic);
		if(counselService.hasChatRoom(chat_seq)==0)
		{
			counselService.insertChatRoom(chRoom);
		}
		else
		{
			counselService.updateChatSeq(counselVo);
		}
		chat_seq = counselService.getChatSeq(cons_seq);
		return  chat_seq;
	}

	/**
	 * <pre>
	 * 1. 개요: 유료쪽지 결제 완료 정보를 등록하는 메서드이다.
	 * 2. 처리내용:
	 *
	 * </pre>
	 * @Method Name: writeSuccessNotePay
	 */
	@RequestMapping(value = "/writeSuccessNotePay", method = RequestMethod.POST)
	@ResponseBody
	public void writeSuccessNotePay(HttpSession session,
									@RequestParam("pg") String pg,
									@RequestParam("pay_method") String pay_method,
									@RequestParam("imp_uid") String imp_uid,
									@RequestParam("merchant_uid") String merchant_uid,
									@RequestParam("paid_amount") String paid_amount,
									@RequestParam("apply_num") String apply_num,
									@RequestParam("verif_comp_yn") String verif_comp_yn,
									@RequestParam("manager_id") String manager_id
									) throws Exception {
		MemberVO memberVO = (MemberVO) session.getAttribute(LOGIN);
		PayInfoVO payInfo = new PayInfoVO();
		payInfo.setPg(pg);
		payInfo.setPay_method(pay_method);
		payInfo.setImp_uid(imp_uid);
		payInfo.setMerchant_uid(merchant_uid);
		payInfo.setPaid_amount(paid_amount);
		payInfo.setApply_num(apply_num);
		payInfo.setVerif_comp_yn(verif_comp_yn);
		payInfo.setManager_id(manager_id);
		payInfo.setMem_id(memberVO.getMem_id());
		counselService.insertSuccessNotePay(payInfo);
	}

	/**
	 * <pre>
	 * 1. 개요: 유료쪽지 결제 완료 정보를 등록하는 메서드이다.
	 * 2. 처리내용:
	 *
	 * </pre>
	 * @Method Name: updateSuccessCounselPay
	 */
	@RequestMapping(value = "/updateSuccessCounselPay", method = RequestMethod.POST)
	@ResponseBody
	public void updateSuccessCounselPay(HttpSession session,
			@RequestParam("pay_seq") int pay_seq,
			@RequestParam("pg") String pg,
			@RequestParam("pay_method") String pay_method,
			@RequestParam("imp_uid") String imp_uid,
			@RequestParam("merchant_uid") String merchant_uid,
			@RequestParam("apply_num") String apply_num
			) throws Exception {
		MemberVO memberVO = (MemberVO) session.getAttribute(LOGIN);
		PayInfoVO payInfo = new PayInfoVO();
		payInfo.setPay_seq(pay_seq);
		payInfo.setPg(pg);
		payInfo.setPay_method(pay_method);
		payInfo.setImp_uid(imp_uid);
		payInfo.setMerchant_uid(merchant_uid);
		payInfo.setApply_num(apply_num);
		payInfo.setMem_id(memberVO.getMem_id());
		counselService.updateSuccessCounselPay(payInfo);
		counselService.updateSuccessCounsMgt(payInfo);
	}


	@RequestMapping(value = "/getCounselPayInfo", method = RequestMethod.POST)
	@ResponseBody
	public PayInfoVO getCounselPayInfoPOST(HttpSession session, @RequestParam("cons_pay_seq") int cons_pay_seq) throws Exception
	{
		MemberVO memberVO = (MemberVO) session.getAttribute(LOGIN);
		Map<String, Object> map = new HashMap<String, Object>();
		//map.put("mem_id",memberVO.getMem_id());
		map.put("cons_pay_seq",cons_pay_seq);
		PayInfoVO payInfoVo = counselService.getCounselPayInfo(map);
		return payInfoVo;
	}

	@RequestMapping(value = "/refundCounsel", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> refundCounselPOST(HttpSession session, @RequestParam("cons_pay_seq") int cons_pay_seq) throws Exception
	{
		MemberVO memberVO = (MemberVO) session.getAttribute(LOGIN);
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("cons_pay_seq",cons_pay_seq);
		PayInfoVO payInfoVo = counselService.getCounselPayInfo(param);

		if( payInfoVo == null )
		{
			map.put("code", 2);
			return map;
		}
		if( !checkRefundCounsel(payInfoVo) )
		{
			map.put("code", 1);
			return map;
		}

		String token = getToken();

		String requestURL = "https://api.iamport.kr/payments/cancel"; // 토큰
		Map<String, Object> json = new HashMap<String, Object>();

		json.put("imp_uid", payInfoVo.getImp_uid());
		json.put("merchant_uid", payInfoVo.getMerchant_uid());
		json.put("amount", payInfoVo.getPaid_amount());
		json.put("reason", "온라인상담 취소");
		JSONObject jsonObject = getJsonStringFromMap(json);

		try {
			HttpClient client = HttpClientBuilder.create().build(); // HttpClient 생성
			HttpPost postRequest = new HttpPost(requestURL); //POST 메소드 URL 새성
			postRequest.setHeader("Accept", "application/json");
			postRequest.setHeader("Connection", "keep-alive");
			postRequest.setHeader("Content-Type", "application/json;charset=UTF-8");
			postRequest.addHeader("Authorization", token); // token 이용시
			postRequest.setEntity(new StringEntity(jsonObject.toString())); //json 메시지 입력

			HttpResponse response = client.execute(postRequest);

			//Response 출력
			if (response.getStatusLine().getStatusCode() == 200) {
				BasicResponseHandler handler = new BasicResponseHandler();
				String body = handler.handleResponse(response);
				System.out.println("refundCounsel : " + body);
				JSONParser parser = new JSONParser();
				Object obj = parser.parse( body );
				JSONObject jsonObj = (JSONObject) obj;
				Map<String, Object> param2 = new HashMap<String, Object>();
				param2.put("pay_seq", payInfoVo.getPay_seq());
				param2.put("mem_id", memberVO.getMem_id());
				counselService.updateRefundPayInfo(param2);
				counselService.updateRefundCounsel(param2);

				map.put("code", jsonObj.get("code"));

			} else {
				map.put("code", response.getStatusLine().getStatusCode());
			}
		} catch (Exception e){
			System.err.println(e.toString());
		}

		return map;
	}

	public static String getToken()
    {
		String requestURL = "https://api.iamport.kr/users/getToken"; // 토큰
		Map<String, Object> json = new HashMap<String, Object>();
		json.put("imp_key","7919755122481151");
		json.put("imp_secret","b67kFGVqC2onDVyTcZJk8gsjoVrZKeIWlPh0wdq8fPwSL4MX3whbMJvbFWaqbTmwIDxeQYn6NUYyYLw2");
		JSONObject jsonObject = getJsonStringFromMap(json);

		String access_token = null;
		try {
			HttpClient client = HttpClientBuilder.create().build(); // HttpClient 생성
			HttpPost postRequest = new HttpPost(requestURL); //POST 메소드 URL 새성
			postRequest.setHeader("Accept", "application/json");
			postRequest.setHeader("Connection", "keep-alive");
			postRequest.setHeader("Content-Type", "application/json");

			postRequest.setEntity(new StringEntity(jsonObject.toString())); //json 메시지 입력

			HttpResponse response = client.execute(postRequest);

			//Response 출력
			if (response.getStatusLine().getStatusCode() == 200) {
				BasicResponseHandler handler = new BasicResponseHandler();
				String body = handler.handleResponse(response);
				JSONParser parser = new JSONParser();
				Object obj = parser.parse( body );
				JSONObject jsonObj = (JSONObject) obj;
				JSONObject jsonObj2 = (JSONObject) jsonObj.get("response");
				access_token =  (String) jsonObj2.get("access_token");
			} else {
			}
		} catch (Exception e){
			System.err.println(e.toString());
		}
		return access_token;

    }



	public static JSONObject getJsonStringFromMap( Map<String, Object> map )
    {
        JSONObject jsonObject = new JSONObject();
        for( Map.Entry<String, Object> entry : map.entrySet() ) {
            String key = entry.getKey();
            Object value = entry.getValue();
            jsonObject.put(key, value);
        }

        return jsonObject;
    }

	public boolean checkRefundCounsel( PayInfoVO payInfoVo )
    {
		try {
			List<CounselVO> refundList = counselService.getRefundCounselList(payInfoVo.getPay_seq());

			String course_id = refundList.get(0).getCons_course_id();
			System.out.println(course_id);
			System.out.println(refundList.size());
			if( course_id.equals("COS002") )
			{
				if( refundList.size() == 3 )
				{
					return true;
				}
			}
			else if ( course_id.equals("COS003") )
			{
				if( refundList.size() == 5 )
				{
					return true;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
    }
}