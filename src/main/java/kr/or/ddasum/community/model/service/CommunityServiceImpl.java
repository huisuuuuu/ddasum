package kr.or.ddasum.community.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddasum.community.model.dao.CommunityDAO;
import kr.or.ddasum.community.model.vo.Community;
import kr.or.ddasum.community.model.vo.CommunityComment;

@Service
public class CommunityServiceImpl implements CommunityService{

	@Autowired
	private CommunityDAO cDAO;
	
	@Autowired
	SqlSessionTemplate sqlSession;

	int recordCountPerPage = 10;
	int pageCountPerNavi = 6;
	
	@Override
	public HashMap<String, Object> selectAllCommunity(int currentPage) {
	
		ArrayList<Community> list = cDAO.selectAllCommunity(sqlSession, currentPage, recordCountPerPage);
		
		
		String navi = cDAO.getPageNavi(sqlSession, currentPage, recordCountPerPage, pageCountPerNavi);
		
		HashMap<String, Object> map = new HashMap<String, Object> ();
		
		map.put("list", list);
		map.put("navi", navi);
		return map;
	}

	@Override
	public ArrayList<Community> searchCommunity(String type, String keyword, int currentPage) {
		cDAO.searchCommunity(sqlSession, type, keyword, currentPage, recordCountPerPage);
		
		String navi = cDAO.getPageNavi(sqlSession, currentPage, recordCountPerPage, pageCountPerNavi);
		return null;
	}

	@Override
	public HashMap<String, Object> detailOneCommunity(int cNo) {
		
		Community c = cDAO.detailOneCommunity(sqlSession, cNo);
		
		ArrayList <CommunityComment> comList = cDAO.detailComment(sqlSession, cNo); 
		
		HashMap<String, Object> map = new HashMap<String, Object> ();
		
		map.put("community", c);
		map.put("comment", comList);
		
		return map;
	}

	@Override
	public int deleteCommunity(int cNo) {
		int cResult = cDAO.deleteCommunity(sqlSession, cNo);
		return 0;
	}

	@Override
	public int deleteComment(int comNo) {
		int result = cDAO.deleteComment(sqlSession, comNo);
		return 0;
	}

	@Override
	public void hitCommunity(int cNo) { // 조회수 증가
		cDAO.hitCommunity(sqlSession, cNo);
		
	}

	@Override
	public int insertCommunity(Community c) {
		
		return 0;
	}

	@Override
	public int insertComment(CommunityComment cc) {
		cDAO.insertComment(sqlSession, cc);
		return 0;
	}
	
	
	
}
