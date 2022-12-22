package reservation;

import reservation.DBConnectionMgr;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class room {
  private static DBConnectionMgr pool;
  Connection con = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  public room() {
    try{
      pool = DBConnectionMgr.getInstance(); //DBConnectionMgr 클래스의 pool을 사용해서 드리이버 로딩
    } catch(Exception e) {
      System.out.println("Error : 커넥션 연결 실페");
    }
  }

  //리뷰내역
  public Vector<reviewBean> desplayReview(String rmClass) {

    Vector<reviewBean> reviewList = new Vector<reviewBean>();

    try {

      con = pool.getConnection();

      String query = "select * from ROOM_REVIEW as A " +
          "join ROOM_RESERVATION as B " +
          "on A.RM_RSV_KEY = B.RM_RSV_KEY " +
          "join ROOM as C " +
          "on B.RM_KEY = C.RM_KEY " +
          "join ROOM_CLASS as D " +
          "on C.RM_CLS_KEY = D.RM_CLS_KEY " +
          "WHERE D.RM_CLS = ?";
      

      pstmt = con.prepareStatement(query);

      pstmt.setString(1, rmClass);

      rs = pstmt.executeQuery();
      

      while(rs.next()) {
        reviewBean rvBean = new reviewBean();

        rvBean.setRV_SCORE(rs.getInt("RV_SC_KEY"));
        rvBean.setRV_CONTENTS(rs.getString("RV_CONTENTS"));
        reviewList.addElement(rvBean);

      }

    }catch(Exception ex) {
      System.out.println("Exception" + ex);
    }finally{
      pool.freeConnection(con);
    }
    return reviewList;

  }

  
  //리뷰평점
  public int reviewAVG(String rmClass) {


    int avg = 0;
    try {

      con = pool.getConnection();

      String query = "select A.RV_SC_KEY from ROOM_REVIEW as A " +
          "join ROOM_RESERVATION as B " +
          "on A.RM_RSV_KEY = B.RM_RSV_KEY " +
          "join ROOM as C " +
          "on B.RM_KEY = C.RM_KEY " +
          "join ROOM_CLASS as D " +
          "on C.RM_CLS_KEY = D.RM_CLS_KEY " +
          "where D.RM_CLS = ?";

      pstmt = con.prepareStatement(query);

      pstmt.setString(1, rmClass);

      rs = pstmt.executeQuery();

      int div = 0;
      while (rs.next()) {
        avg += rs.getInt("RV_SC_KEY");
        div++;
      }
      

      avg = avg / div;

    } catch (Exception ex) {
      System.out.println("Exception" + ex);
    } finally {
      pool.freeConnection(con);
    }
    return avg;
  }
  
  //객실금액계산(숫자에따른) 체크아웃- 체크인 * 객실 수 * 금액
  public int cost(String out, String in, int num, String rmClass) {
	  int cost = 0;
	  int cost2 = 0;
	  
	  PreparedStatement pstmtt = null;
	  ResultSet rss = null;


	  try {
	    con = pool.getConnection();

	    String query = "select DATEDIFF(?, ?) as diff";
	    String query2 = "select RM_COST from ROOM_CLASS " +
	    		"where RM_CLS = ?";

	    pstmt = con.prepareStatement(query);

	    pstmt.setString(1, out);
	    pstmt.setString(2, in);
	    
	    rs = pstmt.executeQuery();
	    
	    pstmtt = con.prepareStatement(query2);
	    
	    pstmtt.setString(1, rmClass);
	    
	    rss = pstmtt.executeQuery();

	    if (rs.next()) {
	      cost = rs.getInt("diff");
	    }
	    
	    if (rss.next()) {
	    	cost2 = rss.getInt("RM_COST");
	    }

	    cost = cost * num * cost2;



	  } catch(Exception ex) {
	    System.out.println("Exception" + ex);
	  } finally{
	    pool.freeConnection(con);
	  }
	  return cost;
	}
  
  //잔여 객실 확인
  public boolean roomSpareCheck(String in, String out, String rmClass, int rmNum) {

	  boolean check = false;

	  try {
	    con = pool.getConnection();

	    String query = "select count(A.RM_KEY) as COUNT, B.RM_CLS from ROOM as A " +
	        "join ROOM_CLASS as B " +
	        "on A.RM_CLS_KEY = B.RM_CLS_KEY " +
	        "where not A.RM_KEY = any(" +
	          "select A.RM_KEY from ROOM_RESERVATION as A " +
	          "join ROOM as B on A.RM_KEY = B.RM_KEY " +
	          "join ROOM_CLASS as C on B.RM_CLS_KEY = C.RM_CLS_KEY " +
	          "where A.RM_RSV_CHK_IN >= ? and A.RM_RSV_CHK_OUT <= ? and RM_CLS = ? and A.RM_RSV_USE = '이용 예정' " +
	        ") and B.RM_CLS = ? " +
	        "group by B.RM_CLS";


	    pstmt = con.prepareStatement(query);
	    pstmt.setString(1, in);
	    pstmt.setString(2, out);
	    pstmt.setString(3, rmClass);
	    pstmt.setString(4, rmClass);
	    rs = pstmt.executeQuery();

	    if (rs.next()) {
	      if (rs.getInt("COUNT") > rmNum) {
	        check = true;
	      }
	    }

	  } catch (Exception ex) {
	    System.out.println("Exception" + ex);
	  } finally {
	    pool.freeConnection(con);
	  }
	  return check;
	}
  
  //객실 키 배정
  public int roomSelect(String in, String out, String rmClass) {
	  int rm_key = 0;
	  try {
	    con = pool.getConnection();

	    String query = "select A.RM_KEY, B.RM_CLS from ROOM as A " +
	      "join ROOM_CLASS as B " +
	      "on A.RM_CLS_KEY = B.RM_CLS_KEY " +
	      "where not A.RM_KEY = any( " +
	          "select A.RM_KEY from ROOM_RESERVATION as A " +
	          "join ROOM as B on A.RM_KEY = B.RM_KEY " +
	          "join ROOM_CLASS as C on B.RM_CLS_KEY = C.RM_CLS_KEY " +
	          "where A.RM_RSV_CHK_IN >= ? and A.RM_RSV_CHK_OUT <= ? and RM_CLS = ? and A.RM_RSV_USE = '이용 예정' " +
	      ") and B.RM_CLS = ?";

	    pstmt = con.prepareStatement(query);
	    pstmt.setString(1, in);
	    pstmt.setString(2, out);
	    pstmt.setString(3, rmClass);
	    pstmt.setString(4, rmClass);

	    rs = pstmt.executeQuery();

	    if (rs.next()) {
	      rm_key = rs.getInt("RM_KEY");
	    }


	  } catch (Exception ex) {
	    System.out.println("Exception" + ex);
	  } finally {
	    pool.freeConnection(con);
	  }
	  return rm_key;
	}
  //비회원 인서트 메소드
  public void RSV_info_insert_nomember(String chk_in, String chk_out, int num, int adult, String name, String phone, String email, String pw, String use, String content, String rsv_pri, int rm_key, int uc_key) {

	  try {
	    con = pool.getConnection();

	    String query = "INSERT INTO `ROOM_RESERVATION` " +
	        "(`RM_RSV_CHK_IN`, `RM_RSV_CHK_OUT`, `RM_RSV_NUM`, `RM_RSV_ADULT`, `RM_RSV_NAME`, " +
	        "`RM_RSV_PHONE`, `RM_RSV_EMAIL`, `RM_RSV_PW`, `RM_RSV_USE`, `RM_RSV_CONTENT`, `RM_RSV_PRI`, `RM_KEY`, `AD_UC_KEY`) " +
	        "VALUES (?, ?, ?, ?, ?, ?, " +
	        "?, ?, ?, ?, ?, ?, ?)";

	    pstmt = con.prepareStatement(query);
	    pstmt.setString(1, chk_in);
	    pstmt.setString(2, chk_out);
	    pstmt.setInt(3, num);
	    pstmt.setInt(4, adult);
	    pstmt.setString(5, name);
	    pstmt.setString(6, phone);
	    pstmt.setString(7, email);
	    pstmt.setString(8, pw);
	    pstmt.setString(9, use);
	    pstmt.setString(10, content);
	    pstmt.setString(11, rsv_pri);
	    pstmt.setInt(12, rm_key);
	    pstmt.setInt(13, uc_key);

	    int ok = pstmt.executeUpdate();

	    System.out.println(query);

	  } catch (Exception ex) {
	    System.out.println("Exception" + ex);
	  } finally {
	    pool.freeConnection(con);
	  }
	}
  
  //회원 인서트 메서드
  public void RSV_info_insert_member(String chk_in, String chk_out, int num, int adult, String name, String phone, String email, String use, String content, String rsv_pri, int rm_key, int mem_key, int uc_key) {

	  try {
	    con = pool.getConnection();

	    String query = "INSERT INTO `ROOM_RESERVATION` " +
	        "(`RM_RSV_CHK_IN`, `RM_RSV_CHK_OUT`, `RM_RSV_NUM`, `RM_RSV_ADULT`, `RM_RSV_NAME`, " +
	        "`RM_RSV_PHONE`, `RM_RSV_EMAIL`, `RM_RSV_USE`, `RM_RSV_CONTENT`, `RM_RSV_PRI`, `RM_KEY`, `MEM_KEY`, `AD_UC_KEY`) " +
	        "VALUES (?, ?, ?, ?, ?, ?, " +
	        "?, ?, ?, ?, ?, ?, ?)";

	    pstmt = con.prepareStatement(query);
	    pstmt.setString(1, chk_in);
	    pstmt.setString(2, chk_out);
	    pstmt.setInt(3, num);
	    pstmt.setInt(4, adult);
	    pstmt.setString(5, name);
	    pstmt.setString(6, phone);
	    pstmt.setString(7, email);
	    pstmt.setString(8, use);
	    pstmt.setString(9, content);
	    pstmt.setString(10, rsv_pri);
	    pstmt.setInt(11, rm_key);
	    pstmt.setInt(12, mem_key);
	    pstmt.setInt(13, uc_key);

	    int ok = pstmt.executeUpdate();

	  } catch (Exception ex) {
	    System.out.println("Exception" + ex);
	  } finally {
	    pool.freeConnection(con);
	  }
	}
  
  //세션에 값이 있을 시 예약정보 자동 생성
  public String mem_name(int key) {
	  String name = null;
	  
	  try {
		  
		  con = pool.getConnection();
		  
		  String query = "select MEM_NAME from MEMBER " +
		  "where MEM_KEY = ?";
		  
		  pstmt = con.prepareStatement(query);
		  pstmt.setInt(1, key);
		  
		  rs = pstmt.executeQuery();
		  
		  if (rs.next()) {
			  name = rs.getString("MEM_NAME");
		  } else {
			  name = "";
		  }
		  
		  
		  
	  } catch (Exception ex) {
		    System.out.println("Exception" + ex);
		  } finally {
		    pool.freeConnection(con);
		  }
	return name;	  
  }
  
  //세션에 값이 있을 시 예약정보 자동 생성

  public String mem_mail(int key) {
	  String mail = null;
	  
	  try {
		  
		  con = pool.getConnection();
		  
		  String query = "select MEM_MAIL from MEMBER " +
		  "where MEM_KEY = ?";
		  
		  pstmt = con.prepareStatement(query);
		  pstmt.setInt(1, key);
		  
		  rs = pstmt.executeQuery();
		  
		  if (rs.next()) {
			  mail = rs.getString("MEM_MAIL");
		  } else {
			  mail = "";
		  }
		  
		  
		  
	  } catch (Exception ex) {
		    System.out.println("Exception" + ex);
		  } finally {
		    pool.freeConnection(con);
		  }
	return mail;	  
  }
  
  //세션에 값이 있을 시 예약정보 자동 생성

  public String mem_phone(int key) {
	  String phone = null;
	  
	  try {
		  
		  con = pool.getConnection();
		  
		  String query = "select MEM_PHONE from MEMBER " +
		  "where MEM_KEY = ?";
		  
		  pstmt = con.prepareStatement(query);
		  pstmt.setInt(1, key);
		  
		  rs = pstmt.executeQuery();
		  
		  if (rs.next()) {
			  phone = rs.getString("MEM_PHONE");
		  } else {
			  phone = "";
		  }
		  
		  
		  
	  } catch (Exception ex) {
		    System.out.println("Exception" + ex);
		  } finally {
		    pool.freeConnection(con);
		  }
	return phone;	  
  }
  
}
