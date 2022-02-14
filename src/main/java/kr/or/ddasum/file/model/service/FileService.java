package kr.or.ddasum.file.model.service;

import kr.or.ddasum.file.model.vo.FileData;
import kr.or.ddasum.file.model.vo.MemberCard;
import kr.or.ddasum.member.model.vo.Member;

public interface FileService {

	int insertUploadFile(FileData fd);

	int memberPImage(Member member);

	int enrollMentImgUpload(MemberCard c);

	int memberCardImage(Member member);

}
