package kr.or.ddasum.board.model.dao;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.ddasum.board.model.vo.Notice;


@Repository
public class NoticeDAO {
	
	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;



	/**
	  * @Method Name : noticeDetail
	  * @작성일 : 2022. 2. 9.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :공지사항 상세글 호출
	  * @param iNo
	 * @return 
	  */
	public Notice noticeDetail(int iNo) {

		return sqlSession.selectOne("notice.noticeDetail", iNo);
		
	}



	/**
	  * @Method Name : recordNoticeTotalCount
	  * @작성일 : 2022. 2. 14.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :
	  * @return
	  */
	public int recordNoticeTotalCount() {
		return sqlSession.selectOne("notice.recordNoticeTotalCount");
	}

	/**
	  * @Method Name : adminSelectAllNotice
	  * @작성일 : 2022. 2. 14.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param currentPage
	  * @param recordCountPerPage
	  * @return
	  */
	public ArrayList<HashMap<String, Object>> selectAllNotice(int currentPage, int recordCountPerPage) {
		int start = (currentPage - 1) * recordCountPerPage;
		int end = recordCountPerPage;
		RowBounds rb = new RowBounds(start, end);
		return new ArrayList<HashMap<String, Object>> (sqlSession.selectList("notice.selectAllNotice", null, rb));
	}





		
	
}
