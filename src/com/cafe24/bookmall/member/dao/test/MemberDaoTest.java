package com.cafe24.bookmall.member.dao.test;

import com.cafe24.bookmall.member.dao.MemberDao;
import com.cafe24.bookmall.member.vo.MemberVo;

public class MemberDaoTest {

	public static void main(String[] args) {
		// insertTest();
		getList();
	}

	public static void insertTest() {
		MemberDao dao = new MemberDao();
		MemberVo vo = new MemberVo();
		vo.setName("티모");
		vo.setPhone("421-456-790");
		vo.setEmail("noob@naver.com");
		vo.setPassword("12012");
		dao.insert(vo);
	}

	public static void getList() {
		MemberDao dao = new MemberDao();
		for (MemberVo member : dao.getList()) {
			System.out.println(member);
		}
	}

}
