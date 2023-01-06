package sales_manage;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;
import java.util.Vector;

public class sales_function {
  private static DBConnectionMgr pool;

  Connection con = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  public sales_function() {
    try{
      pool = DBConnectionMgr.getInstance(); //DBConnectionMgr 클래스의 pool을 사용해서 드리이버 로딩
    } catch(Exception e) {
      System.out.println("Error : 커넥션 연결 실페");
    }
  }

  public void insertExpendse(String date, String sec, String content, int value) {

    int ok = 0;
    try {

      con = pool.getConnection();

      String query ="insert into " +
          "`EXPENDSE` (`EP_DATE`, `EP_SEC`, `EP_CONTENT`, `EP_VALUE`) " +
          "values(?, ?, ?, ?)";

      pstmt = con.prepareStatement(query);
      pstmt.setString(1, date);
      pstmt.setString(2, sec);
      pstmt.setString(3, content);
      pstmt.setInt(4, value);

      ok = pstmt.executeUpdate();

    } catch(Exception e) {
      System.out.println("Error :" + e);
    } finally {
      pool.freeConnection(con);
    }
  }

  public Vector<expendse_bean> epListDesc(String startDate, String endDate) {
    Vector<expendse_bean> list = new Vector<expendse_bean>();

    try {

      con = pool.getConnection();

      String query = "select * from EXPENDSE " +
          "where EP_DATE >= ? and EP_DATE <= ?" +
          "order by EP_DATE desc, EP_KEY desc";

      pstmt = con.prepareStatement(query);
      pstmt.setString(1, startDate);
      pstmt.setString(2, endDate);

      rs = pstmt.executeQuery();

      while (rs.next()) {
        expendse_bean bean = new expendse_bean();

        bean.setEP_KEY(rs.getInt("EP_KEY"));
        bean.setEP_DATE(rs.getString("EP_DATE"));
        bean.setEP_SEC(rs.getString("EP_SEC"));
        bean.setEP_CONTENT(rs.getString("EP_CONTENT"));
        bean.setEP_VALUE(rs.getInt("EP_VALUE"));
        list.addElement(bean);
      }

    } catch(Exception e) {
      System.out.println("Error :" + e);
    } finally {
      pool.freeConnection(con);
    }
    return list;
  }

  public Vector<expendse_bean> epListAsc(String startDate, String endDate) {
    Vector<expendse_bean> list = new Vector<expendse_bean>();

    try {

      con = pool.getConnection();

      String query = "select * from EXPENDSE " +
          "where EP_DATE >= ? and EP_DATE <= ?" +
          "order by EP_DATE asc, EP_KEY asc";

      pstmt = con.prepareStatement(query);
      pstmt.setString(1, startDate);
      pstmt.setString(2, endDate);

      rs = pstmt.executeQuery();

      while (rs.next()) {
        expendse_bean bean = new expendse_bean();

        bean.setEP_KEY(rs.getInt("EP_KEY"));
        bean.setEP_DATE(rs.getString("EP_DATE"));
        bean.setEP_SEC(rs.getString("EP_SEC"));
        bean.setEP_CONTENT(rs.getString("EP_CONTENT"));
        bean.setEP_VALUE(rs.getInt("EP_VALUE"));
        list.addElement(bean);
      }

    } catch(Exception e) {
      System.out.println("Error :" + e);
    } finally {
      pool.freeConnection(con);
    }
    return list;
  }


