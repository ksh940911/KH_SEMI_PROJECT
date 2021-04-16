package member.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import member.model.vo.Member;

public class MemberDao {

	private Properties prop = new Properties();
	
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
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

}
