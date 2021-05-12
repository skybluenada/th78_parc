<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ���</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	//��ư ó�� jQuery			
	$(document).ready(function(){
		
		$("#insertData").click(function(){
			if(!validateForm()) return;
			if(confirm('����� �����ұ��?')){
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
			alert("������ �Է����ּ���.");
			return false;
		}
		if($("#sbname").val().replace(/\s/g,"")==""){
			alert("�̸��� �Է����ּ���.");
			return false;
		}
		if($("#sbpw").val().replace(/\s/g,"")==""){
			alert("��й�ȣ�� �Է����ּ���.");
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
		<td colspan="2" align="center">�Խ��� �۾���</td>				
	</tr>
	<tr>
		<td align="center">�۹�ȣ</td>
		<td><input type="text" name="sbnum" id="sbnum" size="20" readonly></td>
	</tr>
	<tr>
		<td align="center">����</td>
		<td><input type="text" name="sbsubject" id="sbsubject" size="53"></td>
	</tr>
	<tr>
		<td  align="center">�̸�</td>
		<td><input type="text" name="sbname" id="sbname" size="53"></td>
	</tr>
	<tr>
		<td  align="center">��й�ȣ</td>
		<td><input type="password" name="sbpw" id="sbpw" size="20"></td>
	</tr>
	<tr>
		<td  align="center">�Է���</td>
		<td><input type="text" name="insertdate" size="20" disabled></td>
	</tr>
	<tr>
		<td  align="center">������</td>
		<td><input type="text" name="updatedate" size="20" disabled></td>
	</tr>
	<tr>
		<td  align="center">����</td>
		<td>
		<textarea name="sbcontent" id="sbcontent" cols="50" rows="10"></textarea>
	</td>
	</tr>
	<tr>
		<td  align="center">����</td>
		<td>
		<input type="file" name="sbfile" id="sbfile">
	</td>
	</tr>
	<tr>
		<td colspan="2" align="center">				
		<input type="button" id="insertData" value="������">
		<input type="reset" value="�ٽ�">
	</td>				
	</tr>
</table>
</form>
</body>
</html>