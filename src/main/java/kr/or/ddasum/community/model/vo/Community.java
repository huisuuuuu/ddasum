package kr.or.ddasum.community.model.vo;

import java.sql.Date;

public class Community {

	private int cNo;
	private int userNo;
	private String nick;
	private String area;
	private String sigu;
	private String cTitle;
	private String cContent;
	private Date cRegDate;
	private String pImage;
	private int preNo;
	private int nextNo;
	private int comCount;
	private int cCount;
	private char cDelYN;

	public Community() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Community(int cNo, int userNo, String nick, String area, String sigu, String cTitle, String cContent,
			Date cRegDate, String pImage, int preNo, int nextNo, int comCount, int cCount, char cDelYN) {
		super();
		this.cNo = cNo;
		this.userNo = userNo;
		this.nick = nick;
		this.area = area;
		this.sigu = sigu;
		this.cTitle = cTitle;
		this.cContent = cContent;
		this.cRegDate = cRegDate;
		this.pImage = pImage;
		this.preNo = preNo;
		this.nextNo = nextNo;
		this.comCount = comCount;
		this.cCount = cCount;
		this.cDelYN = cDelYN;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getSigu() {
		return sigu;
	}

	public void setSigu(String sigu) {
		this.sigu = sigu;
	}

	public String getcTitle() {
		return cTitle;
	}

	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public Date getcRegDate() {
		return cRegDate;
	}

	public void setcRegDate(Date cRegDate) {
		this.cRegDate = cRegDate;
	}

	public String getpImage() {
		return pImage;
	}

	public void setpImage(String pImage) {
		this.pImage = pImage;
	}

	public int getPreNo() {
		return preNo;
	}

	public void setPreNo(int preNo) {
		this.preNo = preNo;
	}

	public int getNextNo() {
		return nextNo;
	}

	public void setNextNo(int nextNo) {
		this.nextNo = nextNo;
	}

	public int getComCount() {
		return comCount;
	}

	public void setComCount(int comCount) {
		this.comCount = comCount;
	}

	public int getcCount() {
		return cCount;
	}

	public void setcCount(int cCount) {
		this.cCount = cCount;
	}

	public char getcDelYN() {
		return cDelYN;
	}

	public void setcDelYN(char cDelYN) {
		this.cDelYN = cDelYN;
	}
}
