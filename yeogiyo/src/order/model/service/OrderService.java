package order.model.service;

import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

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

<<<<<<< Updated upstream
=======
	public int countOrder() {
		Connection conn = getConnection();
		int totalOrder = orderDao.selectOrderCount(conn);
		close(conn);
		return totalOrder;
	}
>>>>>>> Stashed changes
}
