package kr.or.ddasum.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import kr.or.ddasum.admin.model.vo.AdminMember;
import kr.or.ddasum.board.model.vo.Notice;
import kr.or.ddasum.member.model.vo.Detail;

public interface AdminService {

	//회원정보관리
	ArrayList<AdminMember> adminSelectAllMember(int currentPage, int recordCountPerPage);

	//회원수
	int memberTotalCount();

	//회원이용내역
	ArrayList<Detail> adminMemberDetail(int currentPage, int recordCountPerPage, int userNo);
	
	//회원이용내역수
	int detailTotalCount(int userNo);
	
	HashMap<String, Object> memberDetailName(int userNo);

	//사업자관리페이지
	ArrayList<HashMap<String, Object>> adminSelectAllBizMember(int currentPage, int recordCountPerPage);
		
	//사업자 수
	int recordBizTotalCount();

	//카드인증신청 회원내역수
	int cardTotalCount();
	
	//카드인증관리
	ArrayList<HashMap<String, Object>> selectAllCardMember(int currentPage, int recordCountPerPage);

	//회원 상세정보
	HashMap<String, Object> adminMemberInfo(int userNo);

	//사업자 상세정보
	HashMap<String, Object> adminBizMemberInfo(int bizNo);

	//공지사항 글 총 수
	int recordNoticeTotalCount();

	//공지사항관리 페이징
	ArrayList<HashMap<String, Object>> adminSelectAllNotice(int currentPage, int recordCountPerPage);

	//FAQ 글 총 수
	int recordFAQTotalCount();

	//FAQ 페이징
	ArrayList<HashMap<String, Object>> adminSelectAllFAQNotice(int currentPage, int recordCountPerPage);

	//회원탈퇴
	int adminUpdateMemberEndYN(HashMap<String, Object> map);

	//사업자 탈퇴
	int adminUpdateBizMemberEndYN(HashMap<String, Object> map);

	//후원 글 총 수
	int recordSupportTotalCount();

	//후원 페이징
	ArrayList<HashMap<String, Object>> adminSelectAllSupport(int currentPage, int recordCountPerPage);

	//검색 글 수 (회원관리)
	int recordMemberSearchCount();

	//검색 글 수 페이징 (회원관리)
	ArrayList<HashMap<String, Object>> searchMember(String type, String keyword, int currentPage,
			int recordCountPerPage);

	//공지 글 읽기
	Notice adminNoticeDetail(int iNo);

	//FAQ 글 읽기
	Notice adminFAQDetail(int iNo);
	
	//공지 글 수정
	int adminNoticeUpdate(Notice noti);
	


	
	




}
