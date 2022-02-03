package kr.or.ddasum.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddasum.member.model.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping(value="/member/loginPage.do", method = RequestMethod.GET)
	public String loginPage() {
		
		return "/member/loginPage";
		
	}
	
	@RequestMapping(value="/member/joinPage.do", method = RequestMethod.GET)
	public String joinPage() {
		
		return "/member/joinPage";
		
	}
	
	@RequestMapping(value="/member/findIdPage.do", method = RequestMethod.GET)
	public String findIdPage() {
		
		return "/member/findIdPage";
		
	}
	
	@RequestMapping(value="/member/findPwdPage.do", method = RequestMethod.GET)
	public String findPwdPage() {
		
		return "/member/findPwdPage";
		
	}
	
	@RequestMapping(value="/member/saleRestaurantPage.do", method = RequestMethod.GET)
	public String saleRestaurantPage() {
		
		return "/member/saleRestaurantPage";
		
	}
	
	@RequestMapping(value="/member/memberJoinPage.do", method = RequestMethod.GET)
	public String memberJoinPage() {
		
		return "/member/memberJoinPage";
		
	}
	
	@RequestMapping(value="/member/bizMemberJoinPage.do", method = RequestMethod.GET)
	public String bizMemberJoinPage() {
		
		return "/member/bizMemberJoinPage";
		
	}
	
	@RequestMapping(value="/member/successJoinPage.do", method = RequestMethod.POST)
	public String successJoinPage() {
		
		return "/member/successJoinPage";
		
	}
	
}
