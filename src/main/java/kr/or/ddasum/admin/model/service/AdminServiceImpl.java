package kr.or.ddasum.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddasum.admin.model.dao.AdminDAO;
import kr.or.ddasum.admin.model.vo.AdminMember;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO admDAO;
	
	
//	int recordCountPerPage = 10;
//	int naviCountPerPage = 5;
	
	@Override
	public ArrayList<AdminMember> adminSelectAllMember(int currentPage, int recordCountPerPage) {

		return admDAO.adminSelectAllMember(currentPage, recordCountPerPage);
		
//		String pageNavi = admDAO.getPageNavi( currentPage, recordCountPerPage, naviCountPerPage);
//		
//		HashMap<String, Object> map = new HashMap<String, Object> ();
		
//		map.put("list", list);
//		map.put("pageNavi", pageNavi);
//		
//		return map;
	}

	public int memberTotalCount() {
		return admDAO.recordTotalCount();
	}

	

}
