package kr.or.ddasum.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddasum.member.model.dao.MemberDAO;
import kr.or.ddasum.member.model.vo.BizMember;
import kr.or.ddasum.member.model.vo.Detail;
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
	public BizMember selectRegNoCheck(String regNo) {
		
		return mDAO.selectRegNoCheck(regNo);
	}

	@Override
	public Member findMemberId(Member m) {
		
		return mDAO.findMemberId(m);
	}

	@Override
	public BizMember findBizMemberId(BizMember bm) {
		
		return mDAO.findBizMemberId(bm);
	}

	@Override
	public int findMemberPwd(Member m) {
		
		return mDAO.findMemberPwd(m);
	}

	@Override
	public int findBizMemberPwd(BizMember bm) {
		
		return mDAO.findBizMemberPwd(bm);
	}
	
	@Override
	public HashMap<String, Object> detailMemberList(int currentPage,int userNo) {
		
		int recordCountPerPage = 4;
		
		ArrayList<Detail> list = mDAO.detailMemberList(currentPage, recordCountPerPage, userNo);
		
		int naviCountPerPage = 5;
		
		String pageNavi = mDAO.getPageNavi(currentPage, recordCountPerPage,naviCountPerPage, userNo);
		
		HashMap <String, Object> map = new HashMap <String, Object>();
		
		map.put("list", list);
		map.put("pageNavi", pageNavi);
		
		return map;
	}
	
	@Override
	public int reservationCancle(char reCancle, int userNo) {
		return mDAO.reservationCancle(reCancle, userNo);
		
	}

	@Override
	public int memberWithdraw(String userId) {
		return mDAO.memberWithdraw(userId);
		
	}

	@Override
	public Member memberEmailCheck(String email) {
		
		return mDAO.memberEmailCheck(email);
	}

	@Override
	public BizMember selectBizIdCheck(String bizId) {
		
		return mDAO.selectBizIdCheck(bizId);
	}

	@Override
	public BizMember bizMemberEmailCheck(String bizEmail) {
		
		return mDAO.bizMemberEmailCheck(bizEmail);
	}

	@Override
	public int insertBizMember(BizMember bm) {
		
		return mDAO.insertBizMember(bm);
	}

}
