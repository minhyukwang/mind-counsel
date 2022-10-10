package com.minhyuk.app.activity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.minhyuk.common.constants.CodeValueConstants;
import com.minhyuk.member.vo.LoginVO;
import com.minhyuk.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.minhyuk.app.sf.BoardService;
import com.minhyuk.app.vo.BoardVO;
import com.minhyuk.app.vo.CategoryVO;
import com.minhyuk.app.vo.CommentVO;
import com.minhyuk.app.vo.IssueBoardVO;
import com.minhyuk.app.vo.LikeVO;


/**
 * 게시판 관련 Control class
 */

@Controller
@RequestMapping("/board/*")
public class BoardController implements CodeValueConstants
{
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/timeline", method = RequestMethod.GET)
	public void timelineGET(@ModelAttribute("dto") LoginVO vo)
	{
		
	}
	
	/**
	 * 타임라인 게시판 카테고리 리스트 불러오기
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getCategoryList", method = RequestMethod.POST)
	@ResponseBody
	public List<CategoryVO> getCategoryListPOST() throws Exception 
	{
		List<CategoryVO> categoryList = boardService.getCategoryList();
		return categoryList;
	}
	
	/**
	 * 타임라인 게시판 글 불러오기
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getTimelineList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getTimelineListPOST(@RequestParam("cgId") String cgId, @RequestParam("user_id") String user_id, HttpSession session) throws Exception 
	{
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> param = new HashMap<>();
		param.put("cgId", cgId);
		param.put("user_id", user_id);
		
		// 카테고리 정보 받아와서 예시 (sample) 뿌리는 작업 예정
		CategoryVO categoryVo = null;
		if( cgId != "CG001" && cgId != "CG002" )
		{
			categoryVo = boardService.getCategoryEx(cgId);
		}
		List<BoardVO> boardList = boardService.getBoardList(param);
		
		map.put("boardList",boardList);
		if( cgId != "CG001" || cgId != "CG002" )
		{
			map.put("category",categoryVo);
		}
		
		return map;
	}
	
	/**
	 * 타임라인 게시판 글 append 하기
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/appendTimelineList", method = RequestMethod.POST)
	@ResponseBody
	public List<BoardVO> getAppendTimelineListPOST(@RequestParam("cgId") String cgId, @RequestParam("boardSeq") int boardSeq, @RequestParam("user_id") String user_id,
			HttpSession session) throws Exception 
	{
		Map<String, Object> param = new HashMap<>();
		param.put("cgId", cgId);
		param.put("boardSeq", boardSeq);
		param.put("user_id", user_id);
		
		List<BoardVO> boardList = boardService.getAppendBoardList(param);
		return boardList;
	}
	
	/**
	 * 마이페이지 타임라인 게시판 글 불러오기
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getMypageTimelineList", method = RequestMethod.POST)
	@ResponseBody
	public List<BoardVO> getMypageTimelineListPOST(@RequestParam("user_id") String user_id, @RequestParam("identity") String identity, HttpSession session) throws Exception 
	{
		Map<String, Object> param = new HashMap<>();
		param.put("user_id", user_id);
		param.put("identity", identity);
		
		List<BoardVO> boardList = boardService.getMypageBoardList(param);
		return boardList;
	}
	
	/**
	 * 마이페이지 타임라인 게시판 글 append 하기
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/appendMypageTimelineList", method = RequestMethod.POST)
	@ResponseBody
	public List<BoardVO> getMypageAppendTimelineListPOST(@RequestParam("user_id") String user_id, @RequestParam("identity") String identity, @RequestParam("boardSeq") int boardSeq, HttpSession session) throws Exception 
	{
		Map<String, Object> param = new HashMap<>();
		param.put("user_id", user_id);
		param.put("identity", identity);
		param.put("boardSeq", boardSeq);
		
		List<BoardVO> boardList = boardService.getMypageAppendBoardList(param);
		return boardList;
	}
	
	
	/**
	 * 타임라인 게시판 공지글 불러오기
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getTimelineNoticeContents", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getTimelineNoticeContentsPOST() throws Exception 
	{
		Map<String, Object> map = new HashMap<String, Object>();
		BoardVO boardVo = boardService.getBoardNotice();
		if( boardVo != null )
		{
			map.put("boardVo", boardVo);
			map.put(DATA_YN, FLAG_Y);
		}
		else
		{
			map.put(DATA_YN, FLAG_N);
		}
		
		return map;
	}
	
	/**
	 * 타임라인 게시판 글 컨텐츠 불러오기
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getTimelineContents", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getTimelineContentsPOST(@RequestParam("board_seq") int board_seq, @RequestParam("user_id") String user_id) throws Exception 
	{
		Map<String, Object> map = new HashMap<String, Object>();
		BoardVO boardVo = boardService.getBoardContents(board_seq);
		Map<String, Object> param1 = new HashMap<String, Object>();
		param1.put("board_seq", board_seq);
		param1.put("user_id", user_id);
		List<CommentVO> commentVoList = boardService.getBoardCommentList(param1);
		if( commentVoList.size() > 0 )
		{
			List<Integer> array = new ArrayList<Integer>();
			
			for(int i = 0; i < commentVoList.size(); i++ )
			{
				array.add(commentVoList.get(i).getComment_seq());
			}
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("list", array);
			param.put("user_id", user_id);
			List<CommentVO> commentVoList2 = boardService.getBoardCommentList2(param);
			if( commentVoList.size() > 0 )
			{
				List<CommentVO> mergeCommentVo = mergeCommentVO(commentVoList, commentVoList2);
				map.put("comment", mergeCommentVo);
				map.put(DATA_YN, FLAG_Y);
			}
			else
			{
				map.put("comment", commentVoList);
				map.put(DATA_YN, FLAG_Y);
			}
		}
		else 
		{
			map.put(DATA_YN, FLAG_N);
		}
		
		
		map.put("boardVo", boardVo);
		return map;
	}
	
	/**
	 * 타임라인 수정용 댓글 불러오기
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getModifyComment", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getModifyCommentPOST(@RequestParam("comment_seq") int comment_seq) throws Exception 
	{
		Map<String, Object> map = new HashMap<String, Object>();
		CommentVO commentVo = boardService.getModifyComment(comment_seq);
		
		map.put("comment", commentVo);
		map.put(DATA_YN, FLAG_Y);
		return map;
	}
	
	/**
	 * 타임라인 like pop list 불러오기
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getTimeLineLikePopupList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getTimeLineLikePopupListPOST(@RequestParam("board_seq") int board_seq, @RequestParam("board_type") String board_type) throws Exception 
	{
		Map<String, Object> param = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		param.put("board_seq", board_seq);
		param.put("board_type", board_type);
		List<LikeVO> likeVoList = boardService.getTimeLineLikePopupList(param);
		
		if( likeVoList.size() >= 1 )
		{
			map.put("likeList", likeVoList);
			map.put(DATA_YN, FLAG_Y);
		}
		else
		{
			map.put(DATA_YN, FLAG_N);
		}
		return map;
	}
	
	/**
	 * 타임라인 글 게시 등록
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/writeTimeline", method = RequestMethod.POST)
	public String writeTimelinePOST(HttpServletRequest request, HttpSession session) throws Exception 
	{
		String contents = request.getParameter("contents");
		if( contents == "" || contents.equals(""))
		{
			return "redirect:/board/timeline";
		}
		
		BoardVO boardVo = new BoardVO();
		MemberVO memberVO = (MemberVO) session.getAttribute(LOGIN);
		String category_id = request.getParameter("cate-select");
		String open_grade = request.getParameter("open-select");
		
		boardVo.setCreated_id(memberVO.getMem_id());
		boardVo.setContents(contents);
		boardVo.setMem_nick(memberVO.getMem_nick());
		boardVo.setLast_up_id(memberVO.getMem_id());
		boardVo.setCategory_id(category_id);
		boardVo.setOpen_grade(open_grade);
		boardVo.setAnony_yn(FLAG_N);
		boardVo.setBoard_type("T");
		
		try {
			boardService.insertTimeline(boardVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/board/timeline";
	}
	
	/**
	 * 타임라인 댓글 입력
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/writeBoardComment", method = RequestMethod.POST)
	public String writeBoardCommentPOST(HttpServletRequest request, HttpSession session) throws Exception 
	{
		MemberVO memberVO = (MemberVO) session.getAttribute(LOGIN);
		CommentVO commentVO = new CommentVO();
		String board_seq = request.getParameter("hidCurBoardSeq");
		String comment = request.getParameter("comment");
		commentVO.setBoard_seq(Integer.parseInt(board_seq));
		commentVO.setCreated_id(memberVO.getMem_id());
		commentVO.setLast_up_id(memberVO.getMem_id());
		commentVO.setAnony_yn(FLAG_N);
		commentVO.setBoard_type(C_BOARD_TYPE_T);
		commentVO.setContents(comment);
		commentVO.setMem_nick(memberVO.getMem_nick());
		
		try {
			boardService.insertTimelineComment(commentVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(DATA_YN, FLAG_Y);
		
		return "redirect:/board/timelineContents?board_seq=" + board_seq;
	}
	
	/**
	 * 타임라인 댓글 수정 입력
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/modifyCommentSubmit", method = RequestMethod.POST)
	public String modifyCommentSubmitPOST(HttpServletRequest request, HttpSession session) throws Exception 
	{
		MemberVO memberVO = (MemberVO) session.getAttribute(LOGIN);
		CommentVO commentVO = new CommentVO();
		String comment_seq = request.getParameter("comment_seq");
		String comment = request.getParameter("comment");
		commentVO.setComment_seq(Integer.parseInt(comment_seq));
		commentVO.setLast_up_id(memberVO.getMem_id());
		commentVO.setContents(comment);
		commentVO.setBoard_type(C_BOARD_TYPE_T);
		
		try {
			boardService.modifyTimelineComment(commentVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(DATA_YN, FLAG_Y);
		
		return "success";
	}
	
	/**
	 * 타임라인 게시글 삭제 입력
	 * @param seq
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deletePost", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deletePostPOST(@RequestParam("seq") int seq, HttpSession session) throws Exception 
	{
		MemberVO memberVO = (MemberVO) session.getAttribute(LOGIN);
		Map<String, Object> param = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		param.put("mem_id", memberVO.getMem_id());
		param.put("board_seq", seq);
		boardService.deleteTimelinePost(param);
		map.put(DATA_YN, FLAG_Y);
		return map;
	}

	/**
	 * 타임라인 게시글 수정 
	 * @param seq
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/modifyPost", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> modifyPostPOST(@RequestParam("seq") int seq, @RequestParam("contents") String contents, HttpSession session) throws Exception 
	{
		MemberVO memberVO = (MemberVO) session.getAttribute(LOGIN);
		Map<String, Object> param = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		param.put("mem_id", memberVO.getMem_id());
		param.put("board_seq", seq);
		param.put("contents", contents);
		boardService.updateTimelinePost(param);
		map.put(DATA_YN, FLAG_Y);
		return map;
	}
	
	/**
	 * 타임라인 댓글 삭제 
	 * @param seq
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteComment", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteCommentPOST(@RequestParam("seq") int seq, HttpSession session) throws Exception 
	{
		MemberVO memberVO = (MemberVO) session.getAttribute(LOGIN);
		Map<String, Object> param = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		param.put("mem_id", memberVO.getMem_id());
		param.put("comment_seq", seq);
		param.put("board_type", C_BOARD_TYPE_T);
		boardService.deleteTimelineComment(param);
		map.put(DATA_YN, FLAG_Y);
		return map;
	}
	
	@RequestMapping(value = "/pop/modifyTimelineComment", method = RequestMethod.GET)
	public void modifyTimelineCommentGET() 
	{
		
	}
	
	@RequestMapping(value = "/issueBoard", method = RequestMethod.GET)
	public void issueBoardGET(@ModelAttribute("dto") LoginVO vo) 
	{
		
	}
	
	@RequestMapping(value = "/getIssueList", method = RequestMethod.POST)
	@ResponseBody
	public List<IssueBoardVO> issueListPOST(@ModelAttribute("dto") LoginVO vo, HttpServletRequest request) throws Exception 
	{
		List<IssueBoardVO> titleList = boardService.getTitleList();
		return titleList;
	}
	@RequestMapping(value = "/getIssuePreSeq", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> issuePreSeqPOST(@RequestParam("preSeq") int seq) throws Exception 
	{
		
		Map<String, Object> map = new HashMap<String, Object>();
		int preSeq = boardService.getIssuePreSeq(seq);
	
		if ( preSeq == 0 )
		{
			map.put(DATA_YN, FLAG_N);
		}
		else
		{
			map.put("preSeq", preSeq);
			map.put(DATA_YN, FLAG_Y);
		}
		return map;
	}
	
	@RequestMapping(value = "/getIssueNextSeq", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> issueNextSeqPOST(@RequestParam("nextSeq") int seq) throws Exception 
	{
		
		Map<String, Object> map = new HashMap<String, Object>();
		int nextSeq = boardService.getIssueNextSeq(seq);
		if ( nextSeq == 0 )
		{
			map.put(DATA_YN, FLAG_N);
		}
		else
		{
			map.put("nextSeq", nextSeq);
			map.put(DATA_YN, FLAG_Y);
		}
		return map;
	}
	
	/**
	 * 이슈 게시판 댓글 입력
	 * @param comment
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/writeIssueComment", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> writeissueCommentPOST(@RequestParam("comment") String comment, 
			@RequestParam("board_seq") int boardSeq, HttpSession session) throws Exception 
	{
		MemberVO memberVO = (MemberVO) session.getAttribute(LOGIN);
		CommentVO commentVO = new CommentVO();
		commentVO.setBoard_seq(boardSeq);
		commentVO.setCreated_id(memberVO.getMem_id());
		commentVO.setLast_up_id(memberVO.getMem_id());
		commentVO.setAnony_yn(FLAG_N);
		commentVO.setBoard_type(C_BOARD_TYPE_I);
		commentVO.setContents(comment);
		commentVO.setMem_nick(memberVO.getMem_nick());
		
		try {
			boardService.insertComment(commentVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(DATA_YN, FLAG_Y);
		
		return map;
	}
	
	/**
	 * 이슈게시판 내용 및 댓글 불러오기
	 * @param seq
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getIssueContents", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> issueContentsPOST(@RequestParam("seq") int seq) throws Exception 
	{
		
		Map<String, Object> map = new HashMap<String, Object>();
		IssueBoardVO issueVo = boardService.getIssueContents(seq);
		List<CommentVO> commentVoList = boardService.getIssueCommentList(seq);
		List<LikeVO> likeVo = boardService.getLikeList(seq);
		map.put("issueContents", issueVo);
		map.put("likeCnt", likeVo.size());
		
		if( likeVo.size() > 0 )
		{
			map.put("likeVo", likeVo);
		}
		
		if( commentVoList.size() > 0 )
		{
			List<Integer> array = new ArrayList<Integer>();
			
			for(int i = 0; i < commentVoList.size(); i++ )
			{
				array.add(commentVoList.get(i).getComment_seq());
			}
			
			List<CommentVO> commentVoList2 = boardService.getIssueCommentList2(array);
			if( commentVoList2.size() > 0 )
			{
				List<CommentVO> mergeCommentVo = mergeCommentVO(commentVoList, commentVoList2);
				map.put("comment", mergeCommentVo);
				map.put(DATA_YN, FLAG_Y);
				map.put("commentCnt", mergeCommentVo.size());
			}
			else
			{
				map.put("comment", commentVoList);
				map.put(DATA_YN, FLAG_Y);
				map.put("commentCnt", commentVoList.size());
			}
		}
		else 
		{
			map.put(DATA_YN, FLAG_N);
			map.put("commentCnt", 0);
		}

		return map;
	}
	
	/**
	 * 댓글과 댓글답글을 merge 하면서 정렬하는 Method
	 * @param vo1 : 댓글 param
	 * @param vo2 : 댓글답글 param
	 * @return : merge 된 결과 VO List
	 */
	public List<CommentVO> mergeCommentVO(List<CommentVO> vo1, List<CommentVO> vo2)
	{
		List<CommentVO> mergeCommentVo = new ArrayList<CommentVO>();
		
		for( int i = 0; i < vo1.size(); i++ )
		{
			mergeCommentVo.add(vo1.get(i));
			
			for ( int j = 0; j < vo2.size(); j++ )
			{
			
				if( vo1.get(i).getComment_seq() == vo2.get(j).getParent_comment_seq() )
				{
					mergeCommentVo.add(vo2.get(j));
				}
			}
		}
		
		return mergeCommentVo;
	}
	
