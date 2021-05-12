<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("EUC-KR");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>DELETE</title>
<script type="text/javascript">
	if ("${res}" > 0) {
		alert("데이터 삭제 성공");
		location.href = "boardList.sw";
	} else {
		history.go(-1);	
	}
</script>

</head>
<body>
	DELETE
	<hr>


</body>
</html>