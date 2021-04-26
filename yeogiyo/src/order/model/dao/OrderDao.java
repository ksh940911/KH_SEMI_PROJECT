package order.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import member.model.dao.MemberDao;
import member.model.vo.MemberOrderList;
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
			
			/*
			 * 
			 * insert into tb_order 
			 * (order_id, 
			 * member_id, 1
			 *  res_id, 2
			 *   address,  3
			 *   address_sub, 4
			 *    phone,  5
			 *    order_comment, 6
			 *     payment_way, 7
			 *      payment_place,  8
			 *      order_menu, 9
			 *      review_yn, 
			 *      total_price)10
			 *      values(seq_tb_order_id.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'N', ?);

			 * */
			
			//order_id
			pstmt.setString(1, order.getMemberId()); //kym9129
			pstmt.setInt(2, order.getResId()); //21
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
	
	public Order selectLastOrderMenuById(Connection conn, String memberId) {
		Order order = new Order();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectLastOrderMenuById");
		
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

	public int selectReviewCntByResId(Connection conn, int resId) {
		String sql = prop.getProperty("selectReviewCntByResId");
		int reviewCnt = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				reviewCnt = rset.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return reviewCnt;
	}


	public int updateReviewYNByOrderId(Connection conn, int orderId) {
		int result = 0;
		String sql = prop.getProperty("updateReviewYNByOrderId");
		//update tb_order set review_yn = 'Y' where order_id = ?
		
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1, orderId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	//마이페이지 - 주문 조회
	public List<MemberOrderList> selectRestaurantListByMeberId(Connection conn, String memberId) {
		List<MemberOrderList> list = new ArrayList<>();
		MemberOrderList order = null;
		String query = prop.getProperty("selectOrderList");
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				order = new MemberOrderList();
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
				order.setOrderMenu(rset.getString("order_menu")); //json
				order.setTotalPrice(rset.getInt("total_price"));
				order.setResName(rset.getString("res_name"));
				
				list.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

}
