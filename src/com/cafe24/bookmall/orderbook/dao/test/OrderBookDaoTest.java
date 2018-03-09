package com.cafe24.bookmall.orderbook.dao.test;

import com.cafe24.bookmall.orderbook.dao.OrderBookDao;
import com.cafe24.bookmall.orderbook.vo.OrderBookVo;

public class OrderBookDaoTest {

	public static void main(String[] args) {
		insertTest();
		getList();
	}
	
	public static void insertTest() {
		OrderBookDao dao = new OrderBookDao();
		OrderBookVo vo= new OrderBookVo();
		vo.setOrderNo(1);
		vo.setBookNo(2);
		vo.setAmount(12);
		dao.insert(vo);
	}
	
	public static void getList() {
		OrderBookDao dao = new OrderBookDao();
		System.out.println(dao.getList());
	}

}