  public Vector<expendse_bean> epListSecDesc(String startDate, String endDate, String sec) {
    Vector<expendse_bean> list = new Vector<expendse_bean>();

    try {

      con = pool.getConnection();

      String query = "select * from EXPENDSE " +
          "where EP_DATE >= ? and EP_DATE <= ? " +
          "and EP_SEC like ?" +
          "order by EP_DATE desc, EP_KEY desc";

      pstmt = con.prepareStatement(query);
      pstmt.setString(1, startDate);
      pstmt.setString(2, endDate);
      pstmt.setString(3, "%" + sec + "%");

      rs = pstmt.executeQuery();

      while (rs.next()) {
        expendse_bean bean = new expendse_bean();

        bean.setEP_KEY(rs.getInt("EP_KEY"));
        bean.setEP_DATE(rs.getString("EP_DATE"));
        bean.setEP_SEC(rs.getString("EP_SEC"));
        bean.setEP_CONTENT(rs.getString("EP_CONTENT"));
        bean.setEP_VALUE(rs.getInt("EP_VALUE"));
        list.addElement(bean);
      }

    } catch(Exception e) {
      System.out.println("Error :" + e);
    } finally {
      pool.freeConnection(con);
    }
    return list;
  }
  public Vector<expendse_bean> epListSecAsc(String startDate, String endDate, String sec) {
    Vector<expendse_bean> list = new Vector<expendse_bean>();

    try {

      con = pool.getConnection();

      String query = "select * from EXPENDSE " +
          "where EP_DATE >= ? and EP_DATE <= ? " +
          "and EP_SEC like ?" +
          "order by EP_DATE asc, EP_KEY asc";

      pstmt = con.prepareStatement(query);
      pstmt.setString(1, startDate);
      pstmt.setString(2, endDate);
      pstmt.setString(3, "%" + sec + "%");

      rs = pstmt.executeQuery();

      while (rs.next()) {
        expendse_bean bean = new expendse_bean();

        bean.setEP_KEY(rs.getInt("EP_KEY"));
        bean.setEP_DATE(rs.getString("EP_DATE"));
        bean.setEP_SEC(rs.getString("EP_SEC"));
        bean.setEP_CONTENT(rs.getString("EP_CONTENT"));
        bean.setEP_VALUE(rs.getInt("EP_VALUE"));
        list.addElement(bean);
      }

    } catch(Exception e) {
      System.out.println("Error :" + e);
    } finally {
      pool.freeConnection(con);
    }
    return list;
  }


  public void updateExpendse(String date, String sec, String content, int value, int key) {

    int ok = 0;
    try {

      con = pool.getConnection();

      String query ="update `EXPENDSE` set `EP_DATE` = ? , `EP_SEC` = ? , `EP_CONTENT` = ? , `EP_VALUE` = ? " +
          "where EP_KEY = ?";

      pstmt = con.prepareStatement(query);
      pstmt.setString(1, date);
      pstmt.setString(2, sec);
      pstmt.setString(3, content);
      pstmt.setInt(4, value);
      pstmt.setInt(5, key);

      ok = pstmt.executeUpdate();

    } catch(Exception e) {
      System.out.println("Error :" + e);
    } finally {
      pool.freeConnection(con);
    }
  }

  public void deleteExpendse(int key) {

    try {
      con = pool.getConnection();
      String query = "delete from `EXPENDSE` where `EP_KEY` = ?";

      pstmt = con.prepareStatement(query);
      pstmt.setInt(1, key);

      int ok = pstmt.executeUpdate();

    } catch(Exception e) {
      System.out.println(e);
    } finally {
      pool.freeConnection(con);
    }
  }

  public int yearTotal() {

    PreparedStatement pstmtt = null;
    ResultSet rss = null;

    int total = 0;
    int point = 0;

    Calendar date = Calendar.getInstance();
    int year1 = date.get(Calendar.YEAR);
    int year2 = year1;
    int day = date.get(Calendar.DATE);
    int month1 = date.get(Calendar.MONTH) + 1;
    int month2 = month1 - 12;

    if (month2 <= 0) {
      month2 = 12 + month2;
      year2 = year2 - 1;
    }

    try {

      con = pool.getConnection();

      String query1 = "select sum(D.RM_COST) as SUM from SALES as A " +
      "join ROOM_RESERVATION as B " +
      "on A.RM_RSV_KEY = B.RM_RSV_KEY " +
      "join ROOM as C " +
      "on B.RM_KEY = C.RM_KEY " +
      "join ROOM_CLASS as D " +
      "on C.RM_CLS_KEY = D.RM_CLS_KEY " +
      "WHERE A.SL_DATE < ? and A.SL_DATE >= ? ";

      pstmt = con.prepareStatement(query1);
      pstmt.setString(1, String.valueOf(year1) + "-" + String.valueOf(month1) + "-" + String.valueOf(day));
      pstmt.setString(2, String.valueOf(year2) + "-" + String.valueOf(month2) + "-" + String.valueOf(day));

      rs = pstmt.executeQuery();

      String query2 = "select sum(PL_VALUE) as USED from POINT_LIST " +
          "where PL_SAVE_USE = '사용' and PL_DATE < ? and PL_DATE >= ?";

      pstmtt = con.prepareStatement(query2);
      pstmtt.setString(1, String.valueOf(year1) + "-" + String.valueOf(month1) + "-" + String.valueOf(day));
      pstmtt.setString(2, String.valueOf(year2) + "-" + String.valueOf(month2) + "-" + String.valueOf(day));

      rss = pstmtt.executeQuery();

      if (rs.next()) {
        total = rs.getInt("SUM");
      }
      if (rss.next()) {
        point = rss.getInt("USED");
      }

      total = total + point;

    } catch (Exception e) {
      System.out.println("Error :" + e);
    } finally {
      pool.freeConnection(con);
    }
    return total;
  }

