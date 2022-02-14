package kr.or.ddasum.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import kr.or.ddasum.board.model.vo.Notice;
import kr.or.ddasum.member.model.vo.Detail;

public interface NoticeService {



	/**
	  * @Method Name : noticeDetail
	  * @작성일 : 2022. 2. 9.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :공지사항 상세글 호출
	  * @param iNo
	 * @return 
	  */
	Notice noticeDetail(int iNo);

	/**
	  * @Method Name : recordNoticeTotalCount
	  * @작성일 : 2022. 2. 14.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :
	  * @return
	  */
	int recordNoticeTotalCount();

	/**
	  * @Method Name : selectAllNotice
	  * @작성일 : 2022. 2. 14.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param currentPage
	  * @param recordCountPerPage
	  * @return
	  */
	ArrayList<HashMap<String, Object>> selectAllNotice(int currentPage, int recordCountPerPage);





}
