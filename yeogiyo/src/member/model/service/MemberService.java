package member.model.service;


import static common.JDBCTemplate.*;


import java.sql.Connection;
import java.util.List;
import java.util.Map;

import member.model.dao.MemberDao;
import member.model.vo.Member;



public class MemberService {

	private MemberDao memberDao = new MemberDao();
	

	public static final String MEMBER_ROLE = "U";
	public static final String ADMIN_ROLE = "A";
	
	
	//회원가입
	public int insertMember(Member member) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = memberDao.insertMember(conn, member);
			commit(conn);			
		} catch(Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}
	
	//마이페이지 정보 변경
	public int updateMember(Member member) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = memberDao.updateMember(conn, member);
			commit(conn);			
		} catch(Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);			
		}
		return result;
	}
	
	//마이페이지 휴대폰 번호 변경
	public int updatePhone(String phone, String memberId) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = memberDao.updatePhone(conn, phone, memberId);			
			commit(conn);
		}catch(Exception e) {
			rollback(conn);
			throw e;
		}finally {
			close(conn);			
		}
	
		return result;
	}

	
	//아이디로 멤버조회(로그인시)
	public Member selectMemberById(String memberId) {
		Connection conn = getConnection();
		Member member = memberDao.selectMemberById(conn, memberId);
		close(conn);
		return member;
	}


	//휴대폰 전화번호로 멤버조회(아이디찾기)
	public Member selectMemberByPhone(String phone) {
		Connection conn = getConnection();
		Member member = memberDao.selectMemberByPhone(conn, phone);
		close(conn);
		return member;
	}

	//이메일로 멤버조회(비밀번호찾기)
	public Member selectMemberByEmail(String email) {
		Connection conn = getConnection();
		Member member = memberDao.selectMemberByEmail(conn, email);
		close(conn);
		return member;
	}

	//임시비밀번호로 비밀번호 수정(비밀번호찾기)
	public int updateMemberPassword(Member member) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = memberDao.updateMemberPassword(conn, member);
			commit(conn);			
		}catch(Exception e) {
			rollback(conn);
			throw e;
		}finally {
			close(conn);			
		}
		
		return result;
	}

	// 전체 회원조회-리스트_페이징 (회원관리용)
	public List<Member> selectList(Map<String, String> param) {
		Connection conn = getConnection();
		List<Member> list = memberDao.selectList(conn, param); 
		return list;
	}

	// 전체 회원수 조회 (회원관리용)
	public int selectMemberCount() {
		Connection conn = getConnection();
		int totalContents = memberDao.selectMemberCount(conn);
		close(conn);
		return totalContents;
	}

	// 회원권한 변경 (회원관리용)
	public int updateMemberRole(Member member) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = memberDao.updateMemberRole(conn, member);
			commit(conn);
		}catch(Exception e) {
			rollback(conn);
			throw e;
		}finally {
			close(conn);			
		}
		
		return result;
	}

	// 회원선택 조회_페이징 (회원관리용)
	public List<Member> searchMember(Map<String, String> param) {
		Connection conn = getConnection();
		List<Member> list = memberDao.searchMember(conn, param);
		close(conn);
		return list;
	}

	// 회원선택 조회 회원수 (회원관리용) 
	public int searchMemberCount(Map<String, String> param) {
		Connection conn = getConnection();
		int totalContents = memberDao.searchMemberCount(conn, param);
		close(conn);
		return totalContents;
	}

	//회원 삭제
	public int deleteMember(String memberId) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = memberDao.deleteMember(conn, memberId);
			commit(conn);			
		}catch(Exception e) {
			rollback(conn);
			throw e;
		}finally {
			close(conn);			
		}
		
		return result;
	}

	// 회원 선택 수정 (회원관리용)
	public int adminUpdateMember(Member member) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = memberDao.adminUpdateMember(conn, member);
			commit(conn);
		}catch(Exception e) {
			rollback(conn);
			throw e;
		}finally {
			close(conn);			
		}
		return result;
	}

	// 회원 선택 삭제 (회원관리용)
	public int adminMemberDelete(String memberId) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = memberDao.deleteMember(conn, memberId);
			commit(conn);
		}catch(Exception e) {
			rollback(conn);
			throw e;
		}finally {
			close(conn);			
		}
		 
		return result;
	}
	






}
