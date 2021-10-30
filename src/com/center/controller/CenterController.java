package com.center.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.biz.dao.BizDao;
import com.biz.dto.BizDto;
import com.center.dao.CenterDao;
import com.center.dto.CenterDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.pic.dto.PicDto;
import com.review.dao.ReviewDao;
import com.review.dto.ReviewDto;
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
		ReviewDao rdao = new ReviewDao();
		
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
				bizcategory = String.join(",", multi.getParameter("health"),
												multi.getParameter("pilates"),
												multi.getParameter("yoga"),
												multi.getParameter("etc"));
			
				bizcontent = multi.getParameter("bizcontent");
				
				System.out.println(userno+usernm+biznm+bizaddr+bizcategory); //값 확인용 나중에 지워야함
				
				
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
			List<ReviewDto> reviewList = rdao.selectAll(centerno);
			
			request.setAttribute("centerDto", dto);
			//리뷰 있는지 확인
			if(reviewList !=null) {
				request.setAttribute("reviewList", reviewList);
			}
			RequestDispatcher dispatch = request.getRequestDispatcher("center_detail.jsp");
			dispatch.forward(request, response);
			
		} else if(command.equals("review_write_form")) {
			
			int centerno = Integer.parseInt(request.getParameter("centerno"));
			
			request.setAttribute("centerno", centerno);
			RequestDispatcher dispatch = request.getRequestDispatcher("center_review_write.jsp");
			dispatch.forward(request, response);
		} else if(command.equals("review_write")) {
			
			HttpSession session = request.getSession();
			UserDto loginUser = (UserDto)session.getAttribute("loginUser");
			
			ReviewDto rdto = new ReviewDto();
			
			int centerno = Integer.parseInt(request.getParameter("centerno"));
			String writer = loginUser.getUserid();
			double grade = Double.parseDouble(request.getParameter("star_range"));
			String content = request.getParameter("reviewcontent");
			
			rdto.setCenterno(centerno);
			rdto.setReviewwriter(writer);
			rdto.setReviewgrade(grade);
			rdto.setReviewcontent(content);
			
			int res = rdao.insert(rdto);
			
			if(res>0) {
				jsResponse("리뷰가 등록되었습니다.","CenterController?command=centerdetail&centerno="+centerno,response);
			} else {
				jsResponse("리뷰등록이 실패하였습니다","CenterController?command=review_write_form&centerno="+centerno,response);
			}
		}else if(command.equals("centerdetail_writer")) {
			
			
			String centername = "";
			String centeraddr = "";
			String centerprice = "";
			String centercategory = "";
			String centerintro = "";
			String centercontent = "";
			String centerophour = "";
			String centerpro = "";
			
			String imgpath = ""; //이미지 경로 초기화
			String imgname = ""; //이미지 이름 초기화
			
			String uploadpath = request.getRealPath("upload"); //upload파일에 실제 경로 설정
			
			try {
				MultipartRequest multi = new MultipartRequest(request, uploadpath,10*1024*1024,"UTF-8",new DefaultFileRenamePolicy());

				
				
				
				
				centername = multi.getParameter("centernm");
				centeraddr = multi.getParameter("centeraddr");
				centerprice = multi.getParameter("centerprice");
				centercategory = String.join(",", multi.getParameter("health"),
									multi.getParameter("pilates"),
									multi.getParameter("yoga"),
									multi.getParameter("etc"));
				centerintro = multi.getParameter("centerintro");
				centercontent = multi.getParameter("centercontent");
				centerophour = multi.getParameter("centerophour");
				centerpro = multi.getParameter("centerpro");
				
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			CenterDto dto = new CenterDto(centername, centeraddr, centerprice, centercategory, centerintro, centercontent, centerophour, centerpro);
			
			int res = dao.centerdetail_writer(dto);
			
			if(imgname !=null && !imgname.equals("")) {
				
				int rs = dao.selectno(centername);
				
				try {
					MultipartRequest multi = new MultipartRequest(request, uploadpath,10*1024*1024,"UTF-8",new DefaultFileRenamePolicy());
					
					Enumeration files =multi.getFileNames(); //파일명정보를 배열로 만듬
					
					int nfine =1; //새파일명에 들어갈 끝숫자
					int si=0; //배열의 순서를 얻기 위한 숫자
					
					
					
					while(files.hasMoreElements()) { //다음 요소가 있으면 반복
						String imgfile = (String)files.nextElement(); //파일명정보 Enumeration 의 다음요소를 imgfile에저장
						
						imgpath = multi.getFilesystemName(imgfile);
						imgname = multi.getOriginalFileName(imgfile);
						
						res = dao.insert_pic(rs, imgname, imgpath);
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				if(res>0) {
					response.sendRedirect("center_detail.jsp");
				}else {
					response.sendRedirect("center_detail_writer.jsp");
				}
			}else {
				
				
				if(res>0) {
					response.sendRedirect("center_detail.jsp");
				}else {
					response.sendRedirect("center_detail_writer.jsp");
				}
			}
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}
	
	private void jsResponse(String msg,String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>"
				+ "alert('"+msg+"');"
				+ "location.href='"+url+"';"
				+ "</script>";
		PrintWriter out = response.getWriter();
		out.print(s);
	}
}
