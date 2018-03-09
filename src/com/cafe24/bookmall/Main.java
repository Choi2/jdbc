package com.cafe24.bookmall;

import com.cafe24.bookmall.book.dao.BookDao;
import com.cafe24.bookmall.book.vo.BookVo;
import com.cafe24.bookmall.cart.dao.CartDao;
import com.cafe24.bookmall.cart.vo.CartVo;
import com.cafe24.bookmall.category.dao.CategoryDao;
import com.cafe24.bookmall.category.vo.CategoryVo;
import com.cafe24.bookmall.member.dao.MemberDao;
import com.cafe24.bookmall.member.vo.MemberVo;
import com.cafe24.bookmall.order.dao.OrderDao;
import com.cafe24.bookmall.order.vo.OrderVo;
import com.cafe24.bookmall.orderbook.dao.OrderBookDao;
import com.cafe24.bookmall.orderbook.vo.OrderBookVo;

public class Main {

	public static void main(String[] args) {
		System.out.println("----------------------------------------회원 리스트----------------------------------------");
		MemberDao member = new MemberDao();
		for(MemberVo vo : member.getList()) {
			System.out.println(vo);
		}
		
		System.out.println("----------------------------------------카테고리 리스트----------------------------------------");
		CategoryDao category = new CategoryDao();
		for(CategoryVo vo : category.getList()) {
			System.out.println(vo);
		}
		
		System.out.println("----------------------------------------상품 리스트----------------------------------------");
		BookDao book = new BookDao();
		for(BookVo vo : book.getList()) {
			System.out.println(vo);
		}
		
		System.out.println("----------------------------------------카트 리스트----------------------------------------");
		CartDao cart = new CartDao();
		for(CartVo vo : cart.getList()) {
			System.out.println(vo);
		}
		
		System.out.println("----------------------------------------주문 리스트----------------------------------------");
		OrderDao order = new OrderDao();
		for(OrderVo vo : order.getList()) {
			System.out.println(vo);
		}
	
		System.out.println("----------------------------------------주문 도서 리스트----------------------------------------");
		OrderBookDao orderBook = new OrderBookDao();
		for(OrderBookVo vo : orderBook.getList()) {
			System.out.println(vo);
		}
		
	}

}
