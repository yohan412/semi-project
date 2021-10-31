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
				dto.setUsedcenternm(rs.getString(8));
				dto.setUsedcontent(rs.getString(9));
				dto.setUsedreg(rs.getDate(10));
				dto.setUsedstatus(rs.getString(11));
				
				res.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return res;
	}
	
	public UsedDto selectOne(int usedno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		UsedDto res = new UsedDto();
		
		String sql = "SELECT * FROM USED_BOARD WHERE USED_NO=?";
		
		try {
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, usedno);
			System.out.println("03. query 준비 : "+sql);
			
			rs=pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				
				res.setUsedno(rs.getInt(1));
				res.setUsedtitle(rs.getString(2));
				res.setUserid(rs.getString(3));
				res.setUserno(rs.getInt(4));
				res.setUsedaddr(rs.getString(5));
				res.setUsedprice(rs.getString(6));
				res.setUsedcategory(rs.getString(7));
				res.setUsedcenternm(rs.getString(8));
				res.setUsedcontent(rs.getString(9));
				res.setUsedreg(rs.getDate(10));
				res.setUsedstatus(rs.getString(11));
				
			}
		} catch (SQLException e) {
			System.out.println("error : 3/4단계 failed");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료");
		}
		return res;
	}
}
