package kr.or.ddasum.spRestaurant.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddasum.spRestaurant.model.service.SpRestaurantService;
import kr.or.ddasum.spRestaurant.model.vo.SpRestaurant;

@Controller
public class SpRestaurantController {

	@Autowired
	private SpRestaurantService srService;
	
	@RequestMapping(value="/spRestaurant/spRestaurantList.do", method=RequestMethod.GET)
	public ModelAndView selectAllSpRestaurant (@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, @RequestParam(value="area", required=false, defaultValue="all") String area,
			@RequestParam(value="type", required=false, defaultValue="all") String type, @RequestParam(value="order", required=false, defaultValue="desc") String order, ModelAndView mav) {
		
		HashMap<String, Object> terms = new HashMap<String, Object>();
		terms.put("currentPage", currentPage);
		terms.put("area", area);
		terms.put("type", type);
		terms.put("order", order);	
		
		HashMap<String, Object> map = srService.selectAllSpRestaurant(terms);
		mav.addObject("map", map);
		mav.addObject("terms", terms);
		
		mav.setViewName("/spRestaurant/spList");
		
		return mav;
	}
	
	@RequestMapping(value="/spRestaurant/spRestaurantDetail.do", method=RequestMethod.GET)
	public ModelAndView selectOneSpRestaurant (int bizNo, ModelAndView mav) {
		
		HashMap<String, Object> map = srService.selectOneSpRestaurant(bizNo);
		
		mav.addObject(map);
		mav.setViewName("/spRestaurant/spDetail");
		
		return mav;
	}
}
