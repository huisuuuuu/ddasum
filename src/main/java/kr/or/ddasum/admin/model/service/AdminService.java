package kr.or.ddasum.admin.model.service;

import java.util.ArrayList;

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
	
//	//카드인증관리
//	ArrayList<Card> adminSelectAllCardList(int currentPage, int recordCountPerPage);
//	
//	//카드인증신청 회원내역수
//	int cardTotalCount();


}
