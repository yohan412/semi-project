package com.center.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.center.dao.CenterDao;
import com.center.dto.CenterDto;


@WebServlet("/CenterController")
public class CenterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command= request.getParameter("command");
		System.out.println("[command: "+command+"]");
		
		CenterDao dao = new CenterDao();
		
		if(command.equals("centerlist")) {
			List<CenterDto> centerlist = dao.selectAll();
			request.setAttribute("centerlist", centerlist);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("center_list.jsp");
			dispatch.forward(request, response);
		}else if(command.equals("join_biz")) {
			String usernm = request.getParameter("usernm");
			String biznm = request.getParameter("biznm");
			String bizaddr = request.getParameter("bizaddr");
			String bizcategory = request.getParameter("health")+((request.getParameter("health")!=null)?","+request.getParameter("pilates"):request.getParameter("pilates"))
					+((request.getParameter("pilates")!=null)?","+request.getParameter("yoga"):request.getParameter("yoga"))
					+((request.getParameter("yoga")!=null)?","+request.getParameter("etc"):request.getParameter("etc"));
			String price = request.getParameter("price");
			String bizcontent = request.getParameter("bizcontent");
			if(request.getParameter("bizpic")!=null) {
				
			}		
		} else if (command.equals("centerdetail")){
			int centerno = Integer.parseInt(request.getParameter("centerno"));
			CenterDto dto = dao.selectOne(centerno);
			
			request.setAttribute("centerDto", dto);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("center_detail.jsp");
			dispatch.forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
