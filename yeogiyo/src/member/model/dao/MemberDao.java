package member.model.dao;


import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	

	//아이디로 멤버조회(로그인시)
	public Member selectMemberById(Connection conn, String memberId) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectMemberById");
		
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				member = new Member();
				member.setMemberId(rset.getString("member_id"));
				member.setMemberName(rset.getString("member_name"));
				member.setPassword(rset.getString("password"));
				member.setBirthday(rset.getDate("birthday"));
				member.setGender(rset.getString("gender")); //char
				member.setAddress(rset.getString("address"));
				member.setAddressSub(rset.getString("address_sub"));
				member.setPhone(rset.getString("phone"));
				member.setEmail(rset.getString("email"));
				member.setMemberEnroll(rset.getDate("enroll_date"));
				member.setMemberRole(rset.getString("member_role")); //char
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return member;
	}


	public int insertMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertMember");
				
		try {
			
			//미완성 쿼리문으로 객체 생성
			pstmt = conn.prepareStatement(query);
			
			//쿼리문 완성시키기
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberName());
			pstmt.setString(3, member.getPassword());
			pstmt.setDate(4, member.getBirthday());
			pstmt.setString(5, member.getGender());
			pstmt.setString(6, member.getAddress());
			pstmt.setString(7, member.getAddressSub());
			pstmt.setString(8, member.getPhone());
			pstmt.setString(9, member.getEmail());
			pstmt.setString(10, member.getMemberRole());

			//DML은 excuteUpdate()
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	//휴대폰 전화번호로 멤버조회(아이디찾기)
	public Member selectMemberByPhone(Connection conn, String phone) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectMemberByPhone");
		
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, phone);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				member = new Member();
				member.setMemberId(rset.getString("member_id"));
				member.setMemberName(rset.getString("member_name"));
				member.setPassword(rset.getString("password"));
				member.setBirthday(rset.getDate("birthday"));
				member.setGender(rset.getString("gender")); //char
				member.setAddress(rset.getString("address"));
				member.setAddressSub(rset.getString("address_sub"));
				member.setPhone(rset.getString("phone"));
				member.setEmail(rset.getString("email"));
				member.setMemberEnroll(rset.getDate("enroll_date"));
				member.setMemberRole(rset.getString("member_role")); //char
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return member;
	}

	//이메일로 멤버조회(비밀번호찾기)
	public Member selectMemberByEmail(Connection conn, String email) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectMemberByEmail");
		
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				member = new Member();
				member.setMemberId(rset.getString("member_id"));
				member.setMemberName(rset.getString("member_name"));
				member.setPassword(rset.getString("password"));
				member.setBirthday(rset.getDate("birthday"));
				member.setGender(rset.getString("gender")); //char
				member.setAddress(rset.getString("address"));
				member.setAddressSub(rset.getString("address_sub"));
				member.setPhone(rset.getString("phone"));
				member.setEmail(rset.getString("email"));
				member.setMemberEnroll(rset.getDate("enroll_date"));
				member.setMemberRole(rset.getString("member_role")); //char
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return member;
	}

	//임시비밀번호로 비밀번호 수정(비밀번호찾기)
	public int updateMemberPassword(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateMemberPassword");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getMemberId());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

  public int updateMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberName());
			pstmt.setDate(2, member.getBirthday());
			pstmt.setString(3, member.getGender());
			pstmt.setString(4, member.getAddress());
			pstmt.setString(5, member.getAddressSub());
			pstmt.setString(6, member.getEmail());
			//pstmt.setString(6, member.getPhone());
			pstmt.setString(7, member.getMemberId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


public int updatePhone(Connection conn, String phone, String memberId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateMemberPhone");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, phone);
			pstmt.setString(2, memberId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
<<<<<<< Updated upstream
}
	
  
  
  
=======
	}
	
	public int deleteMember(Connection conn, String memberId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteMember");

		try {
			// 미완성 쿼리문 객체에 대입
			pstmt = conn.prepareStatement(query);
			// 쿼리문 완성시키기
			pstmt.setString(1, memberId);
			// 쿼리문 실행
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	

>>>>>>> Stashed changes
	// 전체 회원조회-리스트_페이징 (회원관리용)
	public List<Member> selectList(Connection conn, Map<String, String> param) {
		List<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectPagedMember");
//		select * from ( select row_number() over(order by enroll_date desc) rnum, M.* from member M ) M where rnum between ? and ?
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, param.get("start"));
			pstmt.setString(2, param.get("end"));
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Member member = new Member();
				member.setMemberId(rset.getString("member_id"));
				member.setMemberName(rset.getString("member_name"));
				member.setPassword(rset.getString("password"));
				member.setBirthday(rset.getDate("birthday"));
				member.setGender(rset.getString("gender")); // char
				member.setAddress(rset.getString("address"));
				member.setAddressSub(rset.getString("address_sub"));
				member.setPhone(rset.getString("phone"));
				member.setEmail(rset.getString("email"));
				member.setMemberEnroll(rset.getDate("enroll_date"));
				member.setMemberRole(rset.getString("member_role")); // char
				list.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 전체 회원수 조회 (회원관리용)
	public int selectMemberCount(Connection conn) {
		int totalContents = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectMemberCount");
//		select count(*) cnt from member
		try {
			pstmt = conn.prepareStatement(query);
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

	// 회원 권한 관리 (회원관리용)
	public int updateMemberRole(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateMemberRole");
//		update member set member_role = ? where member_id = ?
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberRole());
			pstmt.setString(2, member.getMemberId());
			result = pstmt.executeUpdate();
    } catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
    }
		return result;
	}

	// 회원 선택 조회 회원수 (회원관리용)
	public int searchMemberCount(Connection conn, Map<String, String> param) {
		int totalContents = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("searchMemberCount");
//		select count(*) cnt from member M where #
		query = setQuery(query, param.get("searchType"), param.get("searchKeyword"));
		try {
			pstmt = conn.prepareStatement(query);
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

	// 회원 선택 조회_페이징 (회원관리용)
	public List<Member> searchMember(Connection conn, Map<String, String> param) {
		List<Member> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("searchPagedMember");
//		select * from ( select row_number() over( order by enroll_date desc ) rnum, M.* from member M where # ) M where rnum between ? and ?
		query = setQuery(query, param.get("searchType"), param.get("searchKeyword"));
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, param.get("start"));
			pstmt.setString(2, param.get("end"));
			rset = pstmt.executeQuery();
			list = new ArrayList<Member>();
			while (rset.next()) {
				Member member = new Member();
				member.setMemberId(rset.getString("member_id"));
				member.setMemberName(rset.getString("member_name"));
				member.setPassword(rset.getString("password"));
				member.setBirthday(rset.getDate("birthday"));
				member.setGender(rset.getString("gender")); // char
				member.setAddress(rset.getString("address"));
				member.setAddressSub(rset.getString("address_sub"));
				member.setPhone(rset.getString("phone"));
				member.setEmail(rset.getString("email"));
				member.setMemberEnroll(rset.getDate("enroll_date"));
				member.setMemberRole(rset.getString("member_role")); // char
				list.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public String setQuery(String query, String searchType, String searchKeyword) {
		switch (searchType) {
		case "memberId":
			query = query.replace("#", " member_id like '%" + searchKeyword + "%'");
			break;
		case "memberName":
			query = query.replace("#", " member_name like '%" + searchKeyword + "%'");
			break;
		case "gender":
			query = query.replace("#", " gender = '" + searchKeyword + "'");
			break;
		}
		return query;
<<<<<<< Updated upstream
  }
=======
	}

	
	// 회원 선택 수정 (회원관리용)
	public int adminUpdateMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("AdminUpdateMember");
//		update member set member_name = ?, password = ?, birthday = ?,  gender = ?, address = ?, 
//			   address_sub = ?, phone = ?, email = ?, member_role = ? where member_id = ?
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberName());
			pstmt.setString(2, member.getPassword());
			pstmt.setDate(3, member.getBirthday());
			pstmt.setString(4, member.getGender());
			pstmt.setString(5, member.getAddress());
			pstmt.setString(6, member.getAddressSub());
			pstmt.setString(7, member.getPhone());
			pstmt.setString(8, member.getEmail());
			pstmt.setString(9, member.getMemberRole());
			pstmt.setString(10, member.getMemberId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
>>>>>>> Stashed changes

}
