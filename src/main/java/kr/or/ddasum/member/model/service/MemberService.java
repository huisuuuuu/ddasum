package kr.or.ddasum.member.model.service;

import java.util.HashMap;

import kr.or.ddasum.member.model.vo.BizMember;
import kr.or.ddasum.member.model.vo.Member;

public interface MemberService {

	Member memberLogin(Member member);

	int memberInfoUpdate(Member m);

	BizMember bizMemberLogin(BizMember bizMember);

	int insertMember(Member m);

	Member selectIdCheck(String userId);

	Member selectNickCheck(String nick);

	BizMember selectRegNoCheck(String regNo);

	Member findMemberId(Member m);

	BizMember findBizMemberId(BizMember bm);

	int findMemberPwd(Member m);

	int findBizMemberPwd(BizMember bm);

	Member memberEmailCheck(String email);

	BizMember selectBizIdCheck(String bizId);

	BizMember bizMemberEmailCheck(String bizEmail);

	int insertBizMember(BizMember bm);

	HashMap<String, Object> detailMemberList(int currentPage, int userNo);
	
	int reservationCancle(char reCancle, int userNo);

	int memberWithdraw(String userId);

}
