<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="css/custom.css">
<title>SW 프로젝트</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
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

	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 3px solid black; margin-top:10px;">
				<thead>
					<tr>
					 	<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= bbs.getUserID() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11,13) + "시 " + bbs.getBbsDate().substring(14,16) + "분" %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
				</tbody>
			</table>
			
			
			<div class="d-grid gap-2 d-md-block" style="margin-top:15px; margin-left:-10px;">
			<a href="bbs.jsp" class="btn btn-outline-primary">목록</a>
			<%
				if(userID != null && userID.equals(bbs.getUserID())) {
			%>
					<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-outline-primary">수정</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-outline-primary">삭제</a>
			<%
				}
			%>
			</div>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<input type="submit" class="btn btn-outline-primary pull-right" value="글쓰기" style="margin-top:-25px; margin-left:30px;">
		    </div>
	</div>
 </div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>