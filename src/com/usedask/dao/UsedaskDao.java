package com.usedask.dao;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.usedask.dto.UsedaskDto;

import common.JDBCTemplate;

public class UsedaskDao extends JDBCTemplate{
	// 게시판 작성
	public List<UsedaskDto> selectAll() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<UsedaskDto> res = new ArrayList<UsedaskDto>();
		
		String sql = " SELECT * FROM USED_ASK ORDER BY USK_NO DESC ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03.query 준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
			while(rs.next()) {
				UsedaskDto dto = new UsedaskDto();
				dto.setUskno(rs.getInt(1));
				dto.setUsedno(rs.getInt(2));
				dto.setUsktype(rs.getString(3));
				dto.setUskgpno(rs.getInt(4));
				dto.setUskgpsq(rs.getInt(5));
				dto.setUserid(rs.getString(6));
				dto.setUskcontent(rs.getString(7));
				dto.setUskreg(rs.getDate(8));
				dto.setUskstatus(rs.getString(9));
				
				res.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05.db 종료\n");
		}
		return res;
	}
	
			
		public UsedaskDto selectone(int uskno) {
			Connection con = getConnection();
			PreparedStatement pstm = null;
			ResultSet rs = null;
			UsedaskDto res = new UsedaskDto();
			
			String sql = " SELECT * FROM USED_ASK WHERE USK_NO=? ";
			
			try {
				pstm = con.prepareStatement(sql);
				pstm.setInt(1, uskno);
				System.out.println("03.query 준비: " + sql);

				rs = pstm.executeQuery();
				System.out.println("04.query 실행 및 리턴");
				
				while(rs.next()) {
					res.setUskno(rs.getInt(1));
					res.setUsedno(rs.getInt(2));
					res.setUsktype(rs.getString(3));
					res.setUskgpno(rs.getInt(4));
					res.setUskgpsq(rs.getInt(5));
					res.setUserid(rs.getString(6));
					res.setUskcontent(rs.getString(7));
					res.setUskreg(rs.getDate(8));
					res.setUskstatus(rs.getString(9));
				}
				
			} catch (SQLException e) {
				System.out.println("3/4 단계 에러");
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstm);
				close(con);
				System.out.println("05.db 종료\n");
			}
			return res;
		}
		public int insert(UsedaskDto dto) {
			Connection con = getConnection();
			PreparedStatement pstm = null;
			int res = 0;
			
			String sql = " INSERT INTO USED_ASK "+ 
							" VALUES(USK_NOSQ.NEXTVAL, USED_NOSQ.NEXTVAL, ?, USK_GPNOSQ.NEXTVAL, USK_GPSQ.NEXTVAL, ?, ?, SYSDATE, ?) ";
					
			System.out.println("03.query 준비 : " + sql);
			
			try {
				pstm = con.prepareStatement(sql);
				pstm.setString(1, dto.getUsktype());
				pstm.setString(2, dto.getUserid());
				pstm.setString(3, dto.getUskcontent());
				pstm.setString(4, dto.getUskstatus());
				System.out.println("03.query 준비: " + sql);
				
				res = pstm.executeUpdate();
				System.out.println("04.query 실행 및 리턴");
				
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
				System.out.println("05.db 종료\n");
			}
			return res;
		}

		public int update(UsedaskDto dto) {
			Connection con = getConnection();
			PreparedStatement pstm = null;
			int res = 0;
			
			/*
			 CREATE TABLE USED_ASK(
				USK_NO NUMBER PRIMARY KEY,
				USED_NO NUMBER NOT NULL,
				USK_TYPE VARCHAR2(50) NOT NULL,
				USK_GPNO NUMBER NOT NULL,
				USK_GPSQ NUMBER NOT NULL,
				USER_ID VARCHAR2(500) NOT NULL,
				USK_CONTENT VARCHAR2(4000) NOT NULL,
				USK_REG DATE NOT NULL,
				USK_STATUS VARCHAR2(2) DEFAULT 'N' CHECK(USK_STATUS IN('Y','N')),
				CONSTRAINT FK_USED_NO FOREIGN KEY(USED_NO) REFERENCES USED_BOARD(USED_NO),
				CONSTRAINT FK_USER_ID4 FOREIGN KEY(USER_ID) REFERENCES USER_INFO(USER_ID)
			);
			 * */
			String sql = " UPDATE USED_ASK SET USK_NO.NEXTVAL, USED_NO.NEXTVAL, USK_TYPE=?, USK_GPNO.NEXTVAL, USK_GPSQ.NEXTVAL, USER_ID=?, USK_CONTENT=?, SYSDATE, USK_STATUS=? WHERE USKNO=? ";
			
			try {
				pstm = con.prepareStatement(sql);
				pstm.setString(1, dto.getUsktype());
				pstm.setString(2, dto.getUserid());
				pstm.setString(3, dto.getUskcontent());
				pstm.setString(4, dto.getUskstatus());
				pstm.setInt(5, dto.getUskno());
				System.out.println("03.query 준비: " + sql);
				
				res = pstm.executeUpdate();
				System.out.println("04.query 실행 및 리턴");
				
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
				System.out.println("05.db 종료\n");
			}
			
			return res;
		}


	}
