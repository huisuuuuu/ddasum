package kr.or.ddasum.admin.model.vo;

import java.sql.Date;

public class AdminMember {
	
	private int userNo;
	private String authorityId;
	private String userId;
	private String userPwd;
	private String userName;
	private String nick;
	private String email;
	private String address;
	private char detailYN;
	private Date enrollDate;
	private long cardNo;
	private char delYN;
	
	@Override
	public String toString() {
		return "AdminMember [userNo=" + userNo + ", authorityId=" + authorityId + ", userId=" + userId + ", userPwd="
				+ userPwd + ", userName=" + userName + ", nick=" + nick + ", email=" + email + ", address=" + address
				+ ", detailYN=" + detailYN + ", enrollDate=" + enrollDate + ", cardNo=" + cardNo + ", delYN=" + delYN
				+ "]";
	}
	public AdminMember() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminMember(int userNo, String authorityId, String userId, String userPwd, String userName, String nick,
			String email, String address, char detailYN, Date enrollDate, long cardNo, char delYN) {
		super();
		this.userNo = userNo;
		this.authorityId = authorityId;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nick = nick;
		this.email = email;
		this.address = address;
		this.detailYN = detailYN;
		this.enrollDate = enrollDate;
		this.cardNo = cardNo;
		this.delYN = delYN;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getAuthorityId() {
		return authorityId;
	}
	public void setAuthorityId(String authorityId) {
		this.authorityId = authorityId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public char getDetailYN() {
		return detailYN;
	}
	public void setDetailYN(char detailYN) {
		this.detailYN = detailYN;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public long getCardNo() {
		return cardNo;
	}
	public void setCardNo(long cardNo) {
		this.cardNo = cardNo;
	}
	public char getDelYN() {
		return delYN;
	}
	public void setDelYN(char delYN) {
		this.delYN = delYN;
	}
	
	
}