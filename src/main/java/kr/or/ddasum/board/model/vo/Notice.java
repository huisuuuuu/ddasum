package kr.or.ddasum.board.model.vo;

import java.sql.Date;

public class Notice {
	private String infoId;
	private int iNo;
	private String iTitle;
	private String iContent;
	private Date iRegdate;
	private String iImage;
	private char iDelYN;
	
	
	
	
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Notice(String infoId, int iNo, String iTitle, String iContent, Date iRegdate, String iImage, char iDelYN) {
		super();
		this.infoId = infoId;
		this.iNo = iNo;
		this.iTitle = iTitle;
		this.iContent = iContent;
		this.iRegdate = iRegdate;
		this.iImage = iImage;
		this.iDelYN = iDelYN;
	}
	public String getInfoId() {
		return infoId;
	}
	public void setInfoId(String infoId) {
		this.infoId = infoId;
	}
	public int getiNo() {
		return iNo;
	}
	public void setiNo(int iNo) {
		this.iNo = iNo;
	}
	public String getiTitle() {
		return iTitle;
	}
	public void setiTitle(String iTitle) {
		this.iTitle = iTitle;
	}
	public String getiContent() {
		return iContent;
	}
	public void setiContent(String iContent) {
		this.iContent = iContent;
	}
	public Date getiRegdate() {
		return iRegdate;
	}
	public void setiRegdate(Date iRegdate) {
		this.iRegdate = iRegdate;
	}
	public String getiImage() {
		return iImage;
	}
	public void setiImage(String iImage) {
		this.iImage = iImage;
	}
	public char getiDelYN() {
		return iDelYN;
	}
	public void setiDelYN(char iDelYN) {
		this.iDelYN = iDelYN;
	}
	@Override
	public String toString() {
		return "Notice [infoId=" + infoId + ", iNo=" + iNo + ", iTitle=" + iTitle + ", iContent=" + iContent
				+ ", iRegdate=" + iRegdate + ", iImage=" + iImage + ", iDelYN=" + iDelYN + "]";
	}
	
	
	
}
