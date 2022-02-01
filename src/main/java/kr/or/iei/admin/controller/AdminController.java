package kr.or.iei.admin.controller;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.iei.Test;

@Controller
public class AdminController {
	
	
	
	@Autowired
	private SqlSessionTemplate sql;
	
	@RequestMapping(value = "/admin/adminTest.do", method = RequestMethod.GET)
	public void test() {
		int a = 1;
		Test t = sql.selectOne("admin.test", a);
		System.out.println(t.toString());
	}
	
}
