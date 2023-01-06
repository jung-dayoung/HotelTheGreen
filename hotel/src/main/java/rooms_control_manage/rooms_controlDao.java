package rooms_control_manage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;


public class rooms_controlDao {
	private static DBConnectionMgr pool;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public rooms_controlDao(){
		try {
			pool = DBConnectionMgr.getInstance();	//DBConnectionMgr 클래스의 pool을 사용해서 드라이버 로딩
			System.out.println("커넥션 연결 성공!");
		} catch(Exception ex) {
			System.out.println("Error : 커넥션 연결 실페");
		}
	}
	
	//calender 메소드
	//윤년 계산 
	  public boolean isLeapYear(int year) { 
	    boolean leap = false; 

	    if((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0)) { 
	      leap = true; 
	    } 
	    return leap; 
	  } 

	  public int getDate(int year, int month) { 
	    int tmp = 0; 

	    if(isLeapYear(year)) { 

	      switch(month) { 
	        case 1: case 3: case 5: case 7: case 8: case 10: case 12: 
	          tmp = 31; 
	        break; 
	        case 4: case 6: case 9: case 11: 
	          tmp = 30; 
	        break; 
	        case 2: 
	          tmp = 29; 
	        break; 
	      } 
	    }else { 
	      if(month == 1 || month == 3 || month == 5 || month == 7 ||month == 8 || month == 10 || month == 12) { 
	        tmp = 31; 
	      } else if(month == 4 || month == 6 || month == 9 || month == 11) { 
	        tmp = 30;
	      }else if (month == 2) { 
	        tmp = 28; 
	      } 
	    } 
	    return tmp; 
	  } 

	  //해당 월의 첫번쨰 요일 계산 
	  public int getDayOfWeek(int year, int month) { 
	    int dayOfWeek = 0; 
	    int sum = 0; 

	    // 1.1.1 ~ year-1.12.31 
	    for(int i = 1; i < year; i++) { 
	      for(int j = 1; j <= 12; j++) { 
	        sum += getDate(i, j); 
	      } 
	    } 

	    //year.1.1 ~ year.month-1.마지막(31,30.29.28) 
	    for(int k = 1; k < month; k++) { 
	      sum += getDate(year, k); 
	    } 

	    //year.month.1일 
	    sum += 1; 

	    //요일 
	    dayOfWeek = sum % 7;

	    return dayOfWeek; 
	  } 

	  //월별 방 예약된 방 select 메서드
	  public int month_select(int year, int month, int rm_cls) {
		  
		  int year_add = 0;
		  int month_add = 0;
		  int COUNT = 0;
		  
		  if(month < 12) {
			  month_add = month + 1;
			  year_add = year;
		  } else {
			  month_add = 1;
			  year_add = year + 1;
		  }
		  
		  try {
			  con = pool.getConnection();
			  
			  String query = "SELECT RM_RSV_CHK_IN, count(RM_CLS_KEY) as COUNT "
			  		+ "FROM room_reservation AS rsv "
			  		+ "LEFT JOIN room AS rm "
			  		+ "ON rsv.RM_KEY = rm.RM_KEY "
			  		+ "WHERE RM_RSV_CHK_IN >= ? AND RM_RSV_CHK_IN < ? "
			  		+ "AND RM_CLS_KEY = ?";
			  
			  pstmt = con.prepareStatement(query);
			  pstmt.setString(1, year + "-" + month + "-01");
			  pstmt.setString(2, year_add + "-" + month_add + "-01");
			  pstmt.setInt(3, rm_cls);
			  //System.out.println(month_add);
			  System.out.println("월별 select 메서드 성공!");
			  rs = pstmt.executeQuery();
			  
			  if(rs.next()) {
				  COUNT =+ rs.getInt("COUNT");
			  }
		  }catch(Exception ex) {
			  System.out.println("Exception" + ex);
		  }finally {
			    pool.freeConnection(con);
		  }
		  return COUNT;
	  }
	  
