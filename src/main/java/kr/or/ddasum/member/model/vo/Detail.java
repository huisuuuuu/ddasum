package kr.or.ddasum.member.model.vo;

import java.sql.Date;

public class Detail {

	private int mReNo;
	private int userNo;
	private Date reservationDate;
	private int bizNo;
	private String authorityId;
	private int reNo;
	private int menuNo;
	private char reCancle;
	//sql구문에 의해 불러온 데이터
	private String bizName;
	private String menuName;
	
	public Detail() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Detail(int mReNo, int userNo, Date reservationDate, int bizNo, String authorityId, int reNo, int menuNo,
			char reCancle, String bizName, String menuName) {
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
	}

	public String getmenuName() {
		return menuName;
	}

	public void setmenuName(String menuName) {
		this.menuName = menuName;
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

	public int getReNo() {
		return reNo;
	}

	public void setReNo(int reNo) {
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


	
	
	
	
	
	
}
