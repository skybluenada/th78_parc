<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="a.b.c.com.board.vo.BoardVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Member Form</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0
      maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<style type="text/css">
div {
	margin: 50px 0px 0px 100px;
}

.mem {
	text-align: center;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

<%
	
	//����¡ ���� ���� �ʱ�ȭ 
	String pageSize 	= "0"; // �������� ���̴� �� ���� 
	String groupSize 	= "0";
	String curPage 		= "0"; // ������ ��ȣ
	String totalCount 	= "0";
	
	Object obj = request.getAttribute("listAll");
	if (obj == null) return;
	
	List<BoardVO> list = (List<BoardVO>)obj;
	
	int nCnt = list.size();
	System.out.println("nCnt >>> : " + nCnt);
	
	BoardVO bvo = list.get(0);	
%>

$(document).ready(function(){
	$("#pwCheck").click(function(){
		var pw = "<%=bvo.getSbpw()%>";
		
		
		if($('#sbpw').val() == pw){
			alert("��й�ȣ�� ��ġ�մϴ� >>> : ");
			upbool = true;
			document.boardISUDForm.sbpw.disabled = "true";
		}else{
			alert("��й�ȣ�� �ٸ��ϴ� >>> : ");
			document.boardISUDForm.sbpw.value = "";
			document.boardISUDForm.sbpw.focus();
		}
	});
	
	$("#updateData").click(function(){
		if(confirm('������ �����ұ��?')){
			$("#boardISUDForm").attr("action", "boardUpdate.sw");
			$("#boardISUDForm").submit();
		}
	});
	
	$("#deleteData").click(function(){
		if(confirm('������ �����ұ��?')){
			$("#boardISUDForm").attr("action", "boardDelete.sw");
			$("#boardISUDForm").submit();
		}
	});
	
	$("#closeWindow").click(function(){
		window.close();
	});
})
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("EUC-KR");
	%>
	UPDATE
	<hr>
	
	<div>
		<form name="boardISUDForm" id="boardISUDForm">
		<table border="1">
			<tr>
				<td colspan="2" align="center">
				<h3>�Խ���</h3>
				</td>
			</tr>
			<tr>
				<td class="bod">�۹�ȣ</td>
				<td>
					<input type="text" name="sbnum" id="sbnum" value="${boardVO.sbnum}" readonly/>
				</td>
			</tr>
			<tr>
				<td class="bod">����</td>
				<td>
					<input type="text" name="sbsubject" id="sbsubject" value="<%= bvo.getSbsubject() %>">
				</td>
			</tr>
			<tr>
				<td class="bod">�̸�</td>
				<td>
					<input type="text" name="sbname" id="sbname" value="<%= bvo.getSbname() %>">
				</td>
			</tr>
			<tr>
				<td class="bod">����</td>
				<td>
					<textarea rows="5" cols="50" name="sbcontent" id="sbcontent"><%= bvo.getSbcontent() %></textarea>
				</td>
			</tr>
			<tr>
				<td class="bod">����</td>
				<td>
					<input type="text" name="sbfile" id="sbfile" value="<%= bvo.getSbfile() %>">
				</td>
			</tr>
			<tr>
				<td class="bod">�����</td>
				<td>
					<input type="text" name="insertdate" id="insertdate" value="<%= bvo.getInsertdate() %>" disabled/>
				</td>
			</tr>
			<tr>
				<td class="bod">������</td>
				<td>
					<input type="text" name="updatedate" id="updatedate" value="<%= bvo.getUpdatedate() %>" disabled/>
				</td>
			</tr>
			<tr>
				<td class="bod">�н�����</td>
				<td>
					<input type="text" name="sbpw" id="sbpw" />
					<input type="button" value="��й�ȣȮ��" id="pwCheck"/>
				</td>
			</tr>
			<tr align="right">
				<td colspan="2">
					<input type="button" id="updateData" value="����">
					<input type="button" id="deleteData" value="����">
					<input type="button" id="closeWindow" value="�ݱ�">
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>