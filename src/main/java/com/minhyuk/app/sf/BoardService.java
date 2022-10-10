package com.minhyuk.app.sf;

import java.util.List;
import java.util.Map;

import com.minhyuk.app.vo.BoardVO;
import com.minhyuk.app.vo.CategoryVO;
import com.minhyuk.app.vo.CommentVO;
import com.minhyuk.app.vo.IssueBoardVO;
import com.minhyuk.app.vo.LikeVO;

/**
 * 게시판 관련 service interface
 */
public interface BoardService 
{
	// 이슈게시판 시작
	public List<IssueBoardVO> getTitleList() throws Exception;
	public IssueBoardVO getIssueContents(int seq) throws Exception;
	public void insertIssue(IssueBoardVO vo) throws Exception;
	public void insertComment(CommentVO vo) throws Exception;
	public void insertLike(LikeVO vo) throws Exception;
	
	public List<CommentVO> getIssueCommentList(int seq) throws Exception;
	public List<CommentVO> getIssueCommentList2(List<Integer> array) throws Exception;
	public int getIssuePreSeq(int seq) throws Exception;
	public int getIssueNextSeq(int seq) throws Exception;
	public List<LikeVO> getLikeList(int seq) throws Exception;
	public int checkLike(LikeVO vo) throws Exception;
	public void deleteIssueContents(Map<String, Object> param) throws Exception;
	public void modifyIssue(IssueBoardVO vo) throws Exception;
	public void deleteIssueComment(Map<String, Object> param) throws Exception;
	public CommentVO getModifyIssueComment(int comment_seq) throws Exception;
	public void modifyIssueComment(CommentVO vo) throws Exception;
	public void insertIssueRecomment(CommentVO vo) throws Exception;
	// 이슈게시판 종료
	
	// 타임라인 시작
	public List<CategoryVO> getCategoryList() throws Exception;
	public List<BoardVO> getBoardList(Map<String, Object> param) throws Exception;
	public List<BoardVO> getAppendBoardList(Map<String, Object> param) throws Exception;
	public void insertTimeline(BoardVO vo) throws Exception;
	public BoardVO getBoardNotice() throws Exception;
	public BoardVO getBoardContents(int board_seq) throws Exception;
	public List<CommentVO> getBoardCommentList(Map<String, Object> param) throws Exception;
	//public List<CommentVO> getBoardCommentList(int board_seq) throws Exception;
	//public List<CommentVO> getBoardCommentList2(List<Integer> array) throws Exception;
	public List<CommentVO> getBoardCommentList2(Map<String, Object> param) throws Exception;
	public void insertTimelineLike(LikeVO vo) throws Exception;
	public int checkTimelineLike(LikeVO vo) throws Exception;
	public void insertTimelineComment(CommentVO vo) throws Exception;
	public void deleteTimelinePost(Map<String, Object> param) throws Exception;
	public void updateTimelinePost(Map<String, Object> param) throws Exception;
	public void deleteTimelineComment(Map<String, Object> param) throws Exception;
	public CommentVO getModifyComment(int comment_seq) throws Exception;
	public void modifyTimelineComment(CommentVO vo) throws Exception;
	public void insertTimelineRecomment(CommentVO vo) throws Exception;
	public int checkParentComment(CommentVO vo);
	public List<BoardVO> getMypageBoardList(Map<String, Object> param) throws Exception;
	public List<BoardVO> getMypageAppendBoardList(Map<String, Object> param) throws Exception;
	public CategoryVO getCategoryEx(String cgId) throws Exception;
	public List<LikeVO> getTimeLineLikePopupList(Map<String, Object> param) throws Exception;
	// 타임라인 종료
}
