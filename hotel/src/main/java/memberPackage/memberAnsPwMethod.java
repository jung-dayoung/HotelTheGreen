package memberPackage;

import java.sql.*;
import java.util.*;
import memberPackage.*;

public class memberAnsPwMethod {

	private static memberConnectionPool pool;

	public memberAnsPwMethod() {

		try {

			System.out.println("DB 드라이버 로딩 성공!");
			pool = memberConnectionPool.getInstance();

		}

		catch (Exception e) {

			System.out.print("DB 드라이버 로딩 실패!" + e);
			e.printStackTrace();
		}

	}

	public Vector<memberRegisterBean> anspw(String id, String name, String phone) {

		Connection conn = null;

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		Vector<memberRegisterBean> mrlist = new Vector<memberRegisterBean>();

		try

		{

			conn = pool.getConnection();

			String sql = "SELECT * FROM member WHERE mem_id = ? AND mem_name = ? AND mem_phone = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, phone);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				memberRegisterBean MRBean = new memberRegisterBean();

				MRBean.setMEM_ID(rs.getString("MEM_ID"));
				MRBean.setMEM_NAME(rs.getString("MEM_NAME"));
				MRBean.setMEM_PHONE(rs.getString("MEM_PHONE"));
				MRBean.setMEM_PW(rs.getString("MEM_PW"));
				mrlist.addElement(MRBean);
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
		return mrlist;

	}
}
