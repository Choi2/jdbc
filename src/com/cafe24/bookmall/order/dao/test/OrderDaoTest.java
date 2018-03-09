package com.cafe24.bookmall.order.dao.test;

import com.cafe24.bookmall.order.dao.OrderDao;
import com.cafe24.bookmall.order.vo.OrderVo;

public class OrderDaoTest {

	public static void main(String[] args) {
		insertTest();
		getList();
	}
	
	public static void insertTest() {
		OrderDao dao = new OrderDao();
		OrderVo vo = new OrderVo();
		
		vo.setName("가렌");
		vo.setPrice(50000);
		vo.setAddress("전주");
		vo.setMemberNo(1);
		dao.insert(vo);
	}
	
	public static void getList() {
		OrderDao dao = new OrderDao();
		System.out.println(dao.getList());
	}

}
