package com.cafe24.bookmall.category.dao.test;

import com.cafe24.bookmall.category.dao.CategoryDao;
import com.cafe24.bookmall.category.vo.CategoryVo;

public class CategoryDaoTest {

	public static void main(String[] args) {
		insertTest();
		getList();
	}
	
	public static void insertTest() {
		CategoryDao dao = new CategoryDao();
		CategoryVo vo = new CategoryVo();
		vo.setType("음악");
		dao.insert(vo);
	}
	
	public static void getList() {
		CategoryDao dao = new CategoryDao();
		System.out.println(dao.getList());
	}

}
