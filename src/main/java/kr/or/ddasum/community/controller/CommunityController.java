package kr.or.ddasum.community.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddasum.community.model.service.CommunityService;
import kr.or.ddasum.community.model.vo.Community;
import kr.or.ddasum.community.model.vo.CommunityComment;
import kr.or.ddasum.member.model.vo.Member;

@Controller
public class CommunityController {

	@Autowired
	private CommunityService cService;
	
	@RequestMapping(value="/community/communityList.do", method=RequestMethod.GET)
	public ModelAndView selectAllCommunity(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, ModelAndView mav, HttpServletResponse response) {

		SimpleDateFormat format =new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		String nowDate = format.format(cal.getTime());
		
		HashMap<String, Object> map = cService.selectAllCommunity(currentPage);
		map.put("currentPage", currentPage);
		map.put("nowDate", nowDate);
		mav.addObject("map", map);
		mav.setViewName("community/communityList");

		return mav;
	}
	
	@RequestMapping(value="/community/communitySearch.do", method=RequestMethod.GET)
	public ModelAndView searchCommunity(@RequestParam String type, @RequestParam String keyword, ModelAndView mav, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
				
		System.out.println(type);
		System.out.println(keyword);
		System.out.println(currentPage);
		
		HashMap<String, Object> map = cService.searchCommunity(type, keyword, currentPage);
		
		mav.addObject("map", map);
		mav.addObject("currentPage", currentPage);
		mav.addObject("type", type);
		mav.addObject("keyword", keyword);
		mav.setViewName("community/communityList");
		
		return mav;
	}
	
	@RequestMapping(value="/community/communityDetail.do", method=RequestMethod.GET)
	public ModelAndView detailOneCommunity(@RequestParam int cNo, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, ModelAndView mav,
			@CookieValue(value="communityView", required=false) Cookie viewCookie, HttpServletResponse response, HttpServletRequest request) {

		// 조회수 중복방지를 위한 쿠키 생성 및 중복방지 코드
		// @CookieValue(value="viewCookie", required=false) Cookie viewCookie 으로 쿠기 받기

		if(viewCookie != null) {
			// 쿠키 확인 후 조회수 증가
			if(!viewCookie.getValue().contains("["+cNo+"]")) {
				cService.hitCommunity(cNo);
				viewCookie.setValue(viewCookie.getValue()+"_["+cNo+"]");
				viewCookie.setPath("/");
				viewCookie.setMaxAge(60*60*24);
				response.addCookie(viewCookie);
			}
		}else {
			// 쿠키가 없을 경우 새로 생성하고 조회수 증가
			cService.hitCommunity(cNo);
			Cookie newCookie = new Cookie("communityView", "["+cNo+"]");
			newCookie.setPath("/");
			newCookie.setMaxAge(60*60*24);
			response.addCookie(newCookie);

		}

	
		HashMap<String, Object> map = cService.detailOneCommunity(cNo); 
		map.put("currentPage", currentPage);
		
		mav.addObject("map", map);
		mav.setViewName("/community/communityDetail");

		return mav;
	}
	
	@RequestMapping(value="/community/communityDelete.do", method=RequestMethod.POST)
	public void deleteCommunity(@RequestParam int cNo, ModelAndView mav) {
		int result = cService.deleteCommunity(cNo);
		
		if(result>0) {
			mav.addObject("msg", "글을 삭제하였습니다.");
			mav.addObject("view", "/community/communityList.do");
		}else {
			mav.addObject("msg", "글을 삭제하지 못하였습니다.");
			mav.addObject("view", "/community/communityList.do");			
		}
		mav.setViewName("/community/msg");
	}
	
	@RequestMapping(value="/community/communityCommentDelete.do", method=RequestMethod.POST)
	@ResponseBody
	public void deleteComment(@RequestParam int comNo) {
		int result = cService.deleteComment(comNo);
	}
	
	@RequestMapping(value="/community/communityWrite.do", method=RequestMethod.GET)
	public String writeCommunity () {
		return "/community/communityWrite";
	}
						   
	@RequestMapping(value="/community/communityInsert.do", method=RequestMethod.POST)
	public ModelAndView insertCommunity(Community c , ModelAndView mav, HttpSession session) {
		
		int userNo = ((Member)session.getAttribute("member")).getUserNo();

		c.setUserNo(userNo);
		
		int result = cService.insertCommunity(c);
		
		if(result>0) {
			mav.addObject("msg", "게시물이 등록되었습니다.");
			mav.addObject("view", "/community/communityList.do");
		}
		mav.setViewName("/community/msg");
		
		return mav;
	}

	@RequestMapping(value="/community/commentInsert.do", method=RequestMethod.POST)
	@ResponseBody
	public void insertComment(CommunityComment cc, HttpSession session) {
					
		int userNo = ((Member)session.getAttribute("member")).getUserNo();
		
		cc.setUserNo(userNo);
		
		int depth = cc.getComDepth();
		
		// 댓글 뎁스 초기화
		int quotient = depth/7;
		depth = depth-(7*quotient);
		int comDepth = depth==0?7:depth;
		
		cc.setComDepth(comDepth);
		
		int result = cService.insertComment(cc);
		
	}
	
	@RequestMapping(value="/community/communityUpdatePage.do", method=RequestMethod.POST)
	public ModelAndView communityUpdate(@RequestParam int cNo, @RequestParam int currentPage, ModelAndView mav) {
		
		Community c = cService.selectCommunity(cNo);
		
		mav.addObject("community", c);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("/community/communityUpdate");
		
		return mav;
	}
	
	@RequestMapping(value="/community/communityUpdate.do", method=RequestMethod.POST)
	public ModelAndView UpdateCommunity(Community c, HttpSession session, ModelAndView mav, @RequestParam int currentPage) {

		int userNo = ((Member)session.getAttribute("member")).getUserNo();
		
		c.setUserNo(userNo);
		
		int result = cService.updateCommunity(c);
		
	
			HashMap<String, Object> map = cService.detailOneCommunity(c.getcNo()); 
			map.put("currentPage", currentPage);
			
			mav.addObject("map", map);
			mav.setViewName("/community/communityDetail");
		
		
		mav.setViewName("/community/communityDetail");
		return mav;
	}
						   
	@RequestMapping(value="/community/commentUpdate.do", method=RequestMethod.POST)
	@ResponseBody
	public void updateComment(@RequestParam int comNo, @RequestParam String comment) {
		
		CommunityComment cc = new CommunityComment();
		cc.setComNo(comNo);
		cc.setComContent(comment);
		
		int result = cService.updateComment(cc);
	}
}
