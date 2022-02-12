package kr.or.ddasum.dcRestaurant.model.vo;

public class DcRestaurantMenu {
	
	private int MenuNo;         //상품 번호
	private int bizNo;			//사업자 분류번호
	private String authorutyId; //사업자 등급
	private String restaurant;	//업종 분류
	private String menuName;	//상품명
	private String menuInfo;	//상품 설명
	private int originalPrice;	//상품 가격
	private int dcPrice;		//상품 할인 가격
	private String menuImage;	//상품 이미지
	private char menuDelYN;		//삭제 여부
	
	@Override
	public String toString() {
		return "DcRestaurantMenu [MenuNo=" + MenuNo + ", bizNo=" + bizNo + ", authorutyId=" + authorutyId
				+ ", restaurant=" + restaurant + ", menuName=" + menuName + ", menuInfo=" + menuInfo
				+ ", originalPrice=" + originalPrice + ", dcPrice=" + dcPrice + ", menuImage=" + menuImage
				+ ", menuDelYN=" + menuDelYN + "]";
	}

	public DcRestaurantMenu() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DcRestaurantMenu(int menuNo, int bizNo, String authorutyId, String restaurant, String menuName,
			String menuInfo, int originalPrice, int dcPrice, String menuImage, char menuDelYN) {
		super();
		MenuNo = menuNo;
		this.bizNo = bizNo;
		this.authorutyId = authorutyId;
		this.restaurant = restaurant;
		this.menuName = menuName;
		this.menuInfo = menuInfo;
		this.originalPrice = originalPrice;
		this.dcPrice = dcPrice;
		this.menuImage = menuImage;
		this.menuDelYN = menuDelYN;
	}

	public int getMenuNo() {
		return MenuNo;
	}

	public void setMenuNo(int menuNo) {
		MenuNo = menuNo;
	}

	public int getBizNo() {
		return bizNo;
	}

	public void setBizNo(int bizNo) {
		this.bizNo = bizNo;
	}

	public String getAuthorutyId() {
		return authorutyId;
	}

	public void setAuthorutyId(String authorutyId) {
		this.authorutyId = authorutyId;
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
	
}
