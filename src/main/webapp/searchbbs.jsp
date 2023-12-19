<%@page import="user.UserDAO"%>
<%@page import="bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<html>
<head>
<meta charset="EUC-KR">
<title>SW프로젝트</title>
</head>
<body>
   	    <%
    		request.setCharacterEncoding("UTF-8");
    	%>
		<tbody>
		<% 
			String userID = null;
			if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			}
		%>
 <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
 
  
     <a class="navbar-brand" style="margin-left:20px" href="main.jsp"><img src="https://i.imgur.com/4rTnDlt.png" style="height:50px;"></a>
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="bbs.jsp">게시판</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">게임목록</a>
      </li>
    </ul>
     <%
		 if(userID == null) {
	 %>
	  <div class="position-absolute end-0">
	  <ul class="nav navbar-nav navbar-left">
			 <a class="btn btn-outline-dark me-md-2 btn-sm" type="button" href="login.jsp" >로그인</a>	
			 <a class="btn btn-outline-dark me-md-2 btn-sm" type="button" href="join.jsp" >회원가입</a>
      </ul>
     </div>
    <%
	   } else {
	%>
	<div class="position-absolute end-0">
	<ul class="nav navbar-nav navbar-left">	
	<%
	     String userName = null;
  	 	 if (session.getAttribute("userID") != null) {
		 userID = (String) session.getAttribute("userID");
		 UserDAO userDAO=new UserDAO();
       	 userName = userDAO.getUser(userID);
	%>
	<%=userName%>님
	<%} else{%>
    <%}%>  
		<a class="btn btn-dark me-md-2 btn-sm" type="button" href="logoutAction.jsp" style="margin-left:10px; margin-top:-5px;" >로그아웃</a>
    </ul>
    </div>
	   
    	<%
			}
		%>
    	</nav>
 
       		    <h4 style="text-align:center; margin-top:10px;">겸색결과</h4> 		 
	  			 <div class="container">
				 <div class="row">
				 <table class="table table-striped" style="text-align: center; border: 3px solid black; margin-top:20px;">
				<thead>
					<tr>
					 <th style="background-color: #eeeeee; text-align: center;">번호</th>
					 <th style="background-color: #eeeeee; text-align: center;">제목</th>
					 <th style="background-color: #eeeeee; text-align: center;">작성자</th>
					 <th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
					</div>
					</div>
			     </thead>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getSearch(request.getParameter("searchField"),
								request.getParameter("searchText"));
						if (list.size() == 0) {
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('검색결과가 없습니다.')");
							script.println("history.back()");
							script.println("</script>");
						}
						for (int i = 0; i < list.size(); i++) {
					%>
					
					<tr>
						<td><%=list.get(i).getBbsID()%></td>
						<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>" style="text-decoration:none; color:black;"><%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a></td>
						<td><%=list.get(i).getUserID()%></td>
						<td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"
						+ list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</tbody>
		
</body>
</html>