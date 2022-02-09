package kr.or.ddasum.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.ddasum.admin.model.vo.AdminMember;
 
@Repository
public class AdminDAO {
	
	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<AdminMember> adminMemberManageList() {
		
		return new ArrayList<AdminMember> (sqlSession.selectList("admin.adminMemberManageList"));
	}
}
