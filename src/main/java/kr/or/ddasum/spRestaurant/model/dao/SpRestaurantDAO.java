package kr.or.ddasum.spRestaurant.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.or.ddasum.spRestaurant.model.vo.SpMenu;
import kr.or.ddasum.spRestaurant.model.vo.SpRestaurant;

@Repository
public class SpRestaurantDAO {

	public ArrayList<SpRestaurant> selectAllSpRestaurant(SqlSession sqlSession, HashMap<String, Object> terms, int recordCountPerPage) {
		
		int currentPage = (int) terms.get("currentPage");
		int offset = ((currentPage-1)*recordCountPerPage);
		int limit = recordCountPerPage;
		
		RowBounds rb = new RowBounds(offset, limit);
		
		return new ArrayList<SpRestaurant> (sqlSession.selectList("spRestaurant.selectAllSpRestaurant", terms, rb));
	}

	public String getPageNavi(SqlSession sqlSession, HashMap<String, Object> terms, int recordCountPerPage, int naviCountPerPage) {
		int spRestaurantAllCount = spRestaurantAllCount(sqlSession, terms);
		
		int currentPage = (int)terms.get("currentPage");
		
		int pageTotalCount = (int)Math.ceil(spRestaurantAllCount/(double)recordCountPerPage);

		int startNavi = (((currentPage - 1) / naviCountPerPage) * naviCountPerPage) + 1;
		
		int endNavi = startNavi + (naviCountPerPage - 1);
		
		if(endNavi>pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		StringBuilder sb = new StringBuilder();

		if(startNavi!=1) {
			sb.append("<li><a href='/spRestaurant/spRestaurantList.do?currentPage="+(startNavi-1)+"'><i class='fas fa-chevron-left'></i></a></li>");
		}

		for(int i=startNavi; i<=endNavi; i++) {
			
			if(i==currentPage) {
				sb.append("<li><a href='/spRestaurant/spRestaurantList.do?currentPage="+i+"' class='page_active'>"+i+"</a></li>");
			}else {
				sb.append("<li><a href='/spRestaurant/spRestaurantList.do?currentPage="+i+"'>"+i+"</a></li>");
			}
		}

		if(endNavi!=pageTotalCount) {
			sb.append("<li><a href='/spRestaurant/spRestaurantList.do?currentPage="+(endNavi+1)+"'><i class='fas fa-chevron-right'></i></a></li>");
		}
		
		return sb.toString();
	}
	public int spRestaurantAllCount(SqlSession sqlSession, HashMap<String, Object> terms) {
		
		return sqlSession.selectOne("spRestaurant.spRestaurantAllCount", terms);
	}

	public SpRestaurant selectOneSpRestaurant(SqlSession sqlSession, int bizNo) {
		
		return sqlSession.selectOne("spRestaurant.selectOneSpRestaurant", bizNo);
	}

	public ArrayList<SpMenu> selectAllBizMenu(SqlSession sqlSession, int bizNo) {
			
		return new ArrayList<SpMenu> (sqlSession.selectList("spRestaurant.selectAllBizMenu", bizNo));
	}


}
