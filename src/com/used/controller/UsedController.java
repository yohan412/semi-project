package com.used.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.used.dao.UsedDao;
import com.used.dto.UsedDto;

@WebServlet("/usedcontroller")
public class UsedController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command= request.getParameter("command");
		System.out.println("[command: "+command+"]");
		
		UsedDao dao = new UsedDao();
		
		if(command.equals("usedlist")) {
			List<UsedDto> usedlist = dao.selectAll();
			request.setAttribute("usedlist", usedlist);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("used_list.jsp");
			dispatch.forward(request, response);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
