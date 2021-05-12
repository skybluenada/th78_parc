<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>PW CHECK</title>
</head>
<body>
PW CHECK
<hr>
<%
	Object obj = request.getAttribute("nCnt");
	if (obj == null) return;

	int nCnt = ((Integer)obj).intValue();	
	System.out.println("boardPwCheck nCnt >>> : " + nCnt);
	
	String sVal = "";
	if (nCnt == 1 ){
		sVal = "PWGOOD";		
	}else{
		sVal = "PWBAD";
	}
	System.out.println("boardPwCheck bool >>> : " + sVal);
%>
<?xml version='1.0' encoding='UTF-8'?>
<login>
	<result><%= sVal %></result>	
</login>
</body>
</html>