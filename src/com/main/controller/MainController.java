package com.main.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.qna.dao.QnaDao;
import com.qna.dto.QnaDto;
import com.user.dao.UserDao;
import com.user.dto.UserDto;


@WebServlet("/MainController")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");
		System.out.println("[command : " + command + "]");		
		
		UserDao dao = new UserDao();
		QnaDao udao = new QnaDao();
			
		if(command.equals("updatestart")) {
			int userno = Integer.parseInt(request.getParameter("userno"));
			dispatch("mypage_update.jsp",request,response);
			
		}else if(command.equals("update")) {
			int userno = Integer.parseInt(request.getParameter("userno"));
			String name = request.getParameter("name");
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String addr = request.getParameter("addr");
			
			UserDto dto = new UserDto();
			dto.setUserno(userno);
			dto.setUsername(name);
			dto.setUserid(id);
			dto.setUserpw(pw);
			dto.setUserphone(phone);
			dto.setUseremail(email);
			dto.setUseraddr(addr);
			
			int res = dao.update(dto);
			
			if(res>0) {
                jsResponse("회원 수정 성공","MainController?command=updateinfo&userno="+userno,response);
			}else {
				jsResponse("회원 수정 실패","MainController?command=update",response);
			}
			
		}else if(command.equals("qna")) {
			List<QnaDto> list = udao.selectAll();
			
			request.setAttribute("list", list);
			RequestDispatcher disp = request.getRequestDispatcher("qna.jsp");
			disp.forward(request, response);
			
		}else if(command.equals("detail")) {
			int qano = Integer.parseInt(request.getParameter("qano"));
			
			QnaDto dto = udao.selectOne(qano);
			
			request.setAttribute("dto", dto);
			RequestDispatcher dis = request.getRequestDispatcher("question_board_detail.jsp");
			dis.forward(request, response);
			
		}else if(command.equals("writeform")) {
			response.sendRedirect("question_board_write.jsp");
			
		}else if(command.equals("boardwrite")) {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			//String photo = request.getParameter("photo");
			String userid = request.getParameter("user_id");
			int userno = Integer.parseInt(request.getParameter("user_no"));
			int gpno = Integer.parseInt(request.getParameter("qa_gpno"));
			int gpsq = Integer.parseInt(request.getParameter("qa_gpsq"));
			String qafaq = request.getParameter("qa_faq");
			String qastatus = request.getParameter("qa_status");
			String qatype = request.getParameter("qa_type");
			
			
			QnaDto dto = new QnaDto();
			dto.setQagpno(gpno);
			dto.setQagpsq(gpsq);
			dto.setQatitle(title);
			dto.setQacontent(content);
			dto.setUserno(userno);
			dto.setUserid(userid);
			dto.setQafaq(qafaq);
			dto.setQastatus(qastatus);
			dto.setQatype(qatype);
			//dto.setQapic(photo);
			
			int res = udao.insert(dto);
			if(res>0) {
				dispatch("MainController?command=qna",request,response);
			}else {
				dispatch("MainController?command=writeform",request,response);
			}
			
		}else if(command.equals("updateform")) {
			int qano = Integer.parseInt(request.getParameter("qano"));
			
			QnaDto dto = udao.selectOne(qano);
			request.setAttribute("dto", dto);
			dispatch("question_board_update.jsp", request, response);
			
		}else if(command.equals("boardupdate")) {
			int qano = Integer.parseInt(request.getParameter("qano"));
			
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			//String photo = request.getParameter("photo");
			
			QnaDto dto = new QnaDto();
			dto.setQatitle(title);
			dto.setQacontent(content);
			//dto.setQapic(photo);
			
			int res = udao.update(dto);
			 
			if(res>0) {
				dispatch("MainController?command=list",request,response);
			}else {
				dispatch("MainController?command=detail&qano="+qano,request,response);
			}
			
		}else if(command.equals("delete")) {
			int qano = Integer.parseInt(request.getParameter("qano"));
			
			int res = udao.delete(qano);
			
			// 성공 시 qna 페이지로 이동, 실패 시 상세페이지로 이동
			if(res>0) {
				dispatch("MainController?command=list", request, response);
			}else {
				dispatch("MainController?command=detail&qano="+qano, request, response);
			}
		}
	}

	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher(url);
		dis.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void jsResponse(String msg, String url,HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>"+"alert('"+msg+"');"+"location.href='"+url+"';"+"</script>";
		
		PrintWriter out = response.getWriter();
		out.print(s);
	}

}
