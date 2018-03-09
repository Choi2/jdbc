package com.cafe24.bookmall.book.dao.test;

import com.cafe24.bookmall.book.dao.BookDao;
import com.cafe24.bookmall.book.vo.BookVo;

public class BookDaoTest {

	public static void main(String[] args) {
		//insertTest();
		// deleteTest();
		getList();
		
	}
	
	public static void insertTest() {
		BookDao dao = new BookDao();
		BookVo vo = new BookVo();
		vo.setTitle("리니지 가이드");
		vo.setPrice(13000);
		vo.setCategoryNo(3);
		dao.insert(vo);
	}
	
	public static void getList() {
		BookDao dao = new BookDao();
		for(BookVo book : dao.getList()) {
			System.out.println(book);
		}
	}

	public static void deleteTest() {
		BookDao dao = new BookDao();
		dao.delete(4);
	}
}
