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
<title>게시판 목록</title>
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
   
   //체크박스 함수
   //체크박스가 클릭되면 실행된다.
   function checkOnly(chk){
      console.log('checkOnly함수 들어옴'+chk);
      console.log('chk.value>>>'+chk.value);
      //체크박스의 chkInBnum에 해당하는 객체를 가져온다.
        var obj = document.getElementsByName("sbnum");   
      console.log('obj>>>>'+obj);
      for(var i=0; i < obj.length; i++){ 
            if(obj[i] != chk){
                obj[i].checked = false;                
            }
            console.log(' if :: obj['+i+'].checked >>> : ' + obj[i].checked);
        }
    }      
   
   
   //버튼 함수
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
         //체크박스가 체크되어있는지 확인한다.         
         var obj = document.getElementsByName("sbnum");
         var nCnt = 0;
         //체크박스길이만큼 반복문을 돌린다.
         for(var i=0; i < obj.length; i++){ 
            //체크박스가 체크되어있으면 실행된다.
                if (obj[i].checked == true){
                   nCnt++;
                }                                     
           }
         
         console.log('nCnt>>>>'+nCnt);
         
         if (nCnt == 0){   
            alert("체크박스를 체크하세요");            
         }else{            
            $("#sboardForm").attr("action", "boardSelect.sw");
            $("#sboardForm").submit();            
         }            
      }
         
      if ('D' == strValue){   
         $('#sbnum').val($('input:checkbox[id="sbnum"]').val());
         
         //체크박스가 체크되어있는지 확인한다.         
         var obj = document.getElementsByName("sbnum");
         var nCnt = 0;
         //체크박스길이만큼 반복문을 돌린다.
         for(var i=0; i < obj.length; i++){ 
            //체크박스가 체크되어있으면 실행된다.
                if (obj[i].checked == true){
                   nCnt++;
                }                                     
           }         
         console.log('nCnt>>>>'+nCnt);
         
         if (nCnt == 0){   
            alert("체크박스를 체크하세요");            
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

   //페이징 관련 변수 초기화 
   String pageSize    = "0"; // 페이지에 보이는 글 갯수 
   String groupSize    = "0";
   String curPage       = "0"; // 페이지 번호
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
         <c:if test="${paging.cntPerPage == 3}">selected</c:if>>3줄 보기</option>
      <option value="5"
         <c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
      <option value="7"
         <c:if test="${paging.cntPerPage == 7}">selected</c:if>>7줄 보기</option>
      <option value="10"
         <c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
   </select>
</div> <!-- 옵션선택 끝 -->
<table border="1" align="center">
   <thead>
      <tr>
         <td colspan="10" align="center">
            <h2>게시판</h2>
         </td>
      </tr>
      <tr>
         <td colspan="10" align="right">
            <input type="button" value="글쓰기" onclick="boardFunction('I')">
            <input type="button" value="글목록" onclick="boardFunction('SALL')">
            <input type="button" value="글수정" onclick="boardFunction('U')">
            <input type="button" value="글삭제" onclick="boardFunction('D')">   
         </td>                  
      </tr>
      <tr>
         <td class="tt"><input type="checkbox" name="chkAll" id="chkAll"></td>
         <td class="tt">글번호</td>
         <td class="tt">제목</td>
         <td class="tt">이름</td>
         <td class="tt">비밀번호</td>
         <td class="tt">내용</td>
         <td class="tt">삭제여부</td>
         <td class="tt">입력일</td>
         <td class="tt">수정일</td>
         <td class="tt">사진</td>
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
         <input type="button" value="글쓰기" onclick="boardFunction('I')">
         <input type="button" value="글목록" onclick="boardFunction('SALL')">
         <input type="button" value="글수정" onclick="boardFunction('U')">
         <input type="button" value="글삭제" onclick="boardFunction('D')">                           
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