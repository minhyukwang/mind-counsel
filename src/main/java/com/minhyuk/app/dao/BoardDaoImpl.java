package com.minhyuk.app.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.minhyuk.app.vo.BoardVO;
import com.minhyuk.app.vo.CategoryVO;
import com.minhyuk.app.vo.CommentVO;
import com.minhyuk.app.vo.IssueBoardVO;
import com.minhyuk.app.vo.LikeVO;

import javax.inject.Inject;

/**
 * 게시판 관련 Dao 구현 class
 */
@Repository
public class BoardDaoImpl implements BoardDao {

    @Autowired
    private SqlSessionTemplate sm;

    @Override
    public List<IssueBoardVO> getTitleList() {
        return sm.selectList("IssueBoard.selectTitleList");
    }

    @Override
    public void insertIssue(IssueBoardVO vo) {
        sm.insert("IssueBoard.insertIssue", vo);
    }

    @Override
    public void insertComment(CommentVO vo) {
        sm.insert("IssueBoard.insertComment", vo);
    }

    @Override
    public void insertLike(LikeVO vo) {
        sm.insert("IssueBoard.insertLike", vo);
    }

    @Override
    public IssueBoardVO getIssueContents(int seq) {
        return sm.selectOne("IssueBoard.selectIssueContents", seq);
    }

    @Override
    public List<CommentVO> getIssueCommentList(int seq) {
        return sm.selectList("IssueBoard.selectIssueCommentList", seq);
    }

    @Override
    public List<CommentVO> getIssueCommentList2(List<Integer> arr) {
        return sm.selectList("IssueBoard.selectIssueCommentList2", arr);
    }

    @Override
    public int getIssuePreSeq(int seq) {
        return sm.selectOne("IssueBoard.selectIssuePreSeq", seq);
    }

    @Override
    public int getIssueNextSeq(int seq) {
        return sm.selectOne("IssueBoard.selectIssueNextSeq", seq);
    }

    @Override
    public List<LikeVO> getLikeList(int seq) {
        return sm.selectList("IssueBoard.selectLikeList", seq);
    }

    @Override
    public int checkLike(LikeVO vo) {
        return sm.selectOne("IssueBoard.selectCheckLike", vo);
    }

    @Override
    public List<CategoryVO> getCategoryList() {
        return sm.selectList("TimelineBoard.selectCategoryList");
    }

    @Override
    public List<BoardVO> getBoardList(Map<String, Object> param) {
        return sm.selectList("TimelineBoard.selectBoardList", param);
    }

    @Override
    public List<BoardVO> getAppendBoardList(Map<String, Object> param) {
        return sm.selectList("TimelineBoard.selectAppendBoardList", param);
    }

    @Override
    public void insertTimeline(BoardVO vo) {
        sm.insert("TimelineBoard.insertTimeline", vo);
    }

    @Override
    public BoardVO getBoardNotice() {
        return sm.selectOne("TimelineBoard.selectBoardNotice");
    }

    @Override
    public BoardVO getBoardContents(int board_seq) {
        return sm.selectOne("TimelineBoard.selectBoardContents", board_seq);
    }

    @Override
    public List<CommentVO> getBoardCommentList(Map<String, Object> param) {
        return sm.selectList("TimelineBoard.selectBoardCommentList", param);
    }

    @Override
    public List<CommentVO> getBoardCommentList2(Map<String, Object> param) {
        return sm.selectList("TimelineBoard.selectBoardCommentList2", param);
    }

    @Override
    public void insertTimelineLike(LikeVO vo) {
        sm.insert("TimelineBoard.insertLike", vo);
    }

    @Override
    public int checkTimelineLike(LikeVO vo) {
        return sm.selectOne("TimelineBoard.selectCheckLike", vo);
    }

    @Override
    public void insertTimelineComment(CommentVO vo) {
        sm.insert("TimelineBoard.insertComment", vo);
    }

    @Override
    public void deleteTimelinePost(Map<String, Object> param) {
        sm.update("TimelineBoard.deletePost", param);
    }

    @Override
    public void updateTimelinePost(Map<String, Object> param) {
        sm.update("TimelineBoard.updatePost", param);

    }

    @Override
    public void deleteIssueContents(Map<String, Object> param) {
        sm.update("IssueBoard.deleteIssueContents", param);
    }

    @Override
    public void modifyIssue(IssueBoardVO vo) {
        sm.update("IssueBoard.modifyIssue", vo);
    }

    @Override
    public void deleteTimelineComment(Map<String, Object> param) {
        sm.update("TimelineBoard.deleteComment", param);
    }

    @Override
    public CommentVO getModifyComment(int comment_seq) {
        return sm.selectOne("TimelineBoard.selectModifyComment", comment_seq);
    }

    @Override
    public void modifyTimelineComment(CommentVO vo) {
        sm.update("TimelineBoard.modifyComment", vo);
    }

    @Override
    public void deleteIssueComment(Map<String, Object> param) {
        sm.update("IssueBoard.deleteComment", param);
    }

    @Override
    public CommentVO getModifyIssueComment(int comment_seq) {
        return sm.selectOne("IssueBoard.selectModifyComment", comment_seq);
    }

    @Override
    public void modifyIssueComment(CommentVO vo) {
        sm.update("IssueBoard.modifyComment", vo);
    }

    @Override
    public void insertIssueRecomment(CommentVO vo) {
        sm.insert("IssueBoard.insertRecomment", vo);
    }

    @Override
    public void insertTimelineRecomment(CommentVO vo) {
        sm.insert("TimelineBoard.insertRecomment", vo);
    }

    @Override
    public int checkParentComment(CommentVO vo) {
        return sm.selectOne("TimelineBoard.checkParentComment", vo);
    }

    @Override
    public List<BoardVO> getMypageBoardList(Map<String, Object> param) {
        return sm.selectList("TimelineBoard.selectMypageBoardList", param);
    }

    @Override
    public List<BoardVO> getMypageAppendBoardList(Map<String, Object> param) {
        return sm.selectList("TimelineBoard.selectMypageAppendBoardList", param);
    }

    @Override
    public CategoryVO getCategoryEx(String cgId) {
        return sm.selectOne("TimelineBoard.selectCategoryEx", cgId);
    }

    @Override
    public List<LikeVO> getTimeLineLikePopupList(Map<String, Object> param) {
        return sm.selectList("TimelineBoard.selectTimeLineLikePopupList", param);
    }

}
