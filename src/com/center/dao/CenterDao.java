package com.center.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.center.dto.CenterDto;
import com.user.dto.UserDto;

import common.JDBCTemplate;


public class CenterDao extends JDBCTemplate{

	//센터 목록
	public List<CenterDto> selectAll(){
		Connection con = getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		List<CenterDto> res = new ArrayList<CenterDto>();
		
		String sql = " SELECT * FROM CENTER ORDER BY CENTER_NO DESC";
		
		try {
			stmt = con.createStatement();
			System.out.println("03. query 준비: " + sql);
			
			rs = stmt.executeQuery(sql);
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				CenterDto tmp = new CenterDto();
				tmp.setCenterno(rs.getInt(1));
				tmp.setCentertitle(rs.getString(2));
				tmp.setCenteraddr(rs.getString(3));
				tmp.setCenterprice(rs.getString(4));
				tmp.setCentercategory(rs.getString(5));
				tmp.setCenterpic(rs.getString(6));
				tmp.setCentername(rs.getString(7));
				tmp.setCentercontent(rs.getString(8));
				tmp.setCenterreg(rs.getDate(9));
				
				res.add(tmp);
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	

}