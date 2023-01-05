package dining_manage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import dining.DBConnectionMgr;

public class manageDiningDao {
	
	
		   ResultSet rs = null; 
		   Connection con = null;
		   PreparedStatement pstmt = null;
		   String sql = null;

		   public static DBConnectionMgr pool;
		   
			public void getcon(){
				 try{
					pool = DBConnectionMgr.getInstance(); 
					con = pool.getConnection();				 
				   		
				 }catch(Exception e){
				    e.printStackTrace();
				 }
				 

			}
	public Vector<manageDiningBean> getBoardList(String keyWord, String firstDate, String secDate ) {

		getcon();


		Vector<manageDiningBean> vlist = new Vector<manageDiningBean>();
		System.out.println("메서드"+ firstDate);
		System.out.println(secDate);

		try {
			con = pool.getConnection();
			// db 연결 후 검색을 위한 keyWord 변수가 null , 혹은 빈 값 이라면 아래의 쿼리문을 실행.
			if (keyWord.equals("null") || keyWord.equals("")){
				
				if(firstDate.equals("null") || firstDate.equals("") || secDate.equals("null") || secDate.equals("")){
				sql = "SELECT A.DN_RSV_DATE, B.ML_TIME, A.DN_RSV_NAME, A.DN_RSV_PHONE, A.DN_RSV_ADULT, C.RS_NAME FROM dining_reservation AS A"
						+ " JOIN meal AS B"
						+ " ON A.ML_KEY = B.ML_KEY"
						+ " JOIN restaurant AS C "
						+ "ON A.RS_KEY = C.RS_KEY order by DN_RSV_DATE desc";
				pstmt = con.prepareStatement(sql);
				System.out.println("1실행");
				}
				
				else {
					
					sql = "SELECT A.DN_RSV_DATE, B.ML_TIME, A.DN_RSV_NAME, A.DN_RSV_PHONE, A.DN_RSV_ADULT, C.RS_NAME FROM dining_reservation AS A\r\n"
							+ "JOIN meal AS B\r\n"
							+ "ON A.ML_KEY = B.ML_KEY\r\n"
							+ "JOIN restaurant AS C \r\n"
							+ "ON A.RS_KEY = C.RS_KEY WHERE A.DN_RSV_DATE BETWEEN ? AND ? order by DN_RSV_DATE DESC";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, firstDate);
					pstmt.setString(2, secDate);
					System.out.println("2실행");
				}

			}
			
			
			else if (keyWord != null || keyWord != "") {
				
				
				
								
				if(firstDate != null || firstDate != "" || secDate != null || secDate != "") {
					

					sql = "SELECT A.DN_RSV_DATE, B.ML_TIME, A.DN_RSV_NAME, A.DN_RSV_PHONE, A.DN_RSV_ADULT, C.RS_NAME FROM dining_reservation AS A"
							+ " JOIN meal AS B"
							+ " ON A.ML_KEY = B.ML_KEY"
							+ " JOIN restaurant AS C "
							+ "ON A.RS_KEY = C.RS_KEY WHERE A.DN_RSV_NAME = ? AND A.DN_RSV_DATE BETWEEN ? AND ? order by DN_RSV_DATE DESC";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, keyWord);
					pstmt.setString(2, firstDate);
					pstmt.setString(3, secDate);	
					System.out.println("3실행");
					
				}
				
				sql = "SELECT A.DN_RSV_DATE, B.ML_TIME, A.DN_RSV_NAME, A.DN_RSV_PHONE, A.DN_RSV_ADULT, C.RS_NAME FROM dining_reservation AS A"
						+ " JOIN meal AS B"
						+ " ON A.ML_KEY = B.ML_KEY"
						+ " JOIN restaurant AS C "
						+ "ON A.RS_KEY = C.RS_KEY WHERE A.DN_RSV_NAME = ? order by DN_RSV_DATE DESC";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, keyWord);
				System.out.println(firstDate);
				System.out.println(secDate);
				System.out.println("4실행");


			}
			

			rs = pstmt.executeQuery();

			while (rs.next()) {

				manageDiningBean bean = new manageDiningBean();
				bean.setDN_RSV_DATE(rs.getDate(1).toString());
				bean.setRestaurantTime(rs.getString(2));
				bean.setDN_RSV_NAME(rs.getString(3));
				bean.setDN_RSV_PHONE(rs.getString(4));
				bean.setDN_RSV_ADULT(rs.getInt(5));
				bean.setRestaurantName(rs.getString(6));

	
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	
	public Vector<manageDiningBean> getReservCount() {

		getcon();


		Vector<manageDiningBean> vlist = new Vector<manageDiningBean>();

		try {
			con = pool.getConnection();
			// db 연결 후 검색을 위한 keyWord 변수가 null , 혹은 빈 값 이라면 아래의 쿼리문을 실행.
	
				sql = "SELECT COUNT(case when ml_key=1 then 1 END), COUNT(case when ml_key=2 then 1 END), "
						+ "COUNT(case when ml_key=3 then 1 END) FROM dining_reservation "
						+ "where dn_rsv_date BETWEEN NOW() - INTERVAL 1 MONTH AND NOW()";

				pstmt = con.prepareStatement(sql);

				rs = pstmt.executeQuery();

			while (rs.next()) {

				manageDiningBean bean = new manageDiningBean();
				bean.setBreakfast(rs.getInt(1));
				bean.setLunch(rs.getInt(2));
				bean.setDinner(rs.getInt(3));

				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	
	public Vector<manageDiningBean> getCountRestaurant() {

		getcon();


		Vector<manageDiningBean> vlist = new Vector<manageDiningBean>();

		try {
			con = pool.getConnection();
			// db 연결 후 검색을 위한 keyWord 변수가 null , 혹은 빈 값 이라면 아래의 쿼리문을 실행.
	
				sql = "SELECT COUNT(case when rs_key=1 then 1 END), COUNT(case when rs_key=2 then 1 END),"
						+ " COUNT(case when rs_key=3 then 1 END), COUNT(case when rs_key=4 then 1 END), COUNT(case when rs_key=5 then 1 END), COUNT(case when rs_key=6 then 1 END),"
						+ " COUNT(case when rs_key=7 then 1 END) FROM dining_reservation where dn_rsv_date BETWEEN NOW() - INTERVAL 1 MONTH AND NOW()";

				pstmt = con.prepareStatement(sql);

				rs = pstmt.executeQuery();

			while (rs.next()) {

				manageDiningBean bean = new manageDiningBean();
				bean.setChinese(rs.getInt(1));
				bean.setItylian(rs.getInt(2));
				bean.setJapanese(rs.getInt(3));
				bean.setKorean(rs.getInt(4));
				bean.setMexican(rs.getInt(5));
				bean.setThai(rs.getInt(6));
				bean.setSeafood(rs.getInt(7));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	
	public Vector<manageDiningBean> getCountThreeMonth(String nowMonth, String beforeMonth) {

		getcon();


		Vector<manageDiningBean> vlist = new Vector<manageDiningBean>();
		
		
		try {
			con = pool.getConnection();
			// db 연결 후 검색을 위한 keyWord 변수가 null , 혹은 빈 값 이라면 아래의 쿼리문을 실행.
	
				sql = "SELECT COUNT(case when ml_key=1 then 1 END), COUNT(case when ml_key=2 then 1 END), COUNT(case when ml_key=3 then 1 END),\r\n"
						+ " CONCAT(YEAR(dn_rsv_date), '-', MONTH(dn_rsv_date)) as ym FROM dining_reservation "
						+ "WHERE dn_rsv_date BETWEEN ? AND ?"
						+ " group BY ym ORDER BY MONTH(dn_rsv_date) desc;";

				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, beforeMonth);
				pstmt.setString(2, nowMonth);
				System.out.println(nowMonth);
				System.out.println(beforeMonth);
				
				rs = pstmt.executeQuery();

			while (rs.next()) {

				manageDiningBean bean = new manageDiningBean();
				bean.setCountBreakfast(rs.getString(1));
				bean.setCountLunch(rs.getString(2));
				bean.setCountDinner(rs.getString(3));
				bean.setCountMonth(rs.getString(4));


				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
}
