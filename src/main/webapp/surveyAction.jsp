<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="game.GameDAO"%>
<%@page import="game.Game"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="survey.Survey" %>
<%@ page import="survey.SurveyDAO" %>
<%@ page import="java.io.PrintWriter" %>
<link rel="stylesheet" href="css/Sbg.css">
<link rel="stylesheet" href="css/loading.css">
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="survey" class="survey.Survey" scope="page" />
<jsp:setProperty  property="*" name="survey" />
<jsp:useBean id="game" class="game.Game" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="game"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>SW 프로젝트</title>
</head>
<body style="overflow-x: hidden; background-color: #F7FFF7;">
<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
%>

<div class="loader">
<i class='bx bx-loader bx-spin'></i>
</div>



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


 <div class="wrap">
	<%
		GameDAO gameDAO = new GameDAO();
	   ArrayList<Game> allGames = gameDAO.getAllGames();
		if(survey.getGameGender() == null || survey.getGameAge() == null 
			|| survey.getGameDevice() == null || survey.getGameGraphic() == null 
			|| survey.getGameCoop() == null || survey.getGameEnd() == null 
			|| survey.getGamePuzzle() == null || survey.getGameBattle() == null 
			|| survey.getGameGore() == null || survey.getGameInterest() == null) {
				PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('선택이 안 된 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					SurveyDAO SurveyDAO = new SurveyDAO();
					int result = SurveyDAO.result(survey.getGameGender(), survey.getGameAge(), 
							survey.getGameDevice(), survey.getGameGraphic(), survey.getGameCoop(), survey.getGameEnd(), survey.getGamePuzzle(), survey.getGameBattle(), survey.getGameGore(), survey.getGameInterest());
					if (result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('정보 등록에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
					else {
					%><% 						   
					  
					String gameTitle = gameDAO.getGame(game.getGameTitle(), game.getGameDevice(), game.getGameGraphic(), game.getGameCoop(), game.getGameEnd(), game.getGamePuzzle(), game.getGameBattle(), game.getGameGore(), game.getGameInterest(), game.getGameLink(), game.getGameImg());
						   
					ArrayList<Game> getbydevice = gameDAO.getByDevice(survey.getGameDevice());
					
					ArrayList<Game> getbygraphic = gameDAO.getByGraphic(survey.getGameGraphic());
					
					ArrayList<Game> getbycoop = gameDAO.getByCoop(survey.getGameCoop());
					
					ArrayList<Game> getbyend = gameDAO.getByEnd(survey.getGameEnd());
					
					ArrayList<Game> getbypuzzle = gameDAO.getByPuzzle(survey.getGamePuzzle());
					
					ArrayList<Game> getbybattle = gameDAO.getByBattle(survey.getGameBattle());
					
					ArrayList<Game> getbygore = gameDAO.getByGore(survey.getGameGore());
					
					ArrayList<Game> getbyinterest = gameDAO.getByInterest(survey.getGameInterest());
					
					allGames = gameDAO.compareGameName(allGames, getbydevice );
					allGames = gameDAO.compareGameName(allGames, getbygraphic );
					allGames = gameDAO.compareGameName(allGames, getbycoop );
					allGames = gameDAO.compareGameName(allGames, getbyend );
					allGames = gameDAO.compareGameName(allGames, getbypuzzle );
					allGames = gameDAO.compareGameName(allGames, getbybattle );
					allGames = gameDAO.compareGameName(allGames, getbygore );
					allGames = gameDAO.compareGameName(allGames, getbyinterest );
					Collections.sort(allGames);
					Collections.reverse(allGames);
					%>
					
					     
					 <div id="main-text" style="text-align:center; margin-top:20px;">
					 <h1>회원님이 찾으시는 게임은..!</h1>
					 </div>
					     
					    <div class="row">
					    <table class="align-middle">
				        <p><br><br><br><br></p>
				          
					   <%
					      if(allGames.get(0).getGameTitle()!=null){ %>
		
					       <tr>
					       <td style="text-align: center;">
					       <div id=rk1>
					       <img src=<%=allGames.get(0).getGameImg()%> style="border:5px solid black;  border-radius: 20px;"><br>
					        
					       <h4>1위<%=allGames.get(0).getGameTitle()%></h4>
					       
					       <a type="button" class="btn btn-dark" href="<%=allGames.get(0).getGameLink()%>">시작하기</a>
					       <br><br>
					       </div>
					       </td>
					       
					       <td style="text-align: center">
					       <div id=rk2>
					       <img src=<%=allGames.get(1).getGameImg()%> style="border:5px solid black;  border-radius: 20px;"><br>
					       
					       <h4>2위 <%=allGames.get(1).getGameTitle()%></h4>
					   
					       <a type="button" class="btn btn-dark" href="<%=allGames.get(1).getGameLink()%>">시작하기</a>
					       <br><br>
					       </div>
					       </td>
					       
					       <td style="text-align: center">
					       <div id=rk3 >
					       <img src=<%=allGames.get(2).getGameImg()%> style="border:5px solid black;  border-radius: 20px;"><br>
					       
					       <h4> 3위 <%=allGames.get(2).getGameTitle()%></h4>
					       <a type="button" class="btn btn-dark" href="<%=allGames.get(2).getGameLink()%>"> 시작하기</a>
					       <br><br>
					       </div>
					       </td>
					       </tr>
					       
					       
					     </div>
					    </div>
					    </table>
					    </div>
					    
					    <div class="particles" id="particles">
					   </div>
					       		       
					      <%}
					       else if(allGames.get(0).getGameTitle()==null){
					          out.println("게임 출력 실패");
					      } %>	<%
					       
					  
// 						PrintWriter script = response.getWriter();
// 						script.println("<script>");
// 						script.println("location.href = 'surveyResult.jsp'");
// 						script.println("</script>");
					}
				}	
	%>
	
	<script type="text/javascript">
	var particles = document.getElementById("particles");
	var border = ["50%","0%"];
	var colors = ["#FF6B6B","#FFE66D","#4472CA"];

	function createParticle(event){
	    var x = event.clientX;
	    var y = event.clientY;
	    var color = Math.floor(Math.random() * 3);

	    var div = document.createElement("div");
	    div.style.position = "absolute";
	    div.style.marginLeft = x+"px";
	    div.style.marginTop = y+"px";
	    div.style.width = "10px";
	    div.style.borderTop = "5px solid transparent";
	    div.style.borderRight = "5px solid transparent";
	    div.style.borderLeft = "5px solid transparent";
	    div.style.borderBottom = "10px solid "+colors[color];
	    div.style.animation = "move 5s ease-in infinite";
	    particles.appendChild(div);
	    setTimeout(
	        function(){
	            div.remove();
	        }
	    , 5000);
	}

	function getParticles(){
	    var np = document.documentElement.clientWidth / 40;
	    particles.innerHTML = "";
	    for (var i = 0; i < np; i++) {
	        var w = document.documentElement.clientWidth;
	        var h = document.documentElement.clientHeight;
	        var rndw = Math.floor(Math.random() * w ) + 1;
	        var rndh = Math.floor(Math.random() * h ) + 1;
	        var widthpt = Math.floor(Math.random() * 8) + 5;
	        var opty = Math.floor(Math.random() * 4) + 1;
	        var anima = Math.floor(Math.random() * 12) + 8;
	        var bdr = Math.floor(Math.random() * 2);
	        var color = Math.floor(Math.random() * 3);

	        var div = document.createElement("div");
	        div.style.position = "absolute";
	        div.style.marginLeft = rndw+"px";
	        div.style.marginTop = rndh+"px";
	        div.style.width = widthpt+"px";
	        div.style.height = widthpt+"px";
	        div.style.opacity = opty;
	        div.style.backgroundColor = colors[color];
	        div.style.borderRadius = border[bdr];
	        div.style.animation = "move "+anima+"s ease-in infinite";
	        particles.appendChild(div);
	    }
	}

	function main(event){
	    getParticles();
	    particles.addEventListener("click", createParticle);
	}

	window.addEventListener("resize", main);
	window.addEventListener("load", main);
	</script>
    
   <script type="text/javascript">
    const loader = document.querySelector('.loader');
    const html = document.querySelector('html');


    html.style.overflow = 'hidden'; //로딩 중 스크롤 방지

    window.addEventListener('load', ()=>{

         setTimeout(() => { //로딩속도 구현
        
            loader.style.opacity = '0';
        html.style.overflow = 'auto'; //스크롤 방지 해제
            
            setTimeout(() => {
              loader.style.display = 'none';
          }, 400);
            
      }, 1000);

    })
</script>
 
  
 </div> 
</body>
</html>