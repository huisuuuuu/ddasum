package kr.or.ddasum.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.ddasum.member.model.vo.BizMember;
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

}
