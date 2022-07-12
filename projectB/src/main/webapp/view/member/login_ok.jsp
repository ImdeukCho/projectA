<%@page import="com.member.dto.MemberDTO"%>
<%@page import="com.member.dao.MemberDAO"%>
<%@page import="com.member.service.MemberService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 1. 사용자가 보낸 id, pw 받기
	String userId = request.getParameter("userId");
	String userPasswd = request.getParameter("userPasswd");
	// 2. DAO에서 보낸 값 받기
	MemberService service = new MemberService();
	List<MemberDTO> list = service.userLogin(userId,userPasswd);
	System.out.println(list);
%>
	sy
<%
	
	// 3. 로그인이 되면 => main.jsp
	// id가 틀린 경우 => 로그인 창으로 이동하기
	if(dto.getMsg().eqals("NoID")){
%>
	<!-- Ajex -->
<script>
	alert("ID가 존재하지 않습니다");
	history.back();
</script>	
<%
	// id가 존재 => 비밀번호가 틀린 경우 로그인창으로 이동하기
	} else if(dto.getMsg().eqals("NoPW")){
%>		
<script>
	alert("비밀번호가 틀립니다");
	history.back();
</script>
<% 
	// id 존재하고 pw 맞는경우 => id.name.admin여부를 서버에 저장하고 main.jsp로 이동(session)
	} else{
		session.setAttribute("userId", userId);
		session.setAttribute("userPasswd", userPasswd);
	// 사용하고있는 모든 jsp에서 세션에 등록된 모든 데이터 사용이 가능
	response.sendRedirect("main.jsp");	// 팝업창이므로 닫히게 수정할것
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>

</body>
</html>