package kr.or.ddasum.dcRestaurant.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.ddasum.member.model.vo.BizMember;

@Repository
public class DcRestaurantDAO {
	
	@Autowired
	@Qualifier(value = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public int dcRestaurantTotalCount(String area) {
		
		return sqlSession.selectOne("dcReataurant.dcRestaurantTotalCount");
	}

	public ArrayList<BizMember> selectAllDcRestaurantList(int currentPage, int recordCountPerPage, String area,
			String filter) {
		
		//첫번째 인자는 offset 값, 두번째 인자는 limit 값
		int offset = ((currentPage - 1)*recordCountPerPage);
		int limit = recordCountPerPage;
		RowBounds rb = new RowBounds(offset,limit);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("area", area);
		map.put("filter", filter);
		
		return new ArrayList<BizMember>(sqlSession.selectList("dcReataurant.selectAllDcRestaurantList",map,rb));
		
	}


}
