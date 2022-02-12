package kr.or.ddasum.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddasum.admin.model.dao.AdminDAO;
import kr.or.ddasum.admin.model.vo.AdminMember;
import kr.or.ddasum.member.model.vo.Detail;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO admDAO;	
	
	@Autowired
	SqlSessionTemplate sqlSession;
			
	@Override
	public ArrayList<AdminMember> adminSelectAllMember(int currentPage, int recordCountPerPage) {

		return admDAO.adminSelectAllMember(currentPage, recordCountPerPage);
	}

	@Override
	public int memberTotalCount() {
		return admDAO.recordTotalCount();
	}

	@Override
	public ArrayList<Detail> adminMemberDetail(int currentPage, int recordCountPerPage, int userNo) {
		
		return admDAO.adminMemberDetail(currentPage, recordCountPerPage, userNo);
		
	}

	@Override
	public int detailTotalCount() {
		return admDAO.memberDetailTotalCount();
	}

//	@Override
//	public ArrayList<Card> adminSelectAllCardList(int currentPage, int recordCountPerPage) {
//		return admDAO.adminSelectAllCardList(currentPage, recordCountPerPage);
//	}
//
//	@Override
//	public int cardTotalCount() {
//		
//		return admDAO.selectAllCardMemberTotalCount();
//
//	}




	

}
