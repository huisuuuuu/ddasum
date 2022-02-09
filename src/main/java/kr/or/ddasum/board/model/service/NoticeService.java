package kr.or.ddasum.board.model.service;

import java.util.ArrayList;

import kr.or.ddasum.board.model.vo.Notice;

public interface NoticeService {

	/**
	  * @return 
	 * @Method Name : selectAllNotice
	  * @작성일 : 2022. 2. 7.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :공지사항 리스트 호출
	  */
	ArrayList<Notice> selectAllNotice();



}
