<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
// idcheck 버튼 클릭 함수
$(function(){
	$("#idCheckBtn").click(function(){
		// window.open() - window객체로 창은 여는 메서드
		// open(url, name, option)
		// window.open("idCheck.jsp", "idCheck", "width=400, height=400, top=100, left=400");
		idCheckWindowOpen();
	});
	
	$("#id").click(function(){idCheckWindowOpen();});
	
	function idCheckWindowOpen(){
		window.open("idCheck.jsp", "idCheck", "width=400, height=400, top=100, left=400");
	}
});
// 취미 다중 체크박스 값 가져오기 함수
// btnChk 라는 버튼이 눌렸을 때, hobby라는 name을 가진 체크박스들을 확인하여 눌린 체크박스의 value값을 가져오도록 코딩
// gHobby라는 새로운 변수를 만들어서 눌린 체크박스의 값을 ',(콤마)'를 이용하여 하나의 변수에 만들어보았으며, 최종으로 만들어진 gHobby 값을 hidden(히든)에 담아서 Controller로 보내주었다.

$('#btnChk').click(function() {
	var gHobby = "";
	$("input[name=hobby]:checked").each(function() 
		{if(gHobby == ""){
			gHobby = $(this).val();
		} else {gHobby = gHobby + "," + $(this).val();}});
			$('#gHobby').val(gSize);});

// 취미 다중체크박스 전체선택,해제
$(document).ready(function() {
	$("#hobbyAll").click(function() {
		if($("#hobbyAll").is(":checked")) $("input[name=hobby]").prop("checked", true);
		else $("input[name=hobby]").prop("checked", false);
	});
	// 하위항목 체크박스 모두 선택시 상위 전체체크박스 활성화 기능
	$("input[name=hobby]").click(function() {
		var total = $("input[name=hobby]").length;
		var checked = $("input[name=hobby]:checked").length;
		
		if(total != checked) 
			$("#hobbyAll").prop("checked", false);
		else 
			$("#hobbyAll").prop("checked", true); 
	});
});
var test=userid12;
function MainGo() {
	alert('환영합니다. 회원가입 성공하셨습니다');
	/* 	var alertMsg = "환영합니다. " + userId;
		alert(alertMsg);	
	환영합니다 userId님 넣기. */
	opener.location.href='MainTest.html'; 
    window.close();

}
</script>

</head>
<body>

