package member.model.service;


import static common.JDBCTemplate.*;


import java.sql.Connection;

import member.model.dao.MemberDao;
import member.model.vo.Member;



public class MemberService {

	private MemberDao memberDao = new MemberDao();
	

	public static final String MEMBER_ROLE = "U";
	public static final String ADMIN_ROLE = "A";
	
	
	public int insertMember(Member member) {
		Connection conn = getConnection();
		int result = memberDao.insertMember(conn, member);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		return result;
	}

	
	//아이디로 멤버조회(로그인시)
	public Member selectOne(String memberId) {
		Connection conn = getConnection();
		Member member = memberDao.selectOne(conn, memberId);
		close(conn);
		return member;
	}


	//휴대폰 전화번호로 멤버조회(아이디찾기)
	public Member selectMemberId(String phone) {
		Connection conn = getConnection();
		Member member = memberDao.selectMemberId(conn, phone);
		close(conn);
		return member;
	}

	
	

}
