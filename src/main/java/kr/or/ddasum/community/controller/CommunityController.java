package kr.or.ddasum.community.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.Cookie;
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

@Controller
public class CommunityController {

	@Autowired
	private CommunityService cService;
	
	@RequestMapping(value="/community/communityList.do", method=RequestMethod.GET)
	public ModelAndView selectAllCommunity(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, ModelAndView mav, HttpServletResponse response) {
		
		Cookie cookie =new Cookie("view",null); 	//view라는 이름의 쿠키 생성
		cookie.setComment("게시글 조회 확인");		//해당 쿠키가 어떤 용도인지 커멘트
		cookie.setMaxAge(60*60*24);			//해당 쿠키의 유효시간을 설정 (초 기준)
		response.addCookie(cookie);				//사용자에게 해당 쿠키를 추가
		
		HashMap<String, Object> map = cService.selectAllCommunity(currentPage);
		map.put("currentPage", currentPage);
		mav.addObject("map", map);
		mav.setViewName("community/communityList");
		
		return mav;
	}
	
	@RequestMapping(value="/community/communitySearch.do", method=RequestMethod.GET)
	public ModelAndView searchCommunity(@RequestParam String type, @RequestParam String keyword, ModelAndView mav, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
				
		ArrayList<Community> list = cService.searchCommunity(type, keyword, currentPage);
		
		mav.addObject("list", list);
		mav.setViewName("community/communityList");

		return mav;
	}
	
	@RequestMapping(value="/community/communityDetail.do", method=RequestMethod.GET)
	public ModelAndView detailOneCommunity(@RequestParam int cNo, @RequestParam int currentPage, ModelAndView mav,
			@CookieValue(name="view") String cookie) {
			
		if (!(cookie.contains(String.valueOf(cNo)))) {
			cookie += cNo + "/";
			cService.hitCommunity(cNo);
		}
	
		HashMap<String, Object> map = cService.detailOneCommunity(cNo); 
		
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
	public void deleteComment(@RequestParam int comNo) {
		int result = cService.deleteComment(comNo);
	}
	
	@RequestMapping(value="/community/communityWrite.do", method=RequestMethod.GET)
	public String writeCommunity () {
		return "/community/communityWrite";
	}
						   
	@RequestMapping(value="/community/communityInsert.do", method=RequestMethod.POST)
	public void insertCommunity(Community c , ModelAndView mav) {
		System.out.println(c.getcContent());
		
		int result = cService.insertCommunity(c);
		
	}

	@RequestMapping(value="/community/commentInsert.do", method=RequestMethod.POST)
	@ResponseBody
	public String insertComment(CommunityComment cc, HttpSession session) {
							
//		int userNo = ((Member)session.getAttribute("member")).getUserNo();
		int userNo = 22;
		
		cc.setUserNo(userNo);
		System.out.println("controller " + cc.getpComNo());
		int result = cService.insertComment(cc);
		
		return "fff";
	}
	
	@RequestMapping(value="/community/communityUpdate.do", method=RequestMethod.POST)
	public void updateCommunity() {
		
	}
	
	@RequestMapping(value="/community/commentUpdate.do", method=RequestMethod.POST)
	public void updateComment() {
		
	}
}
