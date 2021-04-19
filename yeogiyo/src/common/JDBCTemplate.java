package common;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class JDBCTemplate {
	static String driverClass; //ojdbc6.jar가져오는 필드
	static String url;
	static String user;
	static String password;
	
	//클래스가 사용될 때 처음 1회 실행되는 초기화 블럭
	static {
		//data-source.properties의 내용을 읽어서 변수에 대입
		
		Properties prop = new Properties();
//		String filename = "resources/data-source.properties";
		String filename = JDBCTemplate.class //클래스 객체
										.getResource("/data-source.properties") //url객체
										.getPath(); //String객체 : 절대경로
		System.out.println("fileName@JDBCTemplate = " + filename);
		
		try {
			prop.load(new FileReader(filename));
//			System.out.println("prop = " + prop);
			driverClass = prop.getProperty("driverClass");
//			System.out.println("driverClass@JDBCTemplate = " + driverClass);
			url = prop.getProperty("url");
			user = prop.getProperty("user");
			password = prop.getProperty("password");
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		
//		 * 1. DriverClass등록 (최초1회)
			try {
				Class.forName(driverClass);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			Context ctx = new InitialContext();
			/**
			 * JNDI구조
			 * java:/comp/env/ + jdbc/myoracle
			 */
			DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/myoracle");
			conn = dataSource.getConnection();
			conn.setAutoCommit(false);
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
//	public static Connection getConnection() {
//		Connection conn = null;
//		try {
//
////		 * 2. Connection 객체 생성 (url, user, password)
//			conn = DriverManager.getConnection(url, user, password);
//			//DriverManager: java sql패키지의 클래스
////		 * 	2.1 자동커밋 false설정
//			conn.setAutoCommit(false);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return conn;
//	}
	
	public static void close(Connection conn) {
//		 * 7. 자원반납 (conn)
			try {
				if(conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	public static void close(ResultSet rset) {
		try {
			if(rset != null)
				rset.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public static void close(PreparedStatement pstmt) {
		try {
			if(pstmt != null)
				pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void commit(Connection conn) {
		try {
			if(conn != null)
				conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection conn) {
		try {
			if(conn != null)
				conn.rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
