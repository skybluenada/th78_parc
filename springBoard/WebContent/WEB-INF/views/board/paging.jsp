<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collection" %>

<%
	/**********************************
	�����ؾ� �� ����
	***********************************/
	String	url = null;
	String	str = null;
	
	url = request.getParameter("url");
	str = request.getParameter("str");
	if(str != null)
	{
		str = str + "&";
	}
%>

<%
	/**********************************
	������ �׺���̼� ���� ����
	***********************************/
	// ���������� ������ �Խù��� ��
	int pageSize = 0;
	
	// �׷��� ũ��
	int groupSize = 0;
	
	// ��ü �Խù��� ����
	int totalCount = 0;
	
	//���� ������
	int curPage = 0;
	
	// ��ü �������� ����
	int pageCount = 0;
	
	if(request.getParameter("pageSize") !=null){
		// pageSize �����Ͱ� ������ ���ڿ����� ���ڷ� �ٲټ��� 
		pageSize=Integer.parseInt(request.getParameter("pageSize"));
	}
	
	if(request.getParameter("groupSize") !=null){
		groupSize=Integer.parseInt(request.getParameter("groupSize"));
	}
	
	if(request.getParameter("totalCount") !=null){
		totalCount=Integer.parseInt(request.getParameter("totalCount"));
	}
	
	if(request.getParameter("curPage") !=null){
		curPage=Integer.parseInt(request.getParameter("curPage"));
	}
	
	pageCount=(int)Math.ceil(totalCount/(pageSize+0.0));
	
	int curGroup=(curPage-1)/groupSize;
	int linkPage=curGroup*groupSize;
	
	System.out.println("pageSize >>> : " + pageSize);
	System.out.println("groupSize >>> : " + groupSize);
	System.out.println("totalCount >>> : " + totalCount);
	System.out.println("curPage >>> : " + curPage);
	System.out.println("----------------------------------");
	System.out.println("pageCount >>> : " + pageCount);
	System.out.println("curGroup >>> : " + curGroup);
	System.out.println("linkPage >>> : " + linkPage);
	
%>
<p align="center">
<%
	System.out.println("curGroup_1==>>"+curGroup);
	if(curGroup >0){
%>
	
	<a href="<%=url%><%=str%>curPage=1">����</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=url%><%=str%>curPage=<%=linkPage%>">��</a>&nbsp;&nbsp;&nbsp;
<%		
	}else{
%>
		����&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;
<%	
	}//end of if-else
		
	linkPage++;
	System.out.println("linkPage_1==>>"+linkPage);
	
	int loopCount =groupSize;
	System.out.println("loopCount_1==>>"+loopCount);
	
	System.out.println(loopCount +" >0   && "+ linkPage+ " <= "+ pageCount);
	while(loopCount >0 && linkPage <= pageCount){
		if(linkPage == curPage){
		System.out.println("linkPage==>"+linkPage);
%>
			<%=linkPage %>
<%
		}else{
		System.out.println("linkPage==>"+linkPage);
%>
		[<a href="<%=url%><%=str%>curPage=<%=linkPage%>"><%=linkPage%></a>]&nbsp;
<%			
		}//end of if-else
			
		linkPage++;
		loopCount--;
		System.out.println(">>>"+linkPage+" : "+loopCount);
	}//end of while
		
	System.out.println("<<<>>>"+linkPage+" <= "+pageCount);	
	if(linkPage <=pageCount){
		System.out.println("linkPage==>"+linkPage);
		System.out.println("pageCount==>"+pageCount);
%>
		<a href="<%=url%><%=str%>curPage=<%=linkPage%>">��</a>&nbsp;&nbsp;&nbsp;
		<a href="<%=url%><%=str%>curPage=<%=pageCount%>">����</a>&nbsp;&nbsp;&nbsp;
<%		
	}else{
%>
		��&nbsp;&nbsp;&nbsp;����&nbsp;&nbsp;&nbsp;
<%			
	}//end of if-else	
		
%>
