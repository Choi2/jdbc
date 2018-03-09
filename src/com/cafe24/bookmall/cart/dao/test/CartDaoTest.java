package com.cafe24.bookmall.cart.dao.test;

import com.cafe24.bookmall.cart.dao.CartDao;
import com.cafe24.bookmall.cart.vo.CartVo;

public class CartDaoTest {

	public static void main(String[] args) {
		insertTest();
		getList();
	}
	
	public static void insertTest() {
		CartDao dao = new CartDao();
		CartVo vo = new CartVo();
		vo.setMemberNo(1);
		vo.setBookNo(2);
		vo.setAmount(5);
		dao.insert(vo);
	}
	
	public static void getList() {
		CartDao dao = new CartDao();
		System.out.println(dao.getList());
	}

}
