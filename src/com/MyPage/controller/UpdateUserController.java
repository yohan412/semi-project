package com.MyPage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/update.me")
public class UpdateUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public UpdateUserController() {
        super();
        
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String USER_NAME = request.getParameter("USER_NAME");
		String USER_ID = request.getParameter("USER_ID");
		String USER_PHONE = request.getParameter("USER_PHONE");
		String USER_EMAIL = request.getParameter("USER_EMAIL");
		String USER_ADDR = request.getParameter("USER_ADDR");

        User user = new User(USER_NAME,USER_ID,USER_PHONE,USER_EAMIL,USER_ADDR);
        }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public USER(String USER_ID,) {
		super();
		this.USER_NAME = USER_NAME;
		this.USER_ID = USER_ID;
		this.USER_PHONE = USER_PHONE;
		this.USER_EMAIL = USER_EMAIL;
		this.USER_ADDR = USER_ADDR;
		
	}
	User updateUSER = new USERService().updateUser(user);
}
