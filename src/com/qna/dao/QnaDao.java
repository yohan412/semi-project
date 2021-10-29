package com.qna.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qna.dto.QnaDto;

import common.JDBCTemplate;

public class QnaDao extends JDBCTemplate{
	// 게시판 작성
		public List<QnaDto> selectAll() {
			Connection con = getConnection();
			PreparedStatement pstm = null;
			ResultSet rs = null;
			List<QnaDto> res = new ArrayList<QnaDto>();
			
			String sql = " SELECT * FROM QNA ORDER BY QA_NO DESC ";
			
			try {
				pstm = con.prepareStatement(sql);
				System.out.println("03.query 준비: " + sql);
				
				rs = pstm.executeQuery();
				System.out.println("04.query 실행 및 리턴");
				while(rs.next()) {
					QnaDto dto = new QnaDto();
					dto.setQano(rs.getInt(1));
					dto.setQagpno(rs.getInt(2));
					dto.setQagpsq(rs.getInt(3));
					dto.setUserid(rs.getString(4));
					dto.setUserno(rs.getInt(5));
					dto.setQatype(rs.getString(6));
					dto.setQatitle(rs.getString(7));
					dto.setQacontent(rs.getString(8));
					dto.setQafaq(rs.getString(9));
					dto.setQareg(rs.getDate(10));
					dto.setQastatus(rs.getString(11));
					
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
		
				
			public QnaDto selectOne(int qano) {
				Connection con = getConnection();
				PreparedStatement pstm = null;
				ResultSet rs = null;
				QnaDto res = new QnaDto();
				
				String sql = " SELECT * FROM QNA WHERE QA_NO=? ";
				
				try {
					pstm = con.prepareStatement(sql);
					pstm.setInt(1, qano);
					System.out.println("03.query 준비: " + sql);

					rs = pstm.executeQuery();
					System.out.println("04.query 실행 및 리턴");
					
					while(rs.next()) {
						res.setQano(rs.getInt(1));
						res.setQagpno(rs.getInt(2));
						res.setQagpsq(rs.getInt(3));
						res.setUserid(rs.getString(4));
						res.setUserno(rs.getInt(5));
						res.setQatype(rs.getString(6));
						res.setQatitle(rs.getString(7));
						res.setQacontent(rs.getString(8));
						res.setQafaq(rs.getString(9));
						res.setQareg(rs.getDate(10));
						res.setQastatus(rs.getString(11));
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
			public int insert(QnaDto dto) {
				Connection con = getConnection();
				PreparedStatement pstm = null;
				int res = 0;
				
				String sql = " INSERT INTO QNA "+ 
								" VALUES(QA_NOSQ.NEXTVAL,?,?,?,?,?,?,?.?,SYSDATE,? ) ";
						
				try {
					pstm = con.prepareStatement(sql);
					
					pstm.setInt(1, dto.getQagpno());
					pstm.setInt(2, dto.getQagpsq());
					pstm.setString(3, dto.getUserid());
					pstm.setInt(4, dto.getUserno());
					pstm.setString(5, dto.getQatype());
					pstm.setString(6,dto.getQatitle());
					pstm.setString(7, dto.getQacontent());
					pstm.setString(8, dto.getQafaq());
					pstm.setString(9, dto.getQastatus());
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

			public int update(QnaDto dto) {
				Connection con = getConnection();
				PreparedStatement pstm = null;
				int res = 0;

				String sql = " UPDATE QNA SET QA_NO.NEXTVAL,?,?,?,?,?,?,?,?,SYSDATE,? WHERE QA_NO=? ";
				
				try {
					pstm = con.prepareStatement(sql);
					pstm.setInt(1, dto.getQagpno());
					pstm.setInt(2, dto.getQagpsq());
					pstm.setString(3, dto.getUserid());
					pstm.setInt(4, dto.getUserno());
					pstm.setString(5, dto.getQatype());
					pstm.setString(6,dto.getQatitle());
					pstm.setString(7, dto.getQacontent());
					pstm.setString(8, dto.getQafaq());
					pstm.setString(9, dto.getQastatus());
					
					pstm.setInt(10, dto.getQano());
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
			
			public int delete(int uskno) {
				Connection con = getConnection();
				PreparedStatement pstm = null;
				int res = 0;
				
				String sql = " DELETE FROM QNA WHERE QA_NO=? ";
				
				try {
					pstm=con.prepareStatement(sql);
					pstm.setInt(1, uskno);
					System.out.println("03.query 준비: " + sql);
					
					res = pstm.executeUpdate();
					System.out.println("04.query 실행 및 리턴");
					
					if(res>0) {
						commit(con);
					}
					
				} catch (SQLException e) {
					System.out.println("3/4단계 에러");
					e.printStackTrace();
				}finally {
					close(pstm);
					close(con);
					System.out.println("05.db 종료\n");
				}
				return res;
			}
}
