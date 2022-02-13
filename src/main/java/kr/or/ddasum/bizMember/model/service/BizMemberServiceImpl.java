package kr.or.ddasum.bizMember.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddasum.bizMember.model.dao.BizMemberDAO;
import kr.or.ddasum.bizMember.model.vo.BizGoods;
import kr.or.ddasum.bizMember.model.vo.Calculater;
import kr.or.ddasum.member.model.vo.BizMember;
import kr.or.ddasum.member.model.vo.Detail;


@Service
public class BizMemberServiceImpl implements BizMemberService{

	@Autowired
	private BizMemberDAO bDAO;

	@Autowired
	SqlSessionTemplate sqlSession;	
	
	@Override
	public BizMember bizManage(BizMember bizMember) {
		return bDAO.bizManage(bizMember);
	}

	@Override
	public ArrayList<BizGoods> goodsManage(int bizNo, int nowPage, int cntPerPage) {

		int end = nowPage * cntPerPage;
		int start = end - cntPerPage + 1;
		
		return bDAO.goodsManage(bizNo, start, end);
	}

	@Override
	public int updateBiz(BizMember bz) {
		return bDAO.updateBiz(bz);
		
	}

	@Override
	public int updateWithdraw(String bizId) {
		return bDAO.updateWithdraw(bizId);
	}

	@Override
	public int suportChange(BizMember bg) {
		return bDAO.suportChange(bg);
	}

	@Override
	public int addGood(BizGoods bg) {
		return bDAO.addGood(bg);
	}

	@Override
	public BizGoods goodModify(int menuNo) {
		return bDAO.goodModify(menuNo);
		
	}

	@Override
	public int GoodMo(BizGoods bg) {
		return bDAO.GoodMo(bg);
	}

	@Override
	public ArrayList<Detail> bizReserv(int bizNo, int nowPage, int cntPerPage) {

		int end = nowPage * cntPerPage;
		int start = end - cntPerPage + 1;
		
		return bDAO.bizReserv(bizNo, start, end);
	}

	@Override
	public ArrayList<Calculater> calculate(int bizNo, int nowPage, int cntPerPage) {

		int end = nowPage * cntPerPage;
		int start = end - cntPerPage + 1;
		
		return bDAO.calculate(bizNo, start, end);
	}
	
	@Override
	public int countGood(int bizNo) {
		return bDAO.countGood(bizNo);
	}

	@Override
	public int countreserv(int bizNo) {
		return bDAO.countreserv(bizNo);

	}

	@Override
	public int countcalculate(int bizNo) {
		return bDAO.countcalculate(bizNo);
	}



}




