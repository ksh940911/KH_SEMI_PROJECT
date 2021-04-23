package restaurant.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import common.JDBCTemplate;
import order.model.service.OrderService;
import restaurant.model.exception.RestaurantException;
import restaurant.model.vo.Menu;
import restaurant.model.vo.Restaurant;

public class RestaurantDao {
	
	private OrderService orderService = new OrderService();
	
	private Properties prop = new Properties();
	
	public RestaurantDao() {
//		String drtry = JDBCTemplate.class.getResource("/").getPath();
//		System.out.println("drtry@dao = " + drtry);
		String filename = JDBCTemplate.class.getResource("/sql/restaurant/restaurant-query.properties").getPath();
//		System.out.println("filename@Dao = " + filename);
		try {
			prop.load(new FileReader(filename));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<Restaurant> selectRestaurantList(Connection conn) {
		List<Restaurant> list = new ArrayList<>();
		Restaurant restaurant = null;
		String sql = prop.getProperty("selectRestaurantList");
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				restaurant = new Restaurant();
				restaurant.setResId(rset.getInt("res_id"));
				restaurant.setResName(rset.getString("res_name"));
				restaurant.setResAddress(rset.getString("res_address"));
				restaurant.setCategory(rset.getString("category"));
				restaurant.setMinPrice(rset.getInt("min_price"));
				restaurant.setLogoImg(rset.getString("logo_img"));
				restaurant.setRateAvg(rset.getDouble("rate_avg"));
				restaurant.setReviewCnt(orderService.selectReviewCntByResId(restaurant.getResId()));
				list.add(restaurant);
			}
			
		} catch (Exception e) {
			throw new RestaurantException("가게 리스트 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public List<Menu> selectMenuList(Connection conn, int resId) {
		List<Menu> list = new ArrayList<>();
		String sql = prop.getProperty("selectMenuList");
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resId);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Menu menu = new Menu();
				menu.setMenuId(rset.getInt("menu_id"));
				menu.setResId(rset.getInt("res_id"));
				menu.setMenuName(rset.getString("menu_name"));
				menu.setDescription(rset.getString("description"));
				menu.setMenuCategory(rset.getString("menu_category"));
				menu.setPrice(rset.getInt("price"));
				menu.setMenuImg(rset.getString("menu_img"));
				list.add(menu);
			}
			
		} catch (Exception e) {
			throw new RestaurantException("메뉴 리스트 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public Restaurant selectRestaurant(Connection conn, int resId) {
		Restaurant restaurant = new Restaurant();
		String sql = prop.getProperty("selectRestaurant");
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				restaurant.setResId(rset.getInt("res_id"));
				restaurant.setResName(rset.getString("res_name"));
				restaurant.setResAddress(rset.getString("res_address"));
				restaurant.setCategory(rset.getString("category"));
				restaurant.setMinPrice(rset.getInt("min_price"));
				restaurant.setLogoImg(rset.getString("logo_img"));
				restaurant.setRateAvg(rset.getDouble("rate_avg"));
				restaurant.setReviewCnt(orderService.selectReviewCntByResId(restaurant.getResId()));
			}
			
		} catch (Exception e) {
			throw new RestaurantException("가게 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return restaurant;
	}

	public Menu selectMenu(Connection conn, int menuId) {
		Menu menu = new Menu();
		String sql = prop.getProperty("selectMenu");
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, menuId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				menu.setMenuId(rset.getInt("menu_id"));
				menu.setResId(rset.getInt("res_id"));
				menu.setMenuName(rset.getString("menu_name"));
				menu.setDescription(rset.getString("description"));
				menu.setMenuCategory(rset.getString("menu_category"));
				menu.setPrice(rset.getInt("price"));
				menu.setMenuImg(rset.getString("menu_img"));
			}
			
		} catch (Exception e) {
			throw new RestaurantException("가게 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return menu;
	}

	public List<Restaurant> selectRestaurantListByCategory(Connection conn, String category) {
		List<Restaurant> list = new ArrayList<>();
		Restaurant restaurant = null;
		String sql = prop.getProperty("selectRestaurantListByCategory");
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				restaurant = new Restaurant();
				restaurant.setResId(rset.getInt("res_id"));
				restaurant.setResName(rset.getString("res_name"));
				restaurant.setResAddress(rset.getString("res_address"));
				restaurant.setCategory(rset.getString("category"));
				restaurant.setMinPrice(rset.getInt("min_price"));
				restaurant.setLogoImg(rset.getString("logo_img"));
				restaurant.setRateAvg(rset.getDouble("rate_avg"));
				restaurant.setReviewCnt(orderService.selectReviewCntByResId(restaurant.getResId()));
				list.add(restaurant);
			}
			
		} catch (Exception e) {
			throw new RestaurantException("가게 리스트 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	

}
