package kr.or.ddasum.dcRestaurant.model.service;

import java.util.ArrayList;

import kr.or.ddasum.dcRestaurant.model.vo.DcRestaurant;
import kr.or.ddasum.dcRestaurant.model.vo.DcRestaurantMenu;
import kr.or.ddasum.member.model.vo.BizMember;

public interface DcRestaurantService {

	int dcRestaurantTotalCount(String area);

	ArrayList<DcRestaurant> selectDcRestaurantList(int currentPage, int recordCountPerPage, String area, String restaurant, String filter);

	BizMember selectoneDcRestaurant(int bizNo);

	ArrayList<DcRestaurantMenu> selectAllDcMenu(int bizNo);

	int reservation(String bizNo, String userNo, String menuNo, String reNo);

}
