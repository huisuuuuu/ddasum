package kr.or.ddasum.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.ddasum.member.model.service.MemberService;
import kr.or.ddasum.member.model.vo.BizMember;
import kr.or.ddasum.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;

	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public String memberLogin(Member member, HttpServletRequest request, Model model) {

		Member m = mService.memberLogin(member);

			if (m != null)
			{
				HttpSession session = request.getSession();
				session.setAttribute("member", m);
				session.setAttribute("bizMember", null);
				return "main";

			} else
			{
				model.addAttribute("msg1", "로그인 실패");
				model.addAttribute("msg2", "아이디와 비밀번호를 확인해주세요.");
				model.addAttribute("location", "/member/loginPage.do");
				return "commons/msg";
			}
	}

	@RequestMapping(value = "/member/bizMemberLogin.do", method = RequestMethod.POST)
	public String bizMemberLogin(BizMember bizMember, HttpServletRequest request, Model model) {

		BizMember bm = mService.bizMemberLogin(bizMember);

		if (bm != null) {
			HttpSession session = request.getSession();
			session.setAttribute("bizMember", bm);
			session.setAttribute("member", null);
			return "bizMember/EnterBizMember";

		} else {
			model.addAttribute("msg1", "로그인 실패");
			model.addAttribute("msg2", "아이디와 비밀번호를 확인해주세요.");
			model.addAttribute("location", "/member/bizMemberLoginPage.do");
			return "commons/msg";
		}
	}

	@RequestMapping(value = "/member/logout.do")
	public String memberLogout(HttpSession session) {

		session.invalidate();

		return "main";
	}

	@RequestMapping(value = "/member/myPage.do")
	public String myPageIn(Member member) {

		return "member/myPage";
	}

	@RequestMapping(value = "/member/PasswordCheckPage.do")
	public String memberPasswordCheck() {
		return "member/passwordCheckPage";
	}

	@RequestMapping(value = "/member/myPageUpdate.do", method = RequestMethod.POST)
	public String myPagePasswordCheck(HttpServletRequest request, @SessionAttribute Member member,
			HttpSession session) {
		String userPwd = request.getParameter("userPwd");

		if (userPwd == null) {

			return "member/passwordCheck";
		} else {
			String userId = request.getParameter("userId");

			member.setUserPwd(userPwd);

			Member m = mService.memberLogin(member);

			if (m != null) {
				session.setAttribute("member", m);
				return "member/myPageUpdate";
			} else {
				return "member/passwordCheckPage";
			}

		}
	}

	@RequestMapping(value = "/member/memberInfoUpdate.do", method = RequestMethod.POST)
	public void memberInfoUpdate(@RequestParam String userPwd, @RequestParam String userName, @RequestParam String nick,
			@RequestParam String email, @RequestParam String address, @RequestParam String phone,
			@SessionAttribute Member member, HttpServletResponse response, HttpSession session) throws IOException {

		String userId = member.getUserId();

		Member m = new Member();
		m.setUserId(userId);
		m.setUserPwd(userPwd);
		m.setUserName(userName);
		m.setNick(nick);
		m.setEmail(email);
		m.setAddress(address);
		m.setPhone(phone);

		int result = mService.memberInfoUpdate(m);

		if (result > 0) {
			session.setAttribute("member", m);
			response.getWriter().print(true);
		} else {
			response.getWriter().print(false);
		}

	}

	@RequestMapping(value = "/member/reservationPage.do")
	public String reservationPage() {

		return "member/reservationCheckPage";
	}

	// 정두식 추가 코드(끝)

	@RequestMapping(value = "/member/loginPage.do", method = RequestMethod.GET)
	public String loginPage(HttpServletRequest request, Model model) {
		
		if (request.getSession().getAttribute("member") != null || request.getSession().getAttribute("bizMember") != null)
		{
			model.addAttribute("msg1", "알림메세지");
			model.addAttribute("msg2", "비정상적인 접근입니다.");
			model.addAttribute("location", "/");
			return "commons/msg";
			
		} else {
			return "member/loginPage";
		}
	}

	@RequestMapping(value = "/member/bizMemberLoginPage.do", method = RequestMethod.GET)
	public String bizMemberLoginPage(HttpServletRequest request, Model model) {
		
		
		if (request.getSession().getAttribute("member") != null || request.getSession().getAttribute("bizMember") != null)
		{
			model.addAttribute("msg1", "알림메세지");
			model.addAttribute("msg2", "비정상적인 접근입니다.");
			model.addAttribute("location", "/");
			return "commons/msg";
			
		} else {
			return "member/bizMemberLoginPage";
		}

	}

	@RequestMapping(value = "/member/joinPage.do", method = RequestMethod.GET)
	public String joinPage() {

		return "member/joinPage";

	}
	
	@RequestMapping(value = "/member/memberJoin.do", method = RequestMethod.POST)
	public String memberJoinus(Member m, Model model) {

		int result = mService.insertMember(m);
		
		if(result>0) {
			return "member/successJoinPage";
		}else {
			model.addAttribute("msg1", "회원 가입 실패");
			model.addAttribute("msg2", "지속적인 문제 발생 시 관리자에게 문의해주세요.");
			model.addAttribute("location", "/member/joinPage.do");
			return "commons/msg";
		}
		
	}
	
	@RequestMapping(value = "/member/findIdPage.do", method = RequestMethod.GET)
	public String findIdPage() {

		return "member/findIdPage";

	}

	@RequestMapping(value = "/member/findPwdPage.do", method = RequestMethod.GET)
	public String findPwdPage() {

		return "member/findPwdPage";

	}

	@RequestMapping(value = "/member/saleRestaurantListPage.do", method = RequestMethod.GET)
	public String saleRestaurantPage() {

		return "member/saleRestaurantListPage";

	}

	@RequestMapping(value = "/member/memberJoinPage.do", method = RequestMethod.GET)
	public String memberJoinPage() {

		return "member/memberJoinPage";

	}

	@RequestMapping(value = "/member/bizMemberChoicePage.do", method = RequestMethod.GET)
	public String bizMemberChoicePage() {

		return "member/bizMemberChoicePage";

	}

	@RequestMapping(value = "/member/bizNumVerify.do", method = RequestMethod.GET)
	public String bizNumVerify() {

		return "member/bizNumVerify";

	}

	@RequestMapping(value = "/member/bizMemberJoinPage.do", method = RequestMethod.POST)
	public String bizMemberJoinPage() {

		return "member/bizMemberJoinPage";

	}

	@RequestMapping(value = "/member/successJoinPage.do", method = RequestMethod.POST)
	public String successJoinPage() {

		return "member/successJoinPage";

	}

	// 나중에 삭제할 코드
	@RequestMapping(value = "/member/mainPage.do")
	public String mainPage() {
		return "main";
	}

	@RequestMapping(value = "/member/saleRestaurantDetail.do", method = RequestMethod.GET)
	public String saleRestaurantDetail() {

		return "member/saleRestaurantDetail";

	}

}
