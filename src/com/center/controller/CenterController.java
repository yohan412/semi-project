package com.center.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.core.ApplicationContext;
import org.apache.tomcat.util.descriptor.web.ApplicationParameter;
import org.apache.tomcat.util.net.ApplicationBufferHandler;

import com.biz.dao.BizDao;
import com.biz.dto.BizDto;
import com.center.dao.CenterDao;
import com.center.dto.CenterDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.user.dao.UserDao;
import com.user.dto.UserDto;


@WebServlet("/CenterController")
public class CenterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command= request.getParameter("command");
		System.out.println("[command: "+command+"]");
		
		CenterDao dao = new CenterDao();
		UserDao udao = new UserDao();
		BizDao bdao = new BizDao();
		
		if(command.equals("centerlist")) {
			List<CenterDto> centerlist = dao.selectAll();
			request.setAttribute("centerlist", centerlist);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("center_list.jsp");
			dispatch.forward(request, response);
		}else if(command.equals("business")) {
			int userno = Integer.parseInt(request.getParameter("user_no"));
			
			UserDto dto = udao.selectOne(userno);
			
			request.setAttribute("dto", dto);
			
			RequestDispatcher dis = request.getRequestDispatcher("join_business.jsp");
			dis.forward(request, response);
		}else if(command.equals("join_biz")) {
			
			int userno = 0;
			String usernm = "";
			String biznm = "";
			String bizaddr = "";
			String bizcategory = "";
			String price = "";
			String bizcontent = ""; //초기화
			
			String imgpath = ""; //이미지 경로 초기화
			String imgname = ""; //이미지 이름 초기화
			
			String uploadpath = request.getRealPath("upload"); //upload파일에 실제 경로 설정
			
			System.out.println(uploadpath); //경로확인용
			
			try {
				MultipartRequest multi = new MultipartRequest(request, uploadpath,10*1024*1024,"UTF-8",new DefaultFileRenamePolicy());
				
				imgpath = multi.getFilesystemName("imgfile");
				imgname = multi.getOriginalFileName("imgfile");
				
				
				userno = Integer.parseInt(multi.getParameter("userno"));
				usernm = multi.getParameter("usernm");
				biznm = multi.getParameter("biznm");
				bizaddr = multi.getParameter("bizaddr");
				bizcategory = multi.getParameter("health")+((multi.getParameter("health")!=null)?","+multi.getParameter("pilates"):multi.getParameter("pilates"))
						+((multi.getParameter("pilates")!=null)?","+multi.getParameter("yoga"):multi.getParameter("yoga"))
						+((multi.getParameter("yoga")!=null)?","+multi.getParameter("etc"):multi.getParameter("etc"));
				price = multi.getParameter("price");
				bizcontent = multi.getParameter("bizcontent");
				
				System.out.println(userno+usernm+biznm+bizaddr+bizcategory); //값 확인용 나중에 지움
				
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(imgname !=null && !imgname.equals("")) {
				BizDto dto = new BizDto();
				
				dto.setUserno(userno);
				dto.setUsernm(usernm);
				dto.setBiznm(biznm);
				dto.setBizaddr(bizaddr);
				dto.setBizcategory(bizcategory);
				dto.setBizprice(price);
				dto.setBizcontent(bizcontent);
				dto.setBizpic(uploadpath+imgpath);
				
				int res = bdao.insert(dto);
				
				if(res>0) {
					response.sendRedirect("main.jsp");
				}else {
					response.sendRedirect("join_business.jsp");
				}
			}else {
				BizDto dto = new BizDto();
				
				dto.setUserno(userno);
				dto.setUsernm(usernm);
				dto.setBiznm(biznm);
				dto.setBizaddr(bizaddr);
				dto.setBizcategory(bizcategory);
				dto.setBizprice(price);
				dto.setBizcontent(bizcontent);
				dto.setBizpic("");
				
				int res = bdao.insert(dto);
				
				if(res>0) {
					response.sendRedirect("main.jsp");
				}else {
					response.sendRedirect("join_business.jsp");
				}
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
