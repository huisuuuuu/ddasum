package kr.or.ddasum.file.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.ddasum.file.model.vo.FileData;
import kr.or.ddasum.file.model.vo.MemberCard;
import kr.or.ddasum.member.model.vo.Member;

@Repository
public class FileDAO {

	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public int insertUploadFile(FileData fd) {
		return sqlSession.insert("fileData.fileUpload",fd);
		
	}

	public int memberPImage(Member member) {
		return sqlSession.update("fileData.memberPimage",member);
	}

	public int enrollMentImgUpload(MemberCard c) {
		return sqlSession.insert("card.enrollMentImg",c);
		
	}

	public int memberCardImage(Member member) {
		return sqlSession.update("card.memberCardImage",member);
		
	}
}
