package order.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import member.model.dao.MemberDao;
import order.model.vo.Order;
import static common.JDBCTemplate.*;

public class OrderDao {
	
	private Properties prop = new Properties();
	
	public OrderDao() {
		String fileName = MemberDao.class.getResource("/sql/order/order-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public int insertOrder(Connection conn, Order order) {
		int result = 0;
		String sql = prop.getProperty("insertOrder");
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			//order_id, member_id, res_id, order_date, address, address_sub, phone, order_comment, payment_way, 
			//payment_place, order_menu, total_price
			//insert into tb_order values(sql_tb_order_id.nextval, ?, ?, sysdate, ?, ?, ?, ?, ?, ?, ?, ?)
			
			/*
			 * 
			    member_id varchar2(100) not null,
			    res_id number not null,
			    address varchar2(100) not null,
			    address_sub varchar2(100) not null,
			    phone char(11) not null,
			    order_comment varchar(200),
			    payment_way char(1) not null,
			    payment_place char(1) not null,
			    order_menu varchar2(2000) not null,
			    total_price number not null, 
			 * */
			
			
			pstmt.setString(1, order.getMemberId()); //honggd
			pstmt.setInt(2, order.getResId()); //1
			pstmt.setString(3, order.getAddress()); //서울시 강남구
			pstmt.setString(4, order.getAddressSub()); //테헤란로
			pstmt.setString(5, order.getPhone()); //01099999999
			pstmt.setString(6, order.getOrderComment()); //null
			pstmt.setString(7, order.getPaymentWay()); //K
			pstmt.setString(8, order.getPaymentPlace()); //N
			pstmt.setString(9, order.getOrderMenu()); //null
			pstmt.setInt(10, order.getTotalPrice()); //28000
			
			System.out.println("orderDao(insertOrder) = " + order);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectOrderCount(Connection conn) {
		String sql = prop.getProperty("selectOrderCount");
		int totalOrder = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				totalOrder = rset.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return totalOrder;
	}

	public Order selectLastOrderById(Connection conn, String memberId) {
		Order order = new Order();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectLastOrderById");
		
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				/*
				 * order_id, member_id, res_id, order_date, address, address_sub, phone, order_comment, payment_way, 
					payment_place, order_menu, total_price
				 * */
				order.setOrderId(rset.getInt("order_id"));
				order.setMemberId(rset.getString("member_id"));
				order.setResId(rset.getInt("res_id"));
				order.setOrderDate(rset.getDate("order_date"));
				order.setAddress(rset.getString("address"));
				order.setAddressSub(rset.getString("address_sub"));
				order.setPhone(rset.getString("phone"));
				order.setOrderComment(rset.getString("order_comment"));
				order.setPaymentWay(rset.getString("payment_way"));
				order.setPaymentPlace(rset.getString("payment_place"));
				order.setOrderMenu(rset.getString("order_menu"));
				order.setTotalPrice(rset.getInt("total_price"));
				
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		
		return order;
	}

}
