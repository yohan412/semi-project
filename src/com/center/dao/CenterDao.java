package com.center.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;

import com.center.dto.CenterDto;

import common.JDBCTemplate;

public class CenterDao extends JDBCTemplate {
	public List<CenterDto> selectAll() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<CenterDto> list = new ArrayList<CenterDto>();
		
		String sql = "SELECT * FROM TESTKAKAOMAP";
		
		try {
			pstm=con.prepareStatement(sql);
			System.out.println("sql 준비");
			
			rs=pstm.executeQuery();
			System.out.println("sql 실행");
			while(rs.next()) {
				CenterDto dto = new CenterDto(rs.getString(1),rs.getString(2));
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("sql 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("db 종료");
		}
		
		return list;
	}
}
