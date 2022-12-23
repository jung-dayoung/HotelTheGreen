package dining;

import java.sql.*;

public class diningMgr{
	
	private DBConnectionMgr pool;

	public diningMgr(){
		try{
			pool = DBConnectionMgr.getInstance(); //DBConnectionMgr 클래스 의 pool을 사용해서 드라이버 로딩.
			
		}catch(Exception e){
			
			System.out.println("Error : 커넥션 연결 실패");			
		}
	}

	public boolean loginRegister(String id, String pwd) {
		
		
        Connection con = null;
        
        PreparedStatement pstmt = null;
        
        /*statement 와 preparedStatement 의 차이.
         * 
         * statement 
         * - SQL 쿼리문을 실행하는 역할
         * - 스스로는 SQL 쿼리문 해석 못함 -> 전달 역할만 한다.
         * 
         * preparedStatement
         * - statement 클래스 에서 기능이 향상됨.
         * - 매개변수 사용되는 작업에 특화.(쿼리문의 where 절에 작성될 매개변수 사용)
         * - 코드 안정성이 높고, 가독성이 좋다.
         * */
        
        
        ResultSet rs = null;
        
        boolean loginCon = false;
        
        try {
        	
            con = pool.getConnection(); //pool 사용해서 데이터베이스 접속
            
			String query = "select count(*) from tblRegister where id = ? and pwd = ?";
			//데이터베이스 와 연결 된 후에 select 쿼리로 tblRegister 테이블을 조회 하는데 where 절에 id와 pwd 를 입력 받아서 조회 합니다.
			
            pstmt = con.prepareStatement(query); 
            
            pstmt.setString(1, id); //setString 메서드를 사용해면 쿼리문 실행시 ? 였던 부분이 각 각 id 와 pwd가 들어가게된다. 
            						//예를 들어 id매개변수 가 test 이고 pwd매개변수가 1234 라면...
            						//쿼리 실행 시 select count(*) from tblRegister where "id" = test and pwd = "1234" 
            
            pstmt.setString(2, pwd);
            
            rs = pstmt.executeQuery(); //excuteQuery 를 통해서 쿼리 실행 결과를 resultSet 의 객체인 rs에 담게된다.
            
            if(rs.next()&&rs.getInt(1)>0) 
            	/*
            	 * 쿼리 실행 결과를 바탕으로 if 조건문에 &&비교연산자(조건1 && 조건2 를 모두만족 하면 true) 를 통해서 true, false 값을 할당 합니다.
            	 * 쿼리 실행 값이 담긴 rs를 next() 메서드를 통해서 다음 index 값이 있고,
            	 * 쿼리 실행 결과가 count 1 이 나온다. 따라서 getInt(1)>0 조건문은 count 값이 1 이상이면 true 로 반환.
            	 * 값이 존재 한다면 boolean 타입의 변수 loginCon에 true 값으로 저장.
            	 * */
            								
            	
            	loginCon =true;
            
        }catch(Exception ex) {
            System.out.println("Exception" + ex);
        }finally{
             pool.freeConnection(con,pstmt,rs);
        }
        return loginCon;
    }
}

