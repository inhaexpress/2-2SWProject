<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="css/custom.css">
<title>SW 프로젝트</title>
<style type="text/css">
	a, a:hover {
	color: #000000;
	text-decoration: none;
	}	
</style>
</head>
<body>
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
	
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; margin-top:20px;">
				<thead>
					<tr>
					 	<th style="background-color: #eeeeee; text-align: center;">번호</th>
					 	<th style="background-color: #eeeeee; text-align: center;">카테고리</th>
					 	<th style="background-color: #eeeeee; text-align: center;">제목</th>
					 	<th style="background-color: #eeeeee; text-align: center;">작성자</th>
					 	<th style="background-color: #eeeeee; text-align: center;">작성일</th>
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
							if(list.get(i).getBbsCategory().equals("baba")) {
								category = "바바이즈유";
							} else if(list.get(i).getBbsCategory().equals("brawl")) {
								category = "브롤스타즈";
							} else if(list.get(i).getBbsCategory().equals("cookmam")) {
								category = "쿠킹마마";
							} else if(list.get(i).getBbsCategory().equals("cooksimul")) {
								category = "쿠킹시뮬레이터";
							} else if(list.get(i).getBbsCategory().equals("cytus")) {
								category = "사이터스";
							} else if(list.get(i).getBbsCategory().equals("fm")) {
								category = "풋볼매니저";
							} else if(list.get(i).getBbsCategory().equals("genshin")) {
								category = "원신";
							} else if(list.get(i).getBbsCategory().equals("getam")) {
								category = "겟앰프드";
							} else if(list.get(i).getBbsCategory().equals("gpgp")) {
								category = "좋은피자, 위대한피자";
							} else if(list.get(i).getBbsCategory().equals("hob")) {
								category = "호브";
							} else if(list.get(i).getBbsCategory().equals("isaac")) {
								category = "아이작";
							} else if(list.get(i).getBbsCategory().equals("two")) {
								category = "잇 테이크 투";
							} else if(list.get(i).getBbsCategory().equals("loa")) {
								category = "로스트아크";
							} else if(list.get(i).getBbsCategory().equals("losa")) {
								category = "로스트사가";
							} else if(list.get(i).getBbsCategory().equals("maple")) {
								category = "메이플스토리";
							} else if(list.get(i).getBbsCategory().equals("over")) {
								category = "오버쿡드2";
							} else if(list.get(i).getBbsCategory().equals("watch")) {
								category = "오버워치2";
							} else if(list.get(i).getBbsCategory().equals("pokemon")) {
								category = "포켓몬 퀘스트";
							} else if(list.get(i).getBbsCategory().equals("portal")) {
								category = "포탈2";
							} else if(list.get(i).getBbsCategory().equals("pubg")) {
								category = "배그 모바일";
							} else if(list.get(i).getBbsCategory().equals("puyo")) {
								category = "뿌요뿌요 테트리스";
							} else if(list.get(i).getBbsCategory().equals("r2beat")) {
								category = "알투비트";
							} else if(list.get(i).getBbsCategory().equals("sc5")) {
								category = "스페이스 채널5";
							} else if(list.get(i).getBbsCategory().equals("sims4")) {
								category = "심즈4";
							} else {
								category = "워킹데드";
							}
					%>
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<td>
						<a href="bbs.jsp?searchCategory=<%=list.get(i).getBbsCategory()%>">(<%=category%>)</a>
						</td>
						<td>
						<a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>">
						<%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></a>
						<td><a <%=list.get(i).getUserID()%>"><%= list.get(i).getUserID().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></a></td>
						<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11,13) + "시 " + list.get(i).getBbsDate().substring(14,16) + "분" %></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<%
				if(pageNumber != 1) {
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arrow-left">이전</a>
			<%
				} if(bbsDAO.nextPage(pageNumber + 1)) {
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arrow-left">다음</a>
			<%		
				}
			%>
				<a href="write.jsp" class="btn btn-primary " role="button" data-bs-toggle="button" style="width:120px; margin-left:1200px;">글쓰기</a>
		</div>
	</div>

	<div class="container" style="margin-top:20px;">
		<div class="row">
			<form method="post"  action="searchbbs.jsp">
				<table class="pull-right" style="margin-left:-12px">
					<tr>
						<td><select class="form-control" name="searchField" >
								<option value="0">선택</option>
								<option value="bbsTitle">제목</option>
								<option value="userID">작성자</option>
						</select></td>
						<td><input type="text" class="form-control"
							placeholder="검색어 입력" name="searchText" maxlength="100"></td>
						<td><button type="submit" class="btn btn-primary">검색</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>