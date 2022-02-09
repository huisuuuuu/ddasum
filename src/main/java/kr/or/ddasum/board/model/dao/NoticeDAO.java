package kr.or.ddasum.board.model.dao;


import java.util.ArrayList;

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
	  * @Method Name : selectAllNotice
	  * @작성일 : 2022. 2. 7.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :공지사항리스트 호출
	  */
	public ArrayList<Notice> selectAllNotice() {

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




		
	
}
