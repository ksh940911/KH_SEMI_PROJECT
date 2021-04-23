package com.kh.test.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TestDao {
	
	String driverClass = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@192.168.10.3:1521:xe";
	String user = "kh";
	String password = "kh";

	public List<Test> selectList(){
		
		Connection conn = null;
		String sql = "select * from test";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Test> list = null;
		
		
		try {
			Class.forName(driverClass);
			conn = DriverManager.getConnection(sql, sql, sql);
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			
			while(rset.next()) {
				Test test = new Test();
				test.setSeq(rset.getInt("seq"));
				test.setWriter(rset.getString("writer"));
				test.setTitle(rset.getString("title"));
				test.setContent(rset.getString("content"));
				test.setRegDate(rset.getDate("regdate"));
				list.add(test);
			}
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rset != null) 
					rset.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(pstmt != null) 
					pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(conn != null)
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}
