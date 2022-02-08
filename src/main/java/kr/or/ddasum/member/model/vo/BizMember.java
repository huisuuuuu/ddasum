package kr.or.ddasum.member.model.vo;

import java.sql.Date;

public class BizMember {
	
	private int bizNo; 			//사업자분류번호
	private String authorityId; //사업자등급
	private String bizId; 		//아이디
	private String bizPwd; 		//비밀번호	
	private String ceoName;		//대표자명
	private String bizName;		//업체명
	private String bizEmail;	//이메일
	private String bizPhone;	//전화번호
	private String restaurant;	//업종
	private String area;		//지역
	private String address;		//주소
	private String bizTime;		//운영시간
	private int regNo;			//사업자번호
	private String bizImage;	//프로필이미지
	private Date bizEnrollDate;	//가입일
	private int bizCount;		//사용수량
	private char bizChangeYN;	//사업자전환
	private char bizDelYN;		//탈퇴여부
	
	
	
	@Override
	public String toString() {
		return "BizMember [bizNo=" + bizNo + ", authorityId=" + authorityId + ", bizId=" + bizId + ", bizPwd=" + bizPwd
				+ ", ceoName=" + ceoName + ", bizName=" + bizName + ", bizEmail=" + bizEmail + ", bizPhone=" + bizPhone
				+ ", restaurant=" + restaurant + ", area=" + area + ", address=" + address + ", bizTime=" + bizTime
				+ ", regNo=" + regNo + ", bizImage=" + bizImage + ", bizEnrollDate=" + bizEnrollDate + ", bizCount="
				+ bizCount + ", bizChangeYN=" + bizChangeYN + ", bizDelYN=" + bizDelYN + "]";
	}

	public BizMember() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BizMember(int bizNo, String authorityId, String bizId, String bizPwd, String ceoName, String bizName,
			String bizEmail, String bizPhone, String restaurant, String area, String address, String bizTime, int regNo,
			String bizImage, Date bizEnrollDate, int bizCount, char bizChangeYN, char bizDelYN) {
		super();
		this.bizNo = bizNo;
		this.authorityId = authorityId;
		this.bizId = bizId;
		this.bizPwd = bizPwd;
		this.ceoName = ceoName;
		this.bizName = bizName;
		this.bizEmail = bizEmail;
		this.bizPhone = bizPhone;
		this.restaurant = restaurant;
		this.area = area;
		this.address = address;
		this.bizTime = bizTime;
		this.regNo = regNo;
		this.bizImage = bizImage;
		this.bizEnrollDate = bizEnrollDate;
		this.bizCount = bizCount;
		this.bizChangeYN = bizChangeYN;
		this.bizDelYN = bizDelYN;
	}

	public int getBizNo() {
		return bizNo;
	}

	public void setBizNo(int bizNo) {
		this.bizNo = bizNo;
	}

	public String getAuthorityId() {
		return authorityId;
	}

	public void setAuthorityId(String authorityId) {
		this.authorityId = authorityId;
	}

	public String getBizId() {
		return bizId;
	}

	public void setBizId(String bizId) {
		this.bizId = bizId;
	}

	public String getBizPwd() {
		return bizPwd;
	}

	public void setBizPwd(String bizPwd) {
		this.bizPwd = bizPwd;
	}

	public String getCeoName() {
		return ceoName;
	}

	public void setCeoName(String ceoName) {
		this.ceoName = ceoName;
	}

	public String getBizName() {
		return bizName;
	}

	public void setBizName(String bizName) {
		this.bizName = bizName;
	}

	public String getBizEmail() {
		return bizEmail;
	}

	public void setBizEmail(String bizEmail) {
		this.bizEmail = bizEmail;
	}

	public String getBizPhone() {
		return bizPhone;
	}

	public void setBizPhone(String bizPhone) {
		this.bizPhone = bizPhone;
	}

	public String getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(String restaurant) {
		this.restaurant = restaurant;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBizTime() {
		return bizTime;
	}

	public void setBizTime(String bizTime) {
		this.bizTime = bizTime;
	}

	public int getRegNo() {
		return regNo;
	}

	public void setRegNo(int regNo) {
		this.regNo = regNo;
	}

	public String getBizImage() {
		return bizImage;
	}

	public void setBizImage(String bizImage) {
		this.bizImage = bizImage;
	}

	public Date getBizEnrollDate() {
		return bizEnrollDate;
	}

	public void setBizEnrollDate(Date bizEnrollDate) {
		this.bizEnrollDate = bizEnrollDate;
	}

	public int getBizCount() {
		return bizCount;
	}

	public void setBizCount(int bizCount) {
		this.bizCount = bizCount;
	}

	public char getBizChangeYN() {
		return bizChangeYN;
	}

	public void setBizChangeYN(char bizChangeYN) {
		this.bizChangeYN = bizChangeYN;
	}

	public char getBizDelYN() {
		return bizDelYN;
	}

	public void setBizDelYN(char bizDelYN) {
		this.bizDelYN = bizDelYN;
	}
	
	
}
