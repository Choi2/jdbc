package com.cafe24.bookmall.orderbook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cafe24.bookmall.book.dao.BookDao;
import com.cafe24.bookmall.orderbook.vo.OrderBookVo;


public class OrderBookDao {

	private static final String ID = "bookmall";
	private static final String PASSWORD = "bookmall";
	private static final String URL = "jdbc:mysql://localhost/bookmall";

	private Connection getConnection() throws SQLException{
		Connection conn = null;
		try {
			// 1. 드라이버 로딩^_^
			Class.forName("com.mysql.jdbc.Driver");

			// 2. 연결하기
			conn = DriverManager.getConnection(URL, ID, PASSWORD);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		} 

		return conn;
	}


	public boolean insert(OrderBookVo vo) {
		boolean result = false;
		Connection conn = null;
		
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			// 3. SQL 준비
			String sql = "insert into order_book values(?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql); // 준비된 것이지 이 상태에서 커리날리면 오류 걸림
			BookDao bookDao = new BookDao();
			// 4. 데이터 바인딩(binding)
			
			pstmt.setInt(1, vo.getOrderNo());
			pstmt.setInt(2, vo.getBookNo());
			pstmt.setInt(3, vo.getAmount());
			pstmt.setInt(4, vo.getAmount() * bookDao.getBook(vo.getBookNo()).getPrice());

			// 5. SQL문 실행
			int count = pstmt.executeUpdate(); //열의 갯수를 리턴함!
			
			result = (count != 0);
			
			// 6. 결과 처리
			if (count == 0) {
				System.out.println("실패!");
			} else {
				System.out.println("성공!");
			}

		}  catch (SQLException e) {
			System.out.println("에러:" + e);
		} finally {
			// 자원정리(Clean-Up)
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	public List<OrderBookVo> getList() {
		List<OrderBookVo> list = new ArrayList<OrderBookVo>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			
			conn = getConnection();

			// 4. SQL 실행
			String sql = "select * from order_book";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);

			while (rs.next()) {
				OrderBookVo vo = new OrderBookVo();
				vo.setOrderNo(rs.getInt(1));
				vo.setBookNo(rs.getInt(2));
				vo.setAmount(rs.getInt(3));
				vo.setPrice(rs.getInt(4));
				list.add(vo);
			}

		} catch (SQLException e) {
			System.out.println("에러:" + e);
		} finally {
			// 자원정리(Clean-Up)
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}
}
