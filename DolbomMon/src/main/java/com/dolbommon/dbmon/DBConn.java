package com.dolbommon.dbmon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConn {
	protected Connection con = null;
	protected PreparedStatement pstmt = null;
	protected ResultSet rs = null;
	protected String sql = null;
	
	//DB연결
	public DBConn() {}
	
	
	//DB연결 회선 중 비어있는 회선을 가져오는 메서드 
	public void dbConn() {
		try {
			Context ctx = new InitialContext();
			Context envCtx = (Context)ctx.lookup("java:comp/env");
			
			DataSource ds = (DataSource)envCtx.lookup("jdbc/myoracle");
			con = ds.getConnection();
			
		}catch(Exception e){
			System.out.println("DB연결에러발생------------");
			e.printStackTrace();
		}
		
	}
	//DB연결 닫는메서드
	public void dbClose() {
		try{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(con!=null)con.close();
			
		}catch(Exception e) {
			
		}
	}
	
}
