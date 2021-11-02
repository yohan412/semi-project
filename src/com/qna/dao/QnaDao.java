package com.qna.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



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
					
					if(rs.next()) {
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
								" VALUES(QA_NOSQ.NEXTVAL,?,?,?,?,?,?,?,?,SYSDATE,? ) ";
				
						
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
					
					System.out.println("pstm : " + pstm);
					
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

				String sql = " UPDATE QNA SET QA_TITLE=?,QA_CONTENT=? WHERE QA_NO=? ";
				
				try {
					pstm = con.prepareStatement(sql);
					pstm.setString(1,dto.getQatitle());
					pstm.setString(2, dto.getQacontent());
					pstm.setInt(3, dto.getQano());
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
			
			public int delete(int qano) {
				Connection con = getConnection();
				PreparedStatement pstm = null;
				int res = 0;
				
				String sql = " DELETE FROM QNA WHERE QA_NO=? ";
				
				try {
					pstm=con.prepareStatement(sql);
					pstm.setInt(1, qano);
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
			
			
			
////////////////////////////////////////////////////////////////////////
	// 싱글톤
	private static QnaDao instance = new QnaDao();
	
	public static QnaDao getInstance() {
			return instance;
	}

	public List<QnaDto> getList() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<QnaDto> res = null;
		
		String sql = "select * from qna order by qano desc";
		
		try {
			pstm = con.prepareStatement(sql); 
			System.out.println("03.query 준비: " + sql);
			
			rs = pstm.executeQuery(); 
			System.out.println("04.query 실행 및 리턴");
			
			if (rs.next()) { 
				res = new ArrayList<>(); 
				do {
					QnaDto dto = new QnaDto();
					dto.setQano(rs.getInt("qano"));
					dto.setQagpno(rs.getInt("qagpno"));
					dto.setQagpsq(rs.getInt("qagpsq"));
					dto.setUserid(rs.getString("userid"));
					dto.setUserno(rs.getInt("userno"));
					dto.setQatitle(rs.getString("qatitle"));
					dto.setQacontent(rs.getString("qacontent"));
					dto.setQafaq(rs.getString("qafaq"));
					dto.setQareg(rs.getDate("qareg"));
					dto.setQastatus(rs.getString("qastatus"));
					
					res.add(dto); 
					
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
			
		} finally {
			close(pstm);
			close(con);
			System.out.println("05.db 종료\n");
		}
		return res;
	}

	// qna.jsp에 보여줄 로직 (페이징 처리)
		public List<QnaDto> getList(int startRow, int endRow){
			Connection con = getConnection();
			PreparedStatement pstm = null;
			ResultSet rs = null;
			List<QnaDto> res = null;
				
			String sql = "select * from "
					+ "(select rownum rn, qano, qagpno, qagpsq, userid, userno, qatype, qatitle, qacontent, qafaq, qareg, qastatus from "
					+ "(select * from qna order by qano desc)) where rn between ? and ?";
				
			try {
				pstm = con.prepareStatement(sql); // sql 정의
				pstm.setInt(1, startRow); // sql 물음표에 값 매핑
				pstm.setInt(2, endRow);
				System.out.println("03.query 준비: " + sql);
					
				rs = pstm.executeQuery(); // sql 실행
				System.out.println("04.query 실행 및 리턴");
				
				if (rs.next()) { // 데이터베이스에 데이터가 있으면 실행
					res = new ArrayList<>(); // list 객체 생성
					do {
					// 반복할 때마다 QnaDto 객체를 생성 및 데이터 저장
						QnaDto dto = new QnaDto();
						dto.setQano(rs.getInt("qano"));
						dto.setQagpno(rs.getInt("qagpno"));
						dto.setQagpsq(rs.getInt("qagpsq"));
						dto.setUserid(rs.getString("userid"));
						dto.setUserno(rs.getInt("userno"));
						dto.setQatitle(rs.getString("qatitle"));
						dto.setQacontent(rs.getString("qacontent"));
						dto.setQafaq(rs.getString("qafaq"));
						dto.setQareg(rs.getDate("qareg"));
						dto.setQastatus(rs.getString("qastatus"));
						
						res.add(dto); // res에 0번 인덱스부터 board 객체의 참조값을 저장
							
					} while (rs.next());
				}
			} catch (Exception e) {
				System.out.println("3/4 단계 에러");
				e.printStackTrace();
					
			} finally {
				close(pstm);
				close(con);
				System.out.println("05.db 종료\n");
			}
			return res;
		}
			
	// 총 레코드 수 구하는 로직
		public int getCount(){
			Connection con = getConnection();
			PreparedStatement pstm = null;
			ResultSet rs = null;
			int count = 0;
				
			String sql = "select count(*) from qna ";
			try {
				pstm = con.prepareStatement(sql);
				System.out.println("03.query 준비: " + sql);
				
				rs = pstm.executeQuery();
				System.out.println("04.query 실행 및 리턴");
					
				if(rs.next()){
					count = rs.getInt(1);
				}
					
			} catch (Exception e) {
				System.out.println("3/4 단계 에러");
				e.printStackTrace();
					
			} finally {
				close(rs);
				close(pstm);
				close(con);
				System.out.println("05.db 종료\n");
			}	
			return count; // 총 레코드 수 리턴
		}
}