  public Vector<sales_bean> totalMon() {
    PreparedStatement pstmtt = null;
    ResultSet rss = null;

    Vector<sales_bean> list = new Vector<sales_bean>();

    Calendar date = Calendar.getInstance();
    int year1 = date.get(Calendar.YEAR);
    int year2 = year1;
    int month1 = date.get(Calendar.MONTH) + 1;
    int month2 = month1 + 1;

    if (month2 > 12) {
      month2 = 1;
      year2 += 1;
    }

    try {

      con = pool.getConnection();

      String query1 = "select sum(D.RM_COST) as SUM, count(A.SL_KEY) as RSV from SALES as A " +
          "join ROOM_RESERVATION as B " +
          "on A.RM_RSV_KEY = B.RM_RSV_KEY " +
          "join ROOM as C " +
          "on B.RM_KEY = C.RM_KEY " +
          "join ROOM_CLASS as D " +
          "on C.RM_CLS_KEY = D.RM_CLS_KEY " +
          "WHERE A.SL_DATE >= ? and A.SL_DATE < ? ";


      String query2 = "select sum(PL_VALUE) as USED from POINT_LIST " +
          "where PL_SAVE_USE = '사용' and PL_DATE >= ? and PL_DATE < ?";

      for (int i = 0; i < 6; i ++) {

        sales_bean bean = new sales_bean();
        String date1 = String.valueOf(year1) + "-" + String.valueOf(month1) + "-01";
        String date2 = String.valueOf(year2) + "-" + String.valueOf(month2) + "-01";
        int total = 0;
        int rsv = 0;

        pstmt = con.prepareStatement(query1);
        pstmt.setString(1, date1);

        pstmt.setString(2, date2);
        rs = pstmt.executeQuery();

        pstmtt = con.prepareStatement(query2);
        pstmtt.setString(1, date1);
        pstmtt.setString(2, date2);
        rss = pstmtt.executeQuery();

        if (rs.next()) {
          if (rss.next()) {
            total = rs.getInt("SUM") + rss.getInt("USED");
          }
          rsv = rs.getInt("RSV");
        }
        bean.setSalesEA(total);
        bean.setRsvEA(rsv);
        bean.setMonth(String.valueOf(month1) + " 월");
        list.addElement(bean);

        month1 -= 1;
        month2 -= 1;

        if (month1 == 0) {
          month1 = 12;
          year1 -= 1;
        }
        if (month2 == 0) {
         month2 = 12;
         year2 -= 1;
        }
      }
    } catch (Exception e) {
      System.out.println(e);
    } finally {
      pool.freeConnection(con);
    }
    return list;
  }

  public int totalDuaPri(String start, String end) {

    int total = 0;
    int point = 0;

    PreparedStatement pstmtt = null;
    ResultSet rss = null;

    try {
      con = pool.getConnection();

      String query1 = "select sum(D.RM_COST) as SUM from SALES as A " +
          "join ROOM_RESERVATION as B " +
          "on A.RM_RSV_KEY = B.RM_RSV_KEY " +
          "join ROOM as C " +
          "on B.RM_KEY = C.RM_KEY " +
          "join ROOM_CLASS as D " +
          "on C.RM_CLS_KEY = D.RM_CLS_KEY " +
          "WHERE A.SL_DATE >= ? and A.SL_DATE <= ? ";

      String query2 = "select sum(PL_VALUE) as USED from POINT_LIST " +
          "where PL_SAVE_USE = '사용' and PL_DATE >= ? and PL_DATE <= ?";

      pstmt = con.prepareStatement(query1);
      pstmt.setString(1, start);
      pstmt.setString(2, end);

      rs = pstmt.executeQuery();

      pstmtt = con.prepareStatement(query2);
      pstmtt.setString(1, start);
      pstmtt.setString(2,end);

      rss = pstmtt.executeQuery();

      if (rs.next()) {
        total = rs.getInt("SUM");
        if (rss.next()) {
          point = rss.getInt("USED");
        }
        total += point;
      }

    } catch (Exception e) {
      System.out.println(e);
    } finally {
      pool.freeConnection(con);
    }
    return total;
  }

