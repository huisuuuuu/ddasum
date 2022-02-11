package kr.or.ddasum.spRestaurant.model.service;

import java.util.HashMap;

import kr.or.ddasum.spRestaurant.model.vo.SpRestaurant;

public interface SpRestaurantService {

	HashMap<String, Object> selectAllSpRestaurant(HashMap<String, Object> terms);

	HashMap<String, Object> selectOneSpRestaurant(int bizNo);

}
