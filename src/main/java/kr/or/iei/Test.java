package kr.or.iei;

public class Test {
	private int userNo;
	private String userId;
	
	
	
	@Override
	public String toString() {
		return "Test [userNo=" + userNo + ", userId=" + userId + "]";
	}

	public Test() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Test(int userNo, String userId) {
		super();
		this.userNo = userNo;
		this.userId = userId;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
}
