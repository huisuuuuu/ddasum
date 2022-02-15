package kr.or.ddasum.bizMember.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.ddasum.bizMember.model.vo.BizGoods;
import kr.or.ddasum.bizMember.model.vo.Calculater;
import kr.or.ddasum.community.model.vo.Community;
import kr.or.ddasum.member.model.vo.BizMember;
import kr.or.ddasum.member.model.vo.Detail;

@Repository
public class BizMemberDAO {

	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	
	
	/**
	  * @Method Name : bizManage
	  * @작성일 : 2022. 2. 8.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :사업자 정보 페이지 데이터 호출
	  * @param bizMember
	  * @return
	  */
	public BizMember bizManage(BizMember bizMember) {

		return sqlSession.selectOne("bizAdmin.bizManage", bizMember);

	}

	/**
	  * @Method Name : goodsManage
	  * @작성일 : 2022. 2. 8.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :상품 정보 리스트 호출(페이징 처리)
	  * @param bizNo
	  */
	public ArrayList<BizGoods> goodsManage(int bizNo, int start, int end) {
		HashMap<String, Integer> hashmap;
		hashmap = new HashMap<>();
		hashmap.put("bizNo", bizNo);
		hashmap.put("start", start);
		hashmap.put("end", end);
		return new ArrayList<BizGoods> (sqlSession.selectList("bizAdmin.goodsManage", hashmap));
		
	}

	/**
	  * @Method Name : updateBiz
	  * @작성일 : 2022. 2. 8.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :사업자 정보 수정(ceoName,bizName,bizEmail,bizPhone,restaurant,address,bizTime,bizCount)
	  * @param bz
	  * @return
	  */
	public int updateBiz(BizMember bz) {

		return sqlSession.update("bizAdmin.updateBiz",bz);

	}

	/**
	  * @Method Name : updateWithdraw
	  * @작성일 : 2022. 2. 10.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :사업자 회원 탈퇴 호출(미완성)
	  * @param bizId
	  * @return
	  */
	public int updateWithdraw(String bizId) {

		return sqlSession.update("bizAdmin.updateWithdraw",bizId);

	}

	/**
	  * @Method Name : suportChange
	  * @작성일 : 2022. 2. 10.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :사업자 유형(SP, DC) 변환 호출
	  * @param bizNo
	  * @return
	  */
	public int suportChange(BizMember bg) {

		return sqlSession.update("bizAdmin.suportChange",bg);
	}

	/**
	  * @Method Name : addGood
	  * @작성일 : 2022. 2. 10.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :상품 추가 로직(이미지 미 추가)
	  * @param bg
	  * @return
	  */
	public int addGood(BizGoods bg) {

		return sqlSession.insert("bizAdmin.addGood",bg);

	}

	/**
	  * @Method Name : goodModify
	  * @작성일 : 2022. 2. 10.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :메뉴 수정 페이지 데이터 요청
	  * @param menuNo
	  * @return
	  */
	public BizGoods goodModify(int menuNo) {

		return sqlSession.selectOne("bizAdmin.goodModify", menuNo);
	}

	/**
	  * @Method Name : GoodMo
	  * @작성일 : 2022. 2. 10.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :상품수정 로직
	  * @param bg
	  * @return
	  */
	public int GoodMo(BizGoods bg) {

		return sqlSession.update("bizAdmin.GoodMo",bg);
	}

