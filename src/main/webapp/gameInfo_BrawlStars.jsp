<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="user.UserDAO" %>
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
         <td width="300"><img src="small/BrawlStars.jpeg"></td>
         <td width="400" class="w-50 p-3">
            <h3>Brawl Stars</h3>
            <hr>
            <table border="0">
            	<tr>
            		<td>> 플랫폼</td>
            		<td>&nbsp;&nbsp;&nbsp;모바일</td>
            	</tr>
            	<tr>
            		<td>> 장르</td>
            		<td>&nbsp;&nbsp;&nbsp;슈팅, 배틀로얄, AOS</td>
            	</tr>
            	<tr>
            		<td>> 제작사</td>
            		<td>&nbsp;&nbsp;&nbsp;<a href="https://supercell.com/en/"  target="_blank" style="text-decoration:none">SuperCell</a></td>
            	</tr>
            	<tr>
            		<td>> 이용등급</td>
            		<td>&nbsp;&nbsp;&nbsp;만 7세 이상</td>
            	</tr>
            	<tr>
            		<td>> 출시년도</td>
            		<td>&nbsp;&nbsp;&nbsp;2018년 12월 12일</td>
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
						if(list.get(i).getBbsCategory().equals("brawl")) {
							category = "브롤스타즈";
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
				 	슈퍼셀의 모바일 슈팅 게임이다.<br><br>

					2017년 6월부터 1년 6개월동안 베타테스트를 거치며 2018년 12월 정식 출시되었다.<br><br>
					
					모바일 환경에 슈팅 게임의 묘미를 라이트하게 잘 이식했다는 평가를 받고 있으며, 슈퍼셀이 출시한 게임 중 출시 직후부터 지금까지 가장 선전하고 있다. <br>
					또한 아기자기한 캐릭터와 배경 디자인이 이 게임의 또다른 특징으로, 저연령층의 인기가 특히 높은 편이다.<br><br>
					
					3대3 PvP 팀전이 기본적이나, 배틀로얄, PvE, 레이드, 맵 메이커 등의 다양한 모드 및 컨텐츠도 지원하고 있다.
				 	
				 </div>
				 <div class="tab-pane fade show" id="2">
				 	<table border="0">
				 		<tr>
				 			<td>
				 				<iframe width="265" height="150" src="https://www.youtube.com/embed/Czelgg-jvL8/0.jpg" 
				 				title="YouTube video player" frameborder="0" 
				 				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
				 				allowfullscreen></iframe>
				 				<iframe width="265" height="150" src="https://www.youtube.com/embed/cGNziTCFl1I/0.jpg" 
				 				title="YouTube video player" frameborder="0" 
				 				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
				 				allowfullscreen></iframe>
				 				<iframe width="265" height="150" src="https://www.youtube.com/embed/8U0k4bv-IzM/0.jpg" 
				 				title="YouTube video player" frameborder="0" 
				 				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
				 				allowfullscreen></iframe>
				 				<iframe width="265" height="150" src="https://www.youtube.com/embed/1FTul2cRxic/0.jpg" 
				 				title="YouTube video player" frameborder="0" 
				 				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
				 				allowfullscreen></iframe>
				 			</td>
				 		</tr>
				 		<tr>
				 			<td>
				 				<iframe width="265" height="150" src="https://www.youtube.com/embed/Q3qEl_RIXg0/0.jpg" 
				 				title="YouTube video player" frameborder="0" 
				 				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
				 				allowfullscreen></iframe>
				 				<iframe width="265" height="150" src="https://www.youtube.com/embed/j8kqAoktfXY/0.jpg" 
				 				title="YouTube video player" frameborder="0" 
				 				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
				 				allowfullscreen></iframe>
				 				<iframe width="265" height="150" src="https://www.youtube.com/embed/E3kOG0ZJGUw/0.jpg" 
				 				title="YouTube video player" frameborder="0" 
				 				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
				 				allowfullscreen></iframe>
				 				<iframe width="265" height="150" src="https://www.youtube.com/embed/TGtZS4K_ibw/0.jpg" 
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