package com.used.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.center.dto.CenterDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.pic.dto.PicDto;
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
			List<PicDto> piclist =usedDao.selectAllPic();
			
			
			request.setAttribute("usedList", usedList);
			if(piclist != null) {
			request.setAttribute("piclist", piclist);
			}
			dispatch("used_list.jsp",request,response);
			
		}
		else if(command.equals("useddetail")) {
			
			int usedno = Integer.parseInt(request.getParameter("usedno"));
			
			List<PicDto> piclist = usedDao.selectPics(usedno);
			UsedDto usedDto = usedDao.selectOne(usedno);
			List<UsedaskDto> usklist = uskDao.selectAll(usedno);
			
			request.setAttribute("piclist", piclist);
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
			
			//답변상태 변경
			uskDao.uskstausUpdate(uskno);
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
			
		}else if(command.equals("mypage")) {
			List<UsedDto> mypagelist = usedDao.selectAll();
			request.setAttribute("mypagelist", mypagelist);
			
			dispatch("mypage.jsp",request,response);
			
		} else if(command.equals("usedwriteform")) {
			response.sendRedirect("used_write.jsp");
		} else if(command.equals("usedwrite")){
			
			//사진첨부 미구현 , 첨부기능 추가되면 추가할것
			String usedtitle = "";
			String userid = "";
			int userno = 0;
			String usedaddr = "";
			String usedprice = "";
			String usedcategory = "";
			String usedcenternm = "";
			String usedcontent = "";
			
			
			String imgpath = ""; //이미지 경로 초기화
			String imgname = ""; //이미지 이름 초기화
			
			String uploadpath = request.getRealPath("download"); //upload파일에 실제 경로 설정
			
			System.out.println(uploadpath);
			int res=0;
			
			try {
				MultipartRequest multi = new MultipartRequest(request, uploadpath,10*1024*1024,"UTF-8",new DefaultFileRenamePolicy());
				
				usedtitle = multi.getParameter("title");
				userid = multi.getParameter("logonid");
				userno = Integer.parseInt(multi.getParameter("logonno"));
				usedaddr = multi.getParameter("addr");
				usedprice = multi.getParameter("price");
				usedcategory = multi.getParameter("category");
				usedcenternm = multi.getParameter("centernm");
				usedcontent = multi.getParameter("content");
				
				
			
				UsedDto dto = new UsedDto();
				
				dto.setUsedtitle(usedtitle);
				dto.setUserid(userid);
				dto.setUserno(userno);
				dto.setUsedaddr(usedaddr);
				dto.setUsedprice(usedprice);
				dto.setUsedcategory(usedcategory);
				dto.setUsedcenternm(usedcenternm);
				dto.setUsedcontent(usedcontent);
			
				res = usedDao.insert(dto);
			
				int rs = usedDao.selectno(usedtitle); //centerno호출
				System.out.println(rs);
				
			
				Enumeration files =multi.getFileNames(); //파일명정보를 배열로 만듬
				
				while(files.hasMoreElements()) { //다음 요소가 있으면 반복
					String imgfile = (String)files.nextElement(); //파일명정보 Enumeration 의 다음요소를 imgfile에저장
					imgpath = multi.getFilesystemName(imgfile);
					imgname = multi.getOriginalFileName(imgfile);
						
					res = usedDao.insert_pic(rs, imgname, uploadpath+"\\"+imgpath);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(res>0) {
				jsResponse("성공적으로 등록되었습니다.","usedcontroller?command=usedlist",response);
			}else {
				jsResponse("등록이 실패하였습니다.\n다시 시도해주세요","usedcontroller?command=usedlist",response);
			}
			
		} else if(command.equals("useddelete")) {
			
			int usedno = Integer.parseInt(request.getParameter("usedno"));
			
			int res = usedDao.delete(usedno);
			
			if(res>0) {
				jsResponse("게시글이 성공적으로 삭제되었습니다.","usedcontroller?command=usedlist",response);
			} else {
				jsResponse("게시글 삭제가 실패하였습니다. \n 다시 시도해 주세요.","usedcontroller?command=useddetail&usedno="+usedno,response);
			}
			
		} else if(command.equals("usedupdateform")) {
			
			int usedno = Integer.parseInt(request.getParameter("usedno"));
			
			UsedDto useddto = usedDao.selectOne(usedno);
			
			request.setAttribute("useddto", useddto);
			dispatch("used_update.jsp",request,response);
			
		} else if(command.equals("usedupdate")) {
			
			//첨부파일 수정 작업 필요
			
			int usedno = Integer.parseInt(request.getParameter("usedno"));
			String title = request.getParameter("title");
			String price = request.getParameter("price");
			String content = request.getParameter("content");
			String category = request.getParameter("category");
			
			UsedDto dto = new UsedDto();
			dto.setUsedno(usedno);
			dto.setUsedtitle(title);
			dto.setUsedprice(price);
			dto.setUsedcontent(content);
			dto.setUsedcategory(category);
			
			int res = usedDao.update(dto);
			
			if(res>0) {
				jsResponse("게시글이 수정되었습니다.","usedcontroller?command=useddetail&usedno="+usedno,response);
			}else {
				jsResponse("게시글이 수정이 실패하었습니다.","usedcontroller?command=useddetail&usedno="+usedno,response);
			}
		} else if(command.equals("usedstatus")) {
			
			int usedno = Integer.parseInt(request.getParameter("usedno"));
			String status = request.getParameter("status");
			
			int res = usedDao.updateStatus(usedno,status);
			
			if(res>0) {
				jsResponse("게시글이 거래상태가 변경되었습니다.","usedcontroller?command=useddetail&usedno="+usedno,response);
			} else {
				jsResponse("게시글 거래상태 변경이 실패하였습니다.","usedcontroller?command=useddetail&usedno="+usedno,response);
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
