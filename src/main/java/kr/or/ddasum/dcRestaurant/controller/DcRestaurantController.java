package kr.or.ddasum.dcRestaurant.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddasum.dcRestaurant.model.service.DcRestaurantService;
import kr.or.ddasum.member.model.vo.BizMember;

@Controller
public class DcRestaurantController {
	
	@Autowired
	private DcRestaurantService dcService;
	
	@Autowired
    private JavaMailSender mailSender;
	
	@RequestMapping(value = "/dcRestaurant/dcRestaurantList.do", method = RequestMethod.GET)
	public ModelAndView dcRestaurantList(@RequestParam(defaultValue ="1") int currentPage, @RequestParam(defaultValue ="SEOUL") String area,
										 @RequestParam(defaultValue ="newest") String filter, HttpServletRequest request,
										 ModelAndView mav) {
		
		int recordCountPerPage = 12;
		int naviCountPerPage = 5;
		int pageTotalCount = (int)Math.ceil(dcService.dcRestaurantTotalCount(area)/(double)recordCountPerPage);
		int startNavi = currentPage - (currentPage - 1) % naviCountPerPage;
		int endNavi = startNavi + naviCountPerPage - 1;
		endNavi = endNavi > pageTotalCount ? pageTotalCount : endNavi;
		
		ArrayList<BizMember> list = dcService.selectAllDcRestaurantList(currentPage, recordCountPerPage, area, filter);
		ArrayList<Integer> navi = new ArrayList<>();
		for (int i = startNavi; i <= endNavi; i++) {
			navi.add(i);
		}
		
		mav.addObject("list", list);
		mav.addObject("currentPage", currentPage);
		mav.addObject("navi", navi);
		mav.addObject("preNavi", startNavi > 1 ? startNavi - 1 : 0 );
		mav.addObject("nextNavi", pageTotalCount > endNavi ? endNavi + 1 : 0 );
		mav.setViewName("dcRestaurant/dcRestaurantList");
		
		return mav;		

	}
	
	@RequestMapping(value = "/dcRestaurant/dcRestaurantDetail.do", method = RequestMethod.GET)
	public String dcRestaurantDetail() {

		return "dcRestaurant/dcRestaurantDetail";

	}
}