  public int totalDuaMax(String start, String end) {

    PreparedStatement pstmtt = null;
    ResultSet rss = null;

    int total = 1;
    int cost = 0;

    try {

      con = pool.getConnection();

      String query1 = "select DATEDIFF(?, ?) as diff";

      String query2 = "select sum(RM_COST) as SUM from ROOM_CLASS";

      pstmt = con.prepareStatement(query1);
      pstmt.setString(1, end);
      pstmt.setString(2, start);

      rs = pstmt.executeQuery();

      pstmtt = con.prepareStatement(query2);
      rss = pstmtt.executeQuery();

      if(rs.next()) {
        total += rs.getInt("diff");
        if(rss.next()) {
          cost = rss.getInt("SUM");
        }
        total = total * cost;
      }

    } catch (Exception e) {
      System.out.println(e);
    } finally {
      pool.freeConnection(con);
    }
    return total;
  }

  public int totalDuaRsv(String start, String end) {
    int total = 0;

    try {
      con = pool.getConnection();

      String query = "select count(A.SL_KEY) as RSV from SALES as A " +
          "join ROOM_RESERVATION as B " +
          "on A.RM_RSV_KEY = B.RM_RSV_KEY " +
          "join ROOM as C " +
          "on B.RM_KEY = C.RM_KEY " +
          "join ROOM_CLASS as D " +
          "on C.RM_CLS_KEY = D.RM_CLS_KEY " +
          "WHERE A.SL_DATE >= ? and A.SL_DATE <= ? ";

      pstmt = con.prepareStatement(query);
      pstmt.setString(1, start);
      pstmt.setString(2, end);

      rs = pstmt.executeQuery();

      if (rs.next()) {
        total = rs.getInt("RSV");
      }

    } catch (Exception e) {
      System.out.println(e);
    } finally {
      pool.freeConnection(con);
    }
    return total;
  }

  public int totalDuaRsvMax(String start, String end) {
    PreparedStatement pstmtt = null;
    ResultSet rss = null;

    int total = 1;
    int num = 0;

    try {
      con = pool.getConnection();

      String query1 = "select DATEDIFF(?, ?) as diff";

      String query2 = "select count(RM_CLS_KEY) as NUM from ROOM_CLASS";

      pstmt = con.prepareStatement(query1);
      pstmt.setString(1, end);
      pstmt.setString(2, start);

      rs = pstmt.executeQuery();

      pstmtt = con.prepareStatement(query2);
      rss = pstmtt.executeQuery();

      if (rs.next()) {
        total += rs.getInt("diff");
        if (rss.next()) {
          num = rss.getInt("NUM");
        }
        total = total * num;
      }

    } catch (Exception e) {
      System.out.println(e);
    } finally {
      pool.freeConnection(con);
    }
    return total;
  }

  public int mtPer() {
    PreparedStatement pstmtt = null;
    ResultSet rss = null;

    int per = 0;
    int card = 0;
    int set = 0;

    try {
      con = pool.getConnection();

      String query1 = "select count(SL_KEY) as max from sales";

      String query2 = "select count(SL_KEY) as card from sales where SL_MT_SEC = '카드'";

      pstmt = con.prepareStatement(query1);
      rs = pstmt.executeQuery();

      pstmtt = con.prepareStatement(query2);
      rss = pstmtt.executeQuery();

      if (rs.next()) {
        set = rs.getInt("max");
        if (rss.next()) {
          card = rss.getInt("card");
        }

        per = (int) Math.round((float)card / (float)set * 100);
      }

    } catch (Exception e) {
      System.out.println(e);
    } finally {
      pool.freeConnection(con);
    }
    return per;
  }

