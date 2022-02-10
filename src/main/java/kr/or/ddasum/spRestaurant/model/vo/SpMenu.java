package kr.or.ddasum.spRestaurant.model.vo;

public class SpMenu {

	private int menuNo;
	private int bizNo;
	private String authorityId;
	private String restaurant;
	private String menuName;
	private String menuInfo;
	private String originalPrice;
	private String menuImage;
	private char menuDelYN;

	public SpMenu() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SpMenu(int menuNo, int bizNo, String authorityId, String restaurant, String menuName, String menuInfo,
			String originalPrice, String menuImage, char menuDelYN) {
		super();
		this.menuNo = menuNo;
		this.bizNo = bizNo;
		this.authorityId = authorityId;
		this.restaurant = restaurant;
		this.menuName = menuName;
		this.menuInfo = menuInfo;
		this.originalPrice = originalPrice;
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

	public String getOriginalPrice() {
		return originalPrice;
	}

	public void setOriginalPrice(String originalPrice) {
		this.originalPrice = originalPrice;
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
	
}
