package kr.or.ddasum.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.ddasum.admin.model.vo.AdminMember;
import kr.or.ddasum.member.model.vo.Detail;
 
@Repository
public class AdminDAO {
	
	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<AdminMember> adminSelectAllMember(int currentPage,	int recordCountPerPage) {	
		int start = (currentPage - 1) * recordCountPerPage;
		int end = recordCountPerPage;
		RowBounds rb = new RowBounds(start, end);
		return new ArrayList<AdminMember> (sqlSession.selectList("admin.adminSelectAllMember", null, rb));
	}

	public String getPageNavi(SqlSession sqlSession, int currentPage, int recordCountPerPage, int naviCountPerPage) {
		
		//전체 회원수
		int recordTotalCount = recordTotalCount();
		
		//전체 페이지수
		int pageTotalCount = (int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
				
		int startNavi = (((currentPage-1) / naviCountPerPage) * naviCountPerPage) +1;
		int endNavi = startNavi + (naviCountPerPage-1);
		
		//endNavi가 총 page수보다 클 경우 총 page수로 셋팅
		if(endNavi > pageTotalCount)
		{
			endNavi = pageTotalCount;
		}
				
		//pageNavi 모양 만들기
		StringBuilder sb = new StringBuilder();
		
		if(startNavi!=1) {
			sb.append("<li><a href='/admin/adminMemberManageList.do?currentPage="+(startNavi-1)+"'><i class='fas fa-chevron-left'></i></a></li>");
		}

		for(int i=startNavi; i<=endNavi; i++) {
			
			if(i==currentPage) {
				sb.append("<li><a href='/admin/adminMemberManageList.do?currentPage="+i+"' class='page_active'>"+i+"</a></li>");
			}else {
				sb.append("<li><a href='/admin/adminMemberManageList.do?currentPage="+i+"'>"+i+"</a></li>");
			}
		}

		if(endNavi!=pageTotalCount) {
			sb.append("<li><a href='/admin/adminMemberManageList.do?currentPage="+(endNavi+1)+"'><i class='fas fa-chevron-right'></i></a></li>");
		}
		
		return sb.toString();
	}
	
	public int recordTotalCount() {
		return sqlSession.selectOne("admin.selectAllMemberTotalCount");
	}

	@SuppressWarnings("unchecked")
	public HashMap<String, Object> detailOneMember(SqlSessionTemplate sqlSession, int userNo) {
		
		return (HashMap<String, Object>)sqlSession.selectList("admin.userDetail", userNo);
	}
		
}
