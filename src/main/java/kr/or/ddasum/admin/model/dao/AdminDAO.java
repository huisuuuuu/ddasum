package kr.or.ddasum.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.ddasum.admin.model.vo.AdminMember;
import kr.or.ddasum.member.model.vo.Detail;
 
@Repository
public class AdminDAO {
	
	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<AdminMember> adminSelectAllMember(int currentPage,	int recordCountPerPage) {	
		int start = (currentPage - 1) * recordCountPerPage;
		int end = recordCountPerPage;
		RowBounds rb = new RowBounds(start, end);
		return new ArrayList<AdminMember> (sqlSession.selectList("admin.adminSelectAllMember", null, rb));
	}
	
	public int recordTotalCount() {
		return sqlSession.selectOne("admin.selectAllMemberTotalCount");
	}
	
	public ArrayList<Detail> adminMemberDetail(int currentPage, int recordCountPerPage, int userNo) {
		int start = (currentPage - 1) * recordCountPerPage;
		int end = recordCountPerPage;
		RowBounds rb = new RowBounds(start, end);
		return new ArrayList<Detail> (sqlSession.selectList("admin.adminMemberDetail", null, rb));
	}

	public int memberRecordTotalCount() {
		return sqlSession.selectOne("admin.memberDetailTotalCount");
	}

}
