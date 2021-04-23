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

	public List<Restaurant> selectRestaurantList() {
		Connection conn = getConnection();
		List<Restaurant> list = restaurantDao.selectRestaurantList(conn);
		close(conn);
		return list;
	}

	public List<Menu> selectMenuList(int resId) {
		Connection conn = getConnection();
		List<Menu> list = restaurantDao.selectMenuList(conn, resId);
		close(conn);
		return list;
	}

	public Restaurant selectRestaurant(int resId) {
		Connection conn = getConnection();
		Restaurant restaurant = restaurantDao.selectRestaurant(conn, resId);
		close(conn);
		return restaurant;
	}

	public Menu selectMenu(int menuId) {
		Connection conn = getConnection();
		Menu menu = restaurantDao.selectMenu(conn, menuId);
		close(conn);
		return menu;
	}

	public List<Restaurant> selectRestaurantListByCategory(String category) {
		Connection conn = getConnection();
		List<Restaurant> list = restaurantDao.selectRestaurantListByCategory(conn, category);
		close(conn);
		return list;
	}

}
