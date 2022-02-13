package kr.or.ddasum.board.model.dao;


import java.util.ArrayList;
import java.util.HashMap;

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
	  * @param end 
	 * @param start 
	 * @Method Name : selectAllNotice
	  * @작성일 : 2022. 2. 7.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :공지사항리스트 호출
	  */
	public ArrayList<Notice> selectAllNotice(String info_id, int start, int end) {
		HashMap<String, Integer> hashmap;
		hashmap = new HashMap<>();
		hashmap.put("start", start);
		hashmap.put("end", end);
		return new ArrayList<Notice> (sqlSession.selectList("notice.selectAllNotice"));
		
	}

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
	  * @param iNo 
	 * @Method Name : countnotice
	  * @작성일 : 2022. 2. 14.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :
	  * @return
	  */
	public int countnotice() {
		return sqlSession.selectOne("notice.countnotice");

	}





		
	
}
