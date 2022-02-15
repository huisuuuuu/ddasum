package kr.or.ddasum.board.model.dao;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.ddasum.admin.model.vo.AdminMember;
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
	
	
	/**
	  * @param iNo 
	 * @Method Name : notiMainPageview
	  * @작성일 : 2022. 2. 14.
	  * @작성자 : j
	  * @변경이력 : 
	  * @Method 설명 :
	  * @return
	  */
	/*public ArrayList<Notice> noticeMainPageview() {
		
		ArrayList<Notice> list = new ArrayList<Notice>(sqlSession.selectList("notice.notiMainPageview"));
		
		
		return list;
	}
*/
	
	/**
	  * @param iNo 
	 * @Method Name : faqMainPageview
	  * @작성일 : 2022. 2. 14.
	  * @작성자 : j
	  * @변경이력 : 
	  * @Method 설명 :
	  * @return
	  */
	public ArrayList<Notice> faqMainPageview() {
		ArrayList<Notice> list = new ArrayList<Notice>(sqlSession.selectList("notice.faqMainPageview"));
		
		return list;
	}



	/**
	  * @Method Name : faqTotalCount
	  * @작성일 : 2022. 2. 14.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :faq 토탈 카운트
	  * @return
	  */
	public int faqTotalCount() {
		return sqlSession.selectOne("notice.faqTotalCount");

	}



	/**
	  * @Method Name : faqBoard
	  * @작성일 : 2022. 2. 14.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :faq 보드리스트 호출(페이징)
	  * @param currentPage
	  * @param recordCountPerPage
	  * @return
	  */
	public ArrayList<HashMap<String, Object>> faqBoard(int currentPage, int recordCountPerPage) {
		int start = (currentPage - 1) * recordCountPerPage;
		int end = recordCountPerPage;
		RowBounds rb = new RowBounds(start, end);
		return new ArrayList<HashMap<String, Object>> (sqlSession.selectList("notice.faqBoard", null, rb));
	}



	public ArrayList<Notice> selectFixNotice() {
		ArrayList<Notice> list = new ArrayList<Notice>(sqlSession.selectList("notice.selectFixNotice"));
		return list;
	}





		
	
}
