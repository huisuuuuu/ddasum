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
	public ModelAndView selectAllNotice(HttpServletRequest request,
										Notice notice,
										ModelAndView mav, 
										@RequestParam(value="nowPage", required=false)String nowPage,
										@RequestParam(value="cntPerPage", required=false)String cntPerPage) {

		//total
		int result = nService.countnotice();

		//paging
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		
		int cntPage = 5;
		int cntPerPageInt = Integer.parseInt(cntPerPage);
		int nowPageInt = Integer.parseInt(nowPage);
		
		int lastPage = (int)Math.ceil(result/cntPerPageInt);
		int endPage = ((int)Math.ceil(nowPageInt/cntPage))*cntPage;
		
		if (lastPage < endPage) {
			endPage = lastPage;
		}
		int startPage = endPage - cntPage + 1;
		if (startPage < 1) {
			startPage = 1;
		}
		if(endPage <= 0) {
			lastPage = 1;
			endPage = 1;
		}
		String info_id = "NOTICE";
		ArrayList<Notice> list = nService.selectAllNotice(info_id, nowPageInt, cntPerPageInt);
		System.out.println(list);
		
		HashMap<String, Integer> paging;
		paging = new HashMap<>();
		paging.put("startPage", startPage);
		paging.put("nowPage", nowPageInt);
		paging.put("endPage", endPage);
		paging.put("lastPage", lastPage);
		paging.put("cntPerPage", cntPerPageInt);

		System.out.println(startPage);
		System.out.println(nowPageInt);
		System.out.println(endPage);
		System.out.println(lastPage);
		System.out.println(cntPerPageInt);
		System.out.println(list);
		
		
		
		
		mav.addObject("result", result);
		mav.addObject("paging", paging);
		mav.addObject("list", list);
		mav.setViewName("/admin/noticeBoard");

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
	public String faqBoard() {
		
		return "admin/faqBoard";
		
	}
	

	
}
