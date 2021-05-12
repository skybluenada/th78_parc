<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="a.b.c.com.board.vo.BoardVO" %> 
<%@ page import="java.util.ArrayList" %> 
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� ���</title>
<style type="text/css">
   .tt{
      text-align: center;
      font-weight: bold;
   }
   h2 {
      text-align: center;
   }
   table {
      width: 100%;
   }
   #outter {
      display: block;
      width: 60%;
      margin: auto;
   }
   a {
      text-decoration: none;
   }
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
   console.log('boardSelectAll');
   function selChange() {
      var sel = document.getElementById('cntPerPage').value;
      location.href="boardList.sw?nowPage=${paging.nowPage}&cntPerPage="+sel;
   }
   
   //üũ�ڽ� �Լ�
   //üũ�ڽ��� Ŭ���Ǹ� ����ȴ�.
   function checkOnly(chk){
      console.log('checkOnly�Լ� ����'+chk);
      console.log('chk.value>>>'+chk.value);
      //üũ�ڽ��� chkInBnum�� �ش��ϴ� ��ü�� �����´�.
        var obj = document.getElementsByName("sbnum");   
      console.log('obj>>>>'+obj);
      for(var i=0; i < obj.length; i++){ 
            if(obj[i] != chk){
                obj[i].checked = false;                
            }
            console.log(' if :: obj['+i+'].checked >>> : ' + obj[i].checked);
        }
    }      
   
   
   //��ư �Լ�
   function boardFunction(str, str2){
      var strValue=str;
      var sbnum=str2;
      console.log('boardFunction>>>>'+str);
      console.log('sbnum >>>>'+sbnum);
         
      if ('I' == strValue){      
         $("#sboardForm").attr("action", "boardForm.sw");
         $("#sboardForm").submit();
      }      
      
      if ('SALL' == strValue){   
         $("#sboardForm").attr("action", "boardSelectAll.sw");
         $("#sboardForm").submit();   
      }         
      
      if ('U' == strValue){
         $('#sbnum').val($('input:checkbox[id="sbnum"]').val());
         //üũ�ڽ��� üũ�Ǿ��ִ��� Ȯ���Ѵ�.         
         var obj = document.getElementsByName("sbnum");
         var nCnt = 0;
         //üũ�ڽ����̸�ŭ �ݺ����� ������.
         for(var i=0; i < obj.length; i++){ 
            //üũ�ڽ��� üũ�Ǿ������� ����ȴ�.
                if (obj[i].checked == true){
                   nCnt++;
                }                                     
           }
         
         console.log('nCnt>>>>'+nCnt);
         
         if (nCnt == 0){   
            alert("üũ�ڽ��� üũ�ϼ���");            
         }else{            
            $("#sboardForm").attr("action", "boardSelect.sw");
            $("#sboardForm").submit();            
         }            
      }
         
      if ('D' == strValue){   
         $('#sbnum').val($('input:checkbox[id="sbnum"]').val());
         
         //üũ�ڽ��� üũ�Ǿ��ִ��� Ȯ���Ѵ�.         
         var obj = document.getElementsByName("sbnum");
         var nCnt = 0;
         //üũ�ڽ����̸�ŭ �ݺ����� ������.
         for(var i=0; i < obj.length; i++){ 
            //üũ�ڽ��� üũ�Ǿ������� ����ȴ�.
                if (obj[i].checked == true){
                   nCnt++;
                }                                     
           }         
         console.log('nCnt>>>>'+nCnt);
         
         if (nCnt == 0){   
            alert("üũ�ڽ��� üũ�ϼ���");            
         }else{            
            $("#sboardForm").attr("action", "boardDelete.sw");
            $("#sboardForm").submit();         
         }                                          
      }
      
      
   }
</script>
   
