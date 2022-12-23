package dining;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


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
		public int insertDining(diningBean dbean){
			
			  int ok = 0;
			 			System.out.println("연결1");
			try {
			getcon();
			String SQL = "INSERT INTO dining_reservation(DN_RSV_DATE, DN_RSV_ADULT, DN_RSV_NAME, DN_RSV_PHONE, DN_RSV_PW, RS_KEY, ML_KEY) VALUES(?,?,?,?,?,?,?)";
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
			}	
			
			  System.out.println(ok); return ok;
			 
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
}