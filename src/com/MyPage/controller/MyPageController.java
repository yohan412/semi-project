package com.MyPage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.MyPage.controller.HttpSession;

@WebServlet("MyPage.me")
public class MyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MyPageController() {
      
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("WebContent/mypage_update.jsp");
		view.forward(request, response);
	HttpSession session = request.getSession();
	
	
	USER user = new UserService().selectUser(loginUSERid);
	
	String page = null;
	if(member != null) {
		page = "WebContent/Mypage.jsp");
		request.setAttribute("user", user);
	}else {
		page ="WebContent/"
		
	}
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}

