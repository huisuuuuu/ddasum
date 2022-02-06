package kr.or.ddasum.bizMember.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BizMemberController {
	
	@RequestMapping(value="/BizMember/enter.do", method = RequestMethod.GET)
	public String enterBizMember() {
		
		return "bizMember/EnterBizMember";
		
	}
	
	@RequestMapping(value="/BizMember/bizManage.do", method = RequestMethod.GET)
	public String bizManage() {
		
		return "bizMember/bizManage";
		
	}	
	
	@RequestMapping(value="/BizMember/goodsManage.do", method = RequestMethod.GET)
	public String goodsManage() {
		
		return "bizMember/goodsManage";
		
	}	
	
	@RequestMapping(value="/BizMember/bizReserv.do", method = RequestMethod.GET)
	public String bizReserv() {
		
		return "bizMember/bizReserv";
		
	}		
	
	@RequestMapping(value="/BizMember/calculateManage.do", method = RequestMethod.GET)
	public String calculate() {
		
		return "bizMember/calculateManage";
		
	}		
	
	@RequestMapping(value="/BizMember/goodDetail.do", method = RequestMethod.GET)
	public String goodDetail() {
		
		return "bizMember/goodDetail";
		
	}	
	
	@RequestMapping(value="/BizMember/noticeBoard.do", method = RequestMethod.GET)
	public String noitceBoard() {
		
		return "admin/noticeBoard";
		
	}
	
	@RequestMapping(value="/BizMember/faqBoard.do", method = RequestMethod.GET)
	public String faqBoard() {
		
		return "admin/faqBoard";
		
	}
	
	@RequestMapping(value="/BizMember/noticeDetail.do", method = RequestMethod.GET)
	public String noticeDetail() {
		
		return "admin/noticeDetail";
		
	}
	
}
