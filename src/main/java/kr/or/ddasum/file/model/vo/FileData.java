package kr.or.ddasum.file.model.vo;

import java.sql.Timestamp;

public class FileData {
	private int pFileNo;
	private int userNo;
	private int bizNo;
	private String pOriginal;
	private String pChange;
	private String pFilePath;
	private long pFileSize;
	private Timestamp pFileUpdate;
	private char pDelYN;
	
	
	public FileData() {
		super();
		// TODO Auto-generated constructor stub
	}


	public FileData(int pFileNo, int userNo, int bizNo, String pOriginal, String pChange, String pFilePath,
			long pFileSize, Timestamp pFileUpdate, char pDelYN) {
		super();
		this.pFileNo = pFileNo;
		this.userNo = userNo;
		this.bizNo = bizNo;
		this.pOriginal = pOriginal;
		this.pChange = pChange;
		this.pFilePath = pFilePath;
		this.pFileSize = pFileSize;
		this.pFileUpdate = pFileUpdate;
		this.pDelYN = pDelYN;
	}


	public int getpFileNo() {
		return pFileNo;
	}


	public void setpFileNo(int pFileNo) {
		this.pFileNo = pFileNo;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public int getBizNo() {
		return bizNo;
	}


	public void setBizNo(int bizNo) {
		this.bizNo = bizNo;
	}


	public String getpOriginal() {
		return pOriginal;
	}


	public void setpOriginal(String pOriginal) {
		this.pOriginal = pOriginal;
	}


	public String getpChange() {
		return pChange;
	}


	public void setpChange(String pChange) {
		this.pChange = pChange;
	}


	public String getpFilePath() {
		return pFilePath;
	}


	public void setpFilePath(String pFilePath) {
		this.pFilePath = pFilePath;
	}


	public long getpFileSize() {
		return pFileSize;
	}


	public void setpFileSize(long pFileSize) {
		this.pFileSize = pFileSize;
	}


	public Timestamp getpFileUpdate() {
		return pFileUpdate;
	}


	public void setpFileUpdate(Timestamp pFileUpdate) {
		this.pFileUpdate = pFileUpdate;
	}


	public char getpDelYN() {
		return pDelYN;
	}


	public void setpDelYN(char pDelYN) {
		this.pDelYN = pDelYN;
	}
	
	
	
	
	
	
	
	
}
