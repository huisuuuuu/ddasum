package kr.or.ddasum.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.or.ddasum.member.model.vo.Member;

@Aspect
@Component
public class MemberAOP {
	
	@Autowired
	private SHA256Util enc;
	
	//회원 가입 암호화 처리 AOP 로직
	@Pointcut("execution(int kr.or.ddasum.member.model.service.MemberServiceImpl.insertMember(..))")
	public void insertMemberPointCut() {}
	
	@Before("insertMemberPointCut()")
	public void insertMemberPasswordEncryption(JoinPoint jp) throws Exception
	{
		
		Member m = (Member)jp.getArgs()[0];
		
		String userId = m.getUserId();
		String userPwd = m.getUserPwd();
		
		String encryptPwd = enc.encryptionData(userPwd, userId);

		m.setUserPwd(encryptPwd);
		
	}
	
	//로그인 시 작성한 비밀번호 암호화 처리 AOP 로직
	
	@Pointcut("execution(kr.or.ddasum.member.model.vo.Member kr.or.ddasum.member.model.service.MemberServiceImpl.memberLogin(..))")
	public void memberLoginPointCut() {}
	
	@Before("memberLoginPointCut()")
	public void loginPasswordEncryption(JoinPoint jp) throws Exception{
		
		Member m = (Member)jp.getArgs()[0];
		
		String userId = m.getUserId();
		String userPwd = m.getUserPwd();
		
		String encryptPwd = enc.encryptionData(userPwd, userId);
		
		m.setUserPwd(encryptPwd);
		
	}
	
	//로그인 시 작성한 비밀번호 암호화 처리 AOP 로직
	
	@Pointcut("execution(int kr.or.ddasum.member.model.service.MemberServiceImpl.findMemberPwd(..))")
	public void findMemberPwdPointCut() {}
	
	@Before("findMemberPwdPointCut()")
	public void findMemberPwdEncryption(JoinPoint jp) throws Exception{
		
		Member m = (Member)jp.getArgs()[0];
		
		String userId = m.getUserId();
		String userPwd = m.getUserPwd();
		
		String encryptPwd = enc.encryptionData(userPwd, userId);
		
		m.setUserPwd(encryptPwd);
		
	}
}
