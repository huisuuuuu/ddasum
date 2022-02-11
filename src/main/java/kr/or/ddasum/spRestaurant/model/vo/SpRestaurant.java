package kr.or.ddasum.spRestaurant.model.vo;

import java.sql.Date;

public class SpRestaurant {

	private int bizNo;
	private String authorityId;
	private String bizId;
	private String ceoName;
	private String bizName;
	private String bizEmail;
	private String bizPhone;
	private String restaurant;
	private String area;
	private String address;
	private String bizTime;
	private String regNo;
	private String bizImage;
	private Date enrollDate;
	private int bizCount;
	private char bizChangeYN;
	private char bizDelYN;

	public SpRestaurant() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SpRestaurant(int bizNo, String authorityId, String bizId, String ceoName, String bizName, String bizEmail,
			String bizPhone, String restaurant, String area, String address, String bizTime, String regNo,
			String bizImage, Date enrollDate, int bizCount, char bizChangeYN, char bizDelYN) {
		super();
		this.bizNo = bizNo;
		this.authorityId = authorityId;
		this.bizId = bizId;
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
		this.enrollDate = enrollDate;
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

	public String getRegNo() {
		return regNo;
	}

	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}

	public String getBizImage() {
		return bizImage;
	}

	public void setBizImage(String bizImage) {
		this.bizImage = bizImage;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
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
