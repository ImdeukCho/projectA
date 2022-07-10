<%@page import="com.dto.ClassDTO"%>
<%@page import="com.service.ClassService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String userId = request.getParameter("userId");
	String userPasswd = request.getParameter("userPasswd");
	String userName = request.getParameter("userName");
	String gender = request.getParameter("gender");
	String birth = request.getParameter("birth");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String email = request.getParameter("email");
	String profilephoto = request.getParameter("profilephoto");
	String certificatephoto = request.getParameter("certificatephoto");
	String certificateData = request.getParameter("certificateData");
	String hobby = request.getParameter("hobby");
	String cardName = "";	// ex) 농협
	String cardNo = "";	// 13자리 제한
	
	ClassDTO dto = new ClassDTO();

	dto.setUserId(userId);
	dto.setUserPasswd(userPasswd);
	dto.setUserName(userName);
	dto.setGender(gender);
	dto.setBirth(birth);
	dto.setPhone(phone);
	dto.setAddress(address);
	dto.setEmail(email);
	dto.setProfilephoto(profilephoto);
	dto.setCertificatephoto(certificatephoto);
	dto.setCertificateData(certificateData);
	dto.setHobby(hobby);
	dto.setCardName(cardName);
	dto.setCardNo(cardNo);
	
	ClassService service = new ClassService();
	int n = service.memberAdd(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  String mesg = "회원가입 실패";
  if( n==1){
	  mesg = "회원가입 성공";
  }
%>
<%= mesg %>
  <a href="managementMember.jsp">목록보기</a>
</body>
</html>