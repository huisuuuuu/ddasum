package kr.or.ddasum.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddasum.admin.model.service.AdminService;

@Controller
public class AdminController {
		
	@Autowired
	private AdminService admService;
	
	@RequestMapping(value="/admin/adminMain.do", method = RequestMethod.GET)
	public String adminMain() {
		
		return "/admin/adminMain";
		
	}

	@RequestMapping(value="/admin/adminMemberManageList.do", method = RequestMethod.GET)
	public String adminMemberManageList() {
		return "/admin/adminMemberManageList";
	}
	
	@RequestMapping(value="/admin/adminBizManageList.do", method = RequestMethod.GET)
	public String adminBizManageList() {
		return "/admin/adminBizManageList";
	}
	
	@RequestMapping(value="/admin/adminNoticeManageList.do", method = RequestMethod.GET)
	public String adminNoticeManageList() {
		return "/admin/adminNoticeManageList";
	}
	
	@RequestMapping(value="/admin/adminSupport.do", method = RequestMethod.GET)
	public String adminSupport() {
		return "/admin/adminSupport";
	}
	
	@RequestMapping(value="/admin/adminCardManageList.do", method = RequestMethod.GET)
	public String adminCardManageList() {
		return "/admin/adminCardManageList";
	}
	
	@RequestMapping(value="/admin/adminFAQManageList.do", method = RequestMethod.GET)
	public String adminFAQManageList() {
		return "/admin/adminFAQManageList";
	}
	
	@RequestMapping(value="/admin/adminNoticeWrite.do", method = RequestMethod.GET)
	public String adminNoticeWrite() {
		return "/admin/adminNoticeWrite";
	}
	
	@RequestMapping(value="/admin/adminUserDetail.do", method = RequestMethod.GET)
	public String adminUserDetail() {
		return "/admin/adminUserDetail";
	}
	
	@RequestMapping(value="/admin/adminCardConfirm.do", method = RequestMethod.GET)
	public String adminCardConfirm() {
		return "/admin/adminCardConfirm";
	}
	
	@RequestMapping(value="/member/storyBoard.do", method = RequestMethod.GET)
	public String stroyBoard() {
		return "/member/storyBoard";
	}
	
}
