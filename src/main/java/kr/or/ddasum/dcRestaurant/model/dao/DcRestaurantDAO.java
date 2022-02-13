package kr.or.ddasum.dcRestaurant.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.ddasum.dcRestaurant.model.vo.DcRestaurant;
import kr.or.ddasum.dcRestaurant.model.vo.DcRestaurantMenu;
import kr.or.ddasum.member.model.vo.BizMember;

@Repository
public class DcRestaurantDAO {
	
	@Autowired
	@Qualifier(value = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public int dcRestaurantTotalCount(String area) {
		
		return sqlSession.selectOne("dcRestaurant.dcRestaurantTotalCount",area);
	}

	public ArrayList<DcRestaurant> selectDcRestaurantList(int currentPage, int recordCountPerPage, String area, String restaurant, String filter) {
		
		//첫번째 인자는 offset 값, 두번째 인자는 limit 값
		int offset = ((currentPage - 1)*recordCountPerPage);
		int limit = recordCountPerPage;
		RowBounds rb = new RowBounds(offset,limit);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("area", area);
		map.put("restaurant", restaurant);
		map.put("filter", filter);
		
		return new ArrayList<DcRestaurant>(sqlSession.selectList("dcRestaurant.selectAllDcRestaurantList",map,rb));
		
	}
	
	public ArrayList<BizMember> selectDcRestaurantList(int currentPage, int recordCountPerPage, String area,String filter) {
		
		//첫번째 인자는 offset 값, 두번째 인자는 limit 값
		int offset = ((currentPage - 1)*recordCountPerPage);
		int limit = recordCountPerPage;
		RowBounds rb = new RowBounds(offset,limit);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("area", area);
		map.put("filter", filter);
		
		return new ArrayList<BizMember>(sqlSession.selectList("dcRestaurant.selectDcRestaurantList",map,rb));
		
	}

	public BizMember selectoneDcRestaurant(int bizNo) {
		
		return sqlSession.selectOne("dcRestaurant.selectoneDcRestaurant",bizNo);
	}

	public ArrayList<DcRestaurantMenu> selectAllDcMenu(int bizNo) {
		
		return new ArrayList<DcRestaurantMenu>(sqlSession.selectList("dcRestaurant.selectAllDcMenu",bizNo));
	}

	public int reservation(String bizNo, String userNo, String menuNo, String reNo) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("bizNo", bizNo);
		map.put("userNo", userNo);
		map.put("menuNo", menuNo);
		map.put("reNo", reNo);
		
		return sqlSession.insert("dcRestaurant.reservation",map);
	}


}
