package kr.or.ddasum.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddasum.admin.model.dao.AdminDAO;
import kr.or.ddasum.admin.model.vo.AdminMember;
import kr.or.ddasum.board.model.vo.Notice;
import kr.or.ddasum.member.model.vo.Detail;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO admDAO;	
	
	@Autowired
	SqlSessionTemplate sqlSession;
			
	@Override
	public ArrayList<AdminMember> adminSelectAllMember(int currentPage, int recordCountPerPage) {

		return admDAO.adminSelectAllMember(currentPage, recordCountPerPage);
	}

	@Override
	public int memberTotalCount() {
		return admDAO.recordTotalCount();
	}

	@Override
	public ArrayList<Detail> adminMemberDetail(int currentPage, int recordCountPerPage, int userNo) {
		
		return admDAO.adminMemberDetail(currentPage, recordCountPerPage, userNo);
		
	}

	@Override
	public int detailTotalCount(int userNo) {
		return admDAO.memberDetailTotalCount(userNo);
	}
	
	public HashMap<String, Object> memberDetailName(int userNo) {
		return admDAO.detailMemberName(userNo);
	}

	//사업자페이지 페이징
	@Override
	public ArrayList<HashMap<String, Object>> adminSelectAllBizMember(int currentPage, int recordCountPerPage) {
		return admDAO.adminSelectAllBizMember(currentPage, recordCountPerPage);	}

	@Override
	public int recordBizTotalCount() {
		return admDAO.recordBizTotalCount();
	}

	@Override
	public int cardTotalCount() {
		return admDAO.cardTotalCount();
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectAllCardMember(int currentPage, int recordCountPerPage) {
		return admDAO.adminSelectAllCardMember(currentPage, recordCountPerPage);
	}

	//상세정보
	@Override
	public HashMap<String, Object> adminMemberInfo(int userNo) {
	
		return admDAO.adminSelectOneMemberInfo(userNo);
	}

	//사업자 상세정보
	@Override
	public HashMap<String, Object> adminBizMemberInfo(int bizNo) {
		return admDAO.adminSelectOneBizMemberInfo(bizNo);
	}

	//공지사항 총 글 수
	@Override
	public int recordNoticeTotalCount() {
		return admDAO.recordNoticeTotalCount();
	}

	//공지사항 페이징
	@Override
	public ArrayList<HashMap<String, Object>> adminSelectAllNotice(int currentPage, int recordCountPerPage) {
		return admDAO.adminSelectAllNotice(currentPage, recordCountPerPage);
	}

	//FAQ 총 글 수
	@Override
	public int recordFAQTotalCount() {
		return admDAO.recordFAQTotalCount();
	}

	//FAQ 페이징
	@Override
	public ArrayList<HashMap<String, Object>> adminSelectAllFAQNotice(int currentPage, int recordCountPerPage) {
		return admDAO.adminSelectAllFAQ(currentPage, recordCountPerPage);
	}

	//회원탈퇴
	@Override
	public int adminUpdateMemberEndYN(HashMap<String, Object> map) {
		return admDAO.adminUpdateMemberEndYN(map);
	}

	//사업자 탈퇴
	@Override
	public int adminUpdateBizMemberEndYN(HashMap<String, Object> map) {
		return admDAO.adminUpdateBizMemberEndYN(map);
	}

	@Override
	public int recordSupportTotalCount() {
		
		return admDAO.recordSupportTotalCount();
	}

	@Override
	public ArrayList<HashMap<String, Object>> adminSelectAllSupport(int currentPage, int recordCountPerPage) {
		return admDAO.adminSelectAllSupport(currentPage, recordCountPerPage);
	}

	@Override
	public int recordMemberSearchCount() {
		
		return admDAO.adminMemberSearchTotalCount();
	}

	@Override
	public ArrayList<HashMap<String, Object>> searchMember(String type, String keyword, int currentPage,
			int recordCountPerPage) {

		return admDAO.adminMemberSearchList(type, keyword, currentPage, recordCountPerPage);
	}
	
	@Override
	public Notice adminNoticeDetail(int iNo) {
		
		return admDAO.adminNoticeDetail(iNo);
		
	}

	@Override
	public Notice adminFAQDetail(int iNo) {
		
		return admDAO.adminFAQDetail(iNo);
		
	}

	//공지 수정
	@Override
	public int adminNoticeUpdate(Notice noti) {
		return admDAO.Notice(noti);
	}






}
