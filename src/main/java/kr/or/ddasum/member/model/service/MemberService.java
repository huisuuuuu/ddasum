package kr.or.ddasum.member.model.service;

import kr.or.ddasum.member.model.vo.Member;

public interface MemberService {

	//정두식 추가코드(시작)
	Member memberLogin(Member member);

	int memberInfoUpdate(Member m);
	//정두식 추가코드(끝)
}
