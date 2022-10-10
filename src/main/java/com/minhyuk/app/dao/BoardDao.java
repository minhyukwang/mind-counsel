package com.minhyuk.app.dao;

import java.util.List;
import java.util.Map;

import com.minhyuk.app.vo.BoardVO;
import com.minhyuk.app.vo.CategoryVO;
import com.minhyuk.app.vo.CommentVO;
import com.minhyuk.app.vo.IssueBoardVO;
import com.minhyuk.app.vo.LikeVO;

/**
 * 게시판 관련 Dao Interface
 */
public interface BoardDao 
{
	// 이슈게시판 시작
	public List<IssueBoardVO> getTitleList();
	public IssueBoardVO getIssueContents(int seq);
	public void insertIssue(IssueBoardVO vo);
	public void insertComment(CommentVO vo);
	public void insertLike(LikeVO vo);
	
	public List<CommentVO> getIssueCommentList(int seq);
	public List<CommentVO> getIssueCommentList2(List<Integer> arr);
	public int getIssuePreSeq(int seq);
	public int getIssueNextSeq(int seq);
	public List<LikeVO> getLikeList(int seq);
	public int checkLike(LikeVO vo);
	public void deleteIssueContents(Map<String, Object> param);
	public void modifyIssue(IssueBoardVO vo);
	public void deleteIssueComment(Map<String, Object> param);
	public CommentVO getModifyIssueComment(int comment_seq);
	public void modifyIssueComment(CommentVO vo);
	public void insertIssueRecomment(CommentVO vo);
	// 이슈게시판 종료
	
	// 타임라인 시작
	public List<CategoryVO> getCategoryList();
	public List<BoardVO> getBoardList(Map<String, Object> param);
	public List<BoardVO> getAppendBoardList(Map<String, Object> param);
	public void insertTimeline(BoardVO vo);
	public BoardVO getBoardNotice();
	public BoardVO getBoardContents(int board_seq);
	public List<CommentVO> getBoardCommentList(Map<String, Object> param);
	public List<CommentVO> getBoardCommentList2(Map<String, Object> param);
	public void insertTimelineLike(LikeVO vo);
	public int checkTimelineLike(LikeVO vo);
	public void insertTimelineComment(CommentVO vo);
	public void deleteTimelinePost(Map<String, Object> param);
	public void updateTimelinePost(Map<String, Object> param);
	public void deleteTimelineComment(Map<String, Object> param);
	public CommentVO getModifyComment(int comment_seq);
	public void modifyTimelineComment(CommentVO vo);
	public void insertTimelineRecomment(CommentVO vo);
	public int checkParentComment(CommentVO vo);
	public List<BoardVO> getMypageBoardList(Map<String, Object> param);
	public List<BoardVO> getMypageAppendBoardList(Map<String, Object> param);
	public CategoryVO getCategoryEx(String cgId);
	public List<LikeVO> getTimeLineLikePopupList(Map<String, Object> param);
	// 타임라인 종료
}
