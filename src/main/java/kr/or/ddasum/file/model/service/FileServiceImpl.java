package kr.or.ddasum.file.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddasum.file.model.dao.FileDAO;
import kr.or.ddasum.file.model.vo.FileData;
import kr.or.ddasum.file.model.vo.MemberCard;
import kr.or.ddasum.member.model.vo.Member;

@Service
public class FileServiceImpl implements FileService {

	@Autowired
	private FileDAO fDAO;

	@Override
	
	public int insertUploadFile(FileData fd) {
		return fDAO.insertUploadFile(fd);
		
	}
	@Override
	public int memberPImage(Member member) {
		return fDAO.memberPImage(member);
		
	}

	@Override
	public int enrollMentImgUpload(MemberCard c) {
		return fDAO.enrollMentImgUpload(c);
		
	}

	@Override
	public int memberCardImage(Member member) {
		return fDAO.memberCardImage(member);
	}

}
