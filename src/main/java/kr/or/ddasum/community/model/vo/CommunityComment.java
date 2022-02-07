package kr.or.ddasum.community.model.vo;

import java.sql.Date;

public class CommunityComment {

	private int cNo;
	private int comNo;
	private int userNo;
	private String nick;
	private int pComNo;
	private int comDepth;
	private int comOrder;
	private String comContent;
	private Date comRegDate;
	private char comSecretYN;
	private char comDelYN;
	
	public CommunityComment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CommunityComment(int cNo, int comNo, int userNo, String nick, int pComNo, int comDepth, int comOrder,
			String comContent, Date comRegDate, char comSecretYN, char comDelYN) {
		super();
		this.cNo = cNo;
		this.comNo = comNo;
		this.userNo = userNo;
		this.nick = nick;
		this.pComNo = pComNo;
		this.comDepth = comDepth;
		this.comOrder = comOrder;
		this.comContent = comContent;
		this.comRegDate = comRegDate;
		this.comSecretYN = comSecretYN;
		this.comDelYN = comDelYN;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
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

	public int getpComNo() {
		return pComNo;
	}

	public void setpComNo(int pComNo) {
		this.pComNo = pComNo;
	}

	public int getComDepth() {
		return comDepth;
	}

	public void setComDepth(int comDepth) {
		this.comDepth = comDepth;
	}

	public int getComOrder() {
		return comOrder;
	}

	public void setComOrder(int comOrder) {
		this.comOrder = comOrder;
	}

	public String getComContent() {
		return comContent;
	}

	public void setComContent(String comContent) {
		this.comContent = comContent;
	}

	public Date getComRegDate() {
		return comRegDate;
	}

	public void setComRegDate(Date comRegDate) {
		this.comRegDate = comRegDate;
	}

	public char getComSecretYN() {
		return comSecretYN;
	}

	public void setComSecretYN(char comSecretYN) {
		this.comSecretYN = comSecretYN;
	}

	public char getComDelYN() {
		return comDelYN;
	}

	public void setComDelYN(char comDelYN) {
		this.comDelYN = comDelYN;
	}

}
