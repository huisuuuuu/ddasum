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
	  * @Method Name : addGood
	  * @작성일 : 2022. 2. 9.
	  * @작성자 : lee
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param bg
	  * @return
	  */

	
	
	
}
