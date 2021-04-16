package member.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import static common.JDBCTemplate.*;

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
	

	//아이디로 멤버조회
	public Member selectOne(Connection conn, String memberId) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectOne");
		
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

}
