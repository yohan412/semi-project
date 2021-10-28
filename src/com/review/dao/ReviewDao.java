package com.review.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.review.dto.ReviewDto;

import common.JDBCTemplate;

public class ReviewDao extends JDBCTemplate{
	
	public List<ReviewDto> selectAll(int centerno){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<ReviewDto> res = new ArrayList<ReviewDto>();
		
		String sql = "SELECT * FROM REVIEW WHERE CENTER_NO=?";
		
		try {
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, centerno);
			System.out.println("03. query 준비 : "+sql);
			
			rs=pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				ReviewDto tmp = new ReviewDto();
				
				tmp.setReviewno(rs.getInt(1));
				tmp.setCenterno(rs.getInt(2));
				tmp.setReviewwriter(rs.getString(3));
				tmp.setReviewgrade(rs.getDouble(4));
				tmp.setReviewcontent(rs.getString(5));
				tmp.setReviewreg(rs.getDate(6));
				
				res.add(tmp);
			}
		} catch (SQLException e) {
			System.out.println("error: 3/4 단계 failed");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
		}
		return res;
	}
	
	public int insert (ReviewDto dto , int centerno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res=0;
		
		String sql = "INSERT INRO REVIEW VALUES(REVIEW_NOSQ.NEXTVAL,?,?,?,?,SYSDATE)";
		
		try {
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, centerno);
			pstm.setString(2, dto.getReviewwriter());
			pstm.setDouble(3, dto.getReviewgrade());
			pstm.setString(4, dto.getReviewcontent());
			System.out.println("03. query 준비 : "+sql);
			
			res=pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
		} catch (SQLException e) {
			System.out.println("error : 3/4 단계 failed");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}
		return res;
	}
}
