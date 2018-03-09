package com.cafe24.bookmall.order.vo;

public class OrderVo {
	private int no;
	private String name;
	private int price;
	private String address;
	private int memberNo;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "OrderVo [no=" + no + ", name=" + name + ", price=" + price + ", address=" + address + ", memberNo="
				+ memberNo + "]";
	}
}
