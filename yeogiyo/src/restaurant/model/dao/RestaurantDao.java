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
import restaurant.model.exception.RestaurantException;
import restaurant.model.vo.Menu;
import restaurant.model.vo.Restaurant;

public class RestaurantDao {
	
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

	public List<Restaurant> selectRestaurant(Connection conn) {
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
				restaurant.setReviewCnt(rset.getInt("review_cnt"));
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

}