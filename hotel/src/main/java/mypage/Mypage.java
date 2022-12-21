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
    try{
      pool = connectionPool.getInstance(); //DBConnectionMgr 클래스의 pool을 사용해서 드리이버 로딩
    } catch(Exception e) {
      System.out.println("Error : 커넥션 연결 실페");
    }
  }

  //사용자 아이디 or 이름
  public String userId(int key) {
    String userId = null;

    try {
      con = pool.getConnection();
      String query = "select MEM_ID from MEMBER " +
          "where MEM_KEY = ?";

      pstmt = con.prepareStatement(query);
      pstmt.setInt(1, key);

      rs = pstmt.executeQuery();

      if(rs.next()) {
        userId = rs.getString("MEM_ID");
      }


    } catch(Exception ex) {
      System.out.println("Exception" + ex);
    } finally{
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
      String query1 = "select RM_RSV_NAME from ROOM_RESERVATION " +
          "where RM_RSV_PHONE = ? and RM_RSV_PW = ?";

      pstmt = con.prepareStatement(query1);
      pstmt.setString(1, phone);
      pstmt.setString(2, pwd);

      rs = pstmt.executeQuery();

      String query2 = "select DN_RSV_NAME from DINING_RESERVATION " +
          "where DN_RSV_PHONE = ? and DN_RSV_PW = ?";

      pstmtt = con.prepareStatement(query2);
      pstmtt.setString(1, phone);
      pstmtt.setString(2, pwd);

      rss = pstmtt.executeQuery();

      if(rs.next()) {
        userName = rs.getString("RM_RSV_NAME");
        System.out.println(userName);
      } else if (rss.next()) {
        userName = rss.getString("DN_RSV_NAME");
        System.out.println(userName);
      }

    } catch(Exception ex) {
      System.out.println("Exception" + ex);
    } finally{
      pool.freeConnection(con);
    }
    return userName;
  }


  //객실 및 다이닝 예약 조회
  public boolean rsvCheckRoom(String phone, String pwd) {

    boolean check = false;

    try {
      con = pool.getConnection();

      String query = "select RM_RSV_USE from ROOM_RESERVATION " +
          "where RM_RSV_PHONE = ? " +
          "and RM_RSV_PW = ? " +
          "order by RM_RSV_USE";

      pstmt = con.prepareStatement(query);
      pstmt.setString(1, phone);
      pstmt.setString(2, pwd);

      rs = pstmt.executeQuery();

      if (rs.next()) {
        check = true;
      }

    } catch(Exception ex) {
      System.out.println("Exception" + ex);
    } finally{
      pool.freeConnection(con);
    }
    return check;
  }

  public boolean rsvCheckDining(String phone, String pwd) {

    boolean check = false;

    try {
      con = pool.getConnection();

      String query = "select DN_RSV_USE from DINING_RESERVATION " +
          "where DN_RSV_PHONE = ? " +
          "and DN_RSV_PW = ? " +
          "order by DN_RSV_USE";

      pstmt = con.prepareStatement(query);
      pstmt.setString(1, phone);
      pstmt.setString(2, pwd);

      rs = pstmt.executeQuery();

      if (rs.next()) {
        check = true;
      }

    } catch(Exception ex) {
      System.out.println("Exception" + ex);
    } finally{
      pool.freeConnection(con);
    }
    return check;
  }

  public Vector<roomReservationBean> show_room_list_nomember(String phone, String pwd, String use) {

    Vector<roomReservationBean> vlist = new Vector<roomReservationBean>();

    try {
      con = pool.getConnection();
      String query = "select * from ROOM_RESERVATION as A " +
          "join ROOM as B on A.RM_KEY = B.RM_KEY " +
          "join ROOM_CLASS as C on B.RM_CLS_KEY = C.RM_CLS_KEY " +
          "where RM_RSV_PHONE = ? " +
          "and RM_RSV_PW = ? " +
          "and RM_RSV_USE = ?";

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
    } catch(Exception ex) {
      System.out.println("Exception" + ex);
    } finally{
      pool.freeConnection(con);
    }
    return vlist;
  }

  public Vector<roomReservationBean> show_room_list_member(int key, String use) {

    Vector<roomReservationBean> vlist = new Vector<roomReservationBean>();

    try {

      con = pool.getConnection();

      String query = "select * from ROOM_RESERVATION as A " +
          "join ROOM as B on A.RM_KEY = B.RM_KEY  " +
          "join ROOM_CLASS as C on B.RM_CLS_KEY = C.RM_CLS_KEY " +
          "where MEM_KEY = ? and RM_RSV_USE = ?";

      pstmt = con.prepareStatement(query);

      pstmt.setInt(1, key);
      pstmt.setString(2, use);

      rs = pstmt.executeQuery();

      while(rs.next()) {

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
    } catch(Exception ex) {
      System.out.println("Exception" + ex);
    } finally{
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



    } catch(Exception ex) {
      System.out.println("Exception" + ex);
    } finally{
      pool.freeConnection(con);
    }
    return cost;
  }

  public Vector<diningReservationBean> show_dining_list_nomember(String phone, String pwd, String use) {

    Vector<diningReservationBean> vlist = new Vector<diningReservationBean>();

    try {

      con = pool.getConnection();

      String query = "select * from DINING_RESERVATION as A " +
          "join RESTAURANT as B on A.RS_KEY = B.RS_KEY  " +
          "join MEAL_TIME as C on A.ML_KEY = C.ML_KEY " +
          "where DN_RSV_PHONE = ? and DN_RSV_PW = ? and DN_RSV_USE = ?";

      pstmt = con.prepareStatement(query);

      pstmt.setString(1, phone);
      pstmt.setString(2, pwd);
      pstmt.setString(3, use);

      rs = pstmt.executeQuery();

      while(rs.next()) {

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
    } catch(Exception ex) {
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

      String query = "select * from DINING_RESERVATION as A " +
          "join RESTAURANT as B on A.RS_KEY = B.RS_KEY  " +
          "join MEAL_TIME as C on A.ML_KEY = C.ML_KEY " +
          "where MEM_KEY = ? and DN_RSV_USE = ?";

      pstmt = con.prepareStatement(query);

      pstmt.setInt(1, key);
      pstmt.setString(2, use);

      rs = pstmt.executeQuery();

      while(rs.next()) {

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
    } catch(Exception ex) {
      System.out.println("Exception" + ex);
    } finally {
      pool.freeConnection(con);
    }
    return vlist;
  }


  //예약 취소 메서드
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


  //리뷰 메서드
  public boolean reviewRoomCheck(int key) {
    boolean check = false;
    try {
      con = pool.getConnection();

      String query = "select * from REVIEW where RM_RSV_KEY = ?";

      pstmt = con.prepareStatement(query);
      pstmt.setInt(1, key);

      rs = pstmt.executeQuery();

      if (rs.next() && rs.getInt(1)>0) {
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

      if (rs.next() && rs.getInt(1)>0) {
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

      String query = "insert into REVIEW (RV_CONTENTS, RV_SC_KEY, RM_RSV_KEY) " +
          "values (?, ?, ?)";

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

      String query = "insert into REVIEW (RV_CONTENTS, RV_SC_KEY, DN_RSV_KEY) " +
          "values (?, ?, ?)";

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


  //포인트 메서드
  public int totalPoint(int key) {
    int total = 0;
    try {
      con = pool.getConnection();

      String query = "select PL_VALUE from POINT_LIST where MEM_KEY = ?";

      pstmt = con.prepareStatement(query);
      pstmt.setInt(1, key);

      rs = pstmt.executeQuery();

      while(rs.next()) {
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
}
