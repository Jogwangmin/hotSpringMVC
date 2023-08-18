package com.hot.spring.member.service;

import com.hot.spring.member.domain.Member;

public interface MemberService {

	/**
	 * 회원가입 기능
	 * @param member
	 * @return int
	 */
	int insertMember(Member member);

	
	/**
	 * 회원 로그인 service
	 * @param member
	 * @return
	 */
	Member checkMemberLogin(Member member);

	/**
	 * 회원 상제 정보 조회 service
	 * @param memberId
	 * @return
	 */
	Member getMemberById(String memberId);

	/**
	 * 회원정보 수정 Service
	 * @param member
	 * @return int
	 */
	int updateMember(Member member);

	/**
	 * 회원 탈퇴 Service, update로 할 예정
	 * @param memberId
	 * @return int
	 */
	int deleteMember(String memberId);

}
