package kr.or.ddasum.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddasum.board.model.dao.NoticeDAO;
import kr.or.ddasum.board.model.vo.Notice;
import kr.or.ddasum.member.model.vo.Detail;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDAO nDAO;

	@Override
	public ArrayList<Notice> selectAllNotice(String info_id, int nowPage, int cntPerPage) {

		int end = nowPage * cntPerPage;
		int start = end - cntPerPage + 1;
		
		return nDAO.selectAllNotice(info_id, start, end);
	}

	@Override
	public Notice noticeDetail(int iNo) {

		return nDAO.noticeDetail(iNo);
	}

	
	@Override
	public int countnotice() {
		return nDAO.countnotice();

	}



	
	
	
}
