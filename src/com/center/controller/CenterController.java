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
		}
		else if(command.equals("boardwrite")) {
			String usktype = request.getParameter("usktype");
			String userid = request.getParameter("userid");
			String uskcontent = request.getParameter("uskcontent");
			String uskstatus = request.getParameter("uskstatus");
			
			CenterDto dto = new CenterDto();
			dto.setUsktype(usktype);
			dto.setUserid(userid);
			dto.setUskcontent(uskcontent);
			dto.setUskstatus(uskstatus);
			
			int res = dao.insert(dto);
			if(res>0) {
				dispatch("update.do?command=list",request,response);
			}else {
				dispatch("update.do?command=list",request,response);
			}
		}else if(command.equals("updateform")) {
			int uskno = Integer.parseInt(request.getParameter("uskno"));
			
			CenterDto dto = dao.selectone(uskno);
			request.setAttribute("dto", dto);
			dispatch("question_board_update.jsp",request,response);
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
