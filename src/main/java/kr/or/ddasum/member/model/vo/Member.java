package kr.or.ddasum.member.model.vo;

import java.sql.Date;

public class Member {
	private int userNo;
	private String authorityId;
	private String userId;
	private String userPwd;
	private String userName;
	private String nick;
	private String phone;
	private String email;
	private char detail;
	private String address;
	private String pImage;
	private Date enrollDate;
	private long cardNo;
	private char delYN;
	private String mJoinStatus;
	
	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", authorityId=" + authorityId + ", userId=" + userId + ", userPwd="
				+ userPwd + ", userName=" + userName + ", nick=" + nick + ", phone=" + phone + ", email=" + email
				+ ", detail=" + detail + ", address=" + address + ", pImage=" + pImage + ", enrollDate=" + enrollDate
				+ ", cardNo=" + cardNo + ", delYN=" + delYN + ", mJoinStatus=" + mJoinStatus + "]";
	}

	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(int userNo, String authorityId, String userId, String userPwd, String userName, String nick,
			String phone, String email, char detail, String address, String pImage, Date enrollDate, long cardNo,
			char delYN, String mJoinStatus) {
		super();
		this.userNo = userNo;
		this.authorityId = authorityId;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nick = nick;
		this.phone = phone;
		this.email = email;
		this.detail = detail;
		this.address = address;
		this.pImage = pImage;
		this.enrollDate = enrollDate;
		this.cardNo = cardNo;
		this.delYN = delYN;
		this.mJoinStatus = mJoinStatus;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public char getDetail() {
		return detail;
	}

	public void setDetail(char detail) {
		this.detail = detail;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getpImage() {
		return pImage;
	}

	public void setpImage(String pImage) {
		this.pImage = pImage;
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

	public String getmJoinStatus() {
		return mJoinStatus;
	}

	public void setmJoinStatus(String mJoinStatus) {
		this.mJoinStatus = mJoinStatus;
	}
	
}