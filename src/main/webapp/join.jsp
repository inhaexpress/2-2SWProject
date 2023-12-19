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
       <a class="navbar-brand" style="margin-left:20px" href="#"><img src="https://i.imgur.com/aAJbtem.png" style="height:50px;"></a>
       <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
       <li class="nav-item active">
        <a class="nav-link" href="bbs.jsp" style="color:white;">게시판</a>
       </li>
       <li class="nav-item">
        <a class="nav-link" href="gameList.jsp" style="color:white;">게임목록</a>
      </li>
      </ul>
      </div>
      </nav>
    
    
	              <div class="container">
		          <div class="col-lg-4"></div>
		          <div class="col-lg-4">
			      <div class="card" style=" margin:7em auto; 
			           padding-top: 20px; margin-top:30px;margin-left:445px; width: 400px; height:560px; 
			           background:#e7eaef; border-radius:20px 20px 20px 20px;">
			
				   <form method="post" action="joinAction.jsp">
				   <h3 style="text-align: center;">회원가입 화면</h3><br>
					
				   <div class="form-group">
				   <input type="text" class="un" placeholder="아이디" name="userID" maxlength="20">	
				   </div>
					
				   <div class="form-group">
				   <input type="password" class="pass" placeholder="비밀번호" name="userPassword" maxlength="20">
				   </div>
					
				   <div class="form-group">
				   <input type="text" class="name" placeholder="이름" name="userName" maxlength="20">	
				   </div>
					
				   <div class="form-group">
				   <input type="email" class="email" placeholder="이메일" name="userEmail" maxlength="50">	
				   </div>
				
					
				   
 				   <input type="radio" class="btn-check" name="userGender" id="btnradio1" autocomplete="off" value="남자">
  				   <label class="btn btn-outline-primary" for="btnradio1" style="margin-left:135px">남자</label>

  				   <input type="radio" class="btn-check" name="userGender" id="btnradio2" autocomplete="off" value="여자">
  				   <label class="btn btn-outline-primary" for="btnradio2">여자</label>
					
				   <br>
				   <input class="submit2" type="submit" align="center" value="회원가입">
				   </form>
			       </div>
		           </div>
	               </div>
	
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>