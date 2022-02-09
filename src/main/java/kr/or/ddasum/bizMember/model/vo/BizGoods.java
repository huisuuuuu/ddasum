
package kr.or.ddasum.bizMember.model.vo;

import java.sql.Date;

public class BizGoods {

	private int menuNo;         	//메뉴분류번호
	private int bizNo; 				//사업자분류번호
	private String authorityId; 	//사업자등급
	private String restaurant;		//업종
	private String menuName;		//메뉴명
	private String menuInfo;		//메뉴설명
	private int originalPrice;		//상품가격
	private int dcPrice; 			//할인가격	
	private String menuImage;		//상품이미지
	private char menuDelYN;			//메뉴삭제여부
	
	
		
	
	public BizGoods() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BizGoods(int menuNo, int bizNo, String authorityId, String restaurant, String menuName, String menuInfo,
			int originalPrice, int dcPrice, String menuImage, char menuDelYN) {
		super();
		this.menuNo = menuNo;
		this.bizNo = bizNo;
		this.authorityId = authorityId;
		this.restaurant = restaurant;
		this.menuName = menuName;
		this.menuInfo = menuInfo;
		this.originalPrice = originalPrice;
		this.dcPrice = dcPrice;
		this.menuImage = menuImage;
		this.menuDelYN = menuDelYN;
	}
	public int getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
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
	public String getRestaurant() {
		return restaurant;
	}
	public void setRestaurant(String restaurant) {
		this.restaurant = restaurant;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuInfo() {
		return menuInfo;
	}
	public void setMenuInfo(String menuInfo) {
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
	public String getMenuImage() {
		return menuImage;
	}
	public void setMenuImage(String menuImage) {
		this.menuImage = menuImage;
	}
	public char getMenuDelYN() {
		return menuDelYN;
	}
	public void setMenuDelYN(char menuDelYN) {
		this.menuDelYN = menuDelYN;
	}
	@Override
	public String toString() {
		return "BizGoods [menuNo=" + menuNo + ", bizNo=" + bizNo + ", authorityId=" + authorityId + ", restaurant="
				+ restaurant + ", menuName=" + menuName + ", menuInfo=" + menuInfo + ", originalPrice=" + originalPrice
				+ ", dcPrice=" + dcPrice + ", menuImage=" + menuImage + ", menuDelYN=" + menuDelYN + "]";
	}
	
	
	
}
