package com.hot.spring.notice.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.hot.spring.notice.domain.Notice;
import com.hot.spring.notice.domain.PageInfo;

public interface NoticeStore {

	/**
	 * 공지사항 등록 Store
	 * @param session
	 * @param notice
	 * @return int
	 */
	int insertNotice(SqlSession session, Notice notice);

	/**
	 * 공지사항 목록 조회 Store
	 * @param session
	 * @param pInfo
	 * @return
	 */
	List<Notice> selectNoticeList(SqlSession session, PageInfo pInfo);

	/**
	 * 공지사항 페이지 갯수
	 * @param session
	 * @return
	 */
	int selectListCount(SqlSession session);
	/**
	 * 공지사항 전체 조회 Store
	 * @param session
	 * @param searchKeyword
	 * @return
	 */
	List<Notice> selectNoticesByAll(SqlSession session, String searchKeyword);

	/**
	 * 공지사항 작성자로 조회 Store
	 * @param session
	 * @param searchKeyword 
	 * @return
	 */
	List<Notice> selectNoticesByWriter(SqlSession session, String searchKeyword);

	/**
	 * 공지사항 제목으로 조회 Store
	 * @param session
	 * @param searchKeyword 
	 * @return
	 */
	List<Notice> selectNoticesByTitle(SqlSession session, String searchKeyword);
	/**
	 * 공지사항 내용으로 조회 Store
	 * @param session
	 * @param searchKeyword 
	 * @return
	 */
	List<Notice> selectNoticesByContent(SqlSession session, String searchKeyword);

	/**
	 * 공지사항 조건에 따라 키워드로 조회 Store
	 * @param session
	 * @param pInfo 
	 * @param searchCondition
	 * @param searchKeyword
	 * @return
	 */
	List<Notice> selectNoticesByKeyword(SqlSession session, PageInfo pInfo, Map<String, String> paramMap);

	/**
	 * 공지사항 검색 게시물 전체 갯수 Store
	 * @param session
	 * @param paramMap
	 * @return
	 */
	int selectListCount(SqlSession session, Map<String, String> paramMap);


}
