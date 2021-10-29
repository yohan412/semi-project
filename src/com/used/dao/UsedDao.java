package com.used.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.used.dto.UsedDto;

import common.JDBCTemplate;

public class UsedDao extends JDBCTemplate{
	public List<UsedDto> selectAll(){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<UsedDto> res = new ArrayList<UsedDto>();
		
		String sql = "SELECT * FROM USED_BOARD";
		
		try {
			pstm=con.prepareStatement(sql);
			System.out.println("03. query 준비: " + sql);
			
			rs=pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				UsedDto dto = new UsedDto();
				
				dto.setUsedno(rs.getInt(1));
				dto.setUsedtitle(rs.getString(2));
				dto.setUserid(rs.getString(3));
				dto.setUserno(rs.getInt(4));
				dto.setUsedaddr(rs.getString(5));
				dto.setUsedprice(rs.getString(6));
				dto.setUsedcategory(rs.getString(7));
				dto.setUsedpic(rs.getString(8));
				dto.setUsedcenternm(rs.getString(9));
				dto.setUsedcontent(rs.getString(10));
				dto.setUsedreg(rs.getDate(11));
				dto.setUsedstatus(rs.getString(12));
				
				res.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
		}
		return res;
	}
}
