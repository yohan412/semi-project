package com.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.dao.UserDao;

@WebServlet("/usercontroller")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("[ command : " + command + "]");
		
		UserDao dao = new UserDao();
		
		if(command.equals("loginform")) {
			dispatch("login.jsp",request,response);
		}else if(command.equals("idChk")) {
			String myid=request.getParameter("id");
			String res = dao.idChk(myid);
			
			boolean idnotused=true;
			
			//중복되는 경우가 있을경우
			if(res!=null){ 
				idnotused=false;
			}
			
			response.sendRedirect("idchk.jsp?idnotused="+idnotused);
		}else if(command.equals("login")){
			String user_id = request.getParameter("user_id");
			String user_pw = request.getParameter("user_pw");
			
			UserDto dto = dao.login(user_id, user_pw);
			
			if(dto.getUserid() != null) {
				
				HttpSession session = request.getSession();
				session.setAttribute("dto", dto);
				session.setMaxInactiveInterval(60*60);
				dispatch("main.jsp",request,response);
			
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

}

