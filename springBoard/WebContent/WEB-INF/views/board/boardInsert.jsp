<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("EUC-KR");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>INSERT</title>
<script type="text/javascript">
	if ("${res}" > 0) {
		alert("������ �Է� ����");
		location.href = "boardList.sw";
	} else {
		history.go(-1);	
	}
</script>

</head>
<body>
	INSERT
	<hr>

	

</body>
</html>