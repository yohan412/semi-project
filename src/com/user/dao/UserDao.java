package com.user.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.answer.dto.AnswerDto;
import com.user.dto.UserDto;

public class UserDao {

	public UserDto login(String user_id, String user_pw) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		UserDto res = new UserDto();
		
		String sql = " SELECT * FROM USER_INFO WHERE USER_ID=? AND USER_PW=? AND USER_ENABLED=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, user_id);
			pstm.setString(2, user_pw);
			pstm.setString(3, "N");
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
				res.setReg(rs.getDate(12));
				res.setUserenabled(rs.getString(13));
				res.setUserwish(rs.getString(14));
				
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n ");
		}
		return res;
	}

	
	public String idChk(String id) {
		Connection con = getConnection();
		PreparedStatement pstm =null;
		ResultSet rs = null;
		String res =null;
		
		String sql ="SELECT * FROM USER_INFO WHERE USER_ID=?";
		
		try {
			pstm=con.prepareStatement(sql);
			pstm.setString(1, id);
			System.out.println("03.query 준비: "+sql);
			
			rs=pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
			
			while(rs.next()) {
				res=rs.getString(2);
			}
		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05.db 종료");
		}
		
		return res;
	}
	
	public int insertUser(UserDto dto) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res=0;
		
		String sql = "INSERT INTO USER_INFO VALUES(USER_NOSQ.NEXTVAL,?,?,?,?,?,?,?,?,?,'GU',SYSDATE,'N','')";
		
		try {
			pstm=con.prepareStatement(sql);
			pstm.setString(1, dto.getUserid());
			pstm.setString(2, dto.getUserpw());
			pstm.setString(3, dto.getUsername());
			pstm.setString(4, (dto.getUsergender().equals("남자"))? "M":"F");
			pstm.setString(5, dto.getUserbirthdate());
			pstm.setString(6, dto.getUseremail());
			pstm.setString(7, dto.getUserphone());
			pstm.setString(8, dto.getUserzip());
			pstm.setString(9, dto.getUseraddr());
			System.out.println("03.query 준비: "+sql);
			
			res=pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}else {
				rollback(con);
			}
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

	public boolean delete(int userno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE USER_INFO SET USER_ENABLED = 'Y' WHERE USER_NO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, userno);
			System.out.println("03. query 준비 : " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}else {
				rollback(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return (res>0)?true:false;
	}

	public int update(UserDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE USER_INFO SET USER_NAME=?, USER_ID=?, USER_PW=?, USER_PHONE=?, USER_EMAIL=?, USER_ADDR=? WHERE USER_NO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getUsername());
			pstm.setString(2, dto.getUserid());
			pstm.setString(3, dto.getUserpw());
			pstm.setString(4, dto.getUserphone());
			pstm.setString(5, dto.getUseremail());
			pstm.setString(6, dto.getUseraddr());
			pstm.setInt(7, dto.getUserno());
			System.out.println("03. query 준비 : " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}else {
				rollback(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return res;
	}
	
<<<<<<< HEAD
	public UserDto selectOne(int userno) {
		
=======
	public UserDto selectUser(int userno) {
>>>>>>> d8b111baa556c5a3d69e69e0a3131418253c3897
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		UserDto res = new UserDto();
		
<<<<<<< HEAD
		String sql ="SELECT * FROM USER_INFO WHERE USER_NO=?";
		
		try {
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, userno);
			System.out.println("03.query 준비: "+sql);
			
			rs=pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
=======
		String sql = " SELECT * FROM USER_INFO WHERE USER_NO = ? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, userno);
			System.out.println("03. query 준비 : " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
>>>>>>> d8b111baa556c5a3d69e69e0a3131418253c3897
			
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
				res.setReg(rs.getDate(12));
				res.setUserenabled(rs.getString(13));
<<<<<<< HEAD
				res.setUserwish(rs.getString(14));
				
			}
		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
=======
				res.setUserwish(rs.getString(14));				
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
>>>>>>> d8b111baa556c5a3d69e69e0a3131418253c3897
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
<<<<<<< HEAD
			System.out.println("05.db 종료");
		}
		
		return res;
	}

=======
			System.out.println("05. db 종료\n");
		}
		return res;
	}
>>>>>>> d8b111baa556c5a3d69e69e0a3131418253c3897
	
}
