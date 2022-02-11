package kr.or.ddasum.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import kr.or.ddasum.admin.model.vo.AdminMember;
import kr.or.ddasum.member.model.vo.Detail;

public interface AdminService {


	ArrayList<AdminMember> adminSelectAllMember(int currentPage, int recordCountPerPage);


	int memberTotalCount();


	HashMap<String, Object> userDetail(int currentPage, int userNo);
	
}
