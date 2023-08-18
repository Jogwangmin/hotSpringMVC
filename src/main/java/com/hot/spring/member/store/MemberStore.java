package com.hot.spring.member.store;

import org.apache.ibatis.session.SqlSession;

import com.hot.spring.member.domain.Member;

public interface MemberStore {

	public int insertMember(SqlSession session, Member member);

	public Member checkMemberLogin(SqlSession session, Member member);

	public Member selectOneById(SqlSession session, String memberId);

	public int updateMember(SqlSession session, Member member);

	public int deleteMember(SqlSession session, String memberId);


}
