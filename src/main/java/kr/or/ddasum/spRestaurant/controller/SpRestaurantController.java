package kr.or.ddasum.spRestaurant.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddasum.email.TempKey;
import kr.or.ddasum.member.model.vo.Member;
import kr.or.ddasum.spRestaurant.model.service.SpRestaurantService;

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

		mav.addObject("map", map);
		mav.setViewName("/spRestaurant/spDetail");
		
		return mav;
	}
	
	@RequestMapping(value="/spRestaurant/spRestaurantReservation.do", method=RequestMethod.POST)
	@ResponseBody
	public void insertReservation(@RequestParam(value="bizNo") int bizNo, @RequestParam(value="menuNo") int menuNo, HttpSession session, HttpServletResponse response) throws IOException {
		
		int userNo = ((Member)session.getAttribute("member")).getUserNo();		
	    TempKey tk = new TempKey();
        String authKey = tk.getKey(6, false);
		
		HashMap<String, Object> map = new HashMap<String, Object> (); 
//		Detail d = new  Detail();
//		d.setBizNo(bizNo);
//		d.setMenuNo(menuNo);
//		d.setUserNo(userNo);
//		d.setAuthorityId("SP");	

		map.put("bizNo", bizNo);
		map.put("menuNo", menuNo);
		map.put("userNo", userNo);
		map.put("SP", "SP");
		map.put("authKey", authKey);
	    
		int result = srService.insertReservation(map);
		System.out.println(result);
		if(result>0) {
			response.getWriter().print(true);
		}else {
			response.getWriter().print(false);
		}
		
	}
}
