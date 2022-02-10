package kr.or.ddasum.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddasum.admin.model.dao.AdminDAO;
import kr.or.ddasum.admin.model.vo.AdminMember;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO admDAO;

	@Override
	public ArrayList<AdminMember> adminMemberManageList() {
		return admDAO.adminMemberManageList();
	}

}
