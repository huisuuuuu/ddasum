package kr.or.ddasum.admin.model.vo;

public class AdminCardMember {
	
	private int cmNo;
	private int userNo;
	private int cFileNo;
	private int cardNo;
	private String reply;
	private char checkYN;
	private char joinYN;
	
	@Override
	public String toString() {
		return "AdminCardMember [cmNo=" + cmNo + ", userNo=" + userNo + ", cFileNo=" + cFileNo + ", cardNo=" + cardNo
				+ ", reply=" + reply + ", checkYN=" + checkYN + ", joinYN=" + joinYN + "]";
	}
	public AdminCardMember() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminCardMember(int cmNo, int userNo, int cFileNo, int cardNo, String reply, char checkYN, char joinYN) {
		super();
		this.cmNo = cmNo;
		this.userNo = userNo;
		this.cFileNo = cFileNo;
		this.cardNo = cardNo;
		this.reply = reply;
		this.checkYN = checkYN;
		this.joinYN = joinYN;
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

}
