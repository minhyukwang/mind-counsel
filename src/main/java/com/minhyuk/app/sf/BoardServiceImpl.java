package com.minhyuk.app.sf;

import java.util.List;
import java.util.Map;

import com.minhyuk.app.dao.BoardDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.minhyuk.app.vo.BoardVO;
import com.minhyuk.app.vo.CategoryVO;
import com.minhyuk.app.vo.CommentVO;
import com.minhyuk.app.vo.IssueBoardVO;
import com.minhyuk.app.vo.LikeVO;

@Service
/**
 * 게시판 관련 service 구현 class
 */
public class BoardServiceImpl implements BoardService 
{

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<IssueBoardVO> getTitleList() throws Exception
	{
		return boardDao.getTitleList();
	}
	@Override
	public void insertIssue(IssueBoardVO vo) throws Exception {
		boardDao.insertIssue(vo);
	}

	@Override
	public void insertComment(CommentVO vo) throws Exception {
		boardDao.insertComment(vo);
	}
	
	@Override
	public void insertLike(LikeVO vo) throws Exception {
		boardDao.insertLike(vo);
	}
	
	@Override
	public IssueBoardVO getIssueContents(int seq) throws Exception {
		return boardDao.getIssueContents(seq);
		
	}

	@Override
	public List<CommentVO> getIssueCommentList(int seq) throws Exception {
		return boardDao.getIssueCommentList(seq);
	}

	@Override
	public List<CommentVO> getIssueCommentList2(List<Integer> arr) throws Exception {
		return boardDao.getIssueCommentList2(arr);
	}

	@Override
	public int getIssuePreSeq(int seq) throws Exception {
		return boardDao.getIssuePreSeq(seq);
	}
	
	@Override
	public int getIssueNextSeq(int seq) throws Exception {
		return boardDao.getIssueNextSeq(seq);
	}
	
	@Override
	public List<LikeVO> getLikeList(int seq) throws Exception {
		return boardDao.getLikeList(seq);
	}

	@Override
	public int checkLike(LikeVO vo) throws Exception {
		return boardDao.checkLike(vo);
	}

	@Override
	public List<CategoryVO> getCategoryList() throws Exception {
		return boardDao.getCategoryList();
	}

	@Override
	public List<BoardVO> getBoardList(Map<String, Object> param) throws Exception {
		return boardDao.getBoardList(param);
	}
	
	@Override
	public List<BoardVO> getAppendBoardList(Map<String, Object> param) throws Exception {
		return boardDao.getAppendBoardList(param);
	}
	
	@Override
	public void insertTimeline(BoardVO vo) throws Exception {
		boardDao.insertTimeline(vo);
	}

	@Override
	public BoardVO getBoardNotice() throws Exception {
		return boardDao.getBoardNotice();
	}

	@Override
	public BoardVO getBoardContents(int board_seq) throws Exception {
		return boardDao.getBoardContents(board_seq);
	}

	@Override
	public List<CommentVO> getBoardCommentList(Map<String, Object> param) throws Exception {
		return boardDao.getBoardCommentList(param);
	}
	@Override
	public List<CommentVO> getBoardCommentList2(Map<String, Object> param) throws Exception {
		return boardDao.getBoardCommentList2(param);
	}
	
	@Override
	public void insertTimelineLike(LikeVO vo) throws Exception {
		boardDao.insertTimelineLike(vo);
	}
	
	@Override
	public int checkTimelineLike(LikeVO vo) throws Exception {
		return boardDao.checkTimelineLike(vo);
	}

	@Override
	public void insertTimelineComment(CommentVO vo) throws Exception {
		boardDao.insertTimelineComment(vo);
	}

	@Override
	public void deleteTimelinePost(Map<String, Object> param) throws Exception {
		boardDao.deleteTimelinePost(param);
	}

	@Override
	public void updateTimelinePost(Map<String, Object> param) throws Exception {
		boardDao.updateTimelinePost(param);
	}

	@Override
	public void deleteIssueContents(Map<String, Object> param) throws Exception {
		boardDao.deleteIssueContents(param);
	}

	@Override
	public void modifyIssue(IssueBoardVO vo) throws Exception {
		boardDao.modifyIssue(vo);
	}
	
	@Override
	public void deleteTimelineComment(Map<String, Object> param) throws Exception {
		boardDao.deleteTimelineComment(param);
	}

	@Override
	public CommentVO getModifyComment(int comment_seq) throws Exception {
		return boardDao.getModifyComment(comment_seq);
	}
	
	@Override
	public void modifyTimelineComment(CommentVO vo) throws Exception {
		boardDao.modifyTimelineComment(vo);
	}

	@Override
	public void deleteIssueComment(Map<String, Object> param) throws Exception {
		boardDao.deleteIssueComment(param);
	}

	@Override
	public CommentVO getModifyIssueComment(int comment_seq) throws Exception {
		return boardDao.getModifyIssueComment(comment_seq);
	}

	@Override
	public void modifyIssueComment(CommentVO vo) throws Exception {
		boardDao.modifyIssueComment(vo);
	}

	@Override
	public void insertIssueRecomment(CommentVO vo) throws Exception {
		boardDao.insertIssueRecomment(vo);
	}

	@Override
	public void insertTimelineRecomment(CommentVO vo) throws Exception {
		boardDao.insertTimelineRecomment(vo);
	}
	
	@Override
	public int checkParentComment(CommentVO vo) {
		return boardDao.checkParentComment(vo);
	}

	@Override
	public List<BoardVO> getMypageBoardList(Map<String, Object> param) throws Exception {
		return boardDao.getMypageBoardList(param);
	}

	@Override
	public List<BoardVO> getMypageAppendBoardList(Map<String, Object> param) throws Exception {
		return boardDao.getMypageAppendBoardList(param);
	}

	@Override
	public CategoryVO getCategoryEx(String cgId) throws Exception {
		return boardDao.getCategoryEx(cgId);
	}
	@Override
	public List<LikeVO> getTimeLineLikePopupList(Map<String, Object> param) throws Exception {
		return boardDao.getTimeLineLikePopupList(param);
	}

}