  public int rsvSecPri() {
    PreparedStatement pstmtt = null;
    ResultSet rss = null;

    int total = 0;
    int point = 0;

    Calendar date = Calendar.getInstance();
    int year1 = date.get(Calendar.YEAR);
    int year2 = year1;
    int day = date.get(Calendar.DATE);
    int month1 = date.get(Calendar.MONTH) + 1;
    int month2 = month1 - 12;

    if (month2 <= 0) {
      month2 = 12 + month2;
      year2 = year2 - 1;
    }

    try {

      con = pool.getConnection();

      String query1 = "select sum(D.RM_COST) as SUM from SALES as A " +
          "join ROOM_RESERVATION as B " +
          "on A.RM_RSV_KEY = B.RM_RSV_KEY " +
          "join ROOM as C " +
          "on B.RM_KEY = C.RM_KEY " +
          "join ROOM_CLASS as D " +
          "on C.RM_CLS_KEY = D.RM_CLS_KEY " +
          "WHERE A.SL_DATE < ? and A.SL_DATE >= ? and A.SL_RSV_SEC = '예약'";

      pstmt = con.prepareStatement(query1);
      pstmt.setString(1, String.valueOf(year1) + "-" + String.valueOf(month1) + "-" + String.valueOf(day));
      pstmt.setString(2, String.valueOf(year2) + "-" + String.valueOf(month2) + "-" + String.valueOf(day));

      rs = pstmt.executeQuery();

      String query2 = "select sum(B.PL_VALUE) as USED from SALES as A " +
          "join POINT_LIST as B " +
          "on A.PL_KEY = B.PL_KEY " +
          "WHERE A.SL_DATE < ? and A.SL_DATE >= ? and B.PL_SAVE_USE = '사용' and A.SL_RSV_SEC = '예약'";

      pstmtt = con.prepareStatement(query2);
      pstmtt.setString(1, String.valueOf(year1) + "-" + String.valueOf(month1) + "-" + String.valueOf(day));
      pstmtt.setString(2, String.valueOf(year2) + "-" + String.valueOf(month2) + "-" + String.valueOf(day));

      rss = pstmtt.executeQuery();

      if (rs.next()) {
        total = rs.getInt("SUM");
      }
      if (rss.next()) {
        point = rss.getInt("USED");
      }

      total = total + point;


    } catch (Exception e) {
      System.out.println(e);
    } finally {
      pool.freeConnection(con);
    }
    return total;
  }

  public int totalRsv() {
    int total = 0;

    Calendar date = Calendar.getInstance();
    int year1 = date.get(Calendar.YEAR);
    int year2 = year1;
    int day = date.get(Calendar.DATE);
    int month1 = date.get(Calendar.MONTH) + 1;
    int month2 = month1 - 12;

    if (month2 <= 0) {
      month2 = 12 + month2;
      year2 = year2 - 1;
    }


    try {
      con = pool.getConnection();
      String query = "select count(SL_KEY) as NUM from SALES " +
         "where SL_DATE < ? and SL_DATE >= ?";

      pstmt = con.prepareStatement(query);
      pstmt.setString(1, String.valueOf(year1) + "-" + String.valueOf(month1) + "-" + String.valueOf(day));
      pstmt.setString(2, String.valueOf(year2) + "-" + String.valueOf(month2) + "-" + String.valueOf(day));

      rs = pstmt.executeQuery();

      if (rs.next()) {
        total = rs.getInt("NUM");
      }

    } catch (Exception e) {
      System.out.println(e);
    } finally {
      pool.freeConnection(con);
    }
    return total;
  }

  public int rsvSecNum() {
    int total = 0;

    Calendar date = Calendar.getInstance();
    int year1 = date.get(Calendar.YEAR);
    int year2 = year1;
    int day = date.get(Calendar.DATE);
    int month1 = date.get(Calendar.MONTH) + 1;
    int month2 = month1 - 12;

    if (month2 <= 0) {
      month2 = 12 + month2;
      year2 = year2 - 1;
    }


    try {
      con = pool.getConnection();
      String query = "select count(SL_KEY) as NUM from SALES " +
          "where SL_DATE < ? and SL_DATE >= ? and SL_RSV_SEC = '예약'";

      pstmt = con.prepareStatement(query);
      pstmt.setString(1, String.valueOf(year1) + "-" + String.valueOf(month1) + "-" + String.valueOf(day));
      pstmt.setString(2, String.valueOf(year2) + "-" + String.valueOf(month2) + "-" + String.valueOf(day));

      rs = pstmt.executeQuery();

      if (rs.next()) {
        total = rs.getInt("NUM");
      }

    } catch (Exception e) {
      System.out.println(e);
    } finally {
      pool.freeConnection(con);
    }
    return total;
  }

