package kr.or.ddasum.dcRestaurant.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddasum.dcRestaurant.model.dao.DcRestaurantDAO;
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
	public ArrayList<BizMember> selectAllDcRestaurantList(int currentPage, int recordCountPerPage, String area,
			String filter) {
		
		ArrayList<BizMember> dcRestaurantList = dcDAO.selectAllDcRestaurantList(currentPage, recordCountPerPage, area, filter); 
		
		for(BizMember dcRestaurant : dcRestaurantList) {
			System.out.println(dcRestaurant);
		}
		
		return null;
		//return dcDAO.selectAllDcRestaurantList(currentPage, recordCountPerPage, area, filter);
		
	}

}
