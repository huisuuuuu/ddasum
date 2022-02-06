package kr.or.ddasum.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddasum.member.model.dao.MemberDAO;
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
	public int memberInfoUpdate(Member m) {
		return mDAO.memberInfoUpdate(m);
	}

}
