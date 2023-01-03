package member_manage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class member_function {
	
	  private static DBConnectionMgr pool;

	  Connection con = null;
	  PreparedStatement pstmt = null;
	  ResultSet rs = null;

	  public member_function() {
	    try{
	      pool = DBConnectionMgr.getInstance(); //DBConnectionMgr 클래스의 pool을 사용해서 드리이버 로딩
	    } catch(Exception e) {
	      System.out.println("Error : 커넥션 연결 실페");
	    }
	  }
	  
	  public Vector<member_bean> member_list(String mem_key, String mem_name, String mem_id, String mem_phone, String mem_mail, String ad_uc_key) {
		    Vector<member_bean> list = new Vector<member_bean>();

		    try {
		      con = pool.getConnection();
		      String query = "select * from member " +
		          "where MEM_KEY like ? and MEM_NAME like ? " +
		          "and MEM_ID like ? and MEM_PHONE like ? " +
		          "and MEM_MAIL like ? and AD_UC_KEY like ?";

		      pstmt = con.prepareStatement(query);
		      pstmt.setString(1, "%" + mem_key + "%");
		      pstmt.setString(2, "%" + mem_name + "%");
		      pstmt.setString(3, "%" + mem_id + "%");
		      pstmt.setString(4, "%" + mem_phone + "%");
		      pstmt.setString(5, "%" + mem_mail + "%");
		      pstmt.setString(6, "%" + ad_uc_key + "%");

		      rs = pstmt.executeQuery();
		      while (rs.next()) {
		        member_bean bean = new member_bean();

		        bean.setMEM_KEY(rs.getInt("MEM_KEY"));
		        bean.setMEM_ID(rs.getString("MEM_ID"));
		        bean.setMEM_PW(rs.getString("MEM_PW"));
		        bean.setMEM_NAME(rs.getString("MEM_NAME"));
		        bean.setMEM_PHONE(rs.getString("MEM_PHONE"));
		        bean.setMEM_MAIL(rs.getString("MEM_MAIL"));
		        bean.setMEM_BIRTH(rs.getString("MEM_BIRTH"));
		        bean.setMEM_SPECIFIC(rs.getString("MEM_SPECIFIC"));
		        bean.setAD_UC_KEY(rs.getInt("AD_UC_KEY"));
		        list.addElement(bean);

		      }
		    } catch(Exception ex) {
		      System.out.println("Exception" + ex);
		    } finally{
		      pool.freeConnection(con);
		    }
		    return list;
		  }

		  public Vector<member_bean> show_rm_list(int key) {
		    PreparedStatement pstmtt = null;
		    ResultSet rss = null;
		    String pri = "";

		    Vector<member_bean> list = new Vector<member_bean>();

		    try {
		      con = pool.getConnection();

		      String query1 = "select RM_RSV_PRI as PRI from ROOM_RESERVATION " +
		          "where MEM_KEY = ? and not (RM_RSV_USE = '취소') " +
		          "group by RM_RSV_PRI " +
		          "order by RM_RSV_PRI desc";

		      String query2 = "select * from ROOM_RESERVATION as A " +
		          "join ROOM as B on A.RM_KEY = B.RM_KEY  " +
		          "join ROOM_CLASS as C on B.RM_CLS_KEY = C.RM_CLS_KEY " +
		          "where MEM_KEY = ? and RM_RSV_PRI = ? " +
		          "limit 1";

		      pstmt = con.prepareStatement(query1);
		      pstmt.setInt(1, key);

		      rs = pstmt.executeQuery();

		      while (rs.next()) {
		        pri = rs.getString("PRI");

		        pstmtt = con.prepareStatement(query2);
		        pstmtt.setInt(1, key);
		        pstmtt.setString(2, pri);

		        rss = pstmtt.executeQuery();

		        if (rss.next()) {
		          member_bean bean = new member_bean();
		          bean.setRM_RSV_CHK_IN(rss.getString("RM_RSV_CHK_IN"));
		          bean.setRM_RSV_CHK_OUT(rss.getString("RM_RSV_CHK_OUT"));
		          bean.setRM_RSV_NUM(rss.getInt("RM_RSV_NUM"));
		          bean.setRM_RSV_PRI(rss.getString("RM_RSV_PRI"));
		          bean.setRM_CLS(rss.getString("RM_CLS"));
		          bean.setRM_RSV_USE(rss.getString("RM_RSV_USE"));
		          list.addElement(bean);
		        }
		      }
		    } catch(Exception ex) {
		      System.out.println("Exception" + ex);
		    } finally{
		      pool.freeConnection(con);
		    }
		    return list;
		  }

		  public int show_total(int key) {
		    PreparedStatement pstmtt = null;
		    ResultSet rss = null;
		    PreparedStatement pstmttt = null;
		    ResultSet rsss = null;
		    String pri = "";
		    int total = 0;
		    int cost = 0;


		    try {
		      con = pool.getConnection();

		      String query1 = "select RM_RSV_PRI as PRI from ROOM_RESERVATION " +
		          "where MEM_KEY = ? " +
		          "group by RM_RSV_PRI " +
		          "order by RM_RSV_PRI desc";

		      String query2 = "select C.RM_COST as COST, A.RM_RSV_NUM as NUM, A.RM_RSV_CHK_IN as INN, " +
		          "A.RM_RSV_CHK_OUT as OUTT " +
		          "from ROOM_RESERVATION as A " +
		          "join ROOM as B on A.RM_KEY = B.RM_KEY  " +
		          "join ROOM_CLASS as C on B.RM_CLS_KEY = C.RM_CLS_KEY " +
		          "where MEM_KEY = ? and RM_RSV_PRI = ? and A.RM_RSV_USE = '이용 완료' " +
		          "limit 1";

		      String query3 = "select DATEDIFF(?, ?) as diff";

		      pstmt = con.prepareStatement(query1);
		      pstmt.setInt(1, key);

		      rs = pstmt.executeQuery();

		      while (rs.next()) {
		        pri = rs.getString("PRI");

		        pstmtt = con.prepareStatement(query2);
		        pstmtt.setInt(1, key);
		        pstmtt.setString(2, pri);

		        rss = pstmtt.executeQuery();

		        if (rss.next()) {
		          pstmttt = con.prepareStatement(query3);
		          pstmttt.setString(1, rss.getString("OUTT"));
		          pstmttt.setString(2, rss.getString("INN"));
		          rsss = pstmttt.executeQuery();

		          if (rsss.next()) {
		            cost = rsss.getInt("diff");
		            cost = cost * rss.getInt("COST") * rss.getInt("NUM");
		          }
		        }
		        total += cost;
		      }
		    } catch(Exception ex) {
		      System.out.println("Exception" + ex);
		    } finally{
		      pool.freeConnection(con);
		    }
		    return total;
		  }

		  public Vector<member_bean> show_dn_list(int key) {
		    Vector<member_bean> list = new Vector<member_bean>();
		    try {
		      con = pool.getConnection();

		      String query = "select * from DINING_RESERVATION as A " +
		          "join restaurant as B on A.RS_KEY = B.RS_KEY " +
		          "join MEAL_TIME as C on A.ML_KEY = C.ML_KEY " +
		          "where A.MEM_KEY = ? " +
		          "order by DN_RSV_DATE desc";

		      pstmt = con.prepareStatement(query);
		      pstmt.setInt(1, key);

		      rs = pstmt.executeQuery();

		      while (rs.next()) {
		        member_bean bean = new member_bean();
		        bean.setDN_RSV_DATE(rs.getString("DN_RSV_DATE"));
		        bean.setRS_NAME(rs.getString("RS_NAME"));
		        bean.setML_TIME(rs.getString("ML_TIME"));
		        list.addElement(bean);
		      }

		    } catch(Exception ex) {
		      System.out.println("Exception" + ex);
		    } finally{
		      pool.freeConnection(con);
		    }
		    return list;
		  }

		  public int total_point(int key) {
		    int total = 0;
		    try {
		      con = pool.getConnection();

		      String query = "select sum(PL_VALUE) as SUM from POINT_LIST where MEM_KEY = ?";

		      pstmt = con.prepareStatement(query);
		      pstmt.setInt(1, key);

		      rs = pstmt.executeQuery();

		      if (rs.next()) {
		        total = rs.getInt("SUM");
		      }

		    } catch (Exception e) {
		      System.out.println("Exception" + e);
		    } finally {
		      pool.freeConnection(con);
		    }
		    return total;
		  }

		  public Vector<member_bean> check_point(int key) {
		    Vector<member_bean> vlist = new Vector<member_bean>();
		    int total = total_point(key);
		    try {
		      con = pool.getConnection();

		      String query = "select * from POINT_LIST where MEM_KEY = ? order by PL_DATE desc";

		      pstmt = con.prepareStatement(query);
		      pstmt.setInt(1, key);

		      rs = pstmt.executeQuery();

		      while (rs.next()) {
		        member_bean pBean = new member_bean();

		        pBean.setPL_DATE(rs.getString("PL_DATE"));
		        pBean.setPL_SAVE_USE(rs.getString("PL_SAVE_USE"));
		        pBean.setPL_VALUE(rs.getInt("PL_VALUE"));
		        pBean.setPL_EXTRA(total);
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

		  public void updateinfo(String id, String pw, String name, String phone, String mail, String birth, int ad_key, int key) {
		    int ok = 0;
		    try {
		      con = pool.getConnection();

		      String query = "update MEMBER set " +
		          "MEM_ID = ? , MEM_PW = ? , " +
		          "MEM_NAME = ? , MEM_PHONE = ? , " +
		          "MEM_MAIL = ? , MEM_BIRTH = ? , " +
		          "AD_UC_KEY = ? " +
		          "where MEM_KEY = ?";

		      pstmt = con.prepareStatement(query);
		      pstmt.setString(1, id);
		      pstmt.setString(2, pw);
		      pstmt.setString(3, name);
		      pstmt.setString(4, phone);
		      pstmt.setString(5, mail);
		      pstmt.setString(6, birth);
		      pstmt.setInt(7, ad_key);
		      pstmt.setInt(8, key);

		      ok = pstmt.executeUpdate();

		    } catch (Exception e) {
		      System.out.println("Exception" + e);
		    } finally {
		      pool.freeConnection(con);
		    }
		  }

		  public void deleteinfo(int key) {

		    int ok = 0;

		    try {

		      con = pool.getConnection();

		      String query = "delete from MEMBER " +
		          "where MEM_KEY = ?";

		      pstmt = con.prepareStatement(query);
		      pstmt.setInt(1, key);

		      ok = pstmt.executeUpdate();

		    } catch (Exception e) {
		      System.out.println("Exception" + e);
		    } finally {
		      pool.freeConnection(con);
		    }
		  }

		  public void updatespecific(String text, int key) {
		    int ok = 0;
		    try {

		      con = pool.getConnection();

		      String query = "update MEMBER set " +
		          "MEM_SPECIFIC = ? " +
		          "where MEM_KEY = ?";

		      pstmt = con.prepareStatement(query);
		      pstmt.setString(1, text);
		      pstmt.setInt(2, key);

		      ok = pstmt.executeUpdate();

		    } catch (Exception e) {
		      System.out.println("Exception" + e);
		    } finally {
		      pool.freeConnection(con);
		    }
		  }

}
