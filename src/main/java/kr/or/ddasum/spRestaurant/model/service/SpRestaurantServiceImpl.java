package kr.or.ddasum.spRestaurant.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddasum.spRestaurant.model.dao.SpRestaurantDAO;
import kr.or.ddasum.spRestaurant.model.vo.SpMenu;
import kr.or.ddasum.spRestaurant.model.vo.SpRestaurant;

@Service
public class SpRestaurantServiceImpl implements SpRestaurantService{

	@Autowired
	private SpRestaurantDAO srDAO;
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public HashMap<String, Object> selectAllSpRestaurant(HashMap<String, Object> terms) {
		int recordCountPerPage = 12;
		int naviCountPerPage = 6;
		
		ArrayList<SpRestaurant> list = srDAO.selectAllSpRestaurant(sqlSession, terms, recordCountPerPage);
		
		String navi = srDAO.getPageNavi(sqlSession, terms, recordCountPerPage, naviCountPerPage);
		
		HashMap <String, Object> map = new HashMap <String, Object>();
		map.put("list", list);
		map.put("navi", navi);
		
		return map;
	}

	@Override
	public HashMap<String, Object> selectOneSpRestaurant(int bizNo) {
		
		SpRestaurant sr = srDAO.selectOneSpRestaurant(sqlSession, bizNo);
		ArrayList<SpMenu> mList = srDAO.selectAllBizMenu(sqlSession, bizNo);
		
		HashMap <String, Object> map = new HashMap <String, Object>();
		map.put("sr", sr);
		map.put("mList", mList);
		
		return map;
	}
}
