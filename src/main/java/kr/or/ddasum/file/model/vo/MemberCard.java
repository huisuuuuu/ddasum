package kr.or.ddasum.file.model.vo;

import java.sql.Timestamp;

public class MemberCard {
	
	private int cFileNo;
	private int userNo;
	private String cOriginal;
	private String cChange;
	private String cFilePath;
	private long cFileSize;
	private Timestamp cFileUpdate;
	
	public MemberCard() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberCard(int cFileNo, int userNo, String cOriginal, String cChange, String cFilePath, long cFileSize,
			Timestamp cFileUpdate) {
		super();
		this.cFileNo = cFileNo;
		this.userNo = userNo;
		this.cOriginal = cOriginal;
		this.cChange = cChange;
		this.cFilePath = cFilePath;
		this.cFileSize = cFileSize;
		this.cFileUpdate = cFileUpdate;
	}

	public int getcFileNo() {
		return cFileNo;
	}

	public void setcFileNo(int cFileNo) {
		this.cFileNo = cFileNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getcOriginal() {
		return cOriginal;
	}

	public void setcOriginal(String cOriginal) {
		this.cOriginal = cOriginal;
	}

	public String getcChange() {
		return cChange;
	}

	public void setcChange(String cChange) {
		this.cChange = cChange;
	}

	public String getcFilePath() {
		return cFilePath;
	}

	public void setcFilePath(String cFilePath) {
		this.cFilePath = cFilePath;
	}

	public long getcFileSize() {
		return cFileSize;
	}

	public void setcFileSize(long cFileSize) {
		this.cFileSize = cFileSize;
	}

	public Timestamp getcFileUpdate() {
		return cFileUpdate;
	}

	public void setcFileUpdate(Timestamp cFileUpdate) {
		this.cFileUpdate = cFileUpdate;
	}
	
	
	
	
}