<div class="container">
<h1>튜더 가입</h1>
<div>* 항목은 필수입력 사항입니다.</div>
	<form action="write.jsp" method="post" enctype="multipart/form-data">
		<div class="form-group">					<!-- div태그 : 각각 스타일 지정할수있게 지정 -->
			<label for="userId">아이디(*)</label>			<!-- label태그 : input과 같은기능이라 생각하면 된다. -->
			<div class="input-group">
				<input name="userId" id="userId" required="required" class="form-control" readonly="readonly"
					placeholder="힌트기능 : 아이디 중복체크를 이용하세요. 팝업을 허용하셔야 합니다.">
				<div class="input-group-btn">
					<button type="button" id="idCheckBtn" class="btn btn-default">아이디 중복체크</button>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="userPasswd">비밀번호(*)</label>
			<input name="userPasswd" type="password" class="form-control" id="userPasswd">
		</div>
		<div class="form-group">
			<label for="userPasswd2">비밀번호 확인(*)</label>
			<input type="password" class="form-control" id="userPasswd2">
		</div>
		<div class="form-group">
			<label for="userName">이름(*)</label>
			<input name="userName" type="text" class="form-control" id="userName">
		</div>
		<div class="form-group">
			<label>성별(*)</label>
			<div class="form-inline">
				<!-- style - margin : 바깥쪽 여백 -->
				<div class="form-group" style="margin: 0 10px">
					<label>
						<input name="gender" type="radio" class="form-control" id="gender_man" value="남자" checked="checked">
						남자
					</label>
				</div>
				<div class="form-group">
					<label>
						<input name="gender" type="radio" class="form-control" id="gender_woman" value="여자">
						여자
					</label >
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="birth">생년월일(*)</label>
			<input name="birth" type="date" class="form-control" id="birth">
		</div>
		<div class="form-group">
			<label>연락처(*)</label>
			<div class="form-inline">
				<input name="phone" class="form-control" style="width:60px" type="text" maxlength="3"
				 pattern="[0-9]{2,3}" title="숫자 2 ~ 3자리를 입력할 수 있습니다.">-
				<input name="phone" class="form-control" style="width:80px" type="text" maxlength="4"
				 pattern="[0-9]{4}" title="숫자 4자리를 입력할 수 있습니다.">-
				<input name="phone" class="form-control" style="width:80px" type="text" maxlength="4"
				 pattern="[0-9]{4}" title="숫자 4자리를 입력할 수 있습니다.">
			</div>
		</div>
		<div class="form-group">
			<label for="address">주소(*)</label>
			<input name="address" type="text" class="form-control" id="address">
		</div>
		<div class="form-group">
			<label for="email">이메일(*)</label>
			<!-- type : email - 모바일의 키패드가 email입력 패드로 바뀐다. 입력한 데이터가 이메일 양식에 맞는지 검사한다. -->
			<input name="email" class="form-control" type="email" id="email">
		</div>
		<div class="form-group">
			<label for="profilephoto">프로필 사진(*)</label>
			<input name="profilephoto" type="file" id="profilephoto" class="form-control">
		</div>
		<div class="form-group">
			<label for="certificatephoto">자격증 사진(*)</label>
			<input name="certificatephoto" type="file" id="certificatephoto" class="form-control" accept=".jpg, .png">  <!-- 업로드파일 형식 제한 -->
		</div>	
		<div class="form-group">
			<label for="certificateData">자격증 정보(*)</label>
			<input name="certificateData" type="text" id="certificateData" class="form-control" accept=".jpg, .png">
		</div>
		<div class="checkbox-group">
		<label for="hobby">취미 선택</label><label for="hobbyAll" style="font-size: small;">&emsp;<input type="checkbox" name="hobbyAll" id="hobbyAll"> 전체 선택</label><br>		
		<label for="hobby1" style="font-size: small;"><input name="hobby" type="checkbox" id="hobby1" value="디자인·영상·개발"> 디자인·영상·개발</label>&emsp;
		<label for="hobby2" style="font-size: small;"><input name="hobby" type="checkbox" id="hobby2" value="외국어"> 외국어</label>&emsp;&emsp;&emsp;&emsp;&nbsp;
		<label for="hobby3" style="font-size: small;"><input name="hobby" type="checkbox" id="hobby3" value="재테크·투잡"> 재테크·투잡</label>&emsp;&emsp;&nbsp;
		<label for="hobby4" style="font-size: small;"><input name="hobby" type="checkbox" id="hobby4" value="댄스·뮤직"> 댄스·뮤직</label>&emsp;<br>
		<label for="hobby5" style="font-size: small;"><input name="hobby" type="checkbox" id="hobby5" value="피트니스·스포츠"> 피트니스·스포츠</label>&emsp;&nbsp;
		<label for="hobby6" style="font-size: small;"><input name="hobby" type="checkbox" id="hobby6" value="뷰티·마인드.펫"> 뷰티·마인드.펫</label>&emsp;
		<label for="hobby7" style="font-size: small;"><input name="hobby" type="checkbox" id="hobby7" value="드로잉·사진·글"> 드로잉·사진·글</label>&emsp;
		<label for="hobby8" style="font-size: small;"><input name="hobby" type="checkbox" id="hobby8" value="요리·공예·취미"> 요리·공예·취미</label>&emsp;<br>
		</div><br>
		
		<button class="btn btn-default" onclick="MainGo()">가입</button>
		<button class="btn btn-default" type="reset">새로고침</button>
		<button class="btn btn-default" type="button" onclick="window.close();" id="close">닫기</button>
	</form>
</div>
</body>
</html>