package memberPackage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class memberIdCheckMgr {
	
	private memberConnectionPool pool;
	
	public memberIdCheckMgr() {
		try {
			pool =memberConnectionPool.getInstance();
			System.out.println("drive loading 성공");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//아이디 중복 확인
	public int checkId(String MEM_ID) {
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "select MEM_ID from member where MEM_ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, MEM_ID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 0;// 이미 존재하는 경우 오류
			} else {
				return 1; //가입 가능한 회원 아이디
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
			
				if(rs!=null) rs.close();
			
				if(pstmt != null) pstmt.close();
			
				 if(con != null) con.close();
			
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1; //데이터베이스 오류
	}
	
} 