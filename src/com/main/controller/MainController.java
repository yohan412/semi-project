package com.main.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.dto.MainDto;
import com.user.dao.UserDao;
import com.user.dto.UserDto;


@WebServlet("/MainController")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		UserDao dao = new UserDao();

		String command = request.getParameter("command");
		System.out.println("[command : " + command + "]");
		
			
		if(command.equals("update")) {
			int userno = Integer.parseInt(request.getParameter("userno"));
			String name = request.getParameter("name");
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String addr = request.getParameter("addr");
			
			MainDto dto = new MainDto();
			dto.setUserno(userno);
			dto.setUsername(name);
			dto.setUserid(id);
			dto.setUserpw(password);
			dto.setUserphone(phone);
			dto.setUsereamil(email);
			dto.setUseraddr(addr);
			
			int res = dao.update(dto);
			
			if(res>0) {
				jsResponse("회원 수정 성공","mypage.jsp",response);
			}else {
				jsResponse("회원 수정 실패","MainController?command=update",response);
			}
			
		}else if(command.equals("delete")) {
			int userno = Integer.parseInt(request.getParameter("userno"));
			
			boolean res = dao.delete(userno);
			
			if(res) {
				jsResponse("회원 탈퇴 성공","usercontroller?command=logout",response);
			}else {
				jsResponse("회원 탈퇴 실패","MainController?command=update",response);
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