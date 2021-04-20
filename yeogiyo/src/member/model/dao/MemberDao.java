package member.model.dao;


import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	public Member selectMemberId(Connection conn, String phone) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectMemberId");
		
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

}
