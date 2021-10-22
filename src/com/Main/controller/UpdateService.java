package com.Main.controller;
import java.io.IOException; 
import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse; 
import javax.servlet.http.HttpSession; 

import com.MyPage.dto.*;
import com.user.dao.UserDao;
import com.user.dto.UserDto;

@WebServlet("/UpdateService")
	public class UpdateService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 로그인한 email과 client가 수정하고 싶은 pw, tel, address를 콘솔창에 출력하시오.
			
		// 포스트 방식의 한글이 깨지지 않는 인코딩은 
		request. request.setCharacterEncoding("UTF-8"); 
		HttpSession session = request.getSession(); 
		UserDto info = (UserDto) session.getAttribute("info"); // login 정보 담기.
		String email = info.getUserid(); 		// login 정보에서 email가져오기. 
		
		// 수정하려고 사용자가 입력한 정보는 request에 있으니 옮겨닮아주자.
		String username = request.getParameter("username");
		String userphone = request.getParameter("userphone");
		String useremail = request.getParameter("useremail"); 
		String useraddr = request.getParameter("useraddr"); 
		
		UserDto dto = new UserDto(username,userphone,useremail,useraddr);
		UserDao dao = new UserDao();
		
		result = pstmt.executeUpdate();

		
		int cnt = dao.update(dto);
		
		if(cnt>0) {
			System.out.println("회원정보 수정 성공!");
			response.sendRedirect("WebContent/mypage_update.jsp");
			session.setAttribute("mypage", dto);
		}else {
			System.out.println("회원정보 수정 실패");
			response.sendRedirect("WebContent/mypage.jsp");
		}
}

