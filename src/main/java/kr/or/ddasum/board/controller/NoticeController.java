package kr.or.ddasum.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddasum.board.model.service.NoticeService;
import kr.or.ddasum.board.model.vo.Notice;
import kr.or.ddasum.member.model.vo.BizMember;
import kr.or.ddasum.member.model.vo.Detail;


@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	@RequestMapping(value = "/board/noticeBoard.do", method = RequestMethod.GET)
	public ModelAndView selectAllNotice(@RequestParam(defaultValue="1") int currentPage, HttpServletRequest request, ModelAndView mav) {
		
		int recordCountPerPage = 6;
		int naviCountPerPage = 5;
		int recordNoticeTotalCount = nService.recordNoticeTotalCount();
		int pageTotalCount = (int)Math.ceil(recordNoticeTotalCount/(double)recordCountPerPage);
		int startNavi = currentPage - (currentPage - 1) % naviCountPerPage;
		int endNavi = startNavi + naviCountPerPage - 1;
		endNavi = endNavi > pageTotalCount ? pageTotalCount : endNavi;
		
		ArrayList<HashMap<String, Object>> list = nService.selectAllNotice(currentPage, recordCountPerPage);
		ArrayList<Integer> navi = new ArrayList<>();
		for (int i = startNavi; i <= endNavi; i++) {
			navi.add(i);
		}
		
		ArrayList<Notice> flist = nService.selectFixNotice();
		
		
		
		mav.addObject("recordNoticeTotalCount", recordNoticeTotalCount);
		mav.addObject("list", list);
		mav.addObject("flist", flist);
		mav.addObject("currentPage", currentPage);
		mav.addObject("navi", navi);
		mav.addObject("preNavi", startNavi > 1 ? startNavi - 1 : 0 );
		mav.addObject("nextNavi", pageTotalCount > endNavi ? endNavi + 1 : 0 );
		mav.setViewName("admin/noticeBoard");
					
		return mav;
		
	}

	@RequestMapping(value="/board/noticeDetail.do", method = RequestMethod.GET)
	public ModelAndView noticeDetail(ModelAndView mav, @RequestParam int iNo) {
		
		Notice n = nService.noticeDetail(iNo);
		
		mav.addObject("Notice", n);
		mav.setViewName("admin/noticeDetail");
		return mav;
	}
	
	
	@RequestMapping(value="/board/faqBoard.do", method = RequestMethod.GET)
	public ModelAndView faqBoard(@RequestParam(defaultValue="1") int currentPage, HttpServletRequest request, ModelAndView mav) {

		int recordCountPerPage = 5;
		int naviCountPerPage = 5;
		int faqTotalCount = nService.faqTotalCount();
		int pageTotalCount = (int)Math.ceil(faqTotalCount/(double)recordCountPerPage);
		int startNavi = currentPage - (currentPage - 1) % naviCountPerPage;
		int endNavi = startNavi + naviCountPerPage - 1;
		endNavi = endNavi > pageTotalCount ? pageTotalCount : endNavi;
		
		ArrayList<HashMap<String, Object>> list = nService.faqBoard(currentPage, recordCountPerPage);
		ArrayList<Integer> navi = new ArrayList<>();
		for (int i = startNavi; i <= endNavi; i++) {
			navi.add(i);
		}
				
		mav.addObject("recordNoticeTotalCount", faqTotalCount);
		mav.addObject("list", list);
		mav.addObject("currentPage", currentPage);
		mav.addObject("navi", navi);
		mav.addObject("preNavi", startNavi > 1 ? startNavi - 1 : 0 );
		mav.addObject("nextNavi", pageTotalCount > endNavi ? endNavi + 1 : 0 );
		mav.setViewName("admin/faqBoard");
					
		return mav;		
		
	}
	

	
}
