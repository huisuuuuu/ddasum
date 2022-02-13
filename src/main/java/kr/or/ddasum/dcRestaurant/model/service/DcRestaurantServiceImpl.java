package kr.or.ddasum.dcRestaurant.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddasum.dcRestaurant.model.dao.DcRestaurantDAO;
import kr.or.ddasum.dcRestaurant.model.vo.DcRestaurant;
import kr.or.ddasum.dcRestaurant.model.vo.DcRestaurantMenu;
import kr.or.ddasum.member.model.vo.BizMember;

@Service
public class DcRestaurantServiceImpl implements DcRestaurantService{
	
	@Autowired
	DcRestaurantDAO dcDAO;

	@Override
	public int dcRestaurantTotalCount(String area) {

		return dcDAO.dcRestaurantTotalCount(area);
	}

	@Override
	public ArrayList<DcRestaurant> selectDcRestaurantList(int currentPage, int recordCountPerPage, String area, String restaurant, String filter) {
		
		return dcDAO.selectDcRestaurantList(currentPage, recordCountPerPage, area, restaurant, filter);
		
	}

	@Override
	public BizMember selectoneDcRestaurant(int bizNo) {
		
		return dcDAO.selectoneDcRestaurant(bizNo);
		
	}

	@Override
	public ArrayList<DcRestaurantMenu> selectAllDcMenu(int bizNo) {
		
		return dcDAO.selectAllDcMenu(bizNo);
	}

	@Override
	public int reservation(String bizNo, String userNo, String menuNo, String reNo) {
		
		return dcDAO.reservation(bizNo, userNo, menuNo, reNo);
	}

}
