package kr.or.ddasum.bizMember.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddasum.bizMember.model.service.BizMemberService;
import kr.or.ddasum.bizMember.model.vo.BizGoods;
import kr.or.ddasum.member.model.vo.BizMember;

@Controller
public class BizMemberController {
	
	@Autowired
	private BizMemberService bService;
		
	@RequestMapping(value="/bizMember/bizManage.do", method = RequestMethod.GET)
	public ModelAndView bizManage(@SessionAttribute BizMember bizMember, HttpServletRequest request, ModelAndView mav) {
		BizMember bm = bService.bizManage(bizMember);
		
		mav.addObject("bizMember", bm);
		mav.setViewName("/bizMember/bizManage");

		return mav;
		
	}	
	
	@RequestMapping(value="/BizMember/goodsManage.do", method = RequestMethod.GET)
	public ModelAndView goodsManage(@SessionAttribute BizMember bizMember, ModelAndView mav) {

		int bizNo = bizMember.getBizNo();
		
		ArrayList<BizGoods> list = bService.goodsManage(bizNo);
		
		mav.addObject("list", list);
		mav.setViewName("/bizMember/goodsManage");
		
		return mav;

	}	
	
	@RequestMapping(value="/BizMember/bizReserv.do", method = RequestMethod.GET)
	public String bizReserv(HttpSession session) {
		
		return "bizMember/bizReserv";
		
	}		
	
	@RequestMapping(value="/BizMember/calculateManage.do", method = RequestMethod.GET)
	public String calculate(HttpSession session) {
		
		return "bizMember/calculateManage";
		
	}		
	
	@RequestMapping(value="/BizMember/goodDetail.do", method = RequestMethod.GET)
	public String goodDetail() {
		
		return "bizMember/goodDetail";
		
	}	

	@RequestMapping(value="/BizMember/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/bizMember/updateBizManage.do", method=RequestMethod.GET)
	public ModelAndView updateBizMemeber(@SessionAttribute BizMember bizMember, HttpServletRequest request, ModelAndView mav) {

		BizMember bm = bService.bizManage(bizMember);
		
		mav.addObject("bizMember", bm);
		mav.setViewName("/bizMember/updateBizManage");
		
		return mav;
	}
	
	@RequestMapping(value="/bizMember/updateBiz.do", method=RequestMethod.POST)
	@ResponseBody
	public String updateBiz(BizMember bizMemberVo,@SessionAttribute BizMember bizMember, HttpSession session, HttpServletResponse response) throws IOException{
		String bizId = bizMember.getBizId();
		
		BizMember bz = new BizMember();
		bz.setCeoName(bizMemberVo.getCeoName());
		bz.setBizName(bizMemberVo.getBizName());
		bz.setBizEmail(bizMemberVo.getBizEmail());
		bz.setBizPhone(bizMemberVo.getBizPhone());
		bz.setRestaurant(bizMemberVo.getRestaurant());
		bz.setAddress(bizMemberVo.getAddress());
		bz.setBizTime(bizMemberVo.getBizTime());
		bz.setBizCount(bizMemberVo.getBizCount());
		bz.setBizId(bizId); //session

		/*
		System.out.println(bizMemberVo.getCeoName());
		System.out.println(bizMemberVo.getBizName());
		System.out.println(bizMemberVo.getBizEmail());
		System.out.println(bizMemberVo.getBizPhone());
		System.out.println(bizMemberVo.getRestaurant());
		System.out.println(bizMemberVo.getAddress());
		System.out.println(bizMemberVo.getBizTime());
		System.out.println(bizMemberVo.getBizCount());
		
		System.out.println(bizMember.getBizId());
		*/
		System.out.println(bz);

		int result = bService.updateBiz(bz);
		
		String rst = "";
		if (result > 0) {
			rst = "true";
		} else {
			rst = "false";
		}
		
		return rst;
	}
	
	@RequestMapping(value="/bizMember/addGood.do", method=RequestMethod.POST)
	public ModelAndView addGood(@SessionAttribute BizMember bizMember, ModelAndView mav) {
			
		int result = bService.addGood(bizMember);
		
		if(result>0)
		{
			mav.addObject("msg", "상품 추가 성공");
			mav.addObject("location", "/bizMember/goodsManage");
		}else
		{
			mav.addObject("msg", "상품 추가 실패");
			mav.addObject("location", "/bizMember/goodsManage");
		}
		mav.setViewName("commons/msg");
		return mav;
		
	}
	
	
	
}
