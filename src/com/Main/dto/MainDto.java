package com.Main.dto;

import java.sql.SQLException;

import com.user.dto.UserDto;

public class MainDto {

public int update(UserDto dto) {
	int cnt = 0;
	
	getConnection();
	
	String sql = "update user set username=?, userphone=?, useraddr=? where email=?";
	
	try {
		psmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, user.getUsername());
		pstmt.setString(3, user.getuserphone());
		pstmt.setString(4, user.getuseremail());
		pstmt.setString(5, user.getUseraddr());
		
		cnt = psmt.executeUpdate(); 
		
		}catch (SQLException e)
		{ 
			e.printStackTrace(); 
		} finally{ 
				close();
		} 
		 return cnt; 
		}

private void getConnection() {
	
}

}}
