package rsv_payment_manage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class memberAnsidMothod {

	private static DBConnectionMgr pool;
	  Connection con = null;
	  PreparedStatement pstmt = null;
	  ResultSet rs = null;

	public memberAnsidMothod() {

		try {

			
			pool = DBConnectionMgr.getInstance();
			System.out.println("DB 드라이버 로딩 성공!");
		}

		catch (Exception e) {

			System.out.print("DB 드라이버 로딩 실패!" + e);
			e.printStackTrace();
		}

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
	
	 //잔여 객실 확인
	  public String roomSpareCheck(String in, String out, String rmClass, int rmNum) {

		  String check = "불가능";

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
		        check = "가능";
		      }
		    }

		  } catch (Exception ex) {
		    System.out.println("Exception" + ex);
		  } finally {
		    pool.freeConnection(con);
		  }
		  return check;
		}
	  
	
	public int key(String name, String phone) {
		int key = 0;
		Connection conn = null;

		PreparedStatement pstmt = null;

		ResultSet rs = null;
		
		try {
			
			conn = pool.getConnection();
			
			String query = "select * from MEMBER_CREATE " + 
			"where MEM_NAME = ? and MEM_PHONE = ?";
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				key = rs.getInt("MEM_KEY");
				
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return key;
	}
	
	//회원 인서트 메서드
	 public void RSV_info_insert_member(String chk_in, String chk_out, int num, int adult, String name, String phone, String email, String use, String content, String rsv_pri, int rm_key, int mem_key, int uc_key) {

			Connection conn = null;

			PreparedStatement pstmt = null;

			ResultSet rs = null;
		 
		  try {
		    conn = pool.getConnection();

		    String query = "INSERT INTO `ROOM_RESERVATION` " +
		        "(`RM_RSV_CHK_IN`, `RM_RSV_CHK_OUT`, `RM_RSV_NUM`, `RM_RSV_ADULT`, `RM_RSV_NAME`, " +
		        "`RM_RSV_PHONE`, `RM_RSV_EMAIL`, `RM_RSV_USE`, `RM_RSV_CONTENT`, `RM_RSV_PRI`, `RM_KEY`, `MEM_KEY`, `AD_UC_KEY`) " +
		        "VALUES (?, ?, ?, ?, ?, ?, " +
		        "?, ?, ?, ?, ?, ?, ?)";

		    pstmt = conn.prepareStatement(query);
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
		    pool.freeConnection(conn);
		  }
		}
	 


	  //비회원 인서트 메소드
	  public void RSV_info_insert_nomember(String chk_in, String chk_out, int num, int adult, String name, String phone, String email, String pw, String use, String content, String rsv_pri, int rm_key, int uc_key) {

		  try {
		    con = pool.getConnection();
			PreparedStatement pstmt = null;

			ResultSet rs = null;

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

		    pstmt.executeUpdate();

		    System.out.println(query);

		  } catch (Exception ex) {
		    System.out.println("Exception" + ex);
		  } finally {
		    pool.freeConnection(con);
		  }
		}
	  
	  
		public int memberFindid(String MEM_NAME, String MEM_PHONE) {

			int num = 0;

			Connection conn = null;

			PreparedStatement pstmt = null;

			ResultSet rs = null;
			try

			{

				conn = pool.getConnection();

				String sql = "select * from ROOM_RESERVATION " + "where RM_RSV_NAME = ? and RM_RSV_PHONE = ?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, MEM_NAME);
				pstmt.setString(2, MEM_PHONE);

				rs = pstmt.executeQuery();

				if (rs.next()) {

				num = rs.getInt("RM_RSV_KEY");
				}

			} catch (Exception e) {
				System.out.println(e);
			}
			return num;
		}
		
		//POINT 밸류를 찾는 메서드입니다.
		public int pointData(int memKey) {

			int num = 0;
			

			Connection conn = null;

			PreparedStatement pstmt = null;

			ResultSet rs = null;
			try

			{

				conn = pool.getConnection();

				String sql = "select * from point_list " + "where MEM_KEY = ?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, memKey);
				

				rs = pstmt.executeQuery();

				if (rs.next()) {

				num = rs.getInt("PL_VALUE");
			
				}

			} catch (Exception e) {
				System.out.println(e);
			}
			return num;
		}
		
		//sales 인서트 메서드
		  public void insert_sales(String SL_DATE, String SL_RSV_SEC, String SL_MT_SET, int RSV_KEY, int PL_KEY) {

			  try {
			    con = pool.getConnection();
				PreparedStatement pstmt = null;

				ResultSet rs = null;

			    String query = "INSERT INTO `sales` " +
			        "(`SL_DATE`, `SL_RSV_SEC`, `SL_MT_SEC`, `RM_RSV_KEY`, `PL_KEY`)"
			         +
			        "VALUES (?, ?, ?, ?, ?)";

			    pstmt = con.prepareStatement(query);
			    pstmt.setString(1, SL_DATE);
			    pstmt.setString(2, SL_RSV_SEC);
			    pstmt.setString(3, SL_MT_SET);
			    pstmt.setInt(4, RSV_KEY);
			    pstmt.setInt(5, PL_KEY);
			

			    pstmt.executeUpdate();

			    System.out.println(query);

			  } catch (Exception ex) {
			    System.out.println("Exception" + ex);
			  } finally {
			    pool.freeConnection(con);
			  }
			}
		  
		  //pl키를 찾는 메서드입니다.
			public int findPlKey(int memKey) {

				int num = 0;
				

				Connection conn = null;

				PreparedStatement pstmt = null;

				ResultSet rs = null;
				try

				{

					conn = pool.getConnection();

					String sql = "select * from point_list " + "where MEM_KEY = ?";

					pstmt = conn.prepareStatement(sql);

					pstmt.setInt(1, memKey);
					

					rs = pstmt.executeQuery();

					if (rs.next()) {

					num = rs.getInt("PL_KEY");
				
					}

				} catch (Exception e) {
					System.out.println(e);
				}
				return num;
			}
			
			//방 예약 테이블에서 RM_KEY를 찾는 메서드입니다.
			public int findRoom(String name, String phone) {
				
				  DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
				  Date nowDate = new Date();
				  String today = sdFormat.format(nowDate);

				int room = 0;
				Connection conn = null;

				PreparedStatement pstmt = null;

				ResultSet rs = null;
				
				try {
					
					conn = pool.getConnection();
					
					String query = "select * from room_reservation " + 
					"where RM_RSV_NAME = ? and RM_RSV_PHONE = ? " +
							"and RM_RSV_CHK_IN = ? and RM_RSV_USE = '이용 예정'";
					
					pstmt = conn.prepareStatement(query);
					
					pstmt.setString(1, name);
					pstmt.setString(2, phone);
					pstmt.setString(3, today);
					
					rs = pstmt.executeQuery();
					
					if (rs.next()) {
						room = rs.getInt("RM_KEY");
						
					}
					
				} catch (Exception e) {
					System.out.println(e);
				}
				return room;
			}
	
			
			//room 테이블에서 RM_CLS_KEY를 찾는 메서드입니다.
			public int findRm_Cls_Key(int rm_key) {
				int cls_key = 0;
				Connection conn = null;

				PreparedStatement pstmt = null;

				ResultSet rs = null;
				
				try {
					
					conn = pool.getConnection();
					
					String query = "select * from room " + 
					"where RM_KEY = ?";
					
					pstmt = conn.prepareStatement(query);
					
					pstmt.setInt(1, rm_key);
				
					rs = pstmt.executeQuery();
					
					if (rs.next()) {
						cls_key = rs.getInt("RM_CLS_KEY");
						
					}
					
				} catch (Exception e) {
					System.out.println(e);
				}
				return cls_key;
			}
			
			//객실 호수를 찾는 메서드입니다.
			public int findRm_Num(int rm_key) {
				int rm_num = 0;
				Connection conn = null;

				PreparedStatement pstmt = null;

				ResultSet rs = null;
				
				try {
					
					conn = pool.getConnection();
					
					String query = "select * from room " + 
					"where RM_KEY = ?";
					
					pstmt = conn.prepareStatement(query);
					
					pstmt.setInt(1, rm_key);
				
					rs = pstmt.executeQuery();
					
					if (rs.next()) {
						rm_num = rs.getInt("RM_NUM");
						
					}
					
				} catch (Exception e) {
					System.out.println(e);
				}
				return rm_num;
			}
			
			//room_class 테이블에서 방 등급을 찾는 메서드입니다.
			public String findRoomCls(int cls_key) {
				String cls = "";
				Connection conn = null;

				PreparedStatement pstmt = null;

				ResultSet rs = null;
				
				try {
					
					conn = pool.getConnection();
					
					String query = "select * from room_class " + 
					"where RM_CLS_KEY = ?";
					
					pstmt = conn.prepareStatement(query);
					
					pstmt.setInt(1, cls_key);
					
					
					rs = pstmt.executeQuery();
					
					if (rs.next()) {
						cls = rs.getString("RM_CLS");
						
					}
					
				} catch (Exception e) {
					System.out.println(e);
				}
				return cls;
			}
			
			//room_class 테이블에서 방 가격을 찾는 메서드입니다.
			public int findRoomCost(String name, String phone) {
				int cost = 0;
				Connection conn = null;

				PreparedStatement pstmt = null;

				ResultSet rs = null;
				
				  DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
				  Date nowDate = new Date();
				  String today = sdFormat.format(nowDate);

				
				try {
					
					conn = pool.getConnection();
					
					String query = "SELECT c.rm_cost FROM room_reservation AS a "+
							"JOIN room AS b "+
							"ON a.rm_key = b.rm_key "+
							"JOIN room_class AS c "+
							"ON b.RM_CLS_KEY = c.RM_CLS_KEY "+
							"WHERE a.RM_RSV_NAME = ? AND a.RM_RSV_PHONE = ? AND a.rm_rsv_chk_in = ? ";
					
					pstmt = conn.prepareStatement(query);
					
					pstmt.setString(1, name);
					pstmt.setString(2, phone);
					pstmt.setString(3, today);
					
					
					rs = pstmt.executeQuery();
					
					if (rs.next()) {
						cost = rs.getInt("RM_COST");
						
					}
					
				} catch (Exception e) {
					System.out.println(e);
				}
				return cost;
			}
			
			//point 인서트 메서드
			  public void insert_point(String SL_DATE, String SAVE_USE, int PL_VALUE, int MEM_KEY, int RM_RSV_KEY) {

				  try {
				    con = pool.getConnection();
					PreparedStatement pstmt = null;

					ResultSet rs = null;

				    String query = "INSERT INTO `point_list` " +
				        "(`PL_DATE`, `PL_SAVE_USE`, `PL_VALUE`, `MEM_KEY`, `RM_RSV_KEY`)"
				         +
				        "VALUES (?, ?, ?, ?, ?)";

				    pstmt = con.prepareStatement(query);
				    pstmt.setString(1, SL_DATE);
				    pstmt.setString(2, SAVE_USE);
				    pstmt.setInt(3, PL_VALUE);
				    pstmt.setInt(4, MEM_KEY);
				    pstmt.setInt(5, RM_RSV_KEY);
				

				    pstmt.executeUpdate();

				    System.out.println(query);

				  } catch (Exception ex) {
				    System.out.println("Exception" + ex);
				  } finally {
				    pool.freeConnection(con);
				  }
				}
			  
			  //포인트를 더하는 메서드입니다.
				public int sumPoint(int mem_key) {
					int point = 0;
					Connection conn = null;

					PreparedStatement pstmt = null;

					ResultSet rs = null;
					
					try {
						
						conn = pool.getConnection();
						
						String query = "SELECT sum(PL_VALUE) FROM `point_list` WHERE MEM_KEY = ?";
						
						pstmt = conn.prepareStatement(query);
						
						pstmt.setInt(1, mem_key);
						
						
						rs = pstmt.executeQuery();
						
						if (rs.next()) {
							point = rs.getInt("sum(PL_VALUE)");
							
						}
						
					} catch (Exception e) {
						System.out.println(e);
					}
					return point;
				}
				
				//포인트를 빼는 메서드입니다.
				public int subPoint(int mem_key) {
					int point = 0;
					Connection conn = null;

					PreparedStatement pstmt = null;

					ResultSet rs = null;
					
					try {
						
						conn = pool.getConnection();
						
						String query = "SELECT * FROM `point_list` WHERE MEM_KEY = ?";
						
						pstmt = conn.prepareStatement(query);
						
						pstmt.setInt(1, mem_key);
						
						
						rs = pstmt.executeQuery();
						
						if (rs.next()) {
							point = rs.getInt("PL_VALUE");
							
						}
						
					} catch (Exception e) {
						System.out.println(e);
					}
					return point;
				}
				
				//room테이블에서 사용예정을 사용중으로 바꾸는 메서드입니다.
				  public void room_using(int rm_key) {

					  try {
					    con = pool.getConnection();
						PreparedStatement pstmt = null;

						ResultSet rs = null;

					    String query = "UPDATE `hotelthegreen`.`room` SET `RM_USE`='사용중' WHERE  `RM_KEY`=?";

					    pstmt = con.prepareStatement(query);
					    pstmt.setInt(1, rm_key);
					  
					    pstmt.executeUpdate();

					    System.out.println(query);

					  } catch (Exception ex) {
					    System.out.println("Exception" + ex);
					  } finally {
					    pool.freeConnection(con);
					  }
					}
				  
				  //룸 예약 테이블에서 이용완료로 바꾸는 메서드입니다.
				  public void rsv_using(int rm_rsv_key) {

					  try {
					    con = pool.getConnection();
						PreparedStatement pstmt = null;

						ResultSet rs = null;

					    String query = "UPDATE `hotelthegreen`.`room_reservation` SET `RM_RSV_USE`='이용 완료' WHERE  `RM_RSV_KEY`=?";

					    pstmt = con.prepareStatement(query);
					    pstmt.setInt(1, rm_rsv_key);
					  

					    pstmt.executeUpdate();

					    System.out.println(query);

					  } catch (Exception ex) {
					    System.out.println("Exception" + ex);
					  } finally {
					    pool.freeConnection(con);
					  }
					}
				  
				  //룸 예약 테이블에서 rm_rsv_use의 이용 예정인 값을 조회하는 메서드입니다.
				  public String findRsv_use(int rm_key) {
						String use = "";
						Connection conn = null;

						PreparedStatement pstmt = null;

						ResultSet rs = null;
						
						try {
							
							conn = pool.getConnection();
							
							String query = "select * from room_reservation " + 
							"where RM_KEY = ? and where RM_RSV_USE = '이용예정'";
							
							pstmt = conn.prepareStatement(query);
							
							pstmt.setInt(1, rm_key);
							
							
							rs = pstmt.executeQuery();
							
							if (rs.next()) {
								use = rs.getString("RM_RSV_USE");
							}
							
						} catch (Exception e) {
							System.out.println(e);
						}
						return use;
					}
				  
					public int findRm_Rsv_Key(String name, String phone, int room_key, String using) {
						int rsv_key = 0;
						Connection conn = null;

						PreparedStatement pstmt = null;

						ResultSet rs = null;
						
						try {
							
							conn = pool.getConnection();
							
							String query = "select * from room_reservation " + 
							"where RM_RSV_NAME = ? and RM_RSV_PHONE = ? and RM_key = ? and RM_RSV_USE = ?";
							
							pstmt = conn.prepareStatement(query);
							
							pstmt.setString(1, name);
							pstmt.setString(2, phone);
							pstmt.setInt(3, room_key);
							pstmt.setString(4, using);
							
				
							
							rs = pstmt.executeQuery();
							
							if (rs.next()) {
								rsv_key = rs.getInt("RM_RSV_KEY");
							}
							
						} catch (Exception e) {
							System.out.println(e);
						}
						return rsv_key;
					}
				
}