	@RequestMapping(value = "/issueBoardContents", method = RequestMethod.GET)
	public void issueContentsGET() throws Exception 
	{
	}
	
	@RequestMapping(value = "/timelineContents", method = RequestMethod.GET)
	public void timelineContentsGET() throws Exception 
	{
	}
	
	@RequestMapping(value = "/writeIssue", method = RequestMethod.GET)
	public void writeIssueGET() 
	{
		
	}
	
	@RequestMapping(value = "/modifyIssueContents", method = RequestMethod.GET)
	public void modifyIssueContentsGET() 
	{
		
	}
	
	
	@RequestMapping(value = "/insertIssuePOST", method = RequestMethod.POST)
	public String writeIssuePOST(IssueBoardVO vo, HttpSession session) {
		MemberVO memberVO = (MemberVO) session.getAttribute(LOGIN);
		vo.setMem_nick(memberVO.getMem_nick());
		vo.setCreated_id(memberVO.getMem_id());
		vo.setLast_up_id(memberVO.getMem_id());
		
		if( vo.getTitle() == "" || vo.getTitle() == null )
		{
			vo.setTitle("제목없음");
		}
		try {
			boardService.insertIssue(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/board/issueBoard";
	}
	
	@RequestMapping(value = "/upLike", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> upLikePOST(@RequestParam("seq") int seq, @RequestParam("likeCnt") int likeCnt, HttpSession session) 
	{
		Map<String, Object> map = new HashMap<String, Object>();
		if( likeCnt == 0 )
		{
			insertLike(seq, likeCnt, session);
			map.put(DATA_YN, FLAG_Y);
		}
		else
		{
			if( checkLike(seq, session) )
			{
				map.put(DATA_YN,  FLAG_N);
			}
			else
			{
				insertLike(seq, likeCnt, session);
				map.put(DATA_YN, FLAG_Y);
			}
		}
		return map;
	}
	
	public void insertLike(int seq, int likeCnt, HttpSession session)
	{
		MemberVO memberVO = (MemberVO) session.getAttribute(LOGIN);
		LikeVO likeVo = new LikeVO();
		likeVo.setBoard_seq(seq);
		likeVo.setMem_id(memberVO.getMem_id());
		likeVo.setCreated_id(memberVO.getMem_id());
		likeVo.setLast_up_id(memberVO.getMem_id());
		likeVo.setBoard_type(C_BOARD_TYPE_I);
		
		try {
			boardService.insertLike(likeVo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public boolean checkLike(int seq, HttpSession session)
	{
		MemberVO memberVO = (MemberVO) session.getAttribute(LOGIN);
		LikeVO likeVo = new LikeVO();
		likeVo.setBoard_seq(seq);
		likeVo.setMem_id(memberVO.getMem_id());
		int checkCnt = 0;
		try {
			checkCnt = boardService.checkLike(likeVo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if( checkCnt > 0 )
		{
			return true;
		}
		return false;
	}
	
	/**
	 * 타임라인 좋아요 UP
	 * @param seq
	 * @param likeCnt
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/timelineUpLike", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> timelineUpLikePOST(@RequestParam("seq") int seq, @RequestParam("likeCnt") int likeCnt, HttpSession session) 
	{
		Map<String, Object> map = new HashMap<String, Object>();
		if( likeCnt == 0 )
		{
			insertTimelineLike(seq, likeCnt, session);
			map.put(DATA_YN, FLAG_Y);
		}
		else
		{
			if( checkTimelineLike(seq, session) )
			{
				map.put(DATA_YN,  FLAG_N);
			}
			else
			{
				insertTimelineLike(seq, likeCnt, session);
				map.put(DATA_YN, FLAG_Y);
			}
		}
		return map;
	}
	
	public void insertTimelineLike(int seq, int likeCnt, HttpSession session)
	{
		MemberVO memberVO = (MemberVO) session.getAttribute(LOGIN);
		LikeVO likeVo = new LikeVO();
		likeVo.setBoard_seq(seq);
		likeVo.setMem_id(memberVO.getMem_id());
		likeVo.setCreated_id(memberVO.getMem_id());
		likeVo.setLast_up_id(memberVO.getMem_id());
		likeVo.setBoard_type(C_BOARD_TYPE_T);
		
		try {
			boardService.insertTimelineLike(likeVo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public boolean checkTimelineLike(int seq, HttpSession session)
	{
		MemberVO memberVO = (MemberVO) session.getAttribute(LOGIN);
		LikeVO likeVo = new LikeVO();
		likeVo.setBoard_seq(seq);
		likeVo.setMem_id(memberVO.getMem_id());
		int checkCnt = 0;
		try {
			checkCnt = boardService.checkTimelineLike(likeVo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if( checkCnt > 0 )
		{
			return true;
		}
		return false;
	}
	
	/**
	 * 이슈게시판 게시글 삭제
	 * @param seq
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteIssueContents", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteIssueContentsPOST(@RequestParam("seq") int seq, HttpSession session) throws Exception 
	{
		MemberVO memberVO = (MemberVO) session.getAttribute(LOGIN);
		Map<String, Object> param = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		param.put("mem_id", memberVO.getMem_id());
		param.put("board_seq", seq);
		boardService.deleteIssueContents(param);
		map.put(DATA_YN, FLAG_Y);
		return map;
	}
	
	/**
	 * 이슈게시판 게시글 수정
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/modifyIssuePOST", method = RequestMethod.POST)
	public String modifyIssuePOST(HttpServletRequest request, HttpSession session) {
		MemberVO memberVO = (MemberVO) session.getAttribute(LOGIN);
		IssueBoardVO vo = new IssueBoardVO();
		vo.setTitle(request.getParameter("title"));
		vo.setIssue_board_seq(Integer.parseInt(request.getParameter("issue_board_seq")));
		vo.setContents(request.getParameter("contents"));
		vo.setLast_up_id(memberVO.getMem_id());
		vo.setMem_nick(memberVO.getMem_nick());
		try {
			boardService.modifyIssue(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/board/issueBoard";
	}
	
	/**
	 * 이슈게시판 댓글 삭제 
	 * @param seq
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteIssueComment", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteIssueCommentPOST(@RequestParam("seq") int seq, HttpSession session) throws Exception 
	{
		MemberVO memberVO = (MemberVO) session.getAttribute(LOGIN);
		Map<String, Object> param = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		param.put("mem_id", memberVO.getMem_id());
		param.put("comment_seq", seq);
		param.put("board_type", C_BOARD_TYPE_I);
		boardService.deleteIssueComment(param);
		map.put(DATA_YN, FLAG_Y);
		return map;
	}
	
	/**
	 * 이슈게시판 수정용 댓글 불러오기
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getModifyIssueComment", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getModifyIssueCommentPOST(@RequestParam("comment_seq") int comment_seq) throws Exception 
	{
		Map<String, Object> map = new HashMap<String, Object>();
		CommentVO commentVo = boardService.getModifyIssueComment(comment_seq);
		
		map.put("comment", commentVo);
		map.put(DATA_YN, FLAG_Y);
		return map;
	}
	
	/**
	 * 이슈게시판 댓글 수정 입력
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/modifyIssueCommentSubmit", method = RequestMethod.POST)
	public String modifyIssueCommentSubmitPOST(HttpServletRequest request, HttpSession session) throws Exception 
	{
		MemberVO memberVO = (MemberVO) session.getAttribute(LOGIN);
		CommentVO commentVO = new CommentVO();
		String comment_seq = request.getParameter("comment_seq");
		String comment = request.getParameter("comment");
		commentVO.setComment_seq(Integer.parseInt(comment_seq));
		commentVO.setLast_up_id(memberVO.getMem_id());
		commentVO.setContents(comment);
		commentVO.setBoard_type(C_BOARD_TYPE_I);
		
		try {
			boardService.modifyIssueComment(commentVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(DATA_YN, FLAG_Y);
		
		return "success";
	}
	
	@RequestMapping(value = "/pop/modifyIssueComment", method = RequestMethod.GET)
	public void modifyIssueCommentGET() 
	{
		
	}
	
	@RequestMapping(value = "/pop/recomment", method = RequestMethod.GET)
	public void recommentGET() 
	{
		
	}
	
	@RequestMapping(value = "/pop/likeList", method = RequestMethod.GET)
	public void likeListGET() 
	{
		
	}
	/**
	 * 타임라인 / 이슈게시판 댓글 답글 입력
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/recommentSubmit", method = RequestMethod.POST)
	public String recommentSubmitPOST(HttpServletRequest request, HttpSession session) throws Exception 
	{
		MemberVO memberVO = (MemberVO) session.getAttribute(LOGIN);
		CommentVO commentVO = new CommentVO();
		String board_seq = request.getParameter("board_seq");
		String comment_seq = request.getParameter("comment_seq");
		String comment = request.getParameter("recomment");
		String board_type = request.getParameter("board_type");
		commentVO.setBoard_seq(Integer.parseInt(board_seq));
		commentVO.setParent_comment_seq(Integer.parseInt(comment_seq));
		commentVO.setMem_nick(memberVO.getMem_nick());
		commentVO.setCreated_id(memberVO.getMem_id());
		commentVO.setLast_up_id(memberVO.getMem_id());
		commentVO.setContents(comment);
		commentVO.setBoard_type(board_type);
		commentVO.setAnony_yn(FLAG_N);
		
		int returnParentCommentSeq = boardService.checkParentComment(commentVO);
		
		if( returnParentCommentSeq != 0 )
		{
			commentVO.setParent_comment_seq(returnParentCommentSeq);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if( C_BOARD_TYPE_I.equals(board_type) )
		{
			try {
				boardService.insertIssueRecomment(commentVO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			map.put(DATA_YN, FLAG_Y);
		}
		else if( C_BOARD_TYPE_T.equals(board_type) )
		{
			try {
				boardService.insertTimelineRecomment(commentVO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			map.put(DATA_YN, FLAG_Y);
		}
		
		map.put(DATA_YN, FLAG_N);
		return "success";
	}
	
}
