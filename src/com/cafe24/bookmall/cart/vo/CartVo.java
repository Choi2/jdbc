package com.cafe24.bookmall.cart.vo;

import com.cafe24.bookmall.book.vo.BookVo;

public class CartVo {

	private int memberNo;
	private int bookNo;
	private int amount;
	private int price;
	private BookVo book;

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public BookVo getBook() {
		if(book == null) {
			return new BookVo();
		}
		return book;
	}


	@Override
	public String toString() {
		return "CartVo [memberNo=" + memberNo + ", bookNo=" + bookNo + ", amount=" + amount + ", price=" + price + "]";
	}
}
