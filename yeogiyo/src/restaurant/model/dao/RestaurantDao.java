package restaurant.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import common.JDBCTemplate;
import order.model.service.OrderService;
import restaurant.model.exception.RestaurantException;
import restaurant.model.vo.Menu;
import restaurant.model.vo.ResImg;
import restaurant.model.vo.Restaurant;
import review.model.service.ReviewService;


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
//	public List<Restaurant> selectRestaurantList(Connection conn) {
//		List<Restaurant> list = new ArrayList<>();
//		Restaurant restaurant = null;
//		String sql = prop.getProperty("selectRestaurantList");
//		ResultSet rset = null;
//		PreparedStatement pstmt = null;
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			rset = pstmt.executeQuery();
//			
//			while(rset.next()) {
//				restaurant = new Restaurant();
//				restaurant.setResId(rset.getInt("res_id"));
//				restaurant.setResName(rset.getString("res_name"));
//				restaurant.setResAddress(rset.getString("res_address"));
//				restaurant.setCategory(rset.getString("category"));
//				restaurant.setMinPrice(rset.getInt("min_price"));
//				restaurant.setRateAvg(rset.getDouble("rate_avg"));
//				restaurant.setReviewCnt(orderService.selectReviewCntByResId(restaurant.getResId()));
//				
//				if(rset.getInt("img_res_no") != 0) {
//					ResImg resImg = new ResImg();
//					resImg.setImgResNo(rset.getInt("img_res_no"));
//					resImg.setImgResId(rset.getInt("res_id"));
//					resImg.setOriginalFilname(rset.getString("img_originalfile"));
//					resImg.setRenamedFilename(rset.getString("img_renamedfile"));
//					resImg.setImgResStatus("Y".equals(rset.getString("img_res_status"))? true : false);
//					restaurant.setResImg(resImg);
//				}
//				
//				list.add(restaurant);
//			}
//			
//		} catch (Exception e) {
//			throw new RestaurantException("가게 리스트 조회 오류", e);
//		} finally {
//			close(rset);
//			close(pstmt);
//		}
//		
//		return list;
//	}
	
	public List<Restaurant> selectRestaurantList(Connection conn, String align) {
		List<Restaurant> list = new ArrayList<>();
		Restaurant restaurant = null;
		String query = prop.getProperty("selectRestaurantList");
		query = setQuery(query, align);
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				restaurant = new Restaurant();
				restaurant.setResId(rset.getInt("res_id"));
				restaurant.setResName(rset.getString("res_name"));
				restaurant.setResAddress(rset.getString("res_address"));
				restaurant.setCategory(rset.getString("category"));
				restaurant.setMinPrice(rset.getInt("min_price"));
				restaurant.setRateAvg(rset.getDouble("rate_avg"));
				restaurant.setReviewCnt(orderService.selectReviewCntByResId(restaurant.getResId()));
				
				if(rset.getInt("img_res_no") != 0) {
					ResImg resImg = new ResImg();
					resImg.setImgResNo(rset.getInt("img_res_no"));
					resImg.setImgResId(rset.getInt("res_id"));
					resImg.setOriginalFilname(rset.getString("img_originalfile"));
					resImg.setRenamedFilename(rset.getString("img_renamedfile"));
					resImg.setImgResStatus("Y".equals(rset.getString("img_res_status"))? true : false);
					restaurant.setResImg(resImg);
				}
				
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
				restaurant.setRateAvg(rset.getDouble("rate_avg"));
				restaurant.setReviewCnt(orderService.selectReviewCntByResId(restaurant.getResId()));
				
				if(rset.getInt("img_res_no") != 0) {
					ResImg resImg = new ResImg();
					resImg.setImgResNo(rset.getInt("img_res_no"));
					resImg.setImgResId(rset.getInt("res_id"));
					resImg.setOriginalFilname(rset.getString("img_originalfile"));
					resImg.setRenamedFilename(rset.getString("img_renamedfile"));
					resImg.setImgResStatus("Y".equals(rset.getString("img_res_status"))? true : false);
					restaurant.setResImg(resImg);
				}
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

//	public List<Restaurant> selectRestaurantListByCategory(Connection conn, String category) {
//		List<Restaurant> list = new ArrayList<>();
//		Restaurant restaurant = null;
//		String sql = prop.getProperty("selectRestaurantListByCategory");
//		ResultSet rset = null;
//		PreparedStatement pstmt = null;
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, category);
//			rset = pstmt.executeQuery();
//			
//			while(rset.next()) {
//				restaurant = new Restaurant();
//				restaurant.setResId(rset.getInt("res_id"));
//				restaurant.setResName(rset.getString("res_name"));
//				restaurant.setResAddress(rset.getString("res_address"));
//				restaurant.setCategory(rset.getString("category"));
//				restaurant.setMinPrice(rset.getInt("min_price"));
//				restaurant.setRateAvg(rset.getDouble("rate_avg"));
//				restaurant.setReviewCnt(orderService.selectReviewCntByResId(restaurant.getResId()));
//
//				if(rset.getInt("img_res_no") != 0) {
//					ResImg resImg = new ResImg();
//					resImg.setImgResNo(rset.getInt("img_res_no"));
//					resImg.setImgResId(rset.getInt("res_id"));
//					resImg.setOriginalFilname(rset.getString("img_originalfile"));
//					resImg.setRenamedFilename(rset.getString("img_renamedfile"));
//					resImg.setImgResStatus("Y".equals(rset.getString("img_res_status"))? true : false);
//					restaurant.setResImg(resImg);
//				}
//				
//				list.add(restaurant);
//				
//				
//			}
//			
//		} catch (Exception e) {
//			throw new RestaurantException("가게 리스트 조회 오류", e);
//		} finally {
//			close(rset);
//			close(pstmt);
//		}
//		
//		return list;
//	}
	
	public List<Restaurant> selectRestaurantListByCategory(Connection conn, String category, String align) {
		List<Restaurant> list = new ArrayList<>();
		Restaurant restaurant = null;
		String query = prop.getProperty("selectRestaurantListByCategory");
//		select * from restaurant R left join res_img I 
//			on R.res_id = I.img_res_id and I.img_res_status = 'Y' where category = ? 
//			order by #
		query = setQuery(query, align);
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, category);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				restaurant = new Restaurant();
				restaurant.setResId(rset.getInt("res_id"));
				restaurant.setResName(rset.getString("res_name"));
				restaurant.setResAddress(rset.getString("res_address"));
				restaurant.setCategory(rset.getString("category"));
				restaurant.setMinPrice(rset.getInt("min_price"));
				restaurant.setRateAvg(rset.getDouble("rate_avg"));
				restaurant.setReviewCnt(orderService.selectReviewCntByResId(restaurant.getResId()));

				if(rset.getInt("img_res_no") != 0) {
					ResImg resImg = new ResImg();
					resImg.setImgResNo(rset.getInt("img_res_no"));
					resImg.setImgResId(rset.getInt("res_id"));
					resImg.setOriginalFilname(rset.getString("img_originalfile"));
					resImg.setRenamedFilename(rset.getString("img_renamedfile"));
					resImg.setImgResStatus("Y".equals(rset.getString("img_res_status"))? true : false);
					restaurant.setResImg(resImg);
				}
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
	

	//검색어+카테고리로 가게조회(해당 카테고리에서 검색시)
	public List<Restaurant> selectRestaurantListByKeyword(Connection conn, String keyword, String category) {
		List<Restaurant> list = new ArrayList<>();
		Restaurant restaurant = null;
		String sql = prop.getProperty("selectRestaurantListByKeyword");
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setString(2, '%' + keyword + '%');
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				restaurant = new Restaurant();
				restaurant.setResId(rset.getInt("res_id"));
				restaurant.setResName(rset.getString("res_name"));
				restaurant.setResAddress(rset.getString("res_address"));
				restaurant.setCategory(rset.getString("category"));
				restaurant.setMinPrice(rset.getInt("min_price"));
				restaurant.setRateAvg(rset.getDouble("rate_avg"));
				restaurant.setReviewCnt(orderService.selectReviewCntByResId(restaurant.getResId()));

				if(rset.getInt("img_res_no") != 0) {
					ResImg resImg = new ResImg();
					resImg.setImgResNo(rset.getInt("img_res_no"));
					resImg.setImgResId(rset.getInt("res_id"));
					resImg.setOriginalFilname(rset.getString("img_originalfile"));
					resImg.setRenamedFilename(rset.getString("img_renamedfile"));
					resImg.setImgResStatus("Y".equals(rset.getString("img_res_status"))? true : false);
					restaurant.setResImg(resImg);
				}
				
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
	
	//검색어로 가게조회(전체보기에서 검색시)
	public List<Restaurant> selectRestaurantListByKeyword(Connection conn, String allCategoryKeyword) {
		List<Restaurant> list = new ArrayList<>();
		Restaurant restaurant = null;
		String sql = prop.getProperty("selectRestaurantListByAll");
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%' + allCategoryKeyword + '%');
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				restaurant = new Restaurant();
				restaurant.setResId(rset.getInt("res_id"));
				restaurant.setResName(rset.getString("res_name"));
				restaurant.setResAddress(rset.getString("res_address"));
				restaurant.setCategory(rset.getString("category"));
				restaurant.setMinPrice(rset.getInt("min_price"));
				restaurant.setRateAvg(rset.getDouble("rate_avg"));
				restaurant.setReviewCnt(orderService.selectReviewCntByResId(restaurant.getResId()));

				if(rset.getInt("img_res_no") != 0) {
					ResImg resImg = new ResImg();
					resImg.setImgResNo(rset.getInt("img_res_no"));
					resImg.setImgResId(rset.getInt("res_id"));
					resImg.setOriginalFilname(rset.getString("img_originalfile"));
					resImg.setRenamedFilename(rset.getString("img_renamedfile"));
					resImg.setImgResStatus("Y".equals(rset.getString("img_res_status"))? true : false);
					restaurant.setResImg(resImg);
				}
				
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
	


	// 가게조회-리스트_페이징 (가게관리용)
	public List<Restaurant> selectResList(Connection conn, Map<String, String> param) {
		List<Restaurant> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectResList");
//		select * from 
//		    (select row_number() over(order by R.res_id desc) rnum,
//		            R.*, 
//		            I.img_res_no, 
//		            I.img_originalfile, 
//		            I.img_renamedfile, 
//		            I.img_res_status 
//		    from restaurant R left join res_img I 
//		                on R.res_id = I.img_res_id and I.img_res_status = 'Y' ) R 
//		    where rnum between ? and ?
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, param.get("start"));
			pstmt.setString(2, param.get("end"));
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Restaurant res = new Restaurant();
				res.setResId(rset.getInt("res_id"));
				res.setResName(rset.getString("res_name"));
				res.setResAddress(rset.getString("res_address"));
				res.setCategory(rset.getString("category"));
				res.setMinPrice(rset.getInt("min_price"));
				res.setRateAvg(rset.getDouble("rate_avg"));
				res.setReviewCnt(rset.getInt("review_cnt"));
				
				if(rset.getInt("img_res_no") != 0) {
					ResImg resImg = new ResImg();
					resImg.setImgResNo(rset.getInt("img_res_no"));
					resImg.setImgResId(rset.getInt("res_id"));
					resImg.setOriginalFilname(rset.getString("img_originalfile"));
					resImg.setRenamedFilename(rset.getString("img_renamedfile"));
					resImg.setImgResStatus("Y".equals(rset.getString("img_res_status"))? true : false);
					res.setResImg(resImg);
				}
				list.add(res);
			}
		} catch (Exception e) {
			throw new RestaurantException("가게관리 -> 가게 리스트 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 전체 가게수 조회 (가게관리용)
	public int selectResCount(Connection conn) {
		int totalContents = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectResCount");
//		select count(*) cnt from restaurant
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				totalContents = rset.getInt("cnt");
			}
		} catch (Exception e) {
			throw new RestaurantException("전체 가게수 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalContents;
	}


	// 메뉴조회-리스트_페이징
	public List<Menu> selectMenuList(Connection conn, Map<String, String> param) {
		List<Menu> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMenuList");
//	    select * from ( select row_number() over(order by menu_id desc) rnum, M.* from menu M where res_id = ? ) M where rnum between ? and ?
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, param.get("resId"));
			pstmt.setString(2, param.get("start"));
			pstmt.setString(3, param.get("end"));
			rset = pstmt.executeQuery();
			while (rset.next()) {
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
			throw new RestaurantException("메뉴관리 -> 메뉴 리스트 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 메뉴 개수 조회 (메뉴관리용)
	public int selectMenuCount(Connection conn, String resId) {
		int totalContents = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectMenuCount");
//		select count(*) cnt from menu where res_id = ?
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, resId);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				totalContents = rset.getInt("cnt");
			}
		} catch (Exception e) {
			throw new RestaurantException("메뉴 개수 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalContents;
	}

	// 가게 신규 등록 (가게관리용)
	public int insertRes(Connection conn, Restaurant res) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertRes");
//		insert into restaurant(res_id, res_name, res_address, category, min_price) values(seq_tb_res_id.nextval, ?, ?, ?, ?)
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, res.getResName());
			pstmt.setString(2, res.getResAddress());
			pstmt.setString(3, res.getCategory());
			pstmt.setInt(4, res.getMinPrice());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RestaurantException("가게 등록 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 가게 마지막 번호 조회 (가게관리용)
	public int selectLastResId(Connection conn) {
		int resId = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectLastResId");
//		select seq_tb_res_id.currval res_id from dual	
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				resId = rset.getInt("res_id");
			}
		} catch (SQLException e) {
			throw new RestaurantException("가게등록 번호 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return resId;
	}

	// 가게 이미지 등록 (가게관리용)
	public int insertResImg(Connection conn, ResImg resImg) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertResImg");
//		insert into res_img(img_res_no, img_res_id, img_originalfile, img_renamedfile) values(seq_tb_res_img_no.nextval, ?, ?, ?)
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resImg.getImgResId() );
			pstmt.setString(2, resImg.getOriginalFilname());
			pstmt.setString(3, resImg.getRenamedFilename());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RestaurantException("가게 이미지 등록 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 가게 정보 수정 (가게관리용)
	public int updateRes(Connection conn, Restaurant res) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateRes");
//		update restaurant set res_name = ?, res_address = ?, category = ?, min_price =? where res_id = ?
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, res.getResName());
			pstmt.setString(2, res.getResAddress());
			pstmt.setString(3, res.getCategory());			
			pstmt.setInt(4, res.getMinPrice());
			pstmt.setInt(5, res.getResId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RestaurantException("가게 수정 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 가게 삭제 (가게관리용)
	public int deleteRes(Connection conn, int resId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteRes");
//		delete from restaurant where res_id = ?
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RestaurantException("가게 삭제 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 가게 객체 이미지 연결 (가게관리용)
	public ResImg selectOneResImg(Connection conn, Restaurant res) {
		ResImg resImg  = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOneResImg");
//		select * from res_img where img_res_id = ? and img_res_status = 'Y' order by img_no desc
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, res.getResId());
			rset = pstmt.executeQuery();

			if (rset.next()) {
				resImg = new ResImg();
				resImg.setImgResNo(rset.getInt("img_res_no"));
				resImg.setImgResId(rset.getInt("img_res_id"));
				resImg.setOriginalFilname(rset.getString("img_originalfile"));
				resImg.setRenamedFilename(rset.getString("img_renamedfile"));
				resImg.setImgResStatus("Y".equals(rset.getString("img_res_status")) ? true : false);
			}
		} catch (Exception e) {
			throw new RestaurantException("가게 이미지 첨부파일 조회오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return resImg;
	}

	// 가게 이미지 삭제 (가게관리용)
	public int deleteResImg(Connection conn, String imgResNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteResImg");
//		update res_img set img_res_status = 'N' where img_res_no = ? 
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, imgResNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RestaurantException("가게 이미지 첨부파일 삭제 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 가게 이름 조회 (가게관리용)
	public List<Restaurant> searchResName(Connection conn, Map<String, String> param) {
		List<Restaurant> list = new ArrayList<Restaurant>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("searchPagedResName");
//		select * from 
//	    (select row_number() over(order by R.res_id desc) rnum,
//	            R.*, 
//	            I.img_res_no, 
//	            I.img_originalfile, 
//	            I.img_renamedfile, 
//	            I.img_res_status 
//	    from restaurant R left join res_img I 
//	                on R.res_id = I.img_res_id and I.img_res_status = 'Y'
//        where R.res_name like '%'||?||'%') R 
//	    where rnum between ? and ?
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, param.get("searchResName"));
			pstmt.setString(2, param.get("start"));
			pstmt.setString(3, param.get("end"));
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Restaurant res = new Restaurant();
				res.setResId(rset.getInt("res_id"));
				res.setResName(rset.getString("res_name"));
				res.setResAddress(rset.getString("res_address"));
				res.setCategory(rset.getString("category"));
				res.setMinPrice(rset.getInt("min_price"));
				res.setRateAvg(rset.getDouble("rate_avg"));
				res.setReviewCnt(rset.getInt("review_cnt"));
				
				if(rset.getInt("img_res_no") != 0) {
					ResImg resImg = new ResImg();
					resImg.setImgResNo(rset.getInt("img_res_no"));
					resImg.setImgResId(rset.getInt("res_id"));
					resImg.setOriginalFilname(rset.getString("img_originalfile"));
					resImg.setRenamedFilename(rset.getString("img_renamedfile"));
					resImg.setImgResStatus("Y".equals(rset.getString("img_res_status"))? true : false);
					res.setResImg(resImg);
				}
				list.add(res);
				System.out.println("daoList = "+list);
			}
		} catch (Exception e) {
			throw new RestaurantException("가게 이름 조회 오류(관리자용)", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	// 가게 이름 조회 결과 수 (가게관리용)
	public int searchResNameCount(Connection conn, Map<String, String> param) {
		int totalContents = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("searchResNameCount");
//		select count(*) cnt from restaurant where res_name like '%'||?||'%'
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, param.get("searchResName"));
			rset = pstmt.executeQuery();
			if (rset.next()) {
				totalContents = rset.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalContents;
	}




	// 가게 정렬 조회 쿼리문 셋팅
	private String setQuery(String query, String align) {
		switch(align) {
		case "default":
			query = query.replace("#", "R.res_id desc");
			break;
		case "star":
			query = query.replace("#", "R.rate_avg desc");
			break;
		case "review":
			query = query.replace("#", "R.review_cnt desc");
			break;
		case "min":
			query = query.replace("#", "R.min_price asc");
			break;
		}
	
		return query;
	}

	public int updateReviewCountByResId(Connection conn, int resId, int reviewCount) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReviewCountByResId");
		//update restaurant set review_cnt = ? where res_id = ?

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewCount);
			pstmt.setInt(2, resId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RestaurantException("가게 리뷰갯수 업데이트 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateAvgReviewStarByResId(Connection conn, int resId, int avgReviewStar) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAvgReviewStarByResId");
		//update restaurant set rate_avg = ? where res_id = ?

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, avgReviewStar);
			pstmt.setInt(2, resId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RestaurantException("가게 별점평균 업데이트 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}


}
