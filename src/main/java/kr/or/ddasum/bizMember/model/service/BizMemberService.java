package kr.or.ddasum.bizMember.model.service;

import java.util.ArrayList;

import kr.or.ddasum.bizMember.model.vo.BizGoods;
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
	 * @return 
	  */
	ArrayList<BizGoods> goodsManage(int bizNo);

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
	int suportChange(String bizId);

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
	  * @Method Name : bizReserv
	  * @작성일 : 2022. 2. 11.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 : 예약 리스트 조회
	  * @param bizNo
	  * @return
	  */
	ArrayList<Detail> bizReserv(int bizNo);

	/**
	  * @Method Name : calculate
	  * @작성일 : 2022. 2. 11.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :정산 리스트 조회
	  * @param bizNo
	  * @return
	  */
	ArrayList<Detail> calculate(int bizNo);





}
