package kr.or.ddasum.dcRestaurant.model.vo;

public class MReservation {
	private int no;
	private int userNo;
	private int rest;
	
	@Override
	public String toString() {
		return "MReservation [no=" + no + ", userNo=" + userNo + ", rest=" + rest + "]";
	}

	public MReservation() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MReservation(int no, int userNo, int rest) {
		super();
		this.no = no;
		this.userNo = userNo;
		this.rest = rest;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getRest() {
		return rest;
	}

	public void setRest(int rest) {
		this.rest = rest;
	}
	
}
