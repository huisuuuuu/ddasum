package kr.or.ddasum.file.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.ddasum.file.model.vo.FileData;

@Repository
public class FileDAO {

	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public int insertUploadFile(FileData fd) {
		return sqlSession.insert("fileData.fileUpload",fd);
		
	}


}
