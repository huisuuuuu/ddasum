package kr.or.ddasum.member.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddasum.email.TempKey;
import kr.or.ddasum.member.model.service.MemberService;
import kr.or.ddasum.member.model.vo.BizMember;
import kr.or.ddasum.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	
	@Autowired
    private JavaMailSender mailSender;

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
				return "commons/errorMsg";
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
			return "commons/errorMsg";
		}
	}

	@RequestMapping(value = "/member/logout.do")
	public String memberLogout(HttpSession session) {

		session.invalidate();

		return "main";
	}

	@RequestMapping(value = "/member/myPage.do")
	public String myPageIn(HttpSession session,@SessionAttribute Member member) {
		Member m = mService.memberLogin(member);
		session.setAttribute("member", m);
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

			return "member/passwordCheckPage";
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
	public ModelAndView reservationPage(HttpServletRequest request, @SessionAttribute Member member, ModelAndView mav) {
		
		int currentPage;
		
		if(request.getParameter("currentPage") == null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int userNo = member.getUserNo();
		
		HashMap<String, Object> map = mService.detailMemberList(currentPage, userNo);
		
		map.put("currentPage", currentPage);
		
		
		mav.addObject("map", map);
		mav.setViewName("member/reservationCheckPage");
		
		return mav;
	}

	// 정두식 추가 코드(끝)

	@RequestMapping(value = "/member/loginPage.do", method = RequestMethod.GET)
	public String loginPage(HttpServletRequest request, Model model) {
		
		if (request.getSession().getAttribute("member") != null || request.getSession().getAttribute("bizMember") != null)
		{
			model.addAttribute("msg1", "알림메세지");
			model.addAttribute("msg2", "비정상적인 접근입니다.");
			model.addAttribute("location", "/");
			return "commons/errorMsg";
			
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
			return "commons/errorMsg";
			
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
			return "commons/errorMsg";
		}
		
	}
	
	@RequestMapping(value = "/member/bizMemberJoin.do", method = RequestMethod.POST)
	public String bizMemberJoin(BizMember bm, @RequestParam String bizTimeStart,
							@RequestParam String bizTimeEnd, @RequestParam String roadAddress,
							@RequestParam String detailAddress, @RequestParam String area, Model model) {
		
		if(area.equals("인천")) {
			bm.setArea("INCHEON");
		}else if(area.equals("경기")) {
			bm.setArea("GYEONGGI");
		}else if(area.equals("서울")) {
			bm.setArea("SEOUL");
		};
		
		bm.setBizTime(bizTimeStart+"~"+bizTimeEnd);
		bm.setAddress(roadAddress+" "+detailAddress);
		
		System.out.println(bm);
		
		int result = mService.insertBizMember(bm);
		
		if(result>0) {
			return "member/successJoinPage";
		}else {
			model.addAttribute("msg1", "회원 가입 실패");
			model.addAttribute("msg2", "지속적인 문제 발생 시 관리자에게 문의해주세요.");
			model.addAttribute("location", "/member/joinPage.do");
			return "commons/errorMsg";
		}
		
	}
	
	@RequestMapping(value = "/member/memberIdCheck.do", method = RequestMethod.GET)
	public void memberIdCheck(HttpServletResponse response, @RequestParam String userId, Model model) throws IOException{

		Member m = mService.selectIdCheck(userId);
		
		if(m!=null) {
			response.getWriter().print(true);//사용중
		}else {
			response.getWriter().print(false);//사용 가능
		}
		
	}
	
	@RequestMapping(value = "/member/bizMemberIdCheck.do", method = RequestMethod.GET)
	public void bizMemberIdCheck(HttpServletResponse response, @RequestParam String bizId, Model model) throws IOException{

		BizMember bm = mService.selectBizIdCheck(bizId);
		
		if(bm!=null) {
			response.getWriter().print(true);//사용중
		}else {
			response.getWriter().print(false);//사용 가능
		}
		
	}
	
	@RequestMapping(value = "/member/memberNickCheck.do", method = RequestMethod.GET)
	public void memberNickCheck(HttpServletResponse response, @RequestParam String nick, Model model) throws IOException{

		Member m = mService.selectNickCheck(nick);
		
		if(m!=null) {
			response.getWriter().print(true);//사용중
		}else {
			response.getWriter().print(false);//사용 가능
		}
		
	}
	
	@RequestMapping(value = "/member/memberEmailCheck.do", method = RequestMethod.POST)
	public void memberEmailCheck(@RequestParam String email, HttpServletResponse response) throws IOException{
		
		TempKey tk = new TempKey();
		String authKey = tk.getKey(11, false);
		System.out.println(authKey);
		
		Member m = mService.memberEmailCheck(email);
		
		if(m!=null) {
		
        response.getWriter().print("false");//사용 중인 이메일
        
		}else {
			
			/* 이메일 보내기 */
	        String setFrom = "ddasum0@gmail.com";
	        String toMail = email;
	        String title = "따숨 메일 인증";
	        String content = 
	                "따숨에 오신걸 환영합니다." +
	                "<br><br>" + 
	                "이메일 인증 번호는 <Strong>" + authKey + "</Strong>입니다." + 
	                "<br>" + 
	                "해당 인증 번호를 인증 번호 확인란에 입력해주세요.";
	        try {
			
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            helper.setFrom(setFrom);
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content,true);
	            mailSender.send(message);
	            
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
			
	        response.getWriter().print(authKey);//이메일 인증키 리턴
		}
	}
	
	@RequestMapping(value = "/member/bizMemberEmailCheck.do", method = RequestMethod.POST)
	public void bizMemberEmailCheck(@RequestParam String bizEmail, HttpServletResponse response) throws IOException{
		
		TempKey tk = new TempKey();
		String authKey = tk.getKey(11, false);
		System.out.println(authKey);
		
		BizMember bm = mService.bizMemberEmailCheck(bizEmail);
		
		if(bm!=null) {
		
        response.getWriter().print("false");//사용 중인 이메일
        
		}else {
			
			/* 이메일 보내기 */
	        String setFrom = "ddasum0@gmail.com";
	        String toMail = bizEmail;
	        String title = "따숨 메일 인증";
	        String content = 
	                "따숨에 오신걸 환영합니다." +
	                "<br><br>" + 
	                "이메일 인증 번호는 <Strong>" + authKey + "</Strong>입니다." + 
	                "<br>" + 
	                "해당 인증 번호를 인증 번호 확인란에 입력해주세요.";
	        try {
			
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            helper.setFrom(setFrom);
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content,true);
	            mailSender.send(message);
	            
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
			
	        response.getWriter().print(authKey);//이메일 인증키 리턴
		}
	}
	
	@RequestMapping(value = "/member/bizMemberRegNoCheck.do", method = RequestMethod.GET)
	public void bizMemberRegNumCheck(HttpServletResponse response, @RequestParam String regNo, Model model) throws IOException{
		
		BizMember bm = mService.selectRegNoCheck(regNo);
		
		if(bm!=null) {
			response.getWriter().print(true);//사용 중
			System.out.println("true");
		}else {
			response.getWriter().print(false);//사용 가능
			System.out.println("false");
		}
		
	}
	
	@RequestMapping(value = "/member/findIdPwdPage.do", method = RequestMethod.GET)
	public String findIdPwdPage() {

		return "member/findIdPwdPage";

	}
	
	@RequestMapping(value = "/member/findMemberIdPage.do", method = RequestMethod.GET)
	public String findMemberIdPage() {

		return "member/findMemberIdPage";

	}
	
	@RequestMapping(value = "/member/findMemberPwdPage.do", method = RequestMethod.GET)
	public String findMemberPwdPage() {

		return "member/findMemberPwdPage";

	}
	
	@RequestMapping(value = "/member/findBizMemberIdPage.do", method = RequestMethod.GET)
	public String findBizMemberIdPage() {

		return "member/findBizMemberIdPage";

	}
	
	@RequestMapping(value = "/member/findBizMemberPwdPage.do", method = RequestMethod.GET)
	public String findBizMemberPwdPage() {

		return "member/findBizMemberPwdPage";

	}
	
	@RequestMapping(value = "/member/findMemberId.do", method = RequestMethod.POST)
	public String findMemberId(@RequestParam String userName, @RequestParam String email, Model model) {
		
		Member m = new Member();
		
		m.setUserName(userName);
		m.setEmail(email);
		
		Member member = mService.findMemberId(m);
		
		if(member != null) {
			model.addAttribute("msg1", member.getUserName()+"님의 아이디는 "+member.getUserId()+" 입니다.");
			model.addAttribute("location", "/member/findMemberIdPage.do");
			return "commons/successMsg";
		}else {
			model.addAttribute("msg1", "등록되지 않은 이메일입니다.");
			model.addAttribute("msg2", "다시 시도해주세요.");
			model.addAttribute("location", "/member/findMemberIdPage.do");
			return "commons/errorMsg";
		}
		
	}
	
	@RequestMapping(value = "/member/findBizMemberId.do", method = RequestMethod.POST)
	public String findBizMemberId(@RequestParam String ceoName, @RequestParam String bizEmail, Model model) {
		
		BizMember bm = new BizMember();
		
		bm.setCeoName(ceoName);
		bm.setBizEmail(bizEmail);
		
		BizMember bizMember = mService.findBizMemberId(bm);
		
		if(bizMember != null) {
			model.addAttribute("msg1", bizMember.getCeoName()+"님의 아이디는 "+bizMember.getBizId()+" 입니다.");
			model.addAttribute("location", "/member/findBizMemberIdPage.do");
			return "commons/successMsg";
		}else {
			model.addAttribute("msg1", "등록되지 않은 이메일입니다.");
			model.addAttribute("msg2", "다시 시도해주세요.");
			model.addAttribute("location", "/member/findBizMemberIdPage.do");
			return "commons/errorMsg";
		}
		
	}
	
	@RequestMapping(value = "/member/findMemberPwd.do", method = RequestMethod.POST)
	public void findMemberPwd(@RequestParam String userId, @RequestParam String email, HttpServletResponse response) throws IOException{
		
		TempKey tk = new TempKey();
		Member m = new Member();
		String checkNum = tk.getKey(8, false);
		
		m.setUserId(userId);
		m.setEmail(email);
		m.setUserPwd(checkNum);
		
		int result = mService.findMemberPwd(m);
		
		if(result>0) {
		
		/* 이메일 보내기 */
        String setFrom = "ddasum0@gmail.com";
        String toMail = m.getEmail();
        String title = "따숨 임시 비밀번호 발급";
        String content = 
                "따숨을 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "<b>"+m.getUserId()+"</b>님의 임시 비밀 번호는 <Strong>" + checkNum + "</Strong>입니다." + 
                "<br>" + 
                "발급된 임시번호를 사용하여 로그인해주세요.";
        
        try {
		
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        	response.getWriter().print(true);//비밀번호 변경 완료
        
		}else {
			response.getWriter().print(false);//비밀번호 변경 실패
		}
	}
	
	@RequestMapping(value = "/member/findBizMemberPwd.do", method = RequestMethod.POST)
	public void findBizMemberPwd(@RequestParam String bizId, @RequestParam String bizEmail, HttpServletResponse response) throws IOException{
		
		TempKey tk = new TempKey();
		BizMember bm = new BizMember();
		String checkNum = tk.getKey(8, false);
		
		bm.setBizId(bizId);
		bm.setBizEmail(bizEmail);
		bm.setBizPwd(checkNum);
		
		int result = mService.findBizMemberPwd(bm);
		
		if(result>0) {
		
		/* 이메일 보내기 */
        String setFrom = "ddasum0@gmail.com";
        String toMail = bm.getBizEmail();
        String title = "따숨 임시 비밀번호 발급";
        String content = 
                "따숨을 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "<b>"+bm.getBizId()+"</b>님의 임시 비밀 번호는 <Strong>" + checkNum + "</Strong>입니다." + 
                "<br>" + 
                "발급된 임시번호를 사용하여 로그인해주세요.";
        
        try {
		
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        	response.getWriter().print(true);//비밀번호 변경 완료
        
		}else {
			response.getWriter().print(false);//비밀번호 변경 실패
		}
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

	@RequestMapping(value = "/member/bizMemberJoinPage.do", method = RequestMethod.GET)
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

	@RequestMapping(value = "/member/reservationCancle.do", method = RequestMethod.GET)
	public ModelAndView reservationCancle(@RequestParam int reNo,@SessionAttribute Member member,HttpServletResponse response, ModelAndView mav) throws IOException {
		
		
		
		int userNo = member.getUserNo();
		
		int result = mService.reservationCancle(userNo, reNo);
		
		if(result >0) {
			mav.addObject("msg", "예약을 취소하였습니다.");
			mav.addObject("location", "/member/reservationPage.do");
		}else {
			mav.addObject("msg", "예약 취소 실패 - 지속적인 문제 발생시 관리자에게 문의바랍니다. -");
			mav.addObject("location", "/");
		}
		
		mav.setViewName("commons/msg");
		
		return mav;
	}
	
	
	@RequestMapping(value = "/member/withdraw.do")
	public void memberWithdraw(@SessionAttribute Member member, HttpSession session,HttpServletResponse response) throws IOException {
		
		String userId = member.getUserId();
		
		int result = mService.memberWithdraw(userId);
		
		if(result > 0) {
			session.invalidate();
			
			response.getWriter().print("true");
		}else {
			response.getWriter().print("false");
		}
		
	}

}