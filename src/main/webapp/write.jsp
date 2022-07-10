<%@page import="javax.swing.filechooser.FileNameExtensionFilter"%>
<%@page import="com.webjjang.member.service.MemberWriteService"%>
<%@page import="com.webjjang.main.controller.ExecuteService"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.webjjang.member.vo.MemberVO"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 한글 처리
request.setCharacterEncoding("utf-8");

// 서버의 위치 - webapp(맨앞의 /) 아래의 위치 
String path = "/upload/member";
// 서버 컴퓨터의 실제적으로 저장되는 폴더 위치 
String savePath = request.getServletContext().getRealPath(path);

//파일 크기 15MB로 제한
int sizeLimit = 1024*1024*15;
// encoding type
String encoding = "utf-8";

// 클라이언트 name="photo" -> 임시저장소(메모리 또는 임시 파일) -> 지정된 위치의 파일명 저장 
MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", 
		new DefaultFileRenamePolicy());

// 위에 multi가 생성이 되면 request에서는 데이터를 받을 수 없다. multi에서 받아야 한다.
String id = multi.getParameter("id");
String pw = multi.getParameter("pw");
String name = multi.getParameter("name");
String gender = multi.getParameter("gender");
String birth = multi.getParameter("birth");
String[] tel = multi.getParameterValues("tel");
String email = multi.getParameter("email");
// multi.getFilesystemName() -> 서버에 실제적으로 올라간 파일명
// 저장 데이터는 위치(path) + "/" + 서버의 파일명
String photo = multi.getFilesystemName("photo");
if(photo == null || photo.equals(""))
	photo = "/upload/member/noImage.jpg";
else
	photo = path + "/" + photo;

MemberVO vo = new MemberVO();
vo.setId(id);
vo.setPw(pw);
vo.setName(name);
vo.setGender(gender);
vo.setBirth(birth);
// java - String join(구분문자, 여려개의데이터) : 010-1111-5555
vo.setTel(String.join("-", tel));
vo.setEmail(email);
vo.setPhoto(photo);

// DB에 회원 정보 입력
ExecuteService.execute(new MemberWriteService(), vo);

// 회원 가입한 정보보기 페이지로 이동 - 아이디 정보를 전달.
response.sendRedirect("myPage.jsp?id=" + id);
%>
