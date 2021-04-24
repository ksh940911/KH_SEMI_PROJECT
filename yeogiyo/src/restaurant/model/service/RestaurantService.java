package restaurant.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import notice.model.exception.NoticeException;
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

	
	// 전체 가게조회-리스트_페이징 (가게관리용)
	public List<Restaurant> selectResList(Map<String, String> param) {
		Connection conn = getConnection();
		List<Restaurant> list = restaurantDao.selectResList(conn, param);
		return list;
	}
	// 전체 가게수 조회 (가게관리용)
	public int selectResCount() {
		Connection conn = getConnection();
		int result = restaurantDao.selectResCount(conn);
		return result;
	}
	
	// 가게 신규 등록 (가게관리용)
	public int insertRes(Restaurant res) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = restaurantDao.insertRes(conn, res);
			if (res.getResImg() != null) {
				int resId = restaurantDao.selectLastResId(conn);				
				res.getResImg().setImgResId(resId);
				result = restaurantDao.insertResImg(conn, res.getResImg());
			}
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}


	// 가게 정보 수정 (가게관리용)
	public int updateRes(Restaurant res) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = restaurantDao.updateRes(conn, res);
			if (res.getResImg() != null) {
				result = restaurantDao.insertResImg(conn, res.getResImg());
			}
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	
	}

	
	// 메뉴조회-리스트_페이징 (메뉴관리용)
	public List<Menu> selectMenuList(Map<String, String> param) {
		Connection conn = getConnection();
		List<Menu> list = restaurantDao.selectMenuList(conn, param);
		return list;
	}


	// 메뉴 개수 조회 (메뉴관리용)
	public int selectMenuCount(String resId) {
		Connection conn = getConnection();
		int totalContents = restaurantDao.selectMenuCount(conn, resId);
		return totalContents;
	}


	public int deleteRes(int resId) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = restaurantDao.deleteRes(conn, resId);
			if (result == 0)
				throw new IllegalArgumentException("해당 가게가 존재하지 않습니다. : " + resId);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}


}
