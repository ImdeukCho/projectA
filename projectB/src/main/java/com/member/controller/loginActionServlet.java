package com.member.controller;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.dto.ClassDTO;
import com.member.dto.MemberDTO;
import com.member.service.MemberService;
import com.service.ClassService;


@WebServlet("/loginActionServlet")
public class loginActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public loginActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		String userId = request.getParameter("userId");
		String userPasswd = request.getParameter("userPasswd");
		System.out.println("userId:"+userId+"userPasswd:"+userPasswd);
		
		MemberService service = new MemberService();
		MemberDTO member = service.userLogin(userId);
		String memberId = member.getUserId();
		String memberpw = member.getUserPasswd();	
		System.out.println("memberId:"+member.getUserId());
		System.out.println("memberPw:"+member.getUserPasswd());
				
		if(userId.equals(memberId) && userPasswd.equals(memberpw)) {
			//window.close();
			//opener.location.href="MainTest.html";	
			response.sendRedirect("MainTest.html");
		} else {
			System.out.println("로그인 해주세요");
			response.sendRedirect("login.html");
		}
		/*
		 * if (memberId.equalsIgnoreCase(userId) &&
		 * memberPasswd.equalsIgnoreCase(userPasswd) { session.setAttribute("userId",
		 * userId); session.setAttribute("userPasswd", userPasswd);
		 * response.sendRedirect("myPage.html"); }
		 */
		
		/*
		 * request.setAttribute("list", list); //forward RequestDispatcher dis =
		 * request.getRequestDispatcher("myPage.html"); dis.forward(request, response);
		 */
		/*
		 * if (list.isEmpty()) { // isEmpty : 문자열이 0인 경우 true를 리턴
		 * System.out.println("로그인 안됨"); try { response.getWriter().write("loginFail");
		 * } catch (Exception e) { e.printStackTrace(); } } else(userId.
		 * equalsIgnoreCases(session.getAttribute(userId)) && userPasswd.
		 * equalsIgnoreCases(session.getAttribute(userId))) { //
		 * equalsIgnoreCases:대소문자구분없이 문자열비교 session.setAttribute("userId", userId);
		 * session.setAttribute("userPasswd", userPasswd);
		 * System.out.println(session.getAttribute(userId));
		 * System.out.println(session.getAttribute(userPasswd));
		 * response.sendRedirect("myPage.html"); // 로그인후 페이지 }
		 */
	}
		
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
