package kr.or.ddasum.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddasum.board.model.dao.NoticeDAO;
import kr.or.ddasum.board.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDAO nDAO;

	@Override
	public ArrayList<Notice> selectAllNotice() {

		return nDAO.selectAllNotice();
		

	}
	

	
	
	
}
