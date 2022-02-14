package kr.or.ddasum.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddasum.admin.model.service.AdminService;
import kr.or.ddasum.admin.model.vo.AdminMember;
import kr.or.ddasum.member.model.vo.Detail;

@Controller
public class AdminController {
		
	@Autowired
	private AdminService admService;
	
	@RequestMapping(value="/admin/adminMain.do", method = RequestMethod.GET)
	public String adminMain() {
				
		
		return "admin/adminMain";
		
	}
	
	//회원정보관리 페이징처리
	@RequestMapping(value="/admin/adminMemberManageList.do", method = RequestMethod.GET)
	public ModelAndView adminSelectAllMember(@RequestParam(defaultValue ="1") int currentPage, HttpServletRequest request, ModelAndView mav){
		
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		int recordTotalCount = admService.memberTotalCount();
		int pageTotalCount = (int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
		int startNavi = currentPage - (currentPage - 1) % naviCountPerPage;
		int endNavi = startNavi + naviCountPerPage - 1;
		endNavi = endNavi > pageTotalCount ? pageTotalCount : endNavi;
		
		ArrayList<AdminMember> list = admService.adminSelectAllMember(currentPage, recordCountPerPage);
		ArrayList<Integer> navi = new ArrayList<>();
		for (int i = startNavi; i <= endNavi; i++) {
			navi.add(i);
		}
		
		mav.addObject("recordTotalCount", recordTotalCount);
		mav.addObject("list", list);
		mav.addObject("currentPage", currentPage);
		mav.addObject("navi", navi);
		mav.addObject("preNavi", startNavi > 1 ? startNavi - 1 : 0 );
		mav.addObject("nextNavi", pageTotalCount > endNavi ? endNavi + 1 : 0 );
		mav.setViewName("admin/adminMemberManageList");
		
		return mav;		
		
	}
			
	//이용내역 확인
	@RequestMapping(value="/admin/adminMemberDetail.do", method = RequestMethod.GET)
	public ModelAndView adminMemberDetail(@RequestParam(defaultValue ="1" ) int currentPage, HttpServletRequest request, ModelAndView mav, @RequestParam int userNo)
	{
		int recordCountPerPage = 5;
		int naviCountPerPage = 5;
		int detailTotalCount = admService.detailTotalCount(userNo);
		int pageTotalCount = (int)Math.ceil(detailTotalCount/(double)recordCountPerPage);
		int startNavi = currentPage - (currentPage - 1) % naviCountPerPage;
		int endNavi = startNavi + naviCountPerPage - 1;
		endNavi = endNavi > pageTotalCount ? pageTotalCount : endNavi;
		
		ArrayList<Detail> list = admService.adminMemberDetail(currentPage, recordCountPerPage, userNo);
		ArrayList<Integer> navi = new ArrayList<>();
		for (int i = startNavi; i <= endNavi; i++) {
			navi.add(i);
		}
		
		mav.addObject("detailTotalCount", detailTotalCount);
		mav.addObject("user", admService.memberDetailName(userNo));		
		mav.addObject("list", list);
		mav.addObject("currentPage", currentPage);
		mav.addObject("navi", navi);
		mav.addObject("preNavi", startNavi > 1 ? startNavi - 1 : 0 );
		mav.addObject("nextNavi", pageTotalCount > endNavi ? endNavi + 1 : 0 );
		mav.setViewName("admin/adminMemberDetail");
		
		return mav;				
	}
	
	//회원탈퇴
	@RequestMapping(value = "/admin/adminMemberWithdraw.do")
	public void adminMemberWithDraw(@RequestParam String userId, @RequestParam(defaultValue="Y") char delYN, HttpSession session, HttpServletResponse response, ModelAndView mav) {
		
		//admin = null 비정상접근
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("userId", userId);		
		map.put("delYN", delYN == 'Y' ? 'N' : 'Y' );
		
		int result = admService.adminUpdateMemberEndYN(map);
		
		if(result>0) {
			mav.addObject("message", userId + "회원이 정상탈퇴처리되었습니다.");
			mav.setViewName("/");
		}else {
			mav.addObject("message", userId + "회원이 탈퇴처리가 되지 않았습니다.");
			mav.setViewName("/");
			
			System.out.println(map);
		}
				
	}
	
	//상세정보 확인
	@RequestMapping(value="/admin/adminMemberInfo.do", method = RequestMethod.GET)
	public ModelAndView adminMemberInfo(@RequestParam int userNo, HttpServletRequest request, ModelAndView mav) {

		HashMap<String, Object> map = admService.adminMemberInfo(userNo);
		
		mav.addObject("info", map);		
		mav.setViewName("admin/adminMemberInfo");
		
		return mav;
	}

	//카드인증관리 페이징처리
	@RequestMapping(value="/admin/adminCardManageList.do", method = RequestMethod.GET)
	public ModelAndView adminSelectAllCardMember(@RequestParam(defaultValue ="1") int currentPage, HttpServletRequest request, ModelAndView mav){
		
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		int cardTotalCount = admService.cardTotalCount();
		int pageTotalCount = (int)Math.ceil(cardTotalCount/(double)recordCountPerPage);
		int startNavi = currentPage - (currentPage - 1) % naviCountPerPage;
		int endNavi = startNavi + naviCountPerPage - 1;
		endNavi = endNavi > pageTotalCount ? pageTotalCount : endNavi;
		
		ArrayList<HashMap<String, Object>> list = admService.selectAllCardMember(currentPage, recordCountPerPage);
		ArrayList<Integer> navi = new ArrayList<>();
		for (int i = startNavi; i <= endNavi; i++) {
			navi.add(i);
		}
		
		mav.addObject("cardTotalCount", cardTotalCount);
		mav.addObject("list", list);
		mav.addObject("currentPage", currentPage);
		mav.addObject("navi", navi);
		mav.addObject("preNavi", startNavi > 1 ? startNavi - 1 : 0 );
		mav.addObject("nextNavi", pageTotalCount > endNavi ? endNavi + 1 : 0 );
		mav.setViewName("admin/adminCardManageList");
		
		return mav;		
		
	}
	
	//사업자페이지 페이징 처리
	@RequestMapping(value="/admin/adminBizManageList.do", method = RequestMethod.GET)
	public ModelAndView adminSelectAllBizMember(@RequestParam(defaultValue ="1") int currentPage, HttpServletRequest request, ModelAndView mav){
		
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		int recordBizTotalCount = admService.recordBizTotalCount();
		int pageTotalCount = (int)Math.ceil(recordBizTotalCount/(double)recordCountPerPage);
		int startNavi = currentPage - (currentPage - 1) % naviCountPerPage;
		int endNavi = startNavi + naviCountPerPage - 1;
		endNavi = endNavi > pageTotalCount ? pageTotalCount : endNavi;
		
		ArrayList<HashMap<String, Object>> list = admService.adminSelectAllBizMember(currentPage, recordCountPerPage);
		ArrayList<Integer> navi = new ArrayList<>();
		for (int i = startNavi; i <= endNavi; i++) {
			navi.add(i);
		}
				
		mav.addObject("recordBizTotalCount", recordBizTotalCount);
		mav.addObject("list", list);
		mav.addObject("currentPage", currentPage);
		mav.addObject("navi", navi);
		mav.addObject("preNavi", startNavi > 1 ? startNavi - 1 : 0 );
		mav.addObject("nextNavi", pageTotalCount > endNavi ? endNavi + 1 : 0 );
		mav.setViewName("admin/adminBizManageList");
		
		return mav;		
		
	}
	
	//사업자 상세정보 확인
	@RequestMapping(value="/admin/adminBizMemberInfo.do", method = RequestMethod.GET)
	public ModelAndView adminBizMemberInfo(@RequestParam int bizNo, HttpServletRequest request, ModelAndView mav) {

		HashMap<String, Object> map = admService.adminBizMemberInfo(bizNo);
		
		mav.addObject("info", map);		
		mav.setViewName("admin/adminBizMemberInfo");
		
		return mav;
	}	
	
	//사업자 탈퇴
	@RequestMapping(value = "/admin/adminBizMemberWithdraw.do")
	public void adminBizMemberWithDraw(@RequestParam String bizId, @RequestParam(defaultValue="Y") char bizDelYN, HttpSession session, HttpServletResponse response, ModelAndView mav) {
		
		//admin = null 비정상접근
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("bizId", bizId);		
		map.put("bizDelYN", bizDelYN == 'Y' ? 'N' : 'Y' );
		
		int result = admService.adminUpdateBizMemberEndYN(map);
		
		System.out.println(map);
		
		if(result>0) {
			mav.addObject("message", bizId + "회원이 정상탈퇴처리되었습니다.");
			mav.setViewName("/");
		}else {
			mav.addObject("message", bizId + "회원이 탈퇴처리가 되지 않았습니다.");
			mav.setViewName("/");
		}
				
	}
	
	
	//공지사항페이지
	@RequestMapping(value="/admin/adminNoticeManageList.do", method = RequestMethod.GET)
	public ModelAndView adminSelectNoticeAllManageList(@RequestParam(defaultValue="1") int currentPage, HttpServletRequest request, ModelAndView mav) {
					
			int recordCountPerPage = 10;
			int naviCountPerPage = 5;
			int recordNoticeTotalCount = admService.recordNoticeTotalCount();
			int pageTotalCount = (int)Math.ceil(recordNoticeTotalCount/(double)recordCountPerPage);
			int startNavi = currentPage - (currentPage - 1) % naviCountPerPage;
			int endNavi = startNavi + naviCountPerPage - 1;
			endNavi = endNavi > pageTotalCount ? pageTotalCount : endNavi;
			
			ArrayList<HashMap<String, Object>> list = admService.adminSelectAllNotice(currentPage, recordCountPerPage);
			ArrayList<Integer> navi = new ArrayList<>();
			for (int i = startNavi; i <= endNavi; i++) {
				navi.add(i);
			}
					
			mav.addObject("recordNoticeTotalCount", recordNoticeTotalCount);
			mav.addObject("list", list);
			mav.addObject("currentPage", currentPage);
			mav.addObject("navi", navi);
			mav.addObject("preNavi", startNavi > 1 ? startNavi - 1 : 0 );
			mav.addObject("nextNavi", pageTotalCount > endNavi ? endNavi + 1 : 0 );
			mav.setViewName("admin/adminNoticeManageList");
						
			return mav;
	}	
	
	//후원페이지 연결
	@RequestMapping(value="/admin/adminSelectAllSupport.do", method = RequestMethod.GET)
	public ModelAndView adminSelectAllSupport(@RequestParam(defaultValue="1") int currentPage, HttpServletRequest request, ModelAndView mav) {
					
			int recordCountPerPage = 10;
			int naviCountPerPage = 5;
			int recordSupportTotalCount = admService.recordSupportTotalCount();			
			int pageTotalCount = (int)Math.ceil(recordSupportTotalCount/(double)recordCountPerPage);
			int startNavi = currentPage - (currentPage - 1) % naviCountPerPage;
			int endNavi = startNavi + naviCountPerPage - 1;
			endNavi = endNavi > pageTotalCount ? pageTotalCount : endNavi;
			
			ArrayList<HashMap<String, Object>> list = admService.adminSelectAllSupport(currentPage, recordCountPerPage);
			ArrayList<Integer> navi = new ArrayList<>();
			for (int i = startNavi; i <= endNavi; i++) {
				navi.add(i);
			}
					
			mav.addObject("recordSupportTotalCount", recordSupportTotalCount);
			mav.addObject("list", list);
			mav.addObject("currentPage", currentPage);
			mav.addObject("navi", navi);
			mav.addObject("preNavi", startNavi > 1 ? startNavi - 1 : 0 );
			mav.addObject("nextNavi", pageTotalCount > endNavi ? endNavi + 1 : 0 );
			mav.setViewName("admin/adminSelectAllSupport");
						
			return mav;
	}	
	
	//자주묻는 질문
	@RequestMapping(value="/admin/adminFAQManageList.do", method = RequestMethod.GET)
	public ModelAndView adminSelectAllFAQManageList(@RequestParam(defaultValue="1") int currentPage, HttpServletRequest request, ModelAndView mav) {
					
			int recordCountPerPage = 10;
			int naviCountPerPage = 5;
			int recordFAQTotalCount = admService.recordFAQTotalCount();
			int pageTotalCount = (int)Math.ceil(recordFAQTotalCount/(double)recordCountPerPage);
			int startNavi = currentPage - (currentPage - 1) % naviCountPerPage;
			int endNavi = startNavi + naviCountPerPage - 1;
			endNavi = endNavi > pageTotalCount ? pageTotalCount : endNavi;
			
			ArrayList<HashMap<String, Object>> list = admService.adminSelectAllFAQNotice(currentPage, recordCountPerPage);
			ArrayList<Integer> navi = new ArrayList<>();
			for (int i = startNavi; i <= endNavi; i++) {
				navi.add(i);
			}
					
			mav.addObject("recordFAQTotalCount", recordFAQTotalCount);
			mav.addObject("list", list);
			mav.addObject("currentPage", currentPage);
			mav.addObject("navi", navi);
			mav.addObject("preNavi", startNavi > 1 ? startNavi - 1 : 0 );
			mav.addObject("nextNavi", pageTotalCount > endNavi ? endNavi + 1 : 0 );
			mav.setViewName("admin/adminFAQManageList");
						
			return mav;
	}
	
	//회원관리페이지 검색처리
	@RequestMapping(value="/admin/memberSearch.do", method=RequestMethod.GET)
	public ModelAndView searchMember(@RequestParam(defaultValue="1") int currentPage, ModelAndView mav, @RequestParam String type, @RequestParam String keyword) {
	
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		int recordMemberSearchCount = admService.recordMemberSearchCount();
		int pageTotalCount = (int)Math.ceil(recordMemberSearchCount/(double)recordCountPerPage);
		int startNavi = currentPage - (currentPage - 1) % naviCountPerPage;
		int endNavi = startNavi + naviCountPerPage - 1;
		endNavi = endNavi > pageTotalCount ? pageTotalCount : endNavi;
		
		ArrayList<HashMap<String, Object>> list = admService.searchMember(type, keyword, currentPage, recordCountPerPage);
		ArrayList<Integer> navi = new ArrayList<>();
		for (int i = startNavi; i <= endNavi; i++) {
			navi.add(i);
		}

		mav.addObject("type", type);
		mav.addObject("keyword", keyword);
		mav.addObject("recordMemberSearchCount", recordMemberSearchCount);
		mav.addObject("list", list);
		mav.addObject("currentPage", currentPage);
		mav.addObject("navi", navi);
		mav.addObject("preNavi", startNavi > 1 ? startNavi - 1 : 0 );
		mav.addObject("nextNavi", pageTotalCount > endNavi ? endNavi + 1 : 0 );
		mav.setViewName("admin/adminMemberManageList");
					
		return mav;
		
		
		
	}
	
	
	//공지사항 글쓰기
	@RequestMapping(value="/admin/adminNoticeWrite.do", method = RequestMethod.GET)
	public String adminNoticeWrite() {
		return "/admin/adminNoticeWrite";
	}	
	
	//카드인증관리확인
	@RequestMapping(value="/admin/adminCardConfirm.do", method = RequestMethod.GET)
	public String adminCardConfirm() {
		return "/admin/adminCardConfirm";
	}
	
	//스토리보드 연결
	@RequestMapping(value="/member/storyBoard.do", method = RequestMethod.GET)
	public String stroyBoard() {
		return "/member/storyBoard";
	}
	
}
