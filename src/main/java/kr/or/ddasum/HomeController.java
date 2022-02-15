package kr.or.ddasum;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddasum.board.model.service.NoticeService;
import kr.or.ddasum.board.model.vo.Notice;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private NoticeService nService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		
		ArrayList<Notice> list1 = nService.noticeMainPageview();
		
		ArrayList<Notice> list2 = nService.faqMainPageview();
		
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		
		
		return "main";
		
	}
	
	@RequestMapping(value = "/favicon.ico", method = RequestMethod.GET)
	public void favicon( HttpServletRequest request, HttpServletResponse reponse ) {
	try {
	  reponse.sendRedirect("/resources/favicon.ico");
	} catch (IOException e) {
	  e.printStackTrace();
	}

	}
	
}
