package cscenter;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import cscenter.connectionPool;

public class counsel {
	public counsel() {
		try {
			Class.forName(connectionPool.driverClass);
			System.out.println("DB 드라이버 로딩 성공!");
			
		}	catch(ClassNotFoundException e) {
			
			e.printStackTrace();
		}
	}
	
	
	//insert(입력) 메서드 
	public int insertMessage(int MEM_KEY, int CC_KEY, int CR_KEY, String CS_EMAIL, String CS_TITLE, String CS_CONTENTS, String CS_DATE) {
		
		Connection conn = null; //DB 연결 객체 
		
		PreparedStatement pstmt = null; //쿼리 실행 객체 
		
		ResultSet rs = null; //결과 가져오는 객체 
		
		String sql = "insert into counsel(MEM_KEY, CC_KEY, CR_KEY, CS_EMAIL, CS_TITLE, CS_CONTENTS, CS_DATE) values(?,?,?,?,?,?,?)";
			
			try {
				conn = DriverManager.getConnection(connectionPool.url, connectionPool.id, connectionPool.pwd);
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, MEM_KEY);
				pstmt.setInt(2, CC_KEY);
				pstmt.setInt(3, CR_KEY);
				pstmt.setString(4, CS_EMAIL);
				pstmt.setString(5, CS_TITLE);
				pstmt.setString(6, CS_CONTENTS);
				pstmt.setString(7, CS_DATE);
				
				return pstmt.executeUpdate();
				
			} catch(Exception ex) {
				
				ex.printStackTrace();
			} finally {
				
				try {
					
					if(rs!=null)rs.close();
					
					if(pstmt!=null)pstmt.close();
					
					if(conn!=null)conn.close();
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}	
			return -1; 
	}
}

