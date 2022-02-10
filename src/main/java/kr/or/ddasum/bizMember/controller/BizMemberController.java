package kr.or.ddasum.bizMember.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		
	@RequestMapping(value="/bizMember/bizManage.do", method = {RequestMethod.POST, RequestMethod.GET})
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
	
	@RequestMapping(value="/bizMember/updateBizManage.do", method= {RequestMethod.POST, RequestMethod.GET})
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

		int result = bService.updateBiz(bz);
		
		String rst = "";
		if (result > 0) {
			rst = "true";
		} else {
			rst = "false";
		}
		
		return rst;
	}
	
	
	@RequestMapping(value="/bizMember/withDraw.do", method = RequestMethod.POST)
	@ResponseBody
	public String withDraw(HttpServletRequest request, Model model, 
						@SessionAttribute String bizId,
						HttpSession session) {
		
		int result = bService.updateWithdraw(bizId);
		
		String rst = "";
		if (result > 0) {
			rst = "true";
		} else {
			rst = "false";
		}
		
		return rst;
	}
	
	@RequestMapping(value="/bizMember/spChange.do", method = RequestMethod.POST)
	@ResponseBody
	public String supportChange(@SessionAttribute String bizId,
								@SessionAttribute String authorityName) {
		
		System.out.println(bizId);
		System.out.println(authorityName);
		
		bService.supportChange(bizId);
		
		String rst="";
		
		return rst;
	}
	
}