</head>
<body>
<% request.setCharacterEncoding("EUC-KR");%> 
<%

   //����¡ ���� ���� �ʱ�ȭ 
   String pageSize    = "0"; // �������� ���̴� �� ���� 
   String groupSize    = "0";
   String curPage       = "0"; // ������ ��ȣ
   String totalCount    = "0";
   
   Object obj = request.getAttribute("listAll");
   if (obj == null) return;
   
   List<BoardVO> list = (List<BoardVO>)obj;
   
   int nCnt = list.size();
   System.out.println("nCnt >>> : " + nCnt);
   
   if (list.size() > 0){
%>

<form name="sboardForm" id="sboardForm">
<div style="float: right;">
   <select id="cntPerPage" name="sel" onchange="selChange()">
      <option value="3"
         <c:if test="${paging.cntPerPage == 3}">selected</c:if>>3�� ����</option>
      <option value="5"
         <c:if test="${paging.cntPerPage == 5}">selected</c:if>>5�� ����</option>
      <option value="7"
         <c:if test="${paging.cntPerPage == 7}">selected</c:if>>7�� ����</option>
      <option value="10"
         <c:if test="${paging.cntPerPage == 10}">selected</c:if>>10�� ����</option>
   </select>
</div> <!-- �ɼǼ��� �� -->
<table border="1" align="center">
   <thead>
      <tr>
         <td colspan="10" align="center">
            <h2>�Խ���</h2>
         </td>
      </tr>
      <tr>
         <td colspan="10" align="right">
            <input type="button" value="�۾���" onclick="boardFunction('I')">
            <input type="button" value="�۸��" onclick="boardFunction('SALL')">
            <input type="button" value="�ۼ���" onclick="boardFunction('U')">
            <input type="button" value="�ۻ���" onclick="boardFunction('D')">   
         </td>                  
      </tr>
      <tr>
         <td class="tt"><input type="checkbox" name="chkAll" id="chkAll"></td>
         <td class="tt">�۹�ȣ</td>
         <td class="tt">����</td>
         <td class="tt">�̸�</td>
         <td class="tt">��й�ȣ</td>
         <td class="tt">����</td>
         <td class="tt">��������</td>
         <td class="tt">�Է���</td>
         <td class="tt">������</td>
         <td class="tt">����</td>
      </tr>
   </thead>
             
   <tbody>
   <c:forEach items="${listAll}" var="blist">
   <tr>
      <td align="center">
         <input type="checkbox" name="sbnum" id="sbnum" value="${blist.sbnum}" onclick="checkOnly(this)">
      </td>      
      <td class="tt">${blist.sbnum}</td>
      <td class="tt">${blist.sbsubject} </td>
      <td class="tt">${blist.sbname}</td>
      <td class="tt">${blist.sbpw} </td>
      <td class="tt">${blist.sbcontent} </td>      
      <td class="tt">${blist.deleteyn} </td>
      <td class="tt">${blist.insertdate} </td>
      <td class="tt">${blist.updatedate} </td>
      <td class="tt">${blist.sbfile} </td>   
   </tr>   
   </c:forEach>   
<%
   }//end of for
%>                  
   <tr>
      <td colspan="10" align="right">
         <input type="hidden" name="ISUD_TYPE">         
         <input type="button" value="�۾���" onclick="boardFunction('I')">
         <input type="button" value="�۸��" onclick="boardFunction('SALL')">
         <input type="button" value="�ۼ���" onclick="boardFunction('U')">
         <input type="button" value="�ۻ���" onclick="boardFunction('D')">                           
      </td>
   </tr>
            
   </tbody>      
</table>   

<div style="display: block; text-align: center;">      
   <c:if test="${paging.startPage != 1 }">
      <a href="boardList.sw?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
   </c:if>
   <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
      <c:choose>
         <c:when test="${p == paging.nowPage }">
            <b>${p }</b>
         </c:when>
         <c:when test="${p != paging.nowPage }">
            <a href="boardList.sw?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
         </c:when>
      </c:choose>
   </c:forEach>
   <c:if test="${paging.endPage != paging.lastPage}">
      <a href="boardList.sw?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
   </c:if>
</div>
   
</form>   



</body>
</html>