package com.used.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.dto.BizDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
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
		
		UsedaskDao udao = new UsedaskDao();
		
		if(command.equals("boardlist")) {
			List<UsedaskDto> boardlist = udao.selectAll();
			request.setAttribute("boardlist", boardlist);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("question_board_update.jsp");
			dispatch.forward(request, response);
			
		}else if(command.equals("update")) {
			int uskno = Integer.parseInt(request.getParameter("usk_no"));
			
			UsedaskDto dto = udao.selectOne(uskno);
			
			request.setAttribute("dto", dto);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("question_board_update.jsp");
			dispatch.forward(request, response);
			
		}else if(command.equals("board_update")) {
			int uskno = Integer.parseInt(request.getParameter("uskno"));
			int usedno= 0;
			String usktype = request.getParameter("usktype");
			int uskgpno = Integer.parseInt(request.getParameter("uskgpno"));
			int uskgpsq = Integer.parseInt(request.getParameter("uskgpsq"));
			String userid = request.getParameter("userid");
			String usktitle = request.getParameter("usktitle");
			String uskcontent = request.getParameter("uskcontent");
			String uskstatus = request.getParameter("uskstatus");
			
			String imgpath ="";
			String imgname ="";
			
			String uploadpath = request.getSession().getServletContext().getRealPath("upload");
			
			try {
				MultipartRequest multi = new MultipartRequest(request, uploadpath, 10*1024*1024,"UTF-8",new DefaultFileRenamePolicy());
			
				imgpath = multi.getFilesystemName("imgfile");
				imgname = multi.getOriginalFileName("imgfile");
			
			}catch(IOException e) {
				e.printStackTrace();
			}
			if(imgname !=null && !imgname.equals("")) {
				UsedaskDto dto = new UsedaskDto();
				
				dto.setUsedno(usedno);
				dto.setUsktype(usktype);
				dto.setUskgpno(uskgpno);
				dto.setUskgpsq(uskgpsq);
				dto.setUserid(userid);
				dto.setUsktitle(usktitle);
				dto.setUskcontent(uskcontent);
				dto.setUskpic("upload/"+imgpath);
				
				int res = udao.insert(dto);
				
				if(res>0) {
					response.sendRedirect("main.jsp");
				}else {
					response.sendRedirect("question_board_update.jsp");
				}
			}else {
				UsedaskDto dto = new UsedaskDto();
				
				dto.setUsedno(usedno);
				dto.setUsktype(usktype);
				dto.setUskgpno(uskgpno);
				dto.setUskgpsq(uskgpsq);
				dto.setUserid(userid);
				dto.setUsktitle(usktitle);
				dto.setUskcontent(uskcontent);
				dto.setUskpic("");
				
				int res = udao.insert(dto);
				
				if(res>0) {
					response.sendRedirect("main.jsp");
				}else {
					response.sendRedirect("question_board_update.jsp");
				}
			}
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
