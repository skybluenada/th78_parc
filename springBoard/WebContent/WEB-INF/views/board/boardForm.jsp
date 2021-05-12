<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	//버튼 처리 jQuery			
	$(document).ready(function(){
		
		$("#insertData").click(function(){
			if(!validateForm()) return;
			if(confirm('등록을 진행할까요?')){
				$("#boardForm").attr("action", "boardInsert.sw");
				$("#boardForm").submit();
			}
		});
		
						
		$("#closeWindow").click(function(){
			window.close();
		});
	});
	
	function validateForm(){
		if($("#sbsubject").val().replace(/\s/g,"")==""){
			alert("제목을 입력해주세요.");
			return false;
		}
		if($("#sbname").val().replace(/\s/g,"")==""){
			alert("이름을 입력해주세요.");
			return false;
		}
		if($("#sbpw").val().replace(/\s/g,"")==""){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		return true;
	}

</script>	
</head>
<body>
<form name="boardForm" id="boardForm">
<table border="1" align="center">
	<tr>
		<td colspan="2" align="center">게시판 글쓰기</td>				
	</tr>
	<tr>
		<td align="center">글번호</td>
		<td><input type="text" name="sbnum" id="sbnum" size="20" readonly></td>
	</tr>
	<tr>
		<td align="center">제목</td>
		<td><input type="text" name="sbsubject" id="sbsubject" size="53"></td>
	</tr>
	<tr>
		<td  align="center">이름</td>
		<td><input type="text" name="sbname" id="sbname" size="53"></td>
	</tr>
	<tr>
		<td  align="center">비밀번호</td>
		<td><input type="password" name="sbpw" id="sbpw" size="20"></td>
	</tr>
	<tr>
		<td  align="center">입력일</td>
		<td><input type="text" name="insertdate" size="20" disabled></td>
	</tr>
	<tr>
		<td  align="center">수정일</td>
		<td><input type="text" name="updatedate" size="20" disabled></td>
	</tr>
	<tr>
		<td  align="center">내용</td>
		<td>
		<textarea name="sbcontent" id="sbcontent" cols="50" rows="10"></textarea>
	</td>
	</tr>
	<tr>
		<td  align="center">사진</td>
		<td>
		<input type="file" name="sbfile" id="sbfile">
	</td>
	</tr>
	<tr>
		<td colspan="2" align="center">				
		<input type="button" id="insertData" value="보내기">
		<input type="reset" value="다시">
	</td>				
	</tr>
</table>
</form>
</body>
</html>