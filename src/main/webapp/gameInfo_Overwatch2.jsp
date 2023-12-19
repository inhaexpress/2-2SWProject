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
         <td width="300"><img src="small/Overwatch2.jpeg"  border = "3ps solid black;"></td>
         <td width="400" class="w-50 p-3">
            <h3>오버워치2</h3>
            <hr>
            <table border="0">
            	<tr>
            		<td>> 플랫폼</td>
            		<td>&nbsp;&nbsp;&nbsp;PC</td>
            	</tr>
            	<tr>
            		<td>> 장르</td>
            		<td>&nbsp;&nbsp;&nbsp;FPS</td>
            	</tr>
            	<tr>
            		<td>> 제작사</td>
            		<td>&nbsp;&nbsp;&nbsp;<a href="http://www.blizzard.com/" target="_blank">블리자드</a></td>
            	</tr>
            	<tr>
            		<td>> 이용등급</td>
            		<td>&nbsp;&nbsp;&nbsp;이용등급 X</td>
            	</tr>
            	<tr>
            		<td>> 출시년도</td>
            		<td>&nbsp;&nbsp;&nbsp;2022년 10월 5일</td>
            	</tr>
            </table>
         </td>
         <td class="w-50 p-3">
		<div class="row">
			<table class="table table-hover" style="text-align: center; border: 2px solid black;">
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
						if(list.get(i).getBbsCategory().equals("watch")) {
							category = "오버워치2";
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
				'오버워치'는 미래 시대를 배경으로 삼은 FPS 게임이다. <br>
				5 VS 5, 10명이 치고 박는 멀티플레이를 지원하는 '오버워치'는 블리자드 특유의 무거운 이미지가 아닌 '가벼움'을 전면에 내세웠다. <br>
				공격과 수비, 돌격, 지원 등 4가지 병과로 나뉘며, 캐릭터마다 4 ~ 5가지 기술과 '궁극기'를 사용할 수 있다. <br><br>
				 
				 
					'오버워치 2'는 1편과 달리 기본적으로 스토리 모드를 중심으로 구성돼 있다. <br>
				 	게임은 파리, 눔바니, 부산, 66번 국도 같은 기존 맵에서 적을 방어하거나 사령선에 침투하는 등 다양한 PvE 방식의 임무로 구성돼 있다.<br>
				 	
				 </div>
				 <div class="tab-pane fade show" id="2">
				 	<table border="0">
				 		<tr>
				 			<td>
				 				<iframe width="265" height="150" src="https://www.youtube.com/embed/DR_Y8GA6OqY/0.jpg" 
				 				title="YouTube video player" frameborder="0" 
				 				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
				 				allowfullscreen></iframe>
				 				<iframe width="265" height="150" src="https://www.youtube.com/embed/rVMpyNWIgZE/0.jpg" 
				 				title="YouTube video player" frameborder="0" 
				 				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
				 				allowfullscreen></iframe>
				 				<iframe width="265" height="150" src="https://www.youtube.com/embed/b-XpDX0if-8/0.jpg" 
				 				title="YouTube video player" frameborder="0" 
				 				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
				 				allowfullscreen></iframe>
				 				<iframe width="265" height="150" src="https://www.youtube.com/embed/IGAWmPDGHNk/0.jpg" 
				 				title="YouTube video player" frameborder="0" 
				 				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
				 				allowfullscreen></iframe>
				 			</td>
				 		</tr>
				 		<tr>
				 			<td>
				 				<iframe width="265" height="150" src="https://www.youtube.com/embed/-OGTHlgFDFg/0.jpg" 
				 				title="YouTube video player" frameborder="0" 
				 				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
				 				allowfullscreen></iframe>
				 				<iframe width="265" height="150" src="https://www.youtube.com/embed/OWf7OB7LzUs/0.jpg" 
				 				title="YouTube video player" frameborder="0" 
				 				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
				 				allowfullscreen></iframe>
				 				<iframe width="265" height="150" src="https://www.youtube.com/embed/AMTHpnDcnTk/0.jpg" 
				 				title="YouTube video player" frameborder="0" 
				 				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
				 				allowfullscreen></iframe>
				 				<iframe width="265" height="150" src="https://www.youtube.com/embed/mB9IF7D9a78/0.jpg" 
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