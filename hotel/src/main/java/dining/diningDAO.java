package dining;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;


public class diningDAO {
	
	   ResultSet rs = null; //데이터 베이스의 테이블의 결과를 리턴 받아 자바에 저장해 주는 객체
	   Connection conn = null;//데이터베이스에 접근할수 있도록 설정 
	   PreparedStatement stmt = null;//데이터 베이스에서 쿼리를 실행시켜주는 객체 
	   public static DBConnectionMgr pool;
	   
	   //데이터 베이스에 접근할수 있도록 도와주는 메소드
		public void getcon(){
			//커넥션 풀을 이요하여 데이터 베이스에 접근 
			 try{
				pool = DBConnectionMgr.getInstance(); 
				conn = pool.getConnection();				 
			   		
			 }catch(Exception e){
			    e.printStackTrace();
			 }
			 

		}
		
		//데이터 베이스에 한사람의 회원 정보를 저장해주는 매소드
		public void insertDiningNonMember(diningBean dbean){
			
			
			 System.out.println("연결1");
			try {
			getcon();
			String SQL = "INSERT INTO dining_reservation(DN_RSV_DATE, DN_RSV_ADULT, DN_RSV_NAME, DN_RSV_PHONE, DN_RSV_PW, RS_KEY, ML_KEY, DN_RSV_USE) VALUES(?,?,?,?,?,?,?,'이용예정')";
			//쿼리를 사용하도록 설정 
				stmt = conn.prepareStatement(SQL);
				//?에 맞게 데이터를 맵핑
				System.out.println("연결2");

				stmt.setString(1,dbean.getDN_RSV_DATE());
				stmt.setInt(2,dbean.getDN_RSV_ADULT());
				stmt.setString(3,dbean.getDN_RSV_NAME());
				stmt.setString(4,dbean.getDN_RSV_PHONE());
				stmt.setString(5,dbean.getDN_RSV_PW());
				stmt.setString(6,dbean.getRS_KEY());
				stmt.setString(7,dbean.getML_KEY());
				stmt.executeUpdate();//insert,update,delete 시 사용하는 메소드 
				//5.자원 반납 
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("실패");
			}finally{
			      pool.freeConnection(conn);
			    }						 
		}
		
		
		public void insertDiningMember(diningBean dbean){
			
		 			System.out.println("연결2-1");
			try {
			getcon();
			String SQL = "INSERT INTO dining_reservation(DN_RSV_DATE, DN_RSV_ADULT, DN_RSV_NAME, DN_RSV_PHONE, RS_KEY, ML_KEY, MEM_KEY, DN_RSV_USE) VALUES(?,?,?,?,?,?,?, '이용예정')";
			//쿼리를 사용하도록 설정 
				stmt = conn.prepareStatement(SQL);
				//?에 맞게 데이터를 맵핑
				System.out.println("연결2-2");

				stmt.setString(1,dbean.getDN_RSV_DATE());
				stmt.setInt(2,dbean.getDN_RSV_ADULT());
				stmt.setString(3,dbean.getDN_RSV_NAME());
				stmt.setString(4,dbean.getDN_RSV_PHONE());
				stmt.setString(5,dbean.getRS_KEY());
				stmt.setString(6,dbean.getML_KEY());
				stmt.setInt(7,dbean.getMEM_KEY());
				stmt.executeUpdate();//insert,update,delete 시 사용하는 메소드 
				//5.자원 반납 
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("실패2");
			}	
						 
		}
		
		
		public diningBean oneSelectRestaurant(int RS_KEY){
			
			  diningBean dbean = new diningBean();
		
			System.out.println("레스토랑 이름 가져오기");


			 try{
				  
				 getcon();
 
				 String SQL = "SELECT RS_NAME FROM restaurant WHERE rs_key=?";
				 stmt = conn.prepareStatement(SQL);		 
				 stmt.setInt(1,RS_KEY);
				 rs = stmt.executeQuery();
				 if(rs.next()){
					 dbean.setRestaurantName(rs.getString(1));
				 }
				 conn.close();
				 
			    }catch(Exception e){
			    	e.printStackTrace();
			   	}	
			return dbean;	
		}



