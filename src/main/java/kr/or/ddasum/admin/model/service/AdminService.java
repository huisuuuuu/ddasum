package kr.or.ddasum.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import kr.or.ddasum.admin.model.vo.AdminMember;
import kr.or.ddasum.member.model.vo.Detail;

public interface AdminService {

	//회원정보관리
	ArrayList<AdminMember> adminSelectAllMember(int currentPage, int recordCountPerPage);

	//회원수
	int memberTotalCount();

	//회원이용내역
	ArrayList<Detail> adminMemberDetail(int currentPage, int recordCountPerPage, int userNo);
	
	//회원이용내역수
	int detailTotalCount();

	//회원정보관리-검색
	HashMap<String, Object> adminSearchMember(String type, String keyword, int currentPage);
}
