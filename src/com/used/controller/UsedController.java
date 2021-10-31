package com.used.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
		
		UsedDao usedDao = new UsedDao();
		UsedaskDao uskDao = new UsedaskDao();
		
		if(command.equals("usedlist")) {
			
			List<UsedDto> usedList = usedDao.selectAll();
			
			request.setAttribute("usedList", usedList);
			
			dispatch("used_list.jsp",request,response);
			
		}
		else if(command.equals("useddetail")) {
			
			int usedno = Integer.parseInt(request.getParameter("usedno"));			
			
			UsedDto usedDto = usedDao.selectOne(usedno);
			List<UsedaskDto> usklist = uskDao.selectAll(usedno);
			
			request.setAttribute("usklist", usklist);
			request.setAttribute("usedDto", usedDto);
			dispatch("used_detail.jsp",request,response);
			
		}else if (command.equals("askwriteform")) {
			int usedno = Integer.parseInt(request.getParameter("usedno"));
			String writer= request.getParameter("writer");
			
			request.setAttribute("writer", writer);
			request.setAttribute("usedno", usedno);
			dispatch("used_ask_write.jsp",request,response);			
		} else if (command.equals("askwrite")) {
			
			int usedno = Integer.parseInt(request.getParameter("usedno"));
			String writer= request.getParameter("writer");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String usk_type = request.getParameter("usk_type");
			
			UsedaskDto dto = new UsedaskDto();
			dto.setUsedno(usedno);
			dto.setUserid(writer);
			dto.setUsktitle(title);
			dto.setUskcontent(content);
			dto.setUsktype(usk_type);
			
			int res=uskDao.insert(dto);			
			String msg;
			
			if(res>0) {
				msg="1:1 문의가 등록되었습니다.";
			} else {
				msg="1:1 문의등록이 실패하였습니다.\n 다시 시도해주세요.";
			}
			
			//열었던 팝업창 닫기
			String s = "<script type='text/javascript'>"
					+"window.opener.location.reload();"
					+"window.close();"
					+"alert('"+msg+"');"
					+ "</script>";
			PrintWriter out = response.getWriter();
			out.print(s);
		} else if(command.equals("used_ask_detail")) {
			
			int uskno = Integer.parseInt(request.getParameter("uskno"));
			String writer= request.getParameter("writer");
			
			
			UsedaskDto uskdto = uskDao.selectOne(uskno);
			List<UsedaskDto> anslist = uskDao.selectAnswerAll(uskdto.getUsedno(), uskdto.getUskgpno());
			
			request.setAttribute("anslist", anslist);
			request.setAttribute("writer", writer);
			request.setAttribute("uskdto", uskdto);
			
			dispatch("used_ask_detail.jsp",request,response);
			
		} else if(command.equals("askanswer")) {
			
			int uskno = Integer.parseInt(request.getParameter("uskno"));
			String writer= request.getParameter("writer");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			UsedaskDto parentusk = uskDao.selectOne(uskno);
			
			//들어갈 공간 만들어주기
			uskDao.answerUpdate(parentusk.getUskgpno(), parentusk.getUskgpsq());
			
			UsedaskDto uskdto = new UsedaskDto();
			
			uskdto.setUskgpno(parentusk.getUskgpno());
			uskdto.setUskgpsq(parentusk.getUskgpsq());
			uskdto.setUsedno(parentusk.getUsedno());
			uskdto.setUserid(writer);
			uskdto.setUsktitle(title);
			uskdto.setUskcontent(content);
			
			int res = uskDao.answerInsert(uskdto);
			if(res>0) {				
				jsResponse("등록되었습니다.","usedcontroller?command=used_ask_detail&writer="+writer+"&uskno="+uskno,response);
			}else {
				jsResponse("등록실패하였습니다. \n 다시시도해주세요.","usedcontroller?command=used_ask_detail&writer="+writer+"&uskno="+uskno,response);
			}
		}
	}
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	
	private void jsResponse(String msg,String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>"
				+ "alert('"+msg+"');"
				+ "location.href='"+url+"';"
				+ "</script>";
		PrintWriter out = response.getWriter();
		out.print(s);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
