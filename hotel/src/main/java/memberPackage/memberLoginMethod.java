package memberPackage;

//메서드 파일
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;


public class memberLoginMethod {

	private static memberConnectionPool pool;

	public memberLoginMethod() {

		try {

			System.out.println("DB 드라이버 로딩 성공!");
			pool = memberConnectionPool.getInstance();

		}

		catch (Exception e) {

			System.out.print("DB 드라이버 로딩 실패!" + e);
			e.printStackTrace();
		}
	}

	public boolean memberLogin(String MEM_ID, String MEM_PW) {

		boolean ok = false;

		Connection conn = null;

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		try

		{

			conn = pool.getConnection();

			String sql = "select * from MEMBER where MEM_ID = ? and MEM_PW = ?";
			int MEM_KEY=0;
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, MEM_ID);
			pstmt.setString(2, MEM_PW);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				ok = true;
				MEM_KEY = rs.getInt(MEM_KEY);
			}

		} catch (Exception ex) {

			ex.printStackTrace();

		} finally {
			try {

				if (rs != null)
					rs.close();

				if (pstmt != null)
					pstmt.close();

				if (conn != null)
					conn.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return ok;
	}
	
	public int sessionSetMEMKEY(String id, String pw) {
		
		int key = 0;

		Connection conn = null;

		PreparedStatement pstmt = null;

		ResultSet rs = null;
		
		try {
			conn = pool.getConnection();
			
			String query = "select * from MEMBER where MEM_ID = ? and MEM_PW = ?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				key = rs.getInt("MEM_KEY");
				
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
	return key;
	}
	public int sessionSetADUCKEY(String id, String pw) {
		
		int key = 0;

		Connection conn = null;

		PreparedStatement pstmt = null;

		ResultSet rs = null;
		
		try {
			conn = pool.getConnection();
			
			String query = "select * from MEMBER where MEM_ID = ? and MEM_PW = ?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				key = rs.getInt("AD_UC_KEY");
				
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
	return key;
	}

}
