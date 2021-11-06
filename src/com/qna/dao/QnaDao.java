package com.qna.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
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
			
			
			public List<QnaDto> getList(String qatype){	
				Connection con = getConnection();
				PreparedStatement pstm = null;
				ResultSet rs = null;
				
				String qa_type = "";
				
				if(qatype == "1") {
					qa_type = "가격";
				}else if(qatype == "2") {
					qa_type = "거래";
				}else if(qatype == "3") {
					qa_type = "시설";
				}else if(qatype == "4") {
					qa_type = "기타";
				}	
				
				String sql = " SELECT * FROM QNA WHERE QA_FAQ='Y' AND QA_TYPE='거래' ORDER BY QA_NO DESC ";
				ArrayList<QnaDto> list = new ArrayList<QnaDto>();
				
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
						
						list.add(dto);
					}
					
				} catch (SQLException e) {
					System.out.println("3/4 단계 에러");
					e.printStackTrace();
				}finally {
					close(pstm);
					close(rs);
					System.out.println("05.db 종료\n");
				}
				return list;
			}
			
			public List<QnaDto> selectType(String qatype) {
				Connection con = getConnection();
				PreparedStatement pstm = null;
				ResultSet rs = null;
				List<QnaDto> res = new ArrayList<QnaDto>();
				
				System.out.println("큐 타입 : " +qatype);
				
				String type = "";
				
				if(qatype.equals("1")) {
					type = "가격";
					System.out.println("type1 : " + type);
				}else if(qatype.equals("2")) {
					type = "거래";
					System.out.println("type2 : " + type);
				}else if(qatype.equals("3")) {
					type = "시설";
					System.out.println("type3 : " + type);
				}else if(qatype.equals("4")) {
					type = "기타";
					System.out.println("type4 : " + type);
				}
				
				System.out.println("type : " + type);
				
				
				String sql = " SELECT * FROM QNA WHERE QA_FAQ='Y' AND QA_TYPE=? ORDER BY QA_TYPE DESC";
				
				try {
					pstm = con.prepareStatement(sql);
					pstm.setString(1, type);
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
			
			public List<QnaDto> selectFaq() {
				Connection con = getConnection();
				PreparedStatement pstm = null;
				ResultSet rs = null;
				List<QnaDto> res = new ArrayList<QnaDto>();
				
				String sql = " SELECT * FROM QNA WHERE QA_FAQ='Y' ORDER BY QA_TYPE DESC";
				
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
			
			public int insert(QnaDto dto) {
				Connection con = getConnection();
				PreparedStatement pstm = null;
				int res = 0;
				
				String sql = " INSERT INTO QNA VALUES(QA_NOSQ.NEXTVAL,QA_GPNOSQ.NEXTVAL,?,?,?,?,?,?,'N',SYSDATE,'N') ";
				
						
				try {
					pstm = con.prepareStatement(sql);
					
					pstm.setInt(1, dto.getQagpsq());
					pstm.setString(2, dto.getUserid());
					pstm.setInt(3, dto.getUserno());
					pstm.setString(4, dto.getQatype());
					pstm.setString(5,dto.getQatitle());
					pstm.setString(6, dto.getQacontent());
					//pstm.setString(8, dto.getQafaq());
					//pstm.setString(9, dto.getQastatus());
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

			public int insertform(String qatitle, String userid, String qacontent) {
				Connection con = getConnection();
				PreparedStatement pstm = null;
				int res = 0;
				
				String sql = " INSERT INTO QNA VALUES(?,?,?) ";
				
						
				try {
					pstm = con.prepareStatement(sql);
					
					pstm.setString(1,qatitle);
					pstm.setString(2, userid);
					pstm.setString(3, qacontent);
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
			
			public int countAnswer(Connection con, int gpno, int gpsq) {
				PreparedStatement pstm = null;
				ResultSet rs = null;
				int res = 0;
				
				String sql = " SELECT COUNT(*) FROM QNA WHERE QA_GPNO=? AND QA_GPSQ>? ";
				
				try {
					pstm = con.prepareStatement(sql);
					pstm.setInt(1, gpno);
					pstm.setInt(2, gpsq);
					System.out.println("03. query 준비: " + sql);
					
					rs = pstm.executeQuery();
					System.out.println("04. query 실행 및 리턴");
					
					while(rs.next()) {
						res = rs.getInt(1);
					}
					
				} catch (SQLException e) {
					System.out.println("3/4 단계 에러");
					e.printStackTrace();
				}finally {
					close(rs);
					close(pstm);
				}
				return res;
			}

			public int updateAnswer(Connection con, int gpno, int gpsq) {
				PreparedStatement pstm = null;
				int res = 0;
				
				/*
				 * UPDATE ANSWERBOARD SET GROUPSQ = GROUPSQ + 1
				    WHERE GROUPNO = (SELECT GROUPNO FROM ANSWERBOARD WHERE BOARDNO=2 )
		     			AND GROUPSQ > (SELECT GROUPSQ FROM ANSWERBOARD WHERE BOARDNO=2 );
				 */
				String sql = " UPDATE QNA SET QA_GPSQ = QA_GPSQ + 1 "
							+   " WHERE QA_GPNO=? AND QA_GPSQ>? ";
				
				
				try {
					pstm = con.prepareStatement(sql);
					pstm.setInt(1, gpno);
					pstm.setInt(2, gpsq);
					System.out.println("03. query 준비: "+ sql);
					
					res = pstm.executeUpdate();
					System.out.println("04. query 실행 및 리턴");
					
				} catch (SQLException e) {
					System.out.println("3/4 단계 에러");
					e.printStackTrace();
				}finally {
					close(pstm);
				}
				return res;
			}

			public int insertAnswer(Connection con, QnaDto dto) {
				PreparedStatement pstm = null;
				int res = 0;
				
				/*
				 * INSERT INTO QNA
					VALUES(QA_NOSQ.NEXTVAL,
								(SELECT QA_GPNO FROM QNA WHERE QA_NO=2),
								(SELECT QA_GPSQ FROM QNA WHERE QA_NO=2)+1,
								(SELECT TITLETAB FROM QNA WHERE QA_NO=2)+1,
								'RE:두번째 글','2번글에 답글입니다(2)','유저2',SYSDATE
					);
				 */
				String sql = " INSERT INTO QNA VALUES(QANOSQ.NEXTVAL,?,?,?,?,?,?,?,?,SYSDATE,?) ";
				
				try {
					pstm = con.prepareStatement(sql);
					pstm.setInt(1, dto.getQagpno());
					pstm.setInt(2, dto.getQagpsq()+1);
					pstm.setInt(3, dto.getTitletab()+1);
					pstm.setString(4, dto.getUserid());
					pstm.setInt(5, dto.getUserno());
					pstm.setString(6, dto.getQatype());
					pstm.setString(7, dto.getQatitle());
					pstm.setString(8, dto.getQacontent());
					pstm.setString(9, dto.getQafaq());
					pstm.setString(10, dto.getQastatus());
					System.out.println("03. query 준비:" + sql);
					
					res= pstm.executeUpdate();
					System.out.println("04. query 실행 및 리턴");
					
				} catch (SQLException e) {
					System.out.println("3/4 단계 에러");
					e.printStackTrace();
				} finally {
					close(pstm);
				}
				
				return res;
			}
			
			public boolean answerLogic(QnaDto dto) {
				Connection con = getConnection();
				
				int parentgpno = dto.getQagpno();
				int parentgpsq = dto.getQagpsq();
				
				// update
				int countRes = countAnswer(con, parentgpno, parentgpsq);
				int updateRes = updateAnswer(con, parentgpno, parentgpsq);
				
				System.out.println("countRes: " + countRes);
				System.out.println("updateRes: " + updateRes);
				System.out.println("count == update : " + (countRes == updateRes));
				
				// insert
				int insertRes = insertAnswer(con, dto);
				
				if(countRes == updateRes && insertRes>0) {
					commit(con);
				}else {
					rollback(con);
				}
				
				close(con);
				System.out.println("05.db 종료\n");
				
				return(countRes==updateRes && insertRes>0)?true:false;
			}
		}
