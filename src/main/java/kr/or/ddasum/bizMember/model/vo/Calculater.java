package kr.or.ddasum.bizMember.model.vo;

import java.sql.Date;

public class Calculater {
	private int mReNo;
	private int reNo;       		//메뉴예약번호(detail)(pk)
	private String bizName; 			//사업자명(biz_member)
	private String authorityId; 	//사업자등급(authority)(pk)
	private String menuName;		//메뉴명(menu)
	private int originalPrice;		//상품가격(menu)
	private int dcPrice; 			//할인가격(menu)
	private char menuDelYN;			//메뉴삭제여부(menu)
	private Date reservationDate;   //후원일자(detail)
	private int bizNo;              //사업자번호(biz_member)(pk)
	private int menuNo;				//상품번호(menu)(pk)
	private char reCancle;			//예약취소(detail)
	
	public int getmReNo() {
		return mReNo;
	}
	public void setmReNo(int mReNo) {
		this.mReNo = mReNo;
	}
	
	public int getReNo() {
		return reNo;
	}
	public void setReNo(int reNo) {
		this.reNo = reNo;
	}
	public String getBizName() {
		return bizName;
	}
	public void setBizName(String bizName) {
		this.bizName = bizName;
	}
	public String getAuthorityId() {
		return authorityId;
	}
	public void setAuthorityId(String authorityId) {
		this.authorityId = authorityId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
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
	public char getMenuDelYN() {
		return menuDelYN;
	}
	public void setMenuDelYN(char menuDelYN) {
		this.menuDelYN = menuDelYN;
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
	public Calculater(int mReNo,int reNo, String bizName, String authorityId, String menuName, int originalPrice, int dcPrice,
			char menuDelYN, Date reservationDate, int bizNo, int menuNo, char reCancle) {
		super();
		this.mReNo = mReNo;
		this.reNo = reNo;
		this.bizName = bizName;
		this.authorityId = authorityId;
		this.menuName = menuName;
		this.originalPrice = originalPrice;
		this.dcPrice = dcPrice;
		this.menuDelYN = menuDelYN;
		this.reservationDate = reservationDate;
		this.bizNo = bizNo;
		this.menuNo = menuNo;
		this.reCancle = reCancle;
	}
	public Calculater() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "calculater [mReNo" + mReNo + ", reNo=" + reNo + ", bizName=" + bizName + ", authorityId=" + authorityId + ", menuName="
				+ menuName + ", originalPrice=" + originalPrice + ", dcPrice=" + dcPrice + ", menuDelYN=" + menuDelYN
				+ ", reservationDate=" + reservationDate + ", bizNo=" + bizNo + ", menuNo=" + menuNo + ", reCancle="
				+ reCancle + "]";
	}
}
