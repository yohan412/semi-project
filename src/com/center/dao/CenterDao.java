package com.center.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.center.dto.CenterDto;

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
				tmp.setCentername(rs.getString(2));
				tmp.setCenteraddr(rs.getString(3));
				tmp.setCenterprice(rs.getString(4));
				tmp.setCentercategory(rs.getString(5));
				tmp.setCentergrade(rs.getDouble(6));
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
	
	public CenterDto selectOne(int centerno) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		CenterDto res = new CenterDto();
		
		String sql = " SELECT * FROM CENTER WHERE CENTER_NO = ?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, centerno);
			System.out.println("03. query 준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				res.setCenterno(rs.getInt(1));
				res.setCentername(rs.getString(2));
				res.setCenteraddr(rs.getString(3));
				res.setCenterprice(rs.getString(4));
				res.setCentercategory(rs.getString(5));
				res.setCentergrade(rs.getDouble(6));
				res.setCentercontent(rs.getString(8));
				res.setCenterreg(rs.getDate(9));
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	
	public int centerdetail_writer(CenterDto dto) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
	
		int res =0;
		
		String sql = "INSERT INTO CENTER VALUES(CENTER_NOSQ.NEXTVAL,?,?,?,?,0,?,?,?,?,SYSDATE)";
		
		try {
			pstm = con.prepareStatement(sql);
			
			pstm.setString(1, dto.getCentername());
			pstm.setString(2, dto.getCenteraddr());
			pstm.setString(3, dto.getCenterprice());
			pstm.setString(4, dto.getCentercategory());
			pstm.setString(5, dto.getCenterintro());
			pstm.setString(6, dto.getCentercontent());
			pstm.setString(7, dto.getCenterophour());
			pstm.setString(8, dto.getCenterpro());
			System.out.println("03.query 준비: "+sql);
			
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 준비");
			
		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05.db 종료");
		}
		
		return res;
	}
	
	public int insert_pic(int centerno,String imgname,String imgpath) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res=0;
		
		String sql = " INSERT INTO CENTER_PIC VALUES(?,?,?)";
		
		try {
			pstm = con.prepareStatement(sql);
			
			pstm.setInt(1, centerno);
			pstm.setString(2, imgname);
			pstm.setString(3, imgpath);
			System.out.println("03.query 준비: "+sql);
			
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 준비");
			
		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05.db 종료");
		}
		
		return res;
	}
	
	public int selectno(String centername) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int res=0;
		
		System.out.println(centername);
		String sql = " SELECT * FROM CENTER WHERE CENTER_NAME = ?";
		
		try {
			pstm=con.prepareStatement(sql);
			pstm.setString(1,centername);
			System.out.println("03.query 준비: "+sql);
			
			rs=pstm.executeQuery();
			System.out.println("04.query 실행 및 준비");
			
			while(rs.next()) {
				res = rs.getInt("CENTER_NO");
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05.db 종료");
		}
		
		return res;
	}
}