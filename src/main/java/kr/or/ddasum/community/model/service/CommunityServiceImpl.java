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
	int naviCountPerPage = 6;
	
	@Override
	public HashMap<String, Object> selectAllCommunity(int currentPage) {
		//게시물 리스트 받기
		ArrayList<Community> list = cDAO.selectAllCommunity(sqlSession, currentPage, recordCountPerPage);
		//페이징 네비바
		String navi = cDAO.getPageNavi(sqlSession, currentPage, recordCountPerPage, naviCountPerPage);
		
		HashMap<String, Object> map = new HashMap<String, Object> ();
		
		map.put("list", list);
		map.put("navi", navi);
		return map;
	}

	@Override
	public HashMap<String, Object> searchCommunity(HashMap<String, String> search, int currentPage) {
		//검색된 게시물 리스트 받기
		ArrayList<Community> list = cDAO.searchCommunity(sqlSession, search, currentPage, recordCountPerPage);
		//페이징 네비바
		String navi = cDAO.getPageNavi(sqlSession, currentPage, recordCountPerPage, naviCountPerPage);
		
		HashMap<String, Object> map = new HashMap<String, Object> ();
		
		map.put("list", list);
		map.put("navi", navi);
		
		return map;
	}

	@Override
	public HashMap<String, Object> detailOneCommunity(int cNo) {
		//게시물 한개 가져오기
		Community c = cDAO.detailOneCommunity(sqlSession, cNo);
		//게시물에 해당되는 댓글 리스트로 가져오기
		ArrayList <CommunityComment> comList = cDAO.detailComment(sqlSession, cNo); 
		
		HashMap<String, Object> map = new HashMap<String, Object> ();
		
		map.put("community", c);
		map.put("comment", comList);
		
		return map;
	}

	@Override
	public int deleteCommunity(int cNo) {
		int cResult = cDAO.deleteCommunity(sqlSession, cNo);
		System.out.println(cResult);
		return cResult;
	}

	@Override
	public int deleteComment(int comNo) {
		int result = cDAO.deleteComment(sqlSession, comNo);
		return result;
	}

	@Override
	public void hitCommunity(int cNo) { // 조회수 증가
		cDAO.hitCommunity(sqlSession, cNo);
		
	}

	@Override
	public int insertCommunity(Community c) {
		
		return cDAO.insertCommunity(sqlSession, c);
	}

	@Override
	public int insertComment(CommunityComment cc) {
		// 코멘트 순서정렬을 위해 코멘트 순서를 가져오는 로직
		int cNo = cc.getcNo();
		int comOrder = cDAO.getOrder(sqlSession, cNo);
		// 가져온 순서를 입력할 코멘트 정보에 추가
		cc.setComOrder(comOrder);

		return cDAO.insertComment(sqlSession, cc);
	}

	@Override
	public Community selectCommunity(int cNo) {
		
		return cDAO.detailOneCommunity(sqlSession, cNo);
	}

	@Override
	public int updateCommunity(Community c) {
		
		return cDAO.updateCommunity(sqlSession, c);
	}

	@Override
	public int updateComment(CommunityComment cc) {
		
		return cDAO.updateComment(sqlSession, cc);
	}
	
}
