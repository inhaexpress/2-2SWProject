<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/Login.css">
<title>SW 프로젝트</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-dark">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <a class="navbar-brand" style="margin-left:20px" href="main.jsp"><img src="https://i.imgur.com/aAJbtem.png" style="height:50px;"></a>
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="bbs.jsp" style="color:white">게시판</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="gameList.jsp" style="color:white">게임목록</a>
      </li>
    </ul>
  </div>
</nav>
    
	
	
			<div class="card" style=" margin: 7em auto; 
			     margin-top:100px; width:400px; height:450px; 
			     background-color:#e7eaef; padding-top:20px; 
			     border-radius:20px 20px 20px 20px;">
			     
				<form class="form1" method="post" action="loginAction.jsp">
					<h3 style="text-align: center;">로그인 화면</h3><br><br>
					
					<div class="form-group">
					 <input class="un " type="text" align="center" placeholder="아이디" name="userID" maxlength="20">	
					</div>
					
					<div class="form-group">
					<input class="pass" type="password" align="center" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					
				    <input class="submit" type="submit" align="center" value="로그인">
                    <p class="forgot" align="center"><a href="join.jsp">회원이 아니신가요?</p>
				</form>
			</div>
	
	
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>