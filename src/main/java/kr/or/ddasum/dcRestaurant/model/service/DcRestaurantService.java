package kr.or.ddasum.dcRestaurant.model.service;

import java.util.ArrayList;

import kr.or.ddasum.member.model.vo.BizMember;

public interface DcRestaurantService {

	int dcRestaurantTotalCount(String area);

	ArrayList<BizMember> selectAllDcRestaurantList(int currentPage, int recordCountPerPage, String area, String filter);

}
