package kr.or.ddasum.bizMember.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import kr.or.ddasum.bizMember.model.vo.BizGoods;
import kr.or.ddasum.bizMember.model.vo.Calculater;
import kr.or.ddasum.member.model.vo.BizMember;
import kr.or.ddasum.member.model.vo.Detail;

public interface BizMemberService {

	/**
	  * @Method Name : bizManage
	  * @작성일 : 2022. 2. 8.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 : 사업자 정보 요청
	  * @param bizMember
	  */
	BizMember bizManage(BizMember bizMember);

	/**
	  * @Method Name : goodsManage
	  * @작성일 : 2022. 2. 8.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :상품 정보 리스트
	  * @param bizNo
	 * @param cntPerPageInt 
	 * @param nowPageInt 
	 * @return 
	  */
	ArrayList<BizGoods> goodsManage(int bizNo, int nowPageInt, int cntPerPageInt);

	/**
	  * @Method Name : updateBiz
	  * @작성일 : 2022. 2. 8.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :사업자 정보 수정(ceoName,bizName,bizEmail,bizPhone,restaurant,address,bizTime,bizCount)
	  * @param bz
	 * @return 
	  */
	int updateBiz(BizMember bz);

	/**
	  * @Method Name : updateWithdraw
	  * @작성일 : 2022. 2. 10.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :회원탈퇴 로직
	  * @param bizId
	 * @return 
	  */
	int updateWithdraw(String bizId);

	/**
	  * @Method Name : supportChange
	  * @작성일 : 2022. 2. 10.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 : 사업자 유형 변환
	  * @param bizNo
	  */
	int suportChange(BizMember bg);

	/**
	  * @Method Name : addGood
	  * @작성일 : 2022. 2. 10.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 : 상품추가
	  * @param bg
	  * @return
	  */
	int addGood(BizGoods bg);

	/**
	  * @Method Name : goodModify
	  * @작성일 : 2022. 2. 10.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :메뉴수정 페이지 데이터 요청
	  * @param menuNo
	 * @return 
	  */
	BizGoods goodModify(int menuNo);

	/**
	  * @Method Name : GoodMo
	  * @작성일 : 2022. 2. 10.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 : 메뉴 수정
	  * @param bg
	  * @return
	  */
	int GoodMo(BizGoods bg);

	/**
	  * @Method Name : countcalculate
	  * @작성일 : 2022. 2. 12.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 : 정산 총 수량
	  * @param bizNo
	  * @return
	  */
	
	/*
	int countcalculate(int bizNo);
	
	/**
	  * @Method Name : calculate
	  * @작성일 : 2022. 2. 11.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :정산 리스트 조회
	  * @param bizNo
	  * @return
	  */
	/*
	int countGood(int bizNo);

	/**
	  * @Method Name : countreserv
	  * @작성일 : 2022. 2. 12.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 : 상품 총 수량
	  * @param bizNo
	  * @return
	  */
/*	int countreserv(int bizNo);

	/**
	  * @Method Name : bizReserv
	  * @작성일 : 2022. 2. 13.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :예약 리스트(페이징)
	  * @param bizNo
	  * @param nowPageInt
	  * @param cntPerPageInt
	  * @return
	  */
	ArrayList<Detail> bizReserv(int currentPage, int recordCountPerPage, int bizNo);

	/**
	  * @Method Name : recordBizTotalCount
	  * @작성일 : 2022. 2. 14.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :
	  * @return
	  */
	int recordBizTotalCount(int bizNo);

	/**
	  * @Method Name : goodsManageList
	  * @작성일 : 2022. 2. 14.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :상품 리스트(페이징)
	  * @param currentPage
	  * @param recordCountPerPage
	  * @return
	  */
	ArrayList<HashMap<String, Object>> goodsManageList(int bizNo, int currentPage, int recordCountPerPage);

	/**
	  * @Method Name : reservTotalCount
	  * @작성일 : 2022. 2. 14.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param bizNo
	  * @return
	  */
	int detailTotalCount(int bizNo);

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
	ArrayList<Detail> calculateManage(int currentPage, int recordCountPerPage, int bizNo);

	/**
	  * @Method Name : calculate
	  * @작성일 : 2022. 2. 14.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param bizNo
	  * @param parseInt
	  * @param parseInt2
	  * @return
	  */
	/*	ArrayList<Calculater> calculate(int bizNo, int parseInt, int parseInt2);
*/


	

}
