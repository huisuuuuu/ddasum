package kr.or.ddasum.member.model.service;

import kr.or.ddasum.member.model.vo.BizMember;
import kr.or.ddasum.member.model.vo.Member;

public interface MemberService {

	Member memberLogin(Member member);

	int memberInfoUpdate(Member m);

	BizMember bizMemberLogin(BizMember bizMember);

	int insertMember(Member m);
}
