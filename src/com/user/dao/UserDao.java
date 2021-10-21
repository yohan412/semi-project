package com.user.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.user.dto.UserDto;

public class UserDao {

	public UserDto login(String user_id, String user_pw) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		UserDto res = new UserDto();
		
		String sql = " SELECT * FROM USER_IMFO WHERE USER_ID=? AND USER_PW=? AND USER_ENABLED=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, user_id);
			pstm.setString(2, user_pw);
			pstm.setString(3, "Y");
			System.out.println("03. query 준비 : " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				res.setUserno(rs.getInt(1));
				res.setUserid(rs.getString(2));
				res.setUserpw(rs.getString(3));
				res.setUsername(rs.getString(4));
				res.setUsergender(rs.getString(5));
				res.setUserbirthdate(rs.getString(6));
				res.setUseremail(rs.getString(7));
				res.setUserphone(rs.getString(8));
				res.setUserzip(rs.getString(9));
				res.setUseraddr(rs.getString(10));
				res.setRole(rs.getString(11));
				res.setUserenabled(rs.getString(12));
				
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료 ");
		}
		return res;
	}

	
}
