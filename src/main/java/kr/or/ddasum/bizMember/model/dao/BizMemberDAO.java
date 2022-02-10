package kr.or.ddasum.bizMember.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.ddasum.bizMember.model.vo.BizGoods;
import kr.or.ddasum.board.model.vo.Notice;
import kr.or.ddasum.member.model.vo.BizMember;

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
	  * @Method 설명 :사업자 정보 요청
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
	  * @Method 설명 :상품 정보 리스트
	  * @param bizNo
	  */
	public ArrayList<BizGoods> goodsManage(int bizNo) {

		return new ArrayList<BizGoods> (sqlSession.selectList("bizAdmin.goodsManage", bizNo));

		
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
	  * @Method 설명 :회원탈퇴 로직
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
	  * @Method 설명 :사업자 유형 변환
	  * @param bizNo
	  * @return
	  */
	public int suportChange(String bizId) {

		return sqlSession.update("bizAdmin.suportChange",bizId);
	}

	/**
	  * @Method Name : addGood
	  * @작성일 : 2022. 2. 10.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :상품추가
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
	  * @Method 설명 :메뉴수정 페이지 데이터 요청
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
	  * @Method 설명 :상품수정
	  * @param bg
	  * @return
	  */
	public int GoodMo(BizGoods bg) {

		return sqlSession.update("bizAdmin.GoodMo",bg);
	}

	
	
	
}
