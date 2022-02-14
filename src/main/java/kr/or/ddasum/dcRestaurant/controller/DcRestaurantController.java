package kr.or.ddasum.dcRestaurant.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddasum.dcRestaurant.model.service.DcRestaurantService;
import kr.or.ddasum.dcRestaurant.model.vo.DcRestaurant;
import kr.or.ddasum.dcRestaurant.model.vo.DcRestaurantMenu;
import kr.or.ddasum.dcRestaurant.model.vo.MReservation;
import kr.or.ddasum.email.TempKey;
import kr.or.ddasum.member.model.vo.BizMember;

@Controller
public class DcRestaurantController {
	
	@Autowired
	private DcRestaurantService dcService;
	
	@Autowired
    private JavaMailSender mailSender;
	
	@RequestMapping(value = "/dcRestaurant/dcRestaurantList.do", method = RequestMethod.GET)
	public ModelAndView dcRestaurantList(@RequestParam(defaultValue ="1") int currentPage, @RequestParam(required = false, defaultValue ="SEOUL") String area,
										@RequestParam(required = false, defaultValue ="ALL") String restaurant, @RequestParam(required = false,defaultValue ="newest") String filter,
										HttpServletRequest request, ModelAndView mav) {
		
		String choiceArea = area;
		String choiceRestaurant = restaurant;
		String choiceFilter = filter;
		
		
		int recordCountPerPage = 12;
		int naviCountPerPage = 5;
		int pageTotalCount = (int)Math.ceil(dcService.dcRestaurantTotalCount(area)/(double)recordCountPerPage);
		int startNavi = currentPage - (currentPage - 1) % naviCountPerPage;
		int endNavi = startNavi + naviCountPerPage - 1;
		endNavi = endNavi > pageTotalCount ? pageTotalCount : endNavi;
		
		ArrayList<DcRestaurant> list = dcService.selectDcRestaurantList(currentPage, recordCountPerPage, area, restaurant, filter);
		ArrayList<Integer> navi = new ArrayList<>();
		for (int i = startNavi; i <= endNavi; i++) {
			navi.add(i);
		}
		
		for(DcRestaurant dc : list) {
			System.out.println(dc);
		}
		
		mav.addObject("list", list);
		mav.addObject("area", choiceArea);
		mav.addObject("restaurant", choiceRestaurant);
		mav.addObject("filter", choiceFilter);
		
		
		mav.addObject("currentPage", currentPage);
		mav.addObject("navi", navi);
		mav.addObject("preNavi", startNavi > 1 ? startNavi - 1 : 0 );
		mav.addObject("nextNavi", pageTotalCount > endNavi ? endNavi + 1 : 0 );
		mav.setViewName("dcRestaurant/dcRestaurantList");
		
		return mav;		

	}
	
	@RequestMapping(value = "/dcRestaurant/dcRestaurantDetail.do", method = RequestMethod.GET)
	public ModelAndView dcRestaurantDetail(@RequestParam int bizNo, ModelAndView mav) {
		
		BizMember bm = dcService.selectoneDcRestaurant(bizNo);
		
		if(bm != null) {
			
			ArrayList<DcRestaurantMenu> dcMenu = dcService.selectAllDcMenu(bizNo);
			mav.addObject("dcInfo", bm);
			mav.addObject("dcMenu", dcMenu);
			mav.setViewName("dcRestaurant/dcRestaurantDetail");
			return mav;

		}else {
			mav.addObject("msg1", "비정상적인 접근입니다.");
			mav.addObject("msg2", "지속적인 문제 발생 시 관리자에게 문의해주세요.");
			mav.addObject("location", "/member/loginPage.do");
			mav.setViewName("commons/errorMsg");
			return mav;
		}
	}
	
	@RequestMapping(value = "/dcRestaurant/reservation.do", method = RequestMethod.GET)
	public void reservation(@RequestParam String bizNo, @RequestParam String userNo,
							@RequestParam String menuNo, HttpServletResponse response) throws IOException{
			
			Date today = new Date();
			TempKey tk = new TempKey();
			
			SimpleDateFormat sdf;
			sdf = new SimpleDateFormat("yyyyMMdd");
			String reNo = sdf.format(today)+tk.getKey(6, false);
			
			int result = dcService.inserDetail(bizNo, userNo, menuNo, reNo);
			
			if(result>0) {
				
				int result2 = dcService.insertBizReservation(bizNo, reNo);
				
				if(result2>0) {
					response.getWriter().print("true");
				}else {
					response.getWriter().print("false");
				}
				
			}else {
				response.getWriter().print("false");
			}

	}
	
}
