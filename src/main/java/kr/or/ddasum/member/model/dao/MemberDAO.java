package kr.or.ddasum.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.ddasum.member.model.vo.BizMember;
import kr.or.ddasum.member.model.vo.Detail;
import kr.or.ddasum.member.model.vo.Member;

@Repository
public class MemberDAO {

	@Autowired
	@Qualifier(value = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public Member memberLogin(Member member) {

		return sqlSession.selectOne("member.memberLogin", member);

	}

	public BizMember memberLogin(BizMember bizMember) {

		return sqlSession.selectOne("bizMember.selectLoginBizMember", bizMember);
	}

	public int memberInfoUpdate(Member m) {

		return sqlSession.update("member.memberInfoUpdate", m);

	}

	public int insertMember(Member m) {

		return sqlSession.insert("member.memberJoin", m);
	}

	public Member selectIdCheck(String userId) {

		return sqlSession.selectOne("member.selectIdCheck", userId);
	}

	public Member selectNickCheck(String nick) {

		return sqlSession.selectOne("member.selectNickCheck", nick);
	}

	public BizMember selectRegNumCheck(String regNo) {

		return sqlSession.selectOne("bizMember.selectRegNumCheck", regNo);
	}

	public Member findMemberId(Member m) {
		
		return sqlSession.selectOne("member.findMemberId", m);
	}

	public BizMember findBizMemberId(BizMember bm) {
		
		return sqlSession.selectOne("bizMember.findBizMemberId", bm);
	}

	public int findMemberPwd(Member m) {
		
		return sqlSession.update("member.findeMemberPwd", m);
	}

	public int findBizMemberPwd(BizMember bm) {
		return sqlSession.update("bizMember.findBizMemberPwd", bm);
	}
	
	public ArrayList<Detail> detailMemberList(int currentPage, int recordCountPerPage, int userNo) {
		
		RowBounds rb = new RowBounds(((currentPage-1)*recordCountPerPage),recordCountPerPage);
		
		
		ArrayList<Detail> list = new ArrayList<Detail>(sqlSession.selectList("member.detailMemberList",userNo, rb));
		
		return list;
	}

	public String getPageNavi(int currentPage, int recordCountPerPage, int naviCountPerPage, int userNo) {
		
		int recordTotalCount = totalCount(userNo);
		
		int pageTotalCount;
		
		pageTotalCount =(int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
		
		int startNavi = ((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1;
		int endNavi = startNavi + naviCountPerPage - 1;
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		StringBuilder sb = new StringBuilder();

		if(startNavi!=1) {
			sb.append("<li><a href='/member/reservationPage.do?currentPage="+(startNavi-1)+"'><i class='fas fa-chevron-left'></i></a></li>");
		}

		for(int i=startNavi; i<=endNavi; i++) {
			
			if(i==currentPage) {
				sb.append("<li><a href='/member/reservationPage.do?currentPage="+i+"' class='page_active'>"+i+"</a></li>");
			}else {
				sb.append("<li><a href='/member/reservationPage.do?currentPage="+i+"'>"+i+"</a></li>");
			}
		}

		if(endNavi!=pageTotalCount) {
			sb.append("<li><a href='/member/reservationPage.do?currentPage="+(endNavi+1)+"'><i class='fas fa-chevron-right'></i></a></li>");
		}
		
		return sb.toString();
	}

	private int totalCount(int userNo) {
		return sqlSession.selectOne("member.selectDetailTotalCount",userNo);
		
	}
	
	public int reservationCancle(char reCancle, int userNo) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("reCancle", reCancle);
		map.put("userNo", userNo);

		return sqlSession.update("member.reservationCancleBtn", map);
		
	}

	public int memberWithdraw(String userId) {
		return sqlSession.update("member.withdraw",userId);
		
	}

	public Member memberEmailCheck(String email) {
		
		return sqlSession.selectOne("member.memberEmailCheck", email);
	}

	public BizMember selectBizIdCheck(String bizId) {
		return sqlSession.selectOne("bizMember.selectBizIdCheck", bizId);
	}

	public BizMember bizMemberEmailCheck(String bizEmail) {
		
		return sqlSession.selectOne("bizMember.bizMemberEmailCheck", bizEmail);
	}

	public int insertBizMember(BizMember bm) {
		
		return sqlSession.insert("bizMember.insertBizMember", bm);
		
	}

}
