package kr.or.ddasum.admin.controller;

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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddasum.admin.model.service.AdminService;
import kr.or.ddasum.admin.model.vo.AdminMember;
import kr.or.ddasum.board.model.vo.Notice;
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
	public ModelAndView adminMemberWithDraw(@RequestParam String userId, @RequestParam(defaultValue="Y") char delYN, HttpSession session, HttpServletResponse response, ModelAndView mav) {
		
		//admin = null 비정상접근
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("userId", userId);		
		map.put("delYN", delYN == 'Y' ? 'N' : 'Y' );
		
		int result = admService.adminUpdateMemberEndYN(map);
		
		if(delYN == 'Y') {
			if(result>0) {
				mav.addObject("msg1", "탈퇴완료");
				mav.addObject("msg2", userId + "회원이 정상탈퇴처리되었습니다.");
				mav.addObject("location", "/admin/adminMemberManageList.do");
				mav.setViewName("commons/successMsg");
				
				return mav;
				
			}else {
				mav.addObject("msg1", "탈퇴불가");
				mav.addObject("msg2", userId + "회원의 탈퇴처리가 되지 않았습니다.");
				mav.addObject("location", "/admin/adminMemberManageList.do");
				mav.setViewName("commons/errorMsg");
				
				return mav;			
			}
		}else {
			

			if(result>0) {
				mav.addObject("msg1", "복원완료");
				mav.addObject("msg2", userId + "회원이 정상복원처리되었습니다.");
				mav.addObject("location", "/admin/adminMemberManageList.do");
				mav.setViewName("commons/successMsg");
				
				return mav;
				
			}else {
				mav.addObject("msg1", "복원불가");
				mav.addObject("msg2", userId + "회원의 복원처리가 되지 않았습니다.");
				mav.addObject("location", "/admin/adminMemberManageList.do");
				mav.setViewName("commons/errorMsg");
				
				return mav;

		}
		
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
	
	//카드인증관리확인멤버
	@RequestMapping(value="/admin/adminCardConfirm.do", method = RequestMethod.GET)
	public ModelAndView CardMemberInfo(@RequestParam int userNo, HttpServletRequest request, ModelAndView mav) {
		
		HashMap<String, Object> map = admService.adminCardMemberInfo(userNo);
		
		mav.addObject("info", map);
		mav.setViewName("admin/adminCardConfirm");

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
	public ModelAndView adminBizMemberWithDraw(@RequestParam String bizId, @RequestParam(defaultValue="Y") char bizDelYN, HttpSession session, HttpServletResponse response, ModelAndView mav) {
		
		//admin = null 비정상접근
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("bizId", bizId);		
		map.put("bizDelYN", bizDelYN == 'Y' ? 'N' : 'Y' );
		
		int result = admService.adminUpdateBizMemberEndYN(map);
		
		if(bizDelYN == 'Y') {
			if(result>0) {
				mav.addObject("msg1", "탈퇴완료");
				mav.addObject("msg2", bizId + "회원이 정상탈퇴처리되었습니다.");
				mav.addObject("location", "/admin/adminBizManageList.do");
				mav.setViewName("commons/successMsg");
				
				return mav;
				
			}else {
				mav.addObject("msg1", "탈퇴불가");
				mav.addObject("msg2", bizId + "회원의 탈퇴처리가 되지 않았습니다.");
				mav.addObject("location", "/admin/adminBizManageList.do");
				mav.setViewName("commons/errorMsg");
				
				return mav;			
			}
		}else {
			

			if(result>0) {
				mav.addObject("msg1", "복원완료");
				mav.addObject("msg2", bizId + "회원이 정상복원처리되었습니다.");
				mav.addObject("location", "/admin/adminBizManageList.do");
				mav.setViewName("commons/successMsg");
				
				return mav;
				
			}else {
				mav.addObject("msg1", "복원불가");
				mav.addObject("msg2", bizId + "회원의 복원처리가 되지 않았습니다.");
				mav.addObject("location", "/admin/adminBizManageList.do");
				mav.setViewName("commons/errorMsg");
				
				return mav;

		}
		
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
	
	//스토리보드 연결
	@RequestMapping(value="/member/storyBoard.do", method = RequestMethod.GET)
	public String stroyBoard() {
		return "/member/storyBoard";
	}
	
	//공지사항 글 읽기
	@RequestMapping(value="/admin/adminNoticeDetail.do", method = RequestMethod.GET)
	public ModelAndView adminNoticeDetail(ModelAndView mav, @RequestParam int iNo)
	{
		Notice notice = admService.adminNoticeDetail(iNo);
		
		mav.addObject("notice", notice);
		mav.setViewName("admin/adminNoticeDetail");
		return mav;
	}
		
	//공지사항 글 수정뷰
	@RequestMapping(value="/admin/adminNoticeUpdatePage.do")
	public ModelAndView adminNoticeOnePost(ModelAndView mav, @RequestParam int iNo)
	{
		Notice upNo = admService.adminNoticeOnePost(iNo);
		
		mav.addObject("upNo", upNo);
		mav.setViewName("admin/adminNoticeUpdate");
		return mav;
	}	
	

	//공지사항 수정로직
	@RequestMapping(value="/admin/adminNoticeUpdate.do", method = RequestMethod.GET)
	public ModelAndView adminNoticeUpdate(@RequestParam int iNo, ModelAndView mav, @RequestParam String iTitle, 
			@RequestParam String iContent, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		String title = iTitle;
		String content = iContent;
		
		Notice noti = new Notice();
		
		noti.setiNo(iNo);
		noti.setiTitle(iTitle);
		noti.setiContent(iContent);		
		
		int result = admService.adminNoticeUpdate(noti);

		if(result>0) {
			mav.addObject("msg1", "수정완료");
			mav.addObject("msg2", "정상수정처리되었습니다.");
			mav.addObject("location", "/admin/adminNoticeDetail.do?iNo="+iNo);
			mav.setViewName("commons/successMsg");
				
			return mav;
				
		}else {
			mav.addObject("msg1", "수정불가");
			mav.addObject("msg2", "수정처리가 되지 않았습니다.");
			mav.addObject("location", "/admin/adminNoticeDetail.do?iNo="+iNo);
			mav.setViewName("commons/errorMsg");
				
			return mav;			
		}
	}

	//FAQ 글 읽기
	@RequestMapping(value="/admin/adminFAQDetail.do", method = RequestMethod.GET)
	public ModelAndView adminFAQDetail(ModelAndView mav, @RequestParam int iNo)
	{
		Notice faq = admService.adminFAQDetail(iNo);
		
		mav.addObject("faq", faq);
		mav.setViewName("admin/adminFAQDetail");
		return mav;
	}
	
	//FAQ 수정뷰
	@RequestMapping(value="/admin/adminFAQUpdatePage.do")
	public ModelAndView adminFAQOnePost(ModelAndView mav, @RequestParam int iNo) {
		
		Notice faqNo = admService.adminFAQOnePost(iNo);
		
		mav.addObject("faqNo", faqNo);
		mav.setViewName("admin/adminFAQUpdate");
		return mav;
	}
	
	//FAQ 수정로직
	
	@RequestMapping(value="/admin/adminFAQUpdate.do", method = RequestMethod.GET)
	public ModelAndView adminFAQUpdate(@RequestParam int iNo, ModelAndView mav, @RequestParam String iTitle,
			@RequestParam String iContent, HttpSession session, HttpServletRequest request, HttpServletResponse response)
	{
	
		String title = iTitle;
		String content = iContent;
		
		Notice noFaq = new Notice();
		
		noFaq.setiNo(iNo);
		noFaq.setiTitle(iTitle);
		noFaq.setiContent(iContent);
		
		int result = admService.adminFAQUpdate(noFaq);

		if(result>0)
		{
			mav.addObject("noFaq", noFaq);
			mav.setViewName("admin/adminFAQDetail");
		}else
		{
			mav.addObject("noFaq", noFaq);
			mav.setViewName("views/commons/errorMSG");
		}
		
		return mav;
	}
	
	//공지사항 삭제
	
	@RequestMapping(value="/admin/adminNoticeDel.do", method = RequestMethod.GET)
	public ModelAndView noticeDel(@RequestParam int iNo, ModelAndView mav, @RequestParam(defaultValue="Y") char iDelYN, HttpSession session, HttpServletResponse response) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("iNo", iNo);
		map.put("iDelYN", iDelYN == 'Y' ? 'N' : 'Y');
		
		int result = admService.noticeDelYN(map);
		
		mav.addObject("nm", map);
		mav.setViewName("admin/adminNoticeDel");
		
		return mav;
		
	}
	
	//공지사항 글쓰기 뷰
	
	@RequestMapping(value="/admin/adminNoticeWritePage.do")
	public String noticeWrite(HttpSession session, HttpServletResponse write) throws Exception{
		
		return "admin/adminNoticeWrite";
		
	}
	
	//공지사항 글쓰기 로직
	
	@RequestMapping(value="/admin/adminNoticeWrite.do", method=RequestMethod.POST)
	public String write(Notice notice, HttpSession session, HttpServletResponse insert, RedirectAttributes rttr) throws Exception {
		
		admService.insert(notice);
		rttr.addFlashAttribute("result", notice.getiNo());
		
		return "admin/adminNoticeManageList.do";
		
	}

	
	//공지사항 고정글
	public ModelAndView noticeFix(@RequestParam int iNo, ModelAndView mav, @RequestParam String infoId, HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("iNo", iNo);
		map.put("infoId", infoId);
		
		int result = admService.noticeFix(map);
		
		mav.addObject("notiFix", map);
		mav.setViewName("admin/adminNoticeManageList");
		
		return mav;
		
	}
	
	//카드승인리스트
	
	
}
