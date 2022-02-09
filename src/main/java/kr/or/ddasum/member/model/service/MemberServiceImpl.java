package kr.or.ddasum.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddasum.common.SHA256Util;
import kr.or.ddasum.member.model.dao.MemberDAO;
import kr.or.ddasum.member.model.vo.BizMember;
import kr.or.ddasum.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO mDAO;
	
	@Override
	public Member memberLogin(Member member) {

		return mDAO.memberLogin(member);
	}
	
	@Override
	public BizMember bizMemberLogin(BizMember bizMember) {
		return mDAO.memberLogin(bizMember);
	}

	@Override
	public int memberInfoUpdate(Member m) {
		return mDAO.memberInfoUpdate(m);
	}

	@Override
	public int insertMember(Member m) {
		
		return mDAO.insertMember(m);
	}

	@Override
	public Member selectIdCheck(String userId) {
		
		return mDAO.selectIdCheck(userId);
	}

	@Override
	public Member selectNickCheck(String nick) {
		
		return mDAO.selectNickCheck(nick);
	}

	@Override
	public BizMember selectRegNumCheck(String regNo) {
		
		return mDAO.selectRegNumCheck(regNo);
	}

	@Override
	public Member findMemberId(Member m) {
		
		return mDAO.findMemberId(m);
	}

	@Override
	public BizMember findBizMemberId(BizMember bm) {
		
		return mDAO.findBizMemberId(bm);
	}

}
