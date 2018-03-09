package com.cafe24.bookmall.member.dao.test;

import com.cafe24.bookmall.member.dao.MemberDao;
import com.cafe24.bookmall.member.vo.MemberVo;

public class MemberDaoTest {

	public static void main(String[] args) {
		insertTest();
		getList();
	}
	
	public static void insertTest() {
		MemberDao dao = new MemberDao();
		MemberVo vo = new MemberVo();
		vo.setName("마가렌");
		vo.setPhone("111-456-790");
		vo.setEmail("csj111@naver.com");
		vo.setPassword("12345");
		dao.insert(vo);
	}
	
	public static void getList() {
		MemberDao dao = new MemberDao();
		System.out.println(dao.getList());
	}

}
