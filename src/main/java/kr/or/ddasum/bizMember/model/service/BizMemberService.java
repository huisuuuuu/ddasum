package kr.or.ddasum.bizMember.model.service;

import java.util.ArrayList;

import kr.or.ddasum.bizMember.model.vo.BizGoods;
import kr.or.ddasum.member.model.vo.BizMember;

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
	int supportChange(String bizNo);




}