  public int mondiv(int year, int month){

    int total = 0;
    int point = 0;
    int year2 = year;
    int month2 = month + 1;

    if (month2 > 12) {
      month2 = 1;
      year2 += 1;
    }

    PreparedStatement pstmtt = null;
    ResultSet rss = null;

    try {
      con = pool.getConnection();

      String query1 = "select sum(D.RM_COST) as SUM from SALES as A " +
          "join ROOM_RESERVATION as B " +
          "on A.RM_RSV_KEY = B.RM_RSV_KEY " +
          "join ROOM as C " +
          "on B.RM_KEY = C.RM_KEY " +
          "join ROOM_CLASS as D " +
          "on C.RM_CLS_KEY = D.RM_CLS_KEY " +
          "WHERE A.SL_DATE >= ? and A.SL_DATE <= ? ";

      String query2 = "select sum(PL_VALUE) as USED from POINT_LIST " +
          "where PL_SAVE_USE = '사용' and PL_DATE >= ? and PL_DATE <= ?";

      pstmt = con.prepareStatement(query1);
      pstmt.setString(1, String.valueOf(year) + "-" + String.valueOf(month) + "-01");
      pstmt.setString(2, String.valueOf(year2) + "-" + String.valueOf(month2) + "-01");

      rs = pstmt.executeQuery();

      pstmtt = con.prepareStatement(query2);
      pstmtt.setString(1, String.valueOf(year) + "-" + String.valueOf(month) + "-01");
      pstmtt.setString(2, String.valueOf(year2) + "-" + String.valueOf(month2) + "-01");

      rss = pstmtt.executeQuery();

      if (rs.next()) {
        total = rs.getInt("SUM");
        if (rss.next()) {
          point = rss.getInt("USED");
        }
        total += point;
      }

    } catch (Exception e) {
      System.out.println(e);
    } finally {
      pool.freeConnection(con);
    }
    return total;
  }

  public int monExp(int year, int month) {

    int total = 0;

    int year2 = year;
    int month2 = month + 1;

    if (month2 > 12) {
      month2 = 1;
      year2 += 1;
    }

    try {
      con = pool.getConnection();
      String query = "select sum(EP_VALUE) as SUM from EXPENDSE " +
          "WHERE EP_DATE >= ? and EP_DATE < ?";

      pstmt = con.prepareStatement(query);
      pstmt.setString(1, String.valueOf(year) + "-" + String.valueOf(month) + "-01");
      pstmt.setString(2, String.valueOf(year2) + "-" + String.valueOf(month2) + "-01");

      rs = pstmt.executeQuery();

      if (rs.next()) {
        total = rs.getInt("SUM");
      }

    } catch (Exception e) {
      System.out.println(e);
    } finally {
      pool.freeConnection(con);
    }
    return total;
  }

  public int totalExp() {

    int total = 0;

    Calendar date = Calendar.getInstance();
    int year1 = date.get(Calendar.YEAR);
    int year2 = year1 - 1;
    int day = date.get(Calendar.DATE);
    int month1 = date.get(Calendar.MONTH) + 1;

    try {
      con = pool.getConnection();
      String query = "select sum(EP_VALUE) as SUM from EXPENDSE " +
          "where EP_DATE < ? and EP_DATE >= ?";

      pstmt = con.prepareStatement(query);
      pstmt.setString(1, String.valueOf(year1) + "-" + String.valueOf(month1) + "-" + String.valueOf(day));
      pstmt.setString(2, String.valueOf(year2) + "-" + String.valueOf(month1) + "-" + String.valueOf(day));

      rs = pstmt.executeQuery();

      if (rs.next()) {
        total = rs.getInt("SUM");
      }

    } catch (Exception e) {
      System.out.println(e);
    } finally {
      pool.freeConnection(con);
    }
    return total;

  }

  public String managerName(int key) {

    String name = null;

    try {
      con = pool.getConnection();

      String query = "select `MEM_NAME` as NAME from `MEMBER` " +
          "where `MEM_KEY` = ?";

      pstmt = con.prepareStatement(query);
      pstmt.setInt(1, key);

      rs = pstmt.executeQuery();

      if (rs.next()) {
        name = rs.getString("NAME");
      }
    } catch (Exception e) {
      System.out.println(e);
    } finally {
      pool.freeConnection(con);
    }
    return name;
  }

}
