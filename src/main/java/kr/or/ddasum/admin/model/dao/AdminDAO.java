package kr.or.ddasum.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.ddasum.admin.model.vo.AdminMember;
import kr.or.ddasum.board.model.vo.Notice;
import kr.or.ddasum.member.model.vo.Detail;
 
@Repository
public class AdminDAO {
	
	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	//회원정보페이징
	public ArrayList<AdminMember> adminSelectAllMember(int currentPage,	int recordCountPerPage) {	
		int start = (currentPage - 1) * recordCountPerPage;
		int end = recordCountPerPage;
		RowBounds rb = new RowBounds(start, end);
		return new ArrayList<AdminMember> (sqlSession.selectList("admin.adminSelectAllMember", null, rb));
	}
	
	//회원정보 총 수
	public int recordTotalCount() {
		return sqlSession.selectOne("admin.selectAllMemberTotalCount");
	}
	
	//회원이용내역 페이징
	public ArrayList<Detail> adminMemberDetail(int currentPage, int recordCountPerPage, int userNo) {
		int start = (currentPage - 1) * recordCountPerPage;
		int end = recordCountPerPage;
		RowBounds rb = new RowBounds(start, end);
		return new ArrayList<Detail> (sqlSession.selectList("admin.adminMemberDetail", userNo, rb));
	}
	
	//회원이용내역 총 수
	public int memberDetailTotalCount(int userNo) {
		return sqlSession.selectOne("admin.memberDetailTotalCount", userNo);
	}

	//회원이용내역 이름
	public HashMap<String, Object> detailMemberName(int userNo) {
		return sqlSession.selectOne("admin.memberDetailName", userNo);
	}

	//사업자 정보 페이징
	public ArrayList<HashMap<String, Object>> adminSelectAllBizMember(int currentPage,	int recordCountPerPage) {	
		int start = (currentPage - 1) * recordCountPerPage;
		int end = recordCountPerPage;
		RowBounds rb = new RowBounds(start, end);
		return new ArrayList<HashMap<String, Object>> (sqlSession.selectList("admin.adminSelectAllBizMember", null, rb));
	}

	//사업자 총 수 
	public int recordBizTotalCount() {
		return sqlSession.selectOne("admin.selectAllBizMemberTotalCount");
	}

	//카드 인증 신청 회원 페이징
	public ArrayList<HashMap<String, Object>> adminSelectAllCardMember(int currentPage, int recordCountPerPage) {
		int start = (currentPage - 1) * recordCountPerPage;
		int end = recordCountPerPage;		
		RowBounds rb = new RowBounds(start, end);
		return new ArrayList<HashMap<String, Object>> (sqlSession.selectList("admin.selectAllCardMember", null, rb));
	}

	//카드인증신청 회원 총 수
	public int cardTotalCount() {
		return sqlSession.selectOne("admin.selectAllCardTotalCount");
	}

	//회원정보 상세확인
	public HashMap<String, Object> adminSelectOneMemberInfo(int userNo) {
		
		return sqlSession.selectOne("admin.selectOneMemberInfo", userNo);
	}
	
	//사업자정보 상세확인
	public HashMap<String, Object> adminSelectOneBizMemberInfo(int bizNo) {
		return sqlSession.selectOne("admin.selectOneBizMemberInfo", bizNo);
	}

	//공지사항관리 총 글 수
	public int recordNoticeTotalCount() {
		return sqlSession.selectOne("admin.selectAllNoticeTotalCount");
	}

	//공지사항 페이징
	public ArrayList<HashMap<String, Object>> adminSelectAllNotice(int currentPage, int recordCountPerPage) {
		int start = (currentPage - 1) * recordCountPerPage;
		int end = recordCountPerPage;
		RowBounds rb = new RowBounds(start, end);
		return new ArrayList<HashMap<String, Object>> (sqlSession.selectList("admin.adminSelectAllNotice", null, rb));
	}

	//FAQ 총 글 수
	public int recordFAQTotalCount() {
		return sqlSession.selectOne("admin.selectAllFAQTotalCount");
	}

	//FAQ 페이징
	public ArrayList<HashMap<String, Object>> adminSelectAllFAQ(int currentPage, int recordCountPerPage) {
		int start = (currentPage - 1) * recordCountPerPage;
		int end = recordCountPerPage;
		RowBounds rb = new RowBounds(start, end);
		return new ArrayList<HashMap<String, Object>> (sqlSession.selectList("admin.adminSelectAllFAQ", null, rb));
	}

	//MemberInfo 회원탈퇴
	public int adminUpdateMemberEndYN(HashMap<String, Object> map) {
		return sqlSession.update("admin.updateAdminMemberEndYN", map);
	}
	
	//사업자 회원탈퇴
	public int adminUpdateBizMemberEndYN(HashMap<String, Object> map) {
		return sqlSession.update("admin.updateAdminBizMemberEndYN", map);
	}

	//후원페이지 글 수
	public int recordSupportTotalCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.selectAllSupportTotalCount");
	}

	//후원페이지 페이징
	public ArrayList<HashMap<String, Object>> adminSelectAllSupport(int currentPage, int recordCountPerPage) {
		int start = (currentPage - 1) * recordCountPerPage;
		int end = recordCountPerPage;
		RowBounds rb = new RowBounds(start, end);
		return new ArrayList<HashMap<String, Object>> (sqlSession.selectList("admin.adminSelectAllSupport", null, rb));
	}

	public int adminMemberSearchTotalCount() {

		return sqlSession.selectOne("admin.memberSearchTotalCount");
	}

	public ArrayList<HashMap<String, Object>> adminMemberSearchList(String type, String keyword, int currentPage,
		int recordCountPerPage) {
		int start = (currentPage - 1) * recordCountPerPage;
		int end = recordCountPerPage;
		RowBounds rb = new RowBounds(start, end);
		return new ArrayList<HashMap<String, Object>> (sqlSession.selectList("admin.memberSearchList", null, rb));
	}
	
	//공지사항 글 읽기
	public Notice adminNoticeDetail (int iNo) {
		return sqlSession.selectOne("admin.adminNoticeDetail",iNo);
	}
		
	//FAQ 글 읽기
	public Notice adminFAQDetail (int iNo) {
		return sqlSession.selectOne("admin.adminFAQDetail",iNo);
	}

	//공지사항 수정뷰
	public Notice adminNoticeOnePost(int iNo) {
		
		return sqlSession.selectOne("admin.adminNoticeOnePost",iNo);
	}

	//공지사항수정
	public int adminNoticeUpdate(Notice noti) {

		return sqlSession.update("admin.updateNotice", noti);
	}

	public Notice adminFAQOnePost(int iNo) {

		return sqlSession.selectOne("admin.adminFAQOnePost",iNo);
	}

	public int admFAQUpdate(Notice noFaq) {
		return sqlSession.update("admin.updateFAQ", noFaq);
	}

	//카드인증멤버이름
	public HashMap<String, Object> adminSelectOneCardMemberInfo(int userNo) {

		return sqlSession.selectOne("admin.cardDetailName", userNo);
	}


		
		
		
		



	

}
