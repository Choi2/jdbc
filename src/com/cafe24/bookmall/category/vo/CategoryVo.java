package com.cafe24.bookmall.category.vo;

public class CategoryVo {
	private int no;
	private String type;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "CategoryVO [no=" + no + ", type=" + type + "]";
	}
}
