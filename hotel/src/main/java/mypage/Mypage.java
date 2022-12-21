package mypage;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class Mypage {
	private static connectionPool pool;

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public Mypage() {
		try {
			pool = connectionPool.getInstance(); // DBConnectionMgr 클래스의 pool을 사용해서 드리이버 로딩
		} catch (Exception e) {
			System.out.println("Error : 커넥션 연결 실페");
		}
	}

	// 사용자 아이디 or 이름
	public String userId(int key) {
		String userId = null;

		try {
			con = pool.getConnection();
			String query = "select MEM_ID from MEMBER " + "where MEM_KEY = ?";

			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, key);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				userId = rs.getString("MEM_ID");
			}

		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			pool.freeConnection(con);
		}
		return userId;
	}

	public String userName(String phone, String pwd) {
		String userName = null;
		PreparedStatement pstmtt = null;
		ResultSet rss = null;
		try {
			con = pool.getConnection();
			String query1 = "select RM_RSV_NAME from ROOM_RESERVATION " + "where RM_RSV_PHONE = ? and RM_RSV_PW = ?";

			pstmt = con.prepareStatement(query1);
			pstmt.setString(1, phone);
			pstmt.setString(2, pwd);

			rs = pstmt.executeQuery();

			String query2 = "select DN_RSV_NAME from DINING_RESERVATION " + "where DN_RSV_PHONE = ? and DN_RSV_PW = ?";

			pstmtt = con.prepareStatement(query2);
			pstmtt.setString(1, phone);
			pstmtt.setString(2, pwd);

			rss = pstmtt.executeQuery();

			if (rs.next()) {
				userName = rs.getString("RM_RSV_NAME");
				System.out.println(userName);
			} else if (rss.next()) {
				userName = rss.getString("DN_RSV_NAME");
				System.out.println(userName);
			}

		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			pool.freeConnection(con);
		}
		return userName;
	}

	// 객실 및 다이닝 예약 조회
	public boolean rsvCheckRoom(String phone, String pwd) {

		boolean check = false;

		try {
			con = pool.getConnection();

			String query = "select RM_RSV_USE from ROOM_RESERVATION " + "where RM_RSV_PHONE = ? " + "and RM_RSV_PW = ? "
					+ "order by RM_RSV_USE";

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, phone);
			pstmt.setString(2, pwd);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				check = true;
			}

		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			pool.freeConnection(con);
		}
		return check;
	}

	public boolean rsvCheckDining(String phone, String pwd) {

		boolean check = false;

		try {
			con = pool.getConnection();

			String query = "select DN_RSV_USE from DINING_RESERVATION " + "where DN_RSV_PHONE = ? "
					+ "and DN_RSV_PW = ? " + "order by DN_RSV_USE";

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, phone);
			pstmt.setString(2, pwd);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				check = true;
			}

		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			pool.freeConnection(con);
		}
		return check;
	}

	public Vector<roomReservationBean> show_room_list_nomember(String phone, String pwd, String use) {

		Vector<roomReservationBean> vlist = new Vector<roomReservationBean>();

		try {
			con = pool.getConnection();
			String query = "select * from ROOM_RESERVATION as A " + "join ROOM as B on A.RM_KEY = B.RM_KEY "
					+ "join ROOM_CLASS as C on B.RM_CLS_KEY = C.RM_CLS_KEY " + "where RM_RSV_PHONE = ? "
					+ "and RM_RSV_PW = ? " + "and RM_RSV_USE = ?";

			pstmt = con.prepareStatement(query);

			pstmt.setString(1, phone);
			pstmt.setString(2, pwd);
			pstmt.setString(3, use);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				roomReservationBean rsvBean = new roomReservationBean();

				rsvBean.setRM_RSV_KEY(rs.getInt("RM_RSV_KEY"));
				rsvBean.setRM_RSV_CHK_IN(rs.getDate("RM_RSV_CHK_IN"));
				rsvBean.setRM_RSV_CHK_OUT(rs.getDate("RM_RSV_CHK_OUT"));
				rsvBean.setRM_RSV_USE(rs.getString("RM_RSV_USE"));
				rsvBean.setRM_RSV_NUM(rs.getInt("RM_RSV_NUM"));
				rsvBean.setRM_RSV_ADULT(rs.getInt("RM_RSV_ADULT"));
				rsvBean.setRM_COST(rs.getInt("RM_COST"));
				rsvBean.setRM_CLS(rs.getString("RM_CLS"));
				vlist.addElement(rsvBean);
			}
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			pool.freeConnection(con);
		}
		return vlist;
	}

	public Vector<roomReservationBean> show_room_list_member(int key, String use) {

		Vector<roomReservationBean> vlist = new Vector<roomReservationBean>();

		try {

			con = pool.getConnection();

			String query = "select * from ROOM_RESERVATION as A " + "join ROOM as B on A.RM_KEY = B.RM_KEY  "
					+ "join ROOM_CLASS as C on B.RM_CLS_KEY = C.RM_CLS_KEY " + "where MEM_KEY = ? and RM_RSV_USE = ?";

			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, key);
			pstmt.setString(2, use);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				roomReservationBean rsvBean = new roomReservationBean();

				rsvBean.setRM_RSV_KEY(rs.getInt("RM_RSV_KEY"));
				rsvBean.setRM_RSV_CHK_IN(rs.getDate("RM_RSV_CHK_IN"));
				rsvBean.setRM_RSV_CHK_OUT(rs.getDate("RM_RSV_CHK_OUT"));
				rsvBean.setRM_RSV_NUM(rs.getInt("RM_RSV_NUM"));
				rsvBean.setRM_RSV_ADULT(rs.getInt("RM_RSV_ADULT"));
				rsvBean.setRM_RSV_USE(rs.getString("RM_RSV_USE"));
				rsvBean.setMEM_key(rs.getInt("MEM_KEY"));
				rsvBean.setRM_CLS(rs.getString("RM_CLS"));
				rsvBean.setRM_COST(rs.getInt("RM_COST"));
				vlist.addElement(rsvBean);
			}
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			pool.freeConnection(con);
		}
		return vlist;
	}

	public int cost(Date out, Date in, int num, int rmCost) {
		int cost = 0;

		try {
			con = pool.getConnection();

			String query = "select DATEDIFF(?, ?) as diff";

			pstmt = con.prepareStatement(query);

			pstmt.setDate(1, out);
			pstmt.setDate(2, in);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cost = rs.getInt("diff");
			}

			cost = cost * num * rmCost;

		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			pool.freeConnection(con);
		}
		return cost;
	}

	public Vector<diningReservationBean> show_dining_list_nomember(String phone, String pwd, String use) {

		Vector<diningReservationBean> vlist = new Vector<diningReservationBean>();

		try {

			con = pool.getConnection();

			String query = "select * from DINING_RESERVATION as A " + "join RESTAURANT as B on A.RS_KEY = B.RS_KEY  "
					+ "join MEAL_TIME as C on A.ML_KEY = C.ML_KEY "
					+ "where DN_RSV_PHONE = ? and DN_RSV_PW = ? and DN_RSV_USE = ?";

			pstmt = con.prepareStatement(query);

			pstmt.setString(1, phone);
			pstmt.setString(2, pwd);
			pstmt.setString(3, use);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				diningReservationBean rsvBean = new diningReservationBean();

				rsvBean.setDN_RSV_KEY(rs.getInt("DN_RSV_KEY"));
				rsvBean.setDN_RSV_DATE(rs.getDate("DN_RSV_DATE"));
				rsvBean.setDN_RSV_ADULT(rs.getInt("DN_RSV_ADULT"));
				rsvBean.setDN_RSV_USE(rs.getString("DN_RSV_USE"));
				rsvBean.setRS_NAME(rs.getString("RS_NAME"));
				rsvBean.setML_TIME(rs.getString("ML_TIME"));
				rsvBean.setRS_KEY(rs.getInt("RS_KEY"));
				vlist.addElement(rsvBean);
			}
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			pool.freeConnection(con);
		}
		return vlist;
	}

	public Vector<diningReservationBean> show_dining_list_member(int key, String use) {

		Vector<diningReservationBean> vlist = new Vector<diningReservationBean>();

		try {

			con = pool.getConnection();

			String query = "select * from DINING_RESERVATION as A " + "join RESTAURANT as B on A.RS_KEY = B.RS_KEY  "
					+ "join MEAL_TIME as C on A.ML_KEY = C.ML_KEY " + "where MEM_KEY = ? and DN_RSV_USE = ?";

			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, key);
			pstmt.setString(2, use);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				diningReservationBean rsvBean = new diningReservationBean();

				rsvBean.setDN_RSV_KEY(rs.getInt("DN_RSV_KEY"));
				rsvBean.setDN_RSV_DATE(rs.getDate("DN_RSV_DATE"));
				rsvBean.setDN_RSV_ADULT(rs.getInt("DN_RSV_ADULT"));
				rsvBean.setDN_RSV_USE(rs.getString("DN_RSV_USE"));
				rsvBean.setRS_NAME(rs.getString("RS_NAME"));
				rsvBean.setML_TIME(rs.getString("ML_TIME"));
				rsvBean.setRS_KEY(rs.getInt("RS_KEY"));
				vlist.addElement(rsvBean);
			}
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			pool.freeConnection(con);
		}
		return vlist;
	}

	// 예약 취소 메서드
	public void roomCancel(int key) {

		try {
			con = pool.getConnection();
			String query = "update ROOM_RESERVATION set RM_RSV_USE = '취소' where RM_RSV_KEY = ?";

			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, key);

			int ok = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("Exception" + e);
		} finally {
			pool.freeConnection(con);
		}
	}

	public void diningCancel(int key) {

		try {
			con = pool.getConnection();
			String query = "update DINING_RESERVATION set DN_RSV_USE = '취소' where DN_RSV_KEY = ?";

			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, key);

			int ok = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("Exception" + e);
		} finally {
			pool.freeConnection(con);
		}
	}

	// 리뷰 메서드
	public boolean reviewRoomCheck(int key) {
		boolean check = false;
		try {
			con = pool.getConnection();

			String query = "select * from REVIEW where RM_RSV_KEY = ?";

			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, key);

			rs = pstmt.executeQuery();

			if (rs.next() && rs.getInt(1) > 0) {
				check = false;
			} else {
				check = true;
			}

		} catch (Exception e) {
			System.out.println("Exception" + e);
		} finally {
			pool.freeConnection(con);
		}
		return check;
	}

	public boolean reviewDiningCheck(int key) {
		boolean check = false;
		try {
			con = pool.getConnection();

			String query = "select * from REVIEW where DN_RSV_KEY = ?";

			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, key);

			rs = pstmt.executeQuery();

			if (rs.next() && rs.getInt(1) > 0) {
				check = false;
			} else {
				check = true;
			}

		} catch (Exception e) {
			System.out.println("Exception" + e);
		} finally {
			pool.freeConnection(con);
		}
		return check;
	}

	public void inputRoomReview(int key, int score, String contents) {
		try {
			con = pool.getConnection();

			String query = "insert into REVIEW (RV_CONTENTS, RV_SC_KEY, RM_RSV_KEY) " + "values (?, ?, ?)";

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, contents);
			pstmt.setInt(2, score);
			pstmt.setInt(3, key);

			int ok = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("Exception" + e);
		} finally {
			pool.freeConnection(con);
		}
	}

	public void inputDiningReview(int key, int score, String contents) {
		try {
			con = pool.getConnection();

			String query = "insert into REVIEW (RV_CONTENTS, RV_SC_KEY, DN_RSV_KEY) " + "values (?, ?, ?)";

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, contents);
			pstmt.setInt(2, score);
			pstmt.setInt(3, key);

			int ok = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("Exception" + e);
		} finally {
			pool.freeConnection(con);
		}
	}

	// 포인트 메서드
	public int totalPoint(int key) {
		int total = 0;
		try {
			con = pool.getConnection();

			String query = "select PL_VALUE from POINT_LIST where MEM_KEY = ?";

			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, key);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				total += rs.getInt("PL_VALUE");
			}

		} catch (Exception e) {
			System.out.println("Exception" + e);
		} finally {
			pool.freeConnection(con);
		}
		return total;
	}

	public Vector<pointBean> checkPoint(int key) {
		Vector<pointBean> vlist = new Vector<pointBean>();
		try {
			con = pool.getConnection();
			String query = "select * from POINT_LIST where MEM_KEY = ? order by PL_DATE desc";

			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, key);

			rs = pstmt.executeQuery();
			int total = totalPoint(key);

			while (rs.next()) {
				pointBean pBean = new pointBean();

				pBean.setPL_DATE(rs.getDate("PL_DATE"));
				pBean.setPL_SAVE_USE(rs.getString("PL_SAVE_USE"));
				pBean.setPL_VALUE(rs.getInt("PL_VALUE"));
				pBean.setPL_TOTAL(total);
				vlist.addElement(pBean);

				total -= pBean.getPL_VALUE();
			}

		} catch (Exception e) {
			System.out.println("Exception" + e);
		} finally {
			pool.freeConnection(con);
		}
		return vlist;
	}

	// 내 정보 메서드

	public class myinfoMethod {

		private connectionPool pool = null;

		public myinfoMethod() {

			try {

				pool = connectionPool.getInstance();

			}

			catch (Exception e) {

				System.out.println("Error : 커넥션 연결 실패");
			}
		}

		public Vector<hamBeanInfo> myInfo(int hamkey) {

			Connection conn = null;

			PreparedStatement pstmt = null;

			ResultSet rs = null;

			Vector<hamBeanInfo> hamList = new Vector<hamBeanInfo>();

			try

			{

				conn = pool.getConnection();

				String sql = "select * from MEMBER where MEM_KEY = ?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, hamkey);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					hamBeanInfo hbeanInfo = new hamBeanInfo();

					hbeanInfo.setMEM_NAME(rs.getString("MEM_NAME"));
					hbeanInfo.setMEM_BIRTH(rs.getDate("MEM_BIRTH"));
					hbeanInfo.setMEM_EMAIL(rs.getString("MEM_EMAIL"));
					hbeanInfo.setMEM_PHONE(rs.getString("MEM_PHONE"));
					hamList.addElement(hbeanInfo);

				}

			} catch (Exception ex) {
				System.out.println("Exception" + ex);

			} finally {
				pool.freeConnection(conn);
			}
			return hamList;
		}

		public void myEmailUpdate(int hamkey, String value) {

			Connection conn = null;

			PreparedStatement pstmt = null;

			try

			{

				conn = pool.getConnection();

				String sql = "update member set MEM_EMAIL = ? where MEM_KEY = ?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, value);
				pstmt.setInt(2, hamkey);

				int rs2 = pstmt.executeUpdate();

			} catch (Exception ex) {
				System.out.println("Exception" + ex);

			} finally {
				pool.freeConnection(conn);
			}
		}

		public void myPhoneUpdate(int hamkey, String value) {

			Connection conn = null;

			PreparedStatement pstmt = null;

			try

			{

				conn = pool.getConnection();

				String sql = "update member set MEM_PHONE = ? where MEM_KEY = ?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, value);
				pstmt.setInt(2, hamkey);

				int rs2 = pstmt.executeUpdate();

			} catch (Exception ex) {
				System.out.println("Exception" + ex);

			} finally {
				pool.freeConnection(conn);
			}
		}

		public void myInfodelete(int hamkey) {

			Connection conn = null;

			PreparedStatement pstmt = null;

			try

			{

				conn = pool.getConnection();

				String sql = "delete from member where = ?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, hamkey);

				int rs3 = pstmt.executeUpdate(sql);

			} catch (Exception ex) {
				System.out.println("Exception" + ex);

			} finally {
				pool.freeConnection(conn);
			}
		}
	}

	// 문의내역 메서드

	public class myCounselMethod {

		private connectionPool pool = null;

		public myCounselMethod() {

			try {

				pool = connectionPool.getInstance();

			}

			catch (Exception e) {

				System.out.println("Error : 커넥션 연결 실패");
			}
		}

		// member테이블에 있는 값이 담긴 메서드
		public Vector<hamBeanCounsel> myCounselCustomer(int hamkey) {

			Connection conn = null;

			PreparedStatement pstmt = null;

			ResultSet rs = null;

			Vector<hamBeanCounsel> hamListCounsel = new Vector<hamBeanCounsel>();

			try

			{

				conn = pool.getConnection();

				String sql = "select * from COUNSEL as A join COUNSEL_CATEGORY as B " + "on A.CC_KEY = B.CC_KEY "
						+ "where A.MEM_KEY = ? " + "order by cs_key desc";

				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, hamkey);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					hamBeanCounsel hbeanCounsel = new hamBeanCounsel();

					hbeanCounsel.setCS_DATE(rs.getDate("CS_DATE"));
					hbeanCounsel.setCS_TITLE(rs.getString("CS_TITLE"));
					hbeanCounsel.setCS_CONTENTS(rs.getString("CS_CONTENTS"));
					hbeanCounsel.setCC_SEC(rs.getString("CC_SEC"));
					hbeanCounsel.setAD_ANSWER(rs.getString("AD_ANSWER"));
					hamListCounsel.addElement(hbeanCounsel);

				}

			} catch (Exception ex) {
				System.out.println("Exception" + ex);

			} finally {
				pool.freeConnection(conn);
			}
			return hamListCounsel;
		}
	}
}
