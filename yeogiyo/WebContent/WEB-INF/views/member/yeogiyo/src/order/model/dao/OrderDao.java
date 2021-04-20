package order.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.util.Properties;

import member.model.dao.MemberDao;
import order.model.vo.Order;

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
		
		
		
		
		
		return result;
	}

}
