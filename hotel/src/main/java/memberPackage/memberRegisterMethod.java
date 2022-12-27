package memberPackage;

//회원가입 dao 페이지
import java.sql.*;
import java.sql.Date;
import java.util.*;
import memberPackage.memberRegisterBean;

public class memberRegisterMethod {

	private static memberConnectionPool pool;

	public memberRegisterMethod() {
		try {
			// Class.forName(dbFile.driverClass);
			System.out.println("DB 드라이버 로딩 성공!");
			pool = memberConnectionPool.getInstance();

		} catch (Exception e) {
			System.out.print("DB 드라이버 로딩 실패!" + e);
			e.printStackTrace();
		}
	}

	public int memberInsert(String MEM_NAME, String MEM_BIRTH, String MEM_ID, String MEM_PW, String MEM_PHONE,
			String MEM_MAIL) {

		Connection conn = null;

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		try {

			conn = pool.getConnection();

			String sql = "insert into `member` (`MEM_ID`, `MEM_PW`, `MEM_PHONE`, `MEM_BIRTH`, `MEM_NAME`, `MEM_MAIL`, `AD_UC_KEY`) values(?,?,?,?,?,?,1)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, MEM_ID);
			pstmt.setString(2, MEM_PW);
			pstmt.setString(3, MEM_PHONE);
			pstmt.setString(4, MEM_BIRTH);
			pstmt.setString(5, MEM_NAME);
			pstmt.setString(6, MEM_MAIL);

			return pstmt.executeUpdate();

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
		return -1;
	}

	public static boolean check(String MEM_ID) {

		Connection conn = null;

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		try {
			conn = pool.getConnection();

			String sql = "select MEM_ID from member";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				if (rs.getString("MEM_ID").equals(MEM_ID)) {
					return true;
				}
			}
		} catch (Exception ex) {

			ex.printStackTrace();
		}
		return false;
	}

}
