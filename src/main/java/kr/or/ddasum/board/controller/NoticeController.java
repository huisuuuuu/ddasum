package kr.or.ddasum.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddasum.board.model.service.NoticeService;
import kr.or.ddasum.board.model.vo.Notice;


@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	@RequestMapping(value = "/board/noticeBoard.do", method = RequestMethod.GET)
	public ModelAndView selectAllNotice(ModelAndView mav) {

		ArrayList<Notice> list = nService.selectAllNotice();
		
		mav.addObject("list", list);
		mav.setViewName("/admin/noticeBoard");
		return mav;
	}

	@RequestMapping(value="/board/faqBoard.do", method = RequestMethod.GET)
	public String faqBoard() {
		
		return "admin/faqBoard";
		
	}
	
	@RequestMapping(value="/board/noticeDetail.do", method = RequestMethod.GET)
	public String noticeDetail() {
		
		return "admin/noticeDetail";
		
	}
	
}
