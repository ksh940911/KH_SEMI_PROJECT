package order.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import order.model.dao.OrderDao;
import order.model.vo.Order;

public class OrderService {
	
	private OrderDao orderDao = new OrderDao();
	
	public static final String CREDIT_CARD = "C";
	public static final String KAKAO_PAY = "K";
	public static final String CASH = "M"; //money
	
	public static final String ONLINE = "N";
	public static final String OFFLINE = "F";
	
	public int insertOrder(Order order) {
		Connection conn = getConnection();
		int result = orderDao.insertOrder(conn, order);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		return result;
	}

	public int countOrder() {
		Connection conn = getConnection();
		int totalOrder = orderDao.selectOrderCount(conn);
		close(conn);
		return totalOrder;
	}

	public Order selectLastOrderById(String memberId) {
		Connection conn = getConnection();
		Order order = orderDao.selectLastOrderById(conn, memberId);
		close(conn);
		return order;
	}
	
	public Order selectLastOrderMenuById(String memberId) {
		Connection conn = getConnection();
		Order order = orderDao.selectLastOrderMenuById(conn, memberId);
		close(conn);
		return order;
	}
	
	public int selectReviewCntByResId(int resId) {
		Connection conn = getConnection();
		int reviewCnt = orderDao.selectReviewCntByResId(conn, resId);
		close(conn);
		return reviewCnt;
	}
}