		public diningBean oneSelectTime(String ML_KEY){
			
			  diningBean dbean = new diningBean();
		
			System.out.println("식사시간 가져오기");
		
		
			 try{
				  
				 getcon();
						 
				 String SQL = "SELECT ml_time FROM meal WHERE ml_key=?";
				 stmt = conn.prepareStatement(SQL);		 
				 stmt.setString(1,ML_KEY);
				 rs = stmt.executeQuery();
				 if(rs.next()){
					 dbean.setRestaurantTime(rs.getString(1));
				 }
				 conn.close();
				 
			    }catch(Exception e){
			    	e.printStackTrace();
			   	}	
			return dbean;	
		}
		
		public diningBean oneSelectMember(int id){
			//한사람에 대한 정보만 리턴하기에 빈클래스 객체 생성
			diningBean bean = new diningBean();
			//무조건 데이터 베이스는 예외 처리를 반드시 해야 합니다.
			 try{
				 //커넥션 연결 
				 getcon();
				 
				 //쿼리 준비 
				 String SQL = "SELECT MEM_ID, MEM_PHONE, MEM_NAME FROM MEMBER WHERE mem_key= ?";
				 //쿼리를 실행 시켜주는 객체 선언 
				 stmt = conn.prepareStatement(SQL);		 
				 //?의 값을 맵핑 
				 stmt.setInt(1,id);
				 //쿼리 실행 
				 rs = stmt.executeQuery();
				 if(rs.next()){//레코드가 있다면 
					 bean.setMEM_ID(rs.getString(1));
					 bean.setMEM_PHONE(rs.getString(2));
					 bean.setMEM_NAME(rs.getString(3));	 
				 }
				 
				 //자원 반납
				 conn.close();
				 
			    }catch(Exception e){
			    	e.printStackTrace();
			   	}	
			 //리턴 
			return bean;	
		}
		
		
		public Vector<diningBean> displayReview(String name) {

		    Vector<diningBean> reviewList = new Vector<diningBean>();
		    try {

		    	 getcon();

		      String query = "select * from REVIEW as A join DINING_RESERVATION as B on A.DN_RSV_KEY = B.DN_RSV_KEY "
		      		+ "join RESTAURANT as C on B.RS_KEY = C.RS_KEY WHERE C.RS_KEY = ?";
		      

		      stmt = conn.prepareStatement(query);

		      stmt.setString(1, name);

		      rs = stmt.executeQuery();
		      
		      
				
			    	  diningBean rv = new diningBean();

				 
		      while(rs.next()) {
		    	  

		    	  rv.setRV_SCORE(rs.getInt("RV_SC_KEY"));
		    	  rv.setRV_CONTENTS(rs.getString("RV_CONTENTS"));
		    	  reviewList.addElement(rv);

		      }
		      
	
		    }catch(Exception ex) {
		      System.out.println("Exception" + ex);
		    }finally{
		      pool.freeConnection(conn);
		    }
		    return reviewList;

		  }

		  
		  //리뷰평점
		  public int reviewAVG(String name) {
			  
			  int count = 0;
		      int avg = 0;
		   
		    try {

		    	 getcon();

		      String query = "select * from REVIEW as A " +
			          "join DINING_RESERVATION as B " +
			          "on A.DN_RSV_KEY = B.DN_RSV_KEY " +
			          "join RESTAURANT as C " +
			          "on B.RS_KEY = C.RS_KEY " +
			          "WHERE C.RS_KEY = ?";
			      
		      stmt = conn.prepareStatement(query);

		      stmt.setString(1, name);

		      rs = stmt.executeQuery();

		      
		      while (rs.next()) {
		        avg += rs.getInt("RV_SC_KEY");
		        count++;
		      }
		      

		      avg = avg / count;

		    } catch (Exception ex) {
		      System.out.println("Exception" + ex);
		    } finally {
		      pool.freeConnection(conn);
		    }
		    return avg;
		  }
}