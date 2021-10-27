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
import com.usedask.dao.UsedaskDao;
import com.usedask.dto.UsedaskDto;

@WebServlet("/usedcontroller")
public class UsedController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command= request.getParameter("command");
		System.out.println("[command: "+command+"]");
		
		UsedaskDao dao = new UsedaskDao();
		
		if(command.equals("boardlist")) {
			List<UsedaskDto> boardlist = dao.selectAll();
			request.setAttribute("boardlist", boardlist);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("question_board_update.jsp");
			dispatch.forward(request, response);
			
		}else if(command.equals("question_board_update")) {
			String usktype = request.getParameter("usktype");
			String userid = request.getParameter("userid");
			String uskcontent = request.getParameter("uskcontent");
			String uskstatus = request.getParameter("uskstatus");
		}
		
	}
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
