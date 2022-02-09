package kr.or.ddasum.file.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddasum.file.model.dao.FileDAO;
import kr.or.ddasum.file.model.vo.FileData;

@Service
public class FileServiceImpl implements FileService {

	@Autowired
	private FileDAO fDAO;

	@Override
	
	public int insertUploadFile(FileData fd) {
		return fDAO.insertUploadFile(fd);
		
	}
}
