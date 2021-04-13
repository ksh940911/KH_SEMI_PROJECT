package restaurant.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import restaurant.model.dao.RestaurantDao;
import restaurant.model.vo.Menu;
import restaurant.model.vo.Restaurant;

public class RestaurantService {
	
	private RestaurantDao restaurantDao = new RestaurantDao();

	public List<Restaurant> selectRestaurant() {
		Connection conn = getConnection();
		List<Restaurant> list = restaurantDao.selectRestaurant(conn);
		close(conn);
		return list;
	}

	public List<Menu> selectMenuList(int resId) {
		Connection conn = getConnection();
		List<Menu> list = restaurantDao.selectMenuList(conn, resId);
		close(conn);
		return list;
	}

}
