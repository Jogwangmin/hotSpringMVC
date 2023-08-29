package com.hot.spring.board.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.spring.board.domain.Reply;
import com.hot.spring.board.service.ReplyService;
import com.hot.spring.board.store.ReplyStore;

@Service
public class ReplyServiceImpl implements ReplyService{
	@Autowired
	private ReplyStore rStore;
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int inserReply(Reply reply) {
		int result = rStore.insertReply(sqlSession, reply);
		return result;
	}

	@Override
	public int updateReply(Reply reply) {
		int result = rStore.updateReply(sqlSession, reply);
		return result;
	}

	@Override
	public int deleteReply(Reply reply) {
		int result = rStore.deleteReply(sqlSession, reply);
		return result;
	}

	@Override
	public List<Reply> selectReplyList(int refBoardNo) {
		List<Reply> rList = rStore.selectReplyList(sqlSession, refBoardNo);
		return rList;
	}

}
