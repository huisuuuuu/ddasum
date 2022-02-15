package kr.or.ddasum.member.model.vo;

import java.sql.Date;

public class Detail {

	private int mReNo;
	private int userNo;
	private Date reservationDate;
	private int bizNo;
	private String authorityId;
	private String reNo;
	private int menuNo;
	private char reCancle;
	//sql구문에 의해 불러온 데이터
	private String bizName;
	private String menuName;
	private String userName;
	private String authorityInfo;
	private int originalPrice;
	private int dcPrice;
	private String bizImage;
	private String address;
	private String menuInfo;

	
	
	
	public Detail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Detail(int mReNo, int userNo, Date reservationDate, int bizNo, String authorityId, String reNo, int menuNo,

			char reCancle, String bizName, String menuName, String userName, String authorityInfo, String bizImage, int originalPrice, int dcPrice, String address, String menuInfo) {

		super();
		this.mReNo = mReNo;
		this.userNo = userNo;
		this.reservationDate = reservationDate;
		this.bizNo = bizNo;
		this.authorityId = authorityId;
		this.reNo = reNo;
		this.menuNo = menuNo;
		this.reCancle = reCancle;
		this.bizName = bizName;
		this.menuName = menuName;
		this.userName = userName;
		this.authorityInfo = authorityInfo;
		this.bizImage=bizImage;
		this.originalPrice = originalPrice;
		this.dcPrice = dcPrice;
		this.address = address;
		this.menuInfo = menuInfo;
		
	}
	public int getOriginalPrice() {
		return originalPrice;
	}
	public void setOriginalPrice(int originalPrice) {
		this.originalPrice = originalPrice;
	}
	public int getDcPrice() {
		return dcPrice;
	}
	public void setDcPrice(int dcPrice) {
		this.dcPrice = dcPrice;
	}
	public String getBizImage() {
		return bizImage;
	}
	public void setBizImage(String bizImage) {
		this.bizImage = bizImage;
	}
	public int getmReNo() {
		return mReNo;
	}
	public void setmReNo(int mReNo) {
		this.mReNo = mReNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public Date getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(Date reservationDate) {
		this.reservationDate = reservationDate;
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
	public String getReNo() {
		return reNo;
	}
	public void setReNo(String reNo) {
		this.reNo = reNo;
	}
	public int getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}
	public char getReCancle() {
		return reCancle;
	}
	public void setReCancle(char reCancle) {
		this.reCancle = reCancle;
	}
	public String getBizName() {
		return bizName;
	}
	public void setBizName(String bizName) {
		this.bizName = bizName;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getAuthorityInfo() {
		return authorityInfo;
	}
	public void setAuthorityInfo(String authorityInfo) {
		this.authorityInfo = authorityInfo;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMenuInfo() {
		return menuInfo;
	}
	public void setMenuInfo(String menuInfo) {
		this.menuInfo = menuInfo;
	}
	
}