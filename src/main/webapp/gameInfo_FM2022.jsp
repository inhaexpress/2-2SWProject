<%@page import="user.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width", initial-scale="1">
<title>Insert title here</title>
</head>
<body style="background-color:#e7eaef;">
<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		String searchCategory = null;
		boolean isSearchCategory = false;
		if(request.getParameter("searchCategory") != null) {
			searchCategory = request.getParameter("searchCategory");
			isSearchCategory = true;
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
        <a class="nav-link" href="gameList.jsp">게임목록</a>
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
	환영합니다! <%=userName%>님
	<%} else{%>
    <%}%>  
	<a class="btn btn-dark me-md-2 btn-sm" type="button" href="logoutAction.jsp" style="margin-left:10px; margin-top:-5px;" >로그아웃</a>
    </ul>
    </div>
	   
    <%
		}
	%>
</nav>
   <table border = "3px solid black;" width=100% height=100% style="background-color:white; margin-top:10px;">
      <tr>
         <td width="300"><img src="small/FM2022.jpeg" border="3px solid black;"></td>
         <td width="400" class="w-50 p-3">
            <h3>Football Manager 2022</h3>
            <hr>
            <table border="0">
            	<tr>
            		<td>> 플랫폼</td>
            		<td>&nbsp;&nbsp;&nbsp;PC</td>
            	</tr>
            	<tr>
            		<td>> 장르</td>
            		<td>&nbsp;&nbsp;&nbsp;시뮬레이션 게임</td>
            	</tr>
            	<tr>
            		<td>> 제작사</td>
            		<td>&nbsp;&nbsp;&nbsp;<a href="https://www.sigames.com/" target="_blank" style="text-decoration:none;">Sports Interactive</a></td>
            	</tr>
            	<tr>
            		<td>> 이용등급</td>
            		<td>&nbsp;&nbsp;&nbsp;전체이용가</td>
            	</tr>
            	<tr>
            		<td>> 출시년도</td>
            		<td>&nbsp;&nbsp;&nbsp;2021년 11월 9일</td>
            	</tr>
            </table>
         </td>
         <td class="w-50 p-3">
		<div class="row">
			<table class="table table-hover" style="text-align: center; border: 3px solid black;">
				<thead>
					<tr>
					 	<th style="background-color: #eeeeee; text-align: center;">제목</th>
					 	<th style="background-color: #eeeeee; text-align: center;" width="150">작성자</th>
					</tr>
				</thead>
				<tbody>
					<%
					BbsDAO bbsDAO = new BbsDAO();
					ArrayList<Bbs> list = null;
					if(isSearchCategory) {
						list = bbsDAO.getList(pageNumber, searchCategory);
					} else {
						list = bbsDAO.getList(pageNumber);
					}
					for (int i = 0; i < list.size(); i++) {
						String category = null;
						if(list.get(i).getBbsCategory().equals("fm")) {
							category = "풋볼매니저";
					%>
					<tr>
						<td>
						<a href="bbs.jsp?searchCategory=<%=list.get(i).getBbsCategory()%>" style="text-decoration:none; color:black;">(<%=category%>)</a>
						<a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>" style="text-decoration:none; color:black;">
						<%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></a>
						<td><a<%=list.get(i).getUserID()%>"><%= list.get(i).getUserID().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></a></td>
					</tr>
					<%
						}
					%>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
         </td>
      </tr>
      <tr>
         <td colspan="3">
         	<ul class="nav nav-tabs">
			    <li class="nav-item" style="background-color:black; border:2px solid white;"><a class="nav-link" data-toggle="tab" href="#1" style="color:white;">게임 설명</a></li>
			    <li class="nav-item" style="background-color:black; border:2px solid white;"><a class="nav-link" data-toggle="tab" href="#2" style="color:white;">게임 영상</a></li> 
			</ul>
			<div class="tab-content">
				 <div class="tab-pane fade show active" id="1">
				 	세가 게임즈 산하 개발사 중 하나인 스포츠 인터랙티브에서 개발하고 세가 게임즈에서 유통하는 축구 클럽 매니지먼트 시뮬레이션 게임.<br> 
				 	PC 플랫폼으로 먼저 개발되었으나 모바일(FMM)과 , 태블릿(FMT)전용 버전 또한 출시되었다. <br>
				 	축구 시뮬레이션 게임들 중에서는 실제 52개국 117리그의 클럽을 사실적으로 운영할 수 있는 거의 독점적인 게임이다.<br>
				 	
				 </div>
				 <div class="tab-pane fade show" id="2">
				 	<table border="0">
				 		<tr>
				 			<td>
				 				<iframe width="265" height="150" src="https://www.youtube.com/embed/2-t1MnNBzro/0.jpg" 
				 				title="YouTube video player" frameborder="0" 
				 				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
				 				allowfullscreen></iframe>
				 				<iframe width="265" height="150" src="https://www.youtube.com/embed/Gvxqu9TF5Fs/0.jpg" 
				 				title="YouTube video player" frameborder="0" 
				 				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
				 				allowfullscreen></iframe>
				 				<iframe width="265" height="150" src="https://www.youtube.com/embed/uRuFAr8pJEA/0.jpg" 
				 				title="YouTube video player" frameborder="0" 
				 				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
				 				allowfullscreen></iframe>
				 				<iframe width="265" height="150" src="https://www.youtube.com/embed/v92RA9IzhYY/0.jpg" 
				 				title="YouTube video player" frameborder="0" 
				 				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
				 				allowfullscreen></iframe>
				 			</td>
				 		</tr>
				 		<tr>
				 			<td>
				 				<iframe width="265" height="150" src="https://www.youtube.com/embed/kFUxLGncF18/0.jpg" 
				 				title="YouTube video player" frameborder="0" 
				 				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
				 				allowfullscreen></iframe>
				 				<iframe width="265" height="150" src="https://www.youtube.com/embed/h43Nr1vF6ZU/0.jpg" 
				 				title="YouTube video player" frameborder="0" 
				 				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
				 				allowfullscreen></iframe>
				 				<iframe width="265" height="150" src="https://www.youtube.com/embed/E-PEMO7R2Io/0.jpg" 
				 				title="YouTube video player" frameborder="0" 
				 				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
				 				allowfullscreen></iframe>
				 				<iframe width="265" height="150" src="https://www.youtube.com/embed/8JAwx7xRPSs/0.jpg" 
				 				title="YouTube video player" frameborder="0" 
				 				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
				 				allowfullscreen></iframe>
				 			</td>
				 		</tr>
				 	</table>
				 </div>     
			</div>
         </td>
      </tr>
   </table>
</body>
</html>