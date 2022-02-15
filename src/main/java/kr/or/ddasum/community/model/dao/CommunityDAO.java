package kr.or.ddasum.community.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddasum.community.model.vo.Community;
import kr.or.ddasum.community.model.vo.CommunityComment;

@Repository
public class CommunityDAO {

	public ArrayList<Community> selectAllCommunity(SqlSessionTemplate sqlSession, int currentPage, int recordCountPerPage) {
		
		int offset = ((currentPage-1)*recordCountPerPage);
		int limit = recordCountPerPage;
		
		RowBounds rb = new RowBounds(offset, limit);
		
		return new ArrayList<Community> (sqlSession.selectList("community.selectAllCommunity", null, rb));
	}

	public ArrayList<Community> searchCommunity(SqlSessionTemplate sqlSession, HashMap<String, String> search, int currentPage, int recordCountPerPage) {
		
		int offset = ((currentPage-1));
		int limit = recordCountPerPage;
		
		RowBounds rb = new RowBounds(offset, limit);
		
		
		return new ArrayList<Community> (sqlSession.selectList("community.searchCommunity", search, rb));
	}

	public Community detailOneCommunity(SqlSessionTemplate sqlSession, int cNo) {
		
		
		return sqlSession.selectOne("community.detailOneCommunity", cNo);
	}

	public ArrayList<CommunityComment> detailComment(SqlSessionTemplate sqlSession, int cNo) {
		
		
		return new ArrayList<CommunityComment> (sqlSession.selectList("community.detailComment", cNo));
	}

	public int deleteCommunity(SqlSessionTemplate sqlSession, int cNo) {
		
		return sqlSession.update("community.deleteCommunity", cNo);
	}

	public int deleteComment(SqlSessionTemplate sqlSession, int comNo) {
		
		return sqlSession.update("community.deleteComment", comNo);
	}
	
	public String getPageNavi(SqlSession sqlSession, int currentPage, int recordCountPerPage, int naviCountPerPage) {
		int communityAllCount = communityAllCount(sqlSession);
		
		int pageTotalCount = (int)Math.ceil(communityAllCount/(double)recordCountPerPage);
		
		
		int startNavi = (((currentPage - 1) / naviCountPerPage) * naviCountPerPage) + 1;
		
		int endNavi = startNavi + (naviCountPerPage - 1);
		
		if(endNavi>pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		StringBuilder sb = new StringBuilder();

		if(startNavi!=1) {
			sb.append("<li><a href='/community/communityList.do?currentPage="+(startNavi-1)+"'><i class='fas fa-chevron-left'></i></a></li>");
		}

		for(int i=startNavi; i<=endNavi; i++) {
			
			if(i==currentPage) {
				sb.append("<li><a href='/community/communityList.do?currentPage="+i+"' class='page_active'>"+i+"</a></li>");
			}else {
				sb.append("<li><a href='/community/communityList.do?currentPage="+i+"'>"+i+"</a></li>");
			}
		}

		if(endNavi!=pageTotalCount) {
			sb.append("<li><a href='/community/communityList.do?currentPage="+(endNavi+1)+"'><i class='fas fa-chevron-right'></i></a></li>");
		}
		
		return sb.toString();
	}
	
	public int communityAllCount(SqlSession sqlSession) {
		
		return sqlSession.selectOne("community.selectCommunityAllCount");
	}

	public void hitCommunity(SqlSessionTemplate sqlSession, int cNo) {
		
		sqlSession.update("community.hitCoommunity", cNo);
	}

	public int insertComment(SqlSessionTemplate sqlSession, CommunityComment cc) {
		
		return sqlSession.insert("community.insertComment", cc);
	}

	public int insertCommunity(SqlSessionTemplate sqlSession, Community c) {
		
		return sqlSession.insert("community.insertCommunity", c);
	}

	public int updateCommunity(SqlSessionTemplate sqlSession, Community c) {
		
		return sqlSession.update("community.updateCommunity", c);
	}

	public int updateComment(SqlSessionTemplate sqlSession, CommunityComment cc) {
		
		return sqlSession.update("community.updateComment", cc);
	}

	public int getOrder(SqlSessionTemplate sqlSession, int cNo) {
		
		return sqlSession.selectOne("community.countPCom", cNo);
	}
}