	  //일별 예약된 방 select 메서드
	  public int day_select(int year, int month, int day, int rm_cls) {
		  
		  int COUNT = 0;
		  
		  try {
			  con = pool.getConnection();
			  
			  String query = "SELECT RM_RSV_CHK_IN, count(RM_CLS_KEY) as COUNT "
			  		+ "FROM room_reservation AS rsv "
			  		+ "LEFT JOIN room AS rm "
			  		+ "ON rsv.RM_KEY = rm.RM_KEY "
			  		+ "WHERE RM_RSV_CHK_IN = ? "
			  		+ "AND RM_CLS_KEY = ?";
			  
			  pstmt = con.prepareStatement(query);
			  pstmt.setString(1, year + "-" + month + "-" + day);
			  pstmt.setInt(2, rm_cls);
			  //System.out.println(month_add);
			  System.out.println("일별 select 메서드 성공!");
			  rs = pstmt.executeQuery();
			  
			  if(rs.next()) {
				  COUNT =+ rs.getInt("COUNT");
			  }
		  }catch(Exception ex) {
			  System.out.println("Exception" + ex);
		  }finally {
			    pool.freeConnection(con);
		  }
		  return COUNT;
	  }
	  
	  // 각 룸의 번호와 사용유무, 청소유무 select 메서드
	  public Vector<rooms_controlBean> room_select(String today, int RM_CLS_KEY) {
		  
		  Vector<rooms_controlBean> list = new Vector<rooms_controlBean>();
		  
		  
		  try {
			  con = pool.getConnection();
			  
			  String query ="select A.RM_KEY, A.RM_NUM, A.RM_USE, A.RM_CLEAN, B.RM_RSV_CHK_OUT, max(A.RM_NUM = B.RM_NUM) as ABC from room as A, ( "
					  + "SELECT RM_NUM, B.RM_RSV_CHK_OUT "
					  + "FROM ROOM AS A "
					  + "join room_reservation as B "
					  + "on A.RM_KEY = B.RM_KEY "
					  + "where B.RM_RSV_CHK_IN = ? and A.RM_CLS_KEY = ? "
					  + "group by A.RM_NUM "
					  + "order by A.RM_NUM) as B "
					  + "where A.RM_CLS_KEY = ? "
					  + "group by A.RM_NUM "
					  + "order by A.RM_KEY";
			  
			  pstmt = con.prepareStatement(query);
			  pstmt.setString(1, today);
			  pstmt.setInt(2, RM_CLS_KEY);
			  pstmt.setInt(3, RM_CLS_KEY);
			  
			  rs = pstmt.executeQuery();
			  
			  while (rs.next()) {
				  rooms_controlBean controlBean = new rooms_controlBean();
				  
				  controlBean.setRM_KEY(rs.getInt("RM_KEY"));
				  controlBean.setRM_NUM(rs.getString("RM_NUM"));
				  controlBean.setRM_USE(rs.getString("RM_USE"));
				  controlBean.setRM_CLEAN(rs.getString("RM_CLEAN"));
				  controlBean.setRM_RSV_CHK_OUT(rs.getString("RM_RSV_CHK_OUT"));
				  controlBean.setABC(rs.getString("ABC"));
				  list.addElement(controlBean);
			  }
			  
		  }catch(Exception ex) {
			  System.out.println("Exception" + ex);
		  }finally {
			  pool.freeConnection(con);
		  }
		  return list;
	  }
	  
	  //청소 상태 변경
	  public void clean_update(String RM_NUM, String RM_CLEAN) {
		  
		  try {
			  con = pool.getConnection();
			  
			  String query ="update room set RM_CLEAN = ? where RM_NUM = ? ";
					 
			  pstmt = con.prepareStatement(query);
			  pstmt.setString(1, RM_CLEAN);
			  pstmt.setString(2, RM_NUM);
			  
			  int ok = pstmt.executeUpdate();
			  
		  }catch(Exception ex) {
			  System.out.println("Exception" + ex);
		  }finally {
			  pool.freeConnection(con);
		  }
		  
	  }
	  
	  //객실 사용 상태 변경
	  
	  public void room_usedate(String use, String num) {
		  try {
			  con = pool.getConnection();
			  
			  String query ="update room set RM_USE = ? where RM_NUM = ? ";
					 
			  pstmt = con.prepareStatement(query);
			  pstmt.setString(1, use);
			  pstmt.setString(2, num);
			  
			  int ok = pstmt.executeUpdate();
			  
		  }catch(Exception ex) {
			  System.out.println("Exception" + ex);
		  }finally {
			  pool.freeConnection(con);
		  }
		  
	  }
}
