package memberPackage;

//메서드 파일
import java.sql.*;
import java.util.*;

public class memberFindidMethod {

	private static memberConnectionPool pool;

	public memberFindidMethod() {

		try {

			System.out.println("DB 드라이버 로딩 성공!");
			pool = memberConnectionPool.getInstance();

		}

		catch (Exception e) {

			System.out.print("DB 드라이버 로딩 실패!" + e);
			e.printStackTrace();
		}

	}

	public boolean memberFindid(String MEM_NAME, String MEM_PHONE) {

		boolean ok = false;

		Connection conn = null;

		PreparedStatement pstmt = null;

		ResultSet rs = null;
		try

		{

			conn = pool.getConnection();

			String sql = "select * from MEMBER where MEM_NAME = ? and MEM_PHONE = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, MEM_NAME);
			pstmt.setString(2, MEM_PHONE);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				ok = true;
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

}