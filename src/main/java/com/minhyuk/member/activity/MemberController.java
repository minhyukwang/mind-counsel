package com.minhyuk.member.activity;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.minhyuk.common.constants.CodeValueConstants;
import com.minhyuk.common.util.FindUtil;
import com.minhyuk.common.util.MailUtil;
import com.minhyuk.member.sf.MemberService;
import com.minhyuk.member.vo.MemberVO;


/**
 * @author Minhyuk
 * 회원 관련 Control Class
 * 2019. 7. 15.
 */
@Controller
@RequestMapping("/member/*")
public class MemberController implements CodeValueConstants{

	@Autowired
	private MemberService service;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") MemberVO memVo) {

	}

	/*
	 * 해당 회원 가져오기
	 */
	@RequestMapping(value = "/getMember", method = RequestMethod.POST)
	@ResponseBody
	public MemberVO getMember(@RequestParam("mem_id") String mem_id ) throws Exception
	{
		MemberVO member = service.getMember(mem_id);
		return member;
	}

	/*
	 * 상담사 목록 가져오기
	 */
	@RequestMapping(value = "/getCounselerList", method = RequestMethod.POST)
	@ResponseBody
	public List<MemberVO> getCounselerList() throws Exception
	{
		List<MemberVO> counselerList = service.getCounselerList();
		return counselerList;
	}

	/**
	 * <pre>
	 * 1. 개요: 로그인 Process를 처리하는 메소드
	 * 2. 처리내용: ID, PW일치여부를 Check하고  Cookie기능을 처리하는 메소드이다.
	 *
	 * </pre>
	 * @Method Name: loginPOST
	 * @param memVo
	 * @param session
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/loginPOST", method = RequestMethod.POST)
	public void loginPOST(MemberVO memVo, HttpSession session, Model model) throws Exception {
		MemberVO vo = service.login(memVo);
		if (vo == null)	return;
		model.addAttribute("MemberVO", vo);
		if (memVo.isUseCookie()) {
			int amount = 3600 * 24 * 7;
			Date sessionLimit = new Date(System.currentTimeMillis() + 1000 * amount);
			service.keepLogin(vo.getMem_id(), session.getId(), sessionLimit);
		}

	}

	/**
	 * <pre>
	 * 1. 개요: 로그아웃기능
	 * 2. 처리내용: 로그아웃하면서 쿠키정보를 삭제한다.
	 *
	 * </pre>
	 * @Method Name: logout
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Object obj = session.getAttribute(LOGIN);

		if (obj != null) {
			MemberVO vo = (MemberVO) obj;

			session.removeAttribute(LOGIN);
			session.invalidate();

			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);

				response.addCookie(loginCookie);
				service.keepLogin(vo.getMem_id(), session.getId(), new Date(System.currentTimeMillis()));
			}
		}

		return "redirect:/member/login";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET() {

	}

	/**
	 * <pre>
	 * 1. 개요: 회원가입
	 * 2. 처리내용: ID,PWD,NAME,E-MAIL정보를 받아 회원 최조 회원가입 하는기능이다.
	 *
	 * </pre>
	 * @Method Name: registerPOST
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(MemberVO vo) {
		System.out.println(vo);
		service.insertMember(vo);
		return "redirect:/member/login";
	}

	@RequestMapping(value = "/updateMyInfo", method = RequestMethod.POST)
	@ResponseBody
	public void updateMyInfo(HttpSession session,
							@RequestParam("mem_id") String mem_id
							, @RequestParam("mem_name") String mem_name
							, @RequestParam("mem_nick") String mem_nick
							, @RequestParam("mem_phone") String mem_phone
							, @RequestParam("mem_email") String mem_email
							, @RequestParam("mem_gender") String mem_gender
							, @RequestParam("mem_date") String mem_date
							, @RequestParam("mem_intro") String mem_intro)  throws Exception {
		MemberVO vo = new MemberVO();
		vo = service.checkMember(mem_id);
			vo.setMem_id(mem_id);
			vo.setMem_name(mem_name);
			vo.setMem_nick(mem_nick);
			vo.setMem_phone(mem_phone);
			vo.setMem_email(mem_email);
			vo.setMem_gender(mem_gender);
			vo.setMem_date(mem_date);
			vo.setMem_intro(mem_intro);
		session.setAttribute(LOGIN, vo);
		service.updateMyInfo(vo);
	}


	/**
	 * <pre>
	 * 1. 개요: 아이디 중복 체크
	 * 2. 처리내용: 회원가입시, 회원아이디를 가져와 회원테이블에 해당 아이디가 있는지 중복검사를 한다.
	 *
	 * </pre>
	 * @Method Name: checkID
	 * @param mem_id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/check", method = RequestMethod.GET)
	@ResponseBody
	public boolean checkID(String mem_id) throws Exception {
		if (service.checkID(mem_id) == 0) {
			return true;
		}
		return false;
	}

	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public void find() {

	}

	/**
	 * <pre>
	 * 1. 개요: 아이디찾기
	 * 2. 처리내용: 회원이메일로 회원 아이디를 가져오는 기능이다.
	 *
	 * </pre>
	 * @Method Name: findID
	 * @param mem_email
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/findID", method = RequestMethod.POST)
	@ResponseBody
	public String findID(String mem_email) throws Exception {
		List<String> mem_id = service.getID(mem_email); if (mem_id.get(0) == null || mem_id.get(0).equals("")) {
			return "no data";
		}
		String str = "";
		for (int i = 0; i < mem_id.size(); i++) {
			str += mem_id.get(i).substring(0, mem_id.get(i).length() - 2) + "**, ";
		}
		return str.substring(0, str.length() - 2);
	}

	/**
	 * <pre>
	 * 1. 개요: 비밀번호찾기(인증번호전송)
	 * 2. 처리내용: 비밀번호를 찾기 위해 회원의 이메일로 인증번호를 전송하는 메소드이다.
	 *
	 * </pre>
	 * @Method Name: sendCode
	 * @param mem_email
	 * @param mem_id
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/sendCode", method = RequestMethod.POST)
	@ResponseBody
	public String sendCode(String mem_email, String mem_id, HttpSession session) throws Exception {

		List<String> idList = service.getID(mem_email);
		boolean isDiscordance = true;

		for (int i = 0; i < idList.size(); i++ ) {

			if (mem_id.equals(service.getID(mem_email).get(i))) {
				isDiscordance = false;
			}
		}

		if (isDiscordance) {
			return "discordance";
		}

		String keyCode = FindUtil.createKey();
		session.setAttribute("keyCode", keyCode);
		String subject = "비밀번호 찾기 인증코드 안내";
		String msg = "";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>비밀번호 찾기 인증코드입니다.</h3>";
		msg += "<div style='font-size: 130%'>";
		msg += "비밀번호 찾기 페이지로 돌아가 인증코드 <strong>" + keyCode + "</strong> 를 입력해주세요.</div><br/>";

		MailUtil.sendMail(mem_email, subject, msg);

		return "success";
	}

	/**
	 * <pre>
	 * 1. 개요: 임시비밀번호를 발급
	 * 2. 처리내용: 임시비밀번호를 회원 이메일로 전송하는 메소드이다.
	 *
	 * </pre>
	 * @Method Name: findPwd
	 * @param mem_email
	 * @param mem_id
	 * @param inputCode
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/findPwd", method = RequestMethod.POST)
	@ResponseBody
	public String findPwd(String mem_email, String mem_id, String inputCode, HttpSession session) throws Exception {

		String keyCode = (String) session.getAttribute("keyCode");

		if (!inputCode.equals(keyCode)) {
			return "discordance";
		}

		session.removeAttribute("keyCode");

		String newPwd = FindUtil.getNewPwd();
		service.changePwd(newPwd, mem_id);

		String subject = "임시 비밀번호 발급 안내";

		String msg = "";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'><strong>" + mem_id + "님</strong>의 임시 비밀번호 입니다. 로그인 후 비밀번호를 변경하세요.</h3>";
		msg += "<p>임시 비밀번호 : <strong>" + newPwd + "</strong></p></div>";

		MailUtil.sendMail(mem_email, subject, msg);

		return "success";
	}
	@RequestMapping(value = "/changePw", method = RequestMethod.POST)
	@ResponseBody
	public void changePw(@RequestParam("mem_id") String mem_id
						, @RequestParam("mem_pwd") String mem_pwd) throws Exception {
		service.changePwd(mem_pwd, mem_id);
	}


	@RequestMapping(value = "/getView", method = RequestMethod.GET)
	public void getView(HttpSession session, Model model) throws Exception {
		MemberVO vo = service.getView("test123");

		System.out.println(vo);
	}
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET() {

	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(HttpSession session, MemberVO vo) {
		session.setAttribute(LOGIN, vo);
		service.modifyMember(vo);

		return "redirect:/member/mypage";
	}

	@RequestMapping(value = "/updateMemPic", method = RequestMethod.POST)
	public void updateMemPic(HttpSession session, @RequestParam("mem_id") String mem_id
							, @RequestParam("mem_pic") String mem_pic) throws Exception {
		MemberVO vo = (MemberVO)session.getAttribute(LOGIN);
		vo.setMem_pic(mem_pic);
		session.setAttribute(LOGIN, vo);
		service.updateMemPic(mem_pic, mem_id);

	}
	@RequestMapping(value = "/mypage", method = RequestMethod.POST)
	public void myPagePost(HttpServletRequest request) {

	}
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public void myPage() {

	}
	@RequestMapping(value = "/recommend", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> recommend(HttpSession session) {
		ResponseEntity<Map<String, Object>> entity = null;
		MemberVO vo = (MemberVO) session.getAttribute(LOGIN);

		try {
			Map<String, Object> map = new HashMap<String, Object>();

		//	List<MemberVO> list = service.recommend(vo.getMem_seq());
		//	map.put("list", list);

			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
}
