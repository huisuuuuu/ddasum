package kr.or.ddasum.admin.model.vo;

import java.sql.Date;

public class AdminCardMember {
	
	private int cmNo;
	private int userNo;
	private int cFileNo;
	private int cardNo;
	private String reply;
	private char checkYN;
	private char joinYN;
	private String userName;
	private Date enrollDate;
	private char detailYN;
	
	public AdminCardMember() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminCardMember(int cmNo, int userNo, int cFileNo, int cardNo, String reply, char checkYN, char joinYN,
			String userName, Date enrollDate, char detailYN) {
		super();
		this.cmNo = cmNo;
		this.userNo = userNo;
		this.cFileNo = cFileNo;
		this.cardNo = cardNo;
		this.reply = reply;
		this.checkYN = checkYN;
		this.joinYN = joinYN;
		this.userName = userName;
		this.enrollDate = enrollDate;
		this.detailYN = detailYN;
	}
	public int getCmNo() {
		return cmNo;
	}
	public void setCmNo(int cmNo) {
		this.cmNo = cmNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getcFileNo() {
		return cFileNo;
	}
	public void setcFileNo(int cFileNo) {
		this.cFileNo = cFileNo;
	}
	public int getCardNo() {
		return cardNo;
	}
	public void setCardNo(int cardNo) {
		this.cardNo = cardNo;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public char getCheckYN() {
		return checkYN;
	}
	public void setCheckYN(char checkYN) {
		this.checkYN = checkYN;
	}
	public char getJoinYN() {
		return joinYN;
	}
	public void setJoinYN(char joinYN) {
		this.joinYN = joinYN;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public char getDetailYN() {
		return detailYN;
	}
	public void setDetailYN(char detailYN) {
		this.detailYN = detailYN;
	}

}