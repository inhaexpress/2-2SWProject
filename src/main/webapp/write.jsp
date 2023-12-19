<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
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
		<form method="post" action="writeAction.jsp">
			<table class="table table-striped" style="text-align: center; border: 3px solid black; margin-top:10px;">
				<thead>
					<tr>
					 	<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<select name="bbsCategory" class="form-select">
								<option value="baba">바바이즈유</option>
								<option value="brawl">브롤스타즈</option>
								<option value="cookmam">쿠킹마마</option>
								<option value="cooksimul">쿠킹시뮬레이터</option>
								<option value="cytus">사이터스2</option>
								<option value="fm">풋볼매니저</option>
								<option value="genshin">원신</option>
								<option value="getam">겟앰프드</option>
								<option value="gpgp">좋은피자, 위대한피자</option>
								<option value="hob">호브</option>
								<option value="isaac">아이작</option>
								<option value="two">잇테이크투</option>
								<option value="loa">로스트아크</option>
								<option value="losa">로스트사가</option>
								<option value="maple">메이플스토리</option>
								<option value="over">오버쿡드2</option>
								<option value="watch">오버워치2</option>
								<option value="pokemon">포켓몬퀘스트</option>
								<option value="portal">포탈2</option>
								<option value="pubg">배그 모바일</option>
								<option value="puyo">뿌요뿌요 테트리스</option>
								<option value="r2beat">알투비트</option>
								<option value="sc5">스페이스 채널5</option>
								<option value="sims4">심즈4</option>
								<option value="wd1">워킹데드1</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
		</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>