	/**
	  * @Method Name : bizReserv
	  * @작성일 : 2022. 2. 11.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :예약 리스트 호출(페이징처리)
	  * @param bizNo
	 * @param end 
	 * @param start 
	  * @return
	  */
	public ArrayList<Detail> bizReserv(int currentPage, int recordCountPerPage, int bizNo) {
		int start = (currentPage - 1) * recordCountPerPage;
		int end = recordCountPerPage;
		RowBounds rb = new RowBounds(start, end);
		return new ArrayList<Detail> (sqlSession.selectList("bizAdmin.bizReserv", bizNo, rb));
	}

/*
	/**
	  * @Method Name : countGood
	  * @작성일 : 2022. 2. 12.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :상품 총 수량
	  * @param bizNo
	  * @return
	  */
/*	public int countGood(int bizNo) {
		return sqlSession.selectOne("bizAdmin.countGood", bizNo);
	}

	/**
	  * @Method Name : countreserv
	  * @작성일 : 2022. 2. 12.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :예약 총 수량
	  * @param bizNo
	  * @return
	  */
/*	public int countreserv(int bizNo) {
		return sqlSession.selectOne("bizAdmin.countreserv", bizNo);
	}

	/**
	  * @Method Name : countcalculate
	  * @작성일 : 2022. 2. 12.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :정산 총 수량
	  * @param bizNo
	  * @return
	  */
/*	public int countcalculate(int bizNo) {
		return sqlSession.selectOne("bizAdmin.countcalculate", bizNo);
	}
/*
	/**
	  * @Method Name : searchReserv
	  * @작성일 : 2022. 2. 13.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param currentPage
	  * @param recordCountPerPage
	  * @return
	  */
/*	public ArrayList<Community> searchReserv(SqlSessionTemplate sqlSession, String type, String keyword, int currentPage, int recordCountPerPage) {
		
		int offset = ((currentPage-1));
		int limit = recordCountPerPage;
		
		RowBounds rb = new RowBounds(offset, limit);		
		
		HashMap<String, String> map = new HashMap<String, String> ();
		map.put("type", type);
		map.put("keyword", keyword);
		return new ArrayList<Community> (sqlSession.selectList("community.searchReserv", map, rb));
	}
*/
	/**
	  * @Method Name : calculate
	  * @작성일 : 2022. 2. 13.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param currentPage
	  * @param recordCountPerPage
	  * @param bizNo
	  * @return
	  */
/*	public ArrayList<Detail> calculate(int currentPage, int recordCountPerPage, int bizNo) {
		
		RowBounds rb = new RowBounds(((currentPage-1)*recordCountPerPage),recordCountPerPage);
		
		
		ArrayList<Detail> list = new ArrayList<Detail>(sqlSession.selectList("bizMember.calculate",bizNo, rb));
		
		return list;
	}

	/**
	  * @Method Name : getPageNavi
	  * @작성일 : 2022. 2. 13.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param currentPage
	  * @param recordCountPerPage
	  * @param naviCountPerPage
	  * @param bizNo
	  * @return
	  */
	/*	public String getPageNavi(int currentPage, int recordCountPerPage, int naviCountPerPage, int bizNo) {
		int recordTotalCount = countcalculate(bizNo);
		
		int pageTotalCount;
		
		pageTotalCount =(int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
		
		int startNavi = ((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1;
		int endNavi = startNavi + naviCountPerPage - 1;
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		StringBuilder sb = new StringBuilder();

		if(startNavi!=1) {
			sb.append("<li><a href='/BizMember/calculateManage.do?currentPage="+(startNavi-1)+"'><i class='fas fa-chevron-left'></i></a></li>");
		}

		for(int i=startNavi; i<=endNavi; i++) {
			
			if(i==currentPage) {
				sb.append("<li><a href='/BizMember/calculateManage.do?currentPage="+i+"' class='page_active'>"+i+"</a></li>");
			}else {
				sb.append("<li><a href='/BizMember/calculateManage.do?currentPage="+i+"'>"+i+"</a></li>");
			}
		}

		if(endNavi!=pageTotalCount) {
			sb.append("<li><a href='/BizMember/calculateManage.do?currentPage="+(endNavi+1)+"'><i class='fas fa-chevron-right'></i></a></li>");
		}
		
		return sb.toString();
		}
	*/

	/**
	  * @Method Name : recordBizTotalCount
	  * @작성일 : 2022. 2. 14.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 : 사업자 수 확인
	  * @return
	  */
	public int recordBizTotalCount(int bizNo) {
		return sqlSession.selectOne("bizAdmin.recordBizTotalCount", bizNo);
			}
	/**
	  * @Method Name : goodsManageList
	  * @작성일 : 2022. 2. 14.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :상품 리스트 호출(페이징처리)
	  * @return
	  */
	public ArrayList<HashMap<String, Object>> goodsManageList(int bizNo, int currentPage, int recordCountPerPage) {
		int start = (currentPage - 1) * recordCountPerPage;
		int end = recordCountPerPage;
		int bizNo1 = bizNo;
		RowBounds rb = new RowBounds(start, end);
		return new ArrayList<HashMap<String, Object>> (sqlSession.selectList("bizAdmin.goodsManageList", bizNo1, rb));
		}

	/**
	  * @Method Name : memberDetailTotalCount
	  * @작성일 : 2022. 2. 14.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :예약 수 확인
	  * @param bizNo
	  * @return
	  */
	public int memberDetailTotalCount(int bizNo) {
		return sqlSession.selectOne("bizAdmin.memberDetailTotalCount", bizNo);

	}

	/**
	  * @Method Name : calculateManage
	  * @작성일 : 2022. 2. 14.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 : 정산 리스트(페이징)
	  * @param currentPage
	  * @param recordCountPerPage
	  * @param bizNo
	  * @return
	  */
	public ArrayList<Detail> calculateManage(int currentPage, int recordCountPerPage, int bizNo) {
		int start = (currentPage - 1) * recordCountPerPage;
		int end = recordCountPerPage;
		RowBounds rb = new RowBounds(start, end);
		return new ArrayList<Detail> (sqlSession.selectList("bizAdmin.calculateManage", bizNo, rb));
	}

	/**
	  * @Method Name : calculateTotalCount
	  * @작성일 : 2022. 2. 14.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param bizNo
	  * @return
	  */

	
	
	
	
	
	
	
	
	
	
	
	
}

	

