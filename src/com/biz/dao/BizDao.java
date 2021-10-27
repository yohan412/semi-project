package com.biz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.biz.dto.BizDto;

import common.JDBCTemplate;

public class BizDao extends JDBCTemplate{
	
	public int insert(BizDto dto){
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "INSERT INTO BUSINESS VALUES(BIZ_NOSQ.NEXTVAL,?,?,?,?,?,?,?,?)";
		
		try {
			pstm=con.prepareStatement(sql);
			
			pstm.setInt(1, dto.getUserno());
			pstm.setString(2, dto.getUsernm());
			pstm.setString(3, dto.getBiznm());
			pstm.setString(4, dto.getBizaddr());
			pstm.setString(5, dto.getBizcategory());
			pstm.setString(6, dto.getBizprice());
			pstm.setString(7, dto.getBizcontent());
			pstm.setString(8, dto.getBizpic());
			System.out.println("03.query 준비: "+sql);
			
			res=pstm.executeUpdate();
			System.out.println("04.query 실행 및 준비");
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05.db 종료");
		}
		
		return res;
	}
	
}
