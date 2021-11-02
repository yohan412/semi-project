package com.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.dao.UserDao;
import com.user.dto.UserDto;


@WebServlet("/usercontroller")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("[ command : " + command + "]");
		
		UserDao dao = new UserDao();
		
		
		if(command.equals("idChk")) {
			String myid=request.getParameter("id");
			String res = dao.idChk(myid);
			
			boolean idnotused=true;
			
			//중복되는 경우가 있을경우
			if(res!=null){ 
				idnotused=false;
			}
			
			response.sendRedirect("idchk.jsp?idnotused="+idnotused);
		}else if(command.equals("login")){
			String user_id = request.getParameter("user_id");
			String user_pw = request.getParameter("user_pw");
			
			UserDto loginUser = dao.login(user_id, user_pw);
			
			if(loginUser.getUserid() != null) {
				
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
				session.setMaxInactiveInterval(60*60);
			
				if(loginUser.getRole().equals("M")) {
					dispatch("main.jsp",request,response);
				}else if(loginUser.getRole().equals("BU")) {
					dispatch("main.jsp",request,response);
				}else if(loginUser.getRole().equals("DM")) {
					dispatch("main.jsp",request,response);
				}else if(loginUser.getRole().equals("GU")) {
					dispatch("main.jsp",request,response);
				}
			
			}else {
				jsResponse("로그인 실패","main.jsp",response);
			
			}

		}else if(command.equals("insertuser")) {
			String myid = request.getParameter("myid");
			String mypw = request.getParameter("mypw");
			String myname = request.getParameter("myname");
			String myzip = request.getParameter("myzipcode");
			String mygender = request.getParameter("mygender");
			String myaddr = request.getParameter("myaddr1")+" "+request.getParameter("myaddr2");
			String mybirth = request.getParameter("mybirthyy")+"/"+request.getParameter("mybirthmm")+"/"+request.getParameter("mybirthdd");
			String myphone = request.getParameter("myphone");
			String myemail = request.getParameter("myemail");
			
			UserDto dto = new UserDto();
			dto.setUserid(myid);
			dto.setUserpw(mypw);
			dto.setUsername(myname);
			dto.setUserzip(myzip);
			dto.setUsergender(mygender);
			dto.setUserbirthdate(mybirth);
			dto.setUseraddr(myaddr);
			dto.setUserphone(myphone);
			dto.setUseremail(myemail);
			
			
			int res = dao.insertUser(dto);
			
			if(res>0) {
				jsResponse("회원 가입 성공", "usercontroller?command=loginform", response);
			}else {
				jsResponse("회원 가입 실패", "usercontroller?command=registform", response);
			}
		}else if(command.equals("registform")) {
			response.sendRedirect("join_user.jsp");
		}else if(command.equals("naver_login")) {
			response.sendRedirect("naverlogin.jsp");
		
		}else if(command.equals("logout")) {
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect("main.jsp");
		
		}else if(command.equals("loginform")) {
			response.sendRedirect("login.jsp");
		}
	}
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher(url);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void jsResponse(String msg, String url,HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>"+"alert('"+msg+"');"+"location.href='"+url+"';"+"</script>";
		
		PrintWriter out = response.getWriter();
		out.print(s);
	}}


@RequestMapping(value = "/sendSms.do")
public String sendSms(HttpServletRequest request)throw Exception{
String api_key = "<NCS9CI1UWC8LFNBC>";
String api_secret = "<RDZZW13SAMYGVSTY7CHRQINZKJ04BH5L>";
Coolsms coolsms = new Coolsms(api_key, api_secret);

HashMap<String, String> set = new HashMap<String, String>();
set.put("to", "USER_PHONE"); // 수신번호

set.put("from", (String)request.getParameter("01035939862")); // 발신번호
set.put("text", (String)request.getParameter("[우리동네 헬스장] 인증번호는 \" + \"[\" +  cerNum +\"]\"+\"입니다.")); // 문자내용
set.put("type", "sms"); // 문자 타입

System.out.println(set);

JSONObject result = coolsms.send(set); // 보내기&전송결과받기

if ((boolean)result.get("status") == true) {
  // 메시지 보내기 성공 및 전송결과 출력
  System.out.println("성공");
} else {
  // 메시지 보내기 실패
  System.out.println("실패");
}

return "redirect:main.do";
}

//이메일 인증~
public class MailController {

	@Autowired
	private JavaMailSender mailSender;

	// mailSending 코드
	@RequestMapping(value = "/mailSending.do")
	public String mailSending(HttpServletRequest request) {

		String setfrom = "";
		String tomail = request.getParameter("navvy001@gmail.com"); // 받는 사람 이메일
		String title = request.getParameter("title"); // 제목
		String content = request.getParameter("content"); // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		return "main/main.tiles";
	}
}

