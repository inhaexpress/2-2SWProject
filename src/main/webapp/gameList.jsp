<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/card.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="overflow-x: hidden">
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
   
		<h1>A ~ E</h1>
		<hr>
		<div class="row">
    	<div class="col-2">
		<div class="card" style="width: 12rem; text-align:center; margin-left:20px;">
	    <div class="cards card-front">
	  	<img src="small2/a.jpg" class="card-img-top">
	  	<br><br>
	    <a class="card-title" style="text-decoration:none; color:black; font-size:20px;">BABA is You</a>
	  	<p class="card-text" style="color:grey; font-size:x-small;">#퍼즐</p>
	    </div>
		<div class="cards card-back" style="text-align:center; padding:40px;">
		<br>
		<p class="card-text" style="color:grey;">퍼즐의 색다른 게임을 즐겨보세요!</p>
		<a href="gameInfo_Baba.jsp" class="btn btn-dark">바로가기!</a>
		</div>
	  	</div>
  		</div>
	
		<div class="col-2">
		<div class="card" style="width: 12rem; text-align:center;">
	    <div class="cards card-front">
	  	<img src="small2/b.jpg" class="card-img-top" alt="...">
	  	<br><br>
	  	<a class="card-title" style="text-decoration:none; color:black; font-size:20px;">브롤스타즈</a>
	  	<p class="card-text" style="color:grey; font-size:x-small;">#슈팅액션 #BrawlStars</p>
		</div>
		<div class="cards card-back" style="text-align:center; padding:40px;">
		<p class="card-text" style="color:grey;">아기자기한 캐릭터와 배경 디자인이 색다른 게임을 즐겨보세요!</p>
	    <a href="gameInfo_BrawlStars.jsp" class="btn btn-dark">바로가기!</a>
		</div>
	  	</div>
		</div>
	
		<div class="col-2">
		<div class="card" style="width: 12rem;  text-align:center; ">
	    <div class="cards card-front">
	  	<img src="small2/d.jpg" class="card-img-top" alt="...">
	  	<br><br>
	  	<a class="card-title" style="text-decoration:none; color:black; font-size:17px;">쿠킹마마 : 만들어보아요!</a>
	  	<p class="card-text" style="color:grey; font-size:x-small;">#시뮬레이션 #cooking mama</p>
	  	</div>
	  	<div class="cards card-back" style="text-align:center; padding:40px;">
	  	<p class="card-text" style="color:grey;">요리를 통해 자신의 레시피를 만들어보세요!</p>
	  	<a href="gameInfo_CookingMama.jsp" class="btn btn-dark">바로가기!</a>
		</div>
		</div>
		</div>
	
		<div class="col-2">
		<div class="card" style="width: 12rem;  text-align:center;">
	    <div class="cards card-front">
	  	<img src="small2/c.jpg" class="card-img-top" alt="...">
	  	<br><br>
	  	<a class="card-title" style="text-decoration:none; color:black; font-size:20px;">쿠킹 시뮬레이터</a>
	  	<p class="card-text" style="color:grey; font-size:x-small;">#시뮬레이션 #cooking simulator</p>
		</div>
		<div class="cards card-back" style="text-align:center; padding:40px;">
		<p class="card-text" style="color:grey;">자신이 직접 요리사가 된 기분으로 게임을 즐겨보세요!</p>
	  	<a href="gameInfo_CookingSimulator.jsp" class="btn btn-dark">바로가기!</a>
		</div>
		</div>
		</div>
	
		<div class="col-2">
		<div class="card" style="width: 12rem;  text-align:center;">
	    <div class="cards card-front">
	  	<img src="small2/e.jpg" class="card-img-top" alt="...">
	  	<br><br>
	  	<a class="card-title"  style="text-decoration:none; color:black; font-size:20px;">CytusII</a>
	  	<p class="card-text" style="color:grey; font-size:x-small;">#음악 #사이터스2</p>
		</div>
		<div class="cards card-back" style="text-align:center; padding:40px;">
		<p class="card-text" style="color:grey;">유려한 디자인과 양질의 음악, 신선한 게임성으로 즐겁게 플레이해보세요!</p>
	  	<a href="gameInfo_CytusII.jsp" class="btn btn-dark">바로가기!</a>
		</div>
	 	</div>
 	    </div>
		</div>

		<br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br>
		<h1>F ~ J</h1>
		<hr>
    	<div class="row">
    	<div class="col-2">
    	<div class="card" style="width: 12rem;  text-align:center; margin-left:20px">
	    <div class="cards card-front">
	  	<img src="small2/f.jpg" class="card-img-top" alt="...">
	  	<br><br>
	  	<a class="card-title"  style="text-decoration:none; color:black; font-size:20px;">Football Manager 2022</a>
	  	<p class="card-text" style="color:grey; font-size:x-small;">#시뮬레이션 #스포츠 #풋볼매니저</p>
		</div>
		<div class="cards card-back" style="text-align:center; padding:40px;">
		<p class="card-text" style="color:grey;">자신만의 팀을 편성하여 최강을 노리자!</p>
	  	<a href="gameInfo_FM2022.jsp" class="btn btn-dark">바로가기!</a>
   		</div>
   	  	</div>
   		</div>
   
   		<div class="col-2">
   		<div class="card" style="width: 12rem;  text-align:center; ">
   		<div class="cards card-front">
	  	<img src="small2/g.jpg" class="card-img-top" alt="...">
	  	<br><br>
	  	<a class="card-title" style="text-decoration:none; color:black; font-size:20px;">원신</a>
	  	<p class="card-text" style="color:grey; font-size:x-small;">#어드벤처 #모험 #Genshin</p>
	  	</div>
	  	
		<div class="cards card-back" style="text-align:center; padding:30px; ">
		<p class="card-text" style="color:grey;">7가지 원소가 살아 숨 쉬는 판타지 세계 티바트. 대륙을 여행하며 동료와 함께 비밀을 파헤쳐라!</p>
	  	<a href="gameInfo_Genshin.jsp" class="btn btn-dark">바로가기!</a>
  	    </div>
	 	</div>
		</div>
	
	
   		<div class="col-2">
		<div class="card" style="width: 12rem; text-align:center;">
	 	<div class="cards card-front">
	  	<img src="small2/h.jpg" class="card-img-top" alt="...">
	  	<br><br>
	  	<a class="card-title"  style="text-decoration:none; color:black; font-size:20px;">겟앰프드</a>
	  	<p class="card-text" style="color:grey; font-size:x-small;">#액션 #GetAmped</p>
		</div>
		<div class="cards card-back" style="text-align:center; padding:40px;">
		<p class="card-text" style="color:grey;">자신이 커스텀한 케릭터로 다른 유저들과의 대전으로 재밌는 타격감을 느껴라!</p>
	  	<a  href="gameInfo_GetAmped.jsp" class="btn btn-dark">바로가기!</a>
  	    </div>
		</div>
		</div>
	
	 	<div class="col-2">
		<div class="card" style="width: 12rem; text-align:center;">
	 	<div class="cards card-front">
	  	<img src="small2/i.jpg" class="card-img-top" alt="...">
	    <br><br>
	  	<a class="card-title" href="gameInfo_GPGP.jsp" style="text-decoration:none; color:black; font-size:20px;">좋은 피자, 위대한 피자</a>
	  	<p class="card-text" style="color:grey; font-size:x-small;">#시뮬레이션 #요리 </p>
		</div>
		<div class="cards card-back" style="text-align:center; padding:20px;">
		<p class="card-text" style="color:grey;">피자 가게 하나를 운영하는게 어떤 느낌인지 궁금하세요? 저희 새로운 게임 좋은 피자, 위대한 피자로 체험해보세요!</p>
	  	<a href="gameInfo_GPGP.jsp" class="btn btn-dark">바로가기!</a>
  	    </div>
		</div>
  		</div>
		</div>


		<br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br>
		<h1>K ~ O</h1>
		<hr>
    	<div class="row">
    	<div class="col-2">
		<div class="card" style="width: 12rem;  text-align:center; margin-left:20px">
	    <div class="cards card-front">
	  	<img src="small2/j.jpg" class="card-img-top" alt="...">
	  	<br><br>
	  	<a class="card-title" style="text-decoration:none; color:black; font-size:20px;">HOB</a>
	  	<p class="card-text" style="color:grey; font-size:x-small;">#어드벤처 #1인 #홉</p>
		</div>
		<div class="cards card-back" style="text-align:center; padding:20px;">
		<p class="card-text" style="color:grey;">기괴한 야생 동물, 지나치게 자란 건축물, 알려지지 않은 기계로 가득 찬 공상 과학 세계에 빠져보세요!</p>
	  	<a  href="gameInfo_Hob.jsp" class="btn btn-dark">바로가기!</a>
  	    </div>
		</div>
 		</div>
	
	
		<div class="col-2">
		<div class="card" style="width: 12rem;  text-align:center;">
		<div class="cards card-front">
	  	<img src="small2/k.jpg" class="card-img-top" alt="...">
	  	<br><br>
	  	<a class="card-title"  style="text-decoration:none; color:black; font-size:20px;">The Binding of Issac : Rebirth</a>
	  	<p class="card-text" style="color:grey; font-size:xx-small;">#어드벤처 #액션 #아이작</p>
		</div>
		<div class="cards card-back" style="text-align:center; padding:20px;">
		<p class="card-text" style="color:grey;">종교에 빠진 아이작의 엄마가 아이작을 죽이려 하자 지하실로 도망친 아이작이 겪는 이야기</p>
	  	<a href="gameInfo_Issac.jsp" class="btn btn-dark">바로가기!</a>
  	    </div>
		</div>
		</div>

		<div class="col-2">
		<div class="card" style="width: 12rem;  text-align:center;">
		<div class="cards card-front">
	  	<img src="small2/l.jpg" class="card-img-top" alt="...">
	  	<br><br>
	  	<a class="card-title"  style="text-decoration:none; color:black; font-size:20px;">It Takes Two</a>
	  	<p class="card-text" style="color:grey; font-size:x-small;">#어드벤처 #퍼즐 #잇테이크투</p>
		</div>
		<div class="cards card-back" style="text-align:center; padding:20px;">
		<p class="card-text" style="color:grey;">'손뼉도 부딪혀야 소리가 난다'라는 속담 등과 일맥상통하며 이혼 위기의 부부가 각종 난관을 협동해서 헤쳐 나간다!!</p>
	  	<a href="gameInfo_ItTakesTwo.jsp" class="btn btn-dark">바로가기!</a>
  	    </div>
		</div>
 		</div>
	
		<div class="col-2">
		<div class="card" style="width: 12rem;  text-align:center;">
		<div class="cards card-front">
	  	<img src="small2/m.jpg" class="card-img-top" alt="...">
	  	<br><br>
	  	<a class="card-title"  style="text-decoration:none; color:black; font-size:20px;">로스트아크</a>
	  	<p class="card-text" style="color:grey; font-size:x-small;">#RPG #LostARK</p>
		</div>
		<div class="cards card-back" style="text-align:center; padding:10px; font-size:13px;">
		<p class="card-text" style="color:grey;">혼돈으로 물들어가는 아크라시아를 구하기 위해 흩어졌던 7개의 아크를 모으는 여정이 주를 이루며, 모험가와 함께 아크라시아를 
		지키는 7인의 에스더와 아크라시아를 침공하는 페트라니아의 카제로스와 그의 휘하에 있는 여섯 군단장의 대립을 다뤄보세요!</p>
	  	<a href="gameInfo_LostArk.jsp" class="btn btn-dark">바로가기!</a>
  	    </div>
		</div>
 		</div>
	
		<div class="col-2">
		<div class="card" style="width: 12rem;  text-align:center;">
		<div class="cards card-front">
	  	<img src="small2/n.jpg" class="card-img-top" alt="...">
	  	<br><br>
	  	<a class="card-title" style="text-decoration:none; color:black; font-size:20px;">로스트사가</a>
	  	<p class="card-text" style="color:grey; font-size:x-small;">#액션 #전투 #LostSAGA</p>
		</div>
		
		<div class="cards card-back" style="text-align:center; padding:20px; font-size:14px;">
		<p class="card-text" style="color:grey;"> 원하는 용병을 골라 전투하는 대전액션 게임. 특이한 점이라면 전투 도중 본인 슬롯에 있는 다른 용병으로 교체할 수 있고, 이를 통해 콤보 공격을 이어나갈 수 있습니다!</p>
	  	<a  href="gameInfo_LostSaga.jsp" class="btn btn-dark">바로가기!</a>	
  	    </div>
	  	</div>
   		</div>
		</div>
 
		<br><br><br><br><br><br>
		<br><br><br><br><br><br>
		<div class="row">
    	<div class="col-2">
		<div class="card" style="width: 12rem;  text-align:center; margin-left:20px">
		<div class="cards card-front">
	  	<img src="small2/o.jpg" class="card-img-top" alt="...">
	  	<br><br>
	  	<a class="card-title"  style="text-decoration:none; color:black; font-size:20px;">메이플스토리</a>
	  	<p class="card-text" style="color:grey; font-size:x-small;">#RPG #Maplestory</p>
		</div>
		<div class="cards card-back" style="text-align:center; padding:20px;">
		<p class="card-text" style="color:grey;"> 다채로운 필드에서의 여행과 모험을 강조하고 있습니다! 캐치 프레이즈는 '끊임없는 즐거움, 스스로 만들어 나가는 이야기, 상상 속의 세계'입니다!</p>
	  	<a href="gameInfo_MapleStory.jsp" class="btn btn-dark">바로가기!</a>	
  	    </div>
		</div>
   		</div>
	
		<div class="col-2">
		<div class="card" style="width: 12rem;  text-align:center;">
		<div class="cards card-front">
	  	<img src="small2/p.jpg" class="card-img-top" alt="...">
	  	<br><br>
	  	<a class="card-title"  style="text-decoration:none; color:black; font-size:20px;">OverCooked2</a>
	  	<p class="card-text" style="color:grey; font-size:x-small;">#시뮬레이션 #요리 #퍼즐 </p>
		</div>
		
		<div class="cards card-back" style="text-align:center; padding:20px; font-size:15px;">
		<p class="card-text" style="color:grey;">이리저리 치고받으며 엉망진창으로 클리어해도, 역할을 잘 나눠 클린플레이를 해도, 
		극한의 협동으로 고득점을 노려도 각자만의 재미가 있어 빠져들게 만든다.</p>
	  	<a href="gameInfo_OverCooked2.jsp" class="btn btn-dark">바로가기!</a>	
  	    </div>
	  	</div>
		</div>
	
		<div class="col-2">
		<div class="card" style="width: 12rem;  text-align:center;">
		<div class="cards card-front">
	  	<img src="small2/r.jpg" class="card-img-top" alt="...">
	    <br><br>
	  	<a class="card-title"  style="text-decoration:none; color:black; font-size:20px;">오버워치2</a>
	  	<p class="card-text" style="color:grey; font-size:x-small;">#액션 #전투 #FPS #OVERWATCH2</p>
		</div>
		<div class="cards card-back" style="text-align:center; padding:20px;">
		<p class="card-text" style="color:grey;">희망적인 미래를 배경으로 펼쳐지는 팀 기반 액션 무료 플레이 게임으로, 플레이어는 5대5 전장에서 난투를 벌이게 됩니다!</p>
	  	<a href="gameInfo_Overwatch2.jsp" class="btn btn-dark">바로가기!</a>
  	    </div>
		</div>
        </div>

		<br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br>
		<h1>P ~ Z</h1>
		<hr> 
		
    	<div class="row">
    	<div class="col-2">
		<div class="card" style="width: 12rem; text-align:center; margin-left:20px">
	    <div class="cards card-front">
	  	<img src="small2/s.jpg" class="card-img-top" alt="...">
	  	<br><br>
	  	<a class="card-title"  style="text-decoration:none; color:black; font-size:20px;">포켓몬퀘스트</a>
	  	<p class="card-text" style="color:grey; font-size:x-small;">#어드벤처 #제작 #포켓몬 </p>
	  	</div>
	  	<div class="cards card-back" style="text-align:center; padding:20px;  font-size:14px;">
		<p class="card-text" style="color:grey;"> 모든 것이 네모난 세상이 배경이며, 네모루루섬에서 네모난 포켓몬들과 함께 보물을 찾는 탐험에 도전하는 것이 게임의 목표입니다!
		포켓몬들과 모험을 같이 떠나보세요!</p>
	  	<a href="gameInfo_PokemonQuest.jsp" class="btn btn-dark">바로가기!</a>
		</div>
		</div>
		</div>
	
		<div class="col-2">
		<div class="card" style="width: 12rem; text-align:center;">
		<div class="cards card-front">
	  	<img src="small2/u.jpg"class="card-img-top" alt="...">
	  	<br><br>
	  	<a class="card-title" style="text-decoration:none; color:black; font-size:20px;">배틀그라운드 모바일</a>
	  	<p class="card-text" style="color:grey; font-size:x-small;">#FPS #배틀그라운드 #PUBG</p>
	  	</div>
	  	<div class="cards card-back" style="text-align:center; padding:20px;">
	  	<p class="card-text" style="color:grey;">PC에서만 즐기던 배틀그라운드를 모바일에서도 만나보세요!</p>
	  	<a href="gameInfo_PubgMobile.jsp"   class="btn btn-dark">바로가기!</a>
		</div>
		</div>
 		</div>
	
		<div class="col-2">
		<div class="card" style="width: 12rem; text-align:center;">
	 	<div class="cards card-front">
	  	<img src="small2/v.jpg" class="card-img-top" alt="...">
	  	<br><br>
	  	<a class="card-title" style="text-decoration:none; color:black; font-size:20px;">뿌요뿌요 테트리스</a>
	  	<p class="card-text" style="color:grey; font-size:x-small;">#퍼즐 #PuyoPuyo Tetris</p>
		</div>
		<div class="cards card-back" style="text-align:center; padding:20px; font-size:11px;">
		<p class="card-text" style="color:grey;">2014년에 세가가 발매한 퍼즐 비디오 게임이다. 뿌요뿌요 시리즈와 테트리스 간의 크로스오버 작품으로, 두 게임의 진행방식을 여러 방법으로 통합한 모드들을 제공한다. 
		줄거리 상으로 단면 테트로미노의 각 모양에 기반한 인물들이 뿌요뿌요의 등장인물들과 만나게 되는 내용으로 구성됐다.</p>
	  	<a href="gameInfo_PuyoTet.jsp"  class="btn btn-dark">바로가기!</a>
  	    </div>
		</div>
 		</div>
	
    	<div class="col-2">	
		<div class="card" style="width: 12rem; text-align:center;">
		<div class="cards card-front">
	  	<img src="small2/t.jpg"class="card-img-top" alt="...">
	  	<br><br>
	  	<a class="card-title"  style="text-decoration:none; color:black; font-size:20px;">Portal2</a>
	  	<p class="card-text" style="color:grey; font-size:x-small;">#퍼즐 #어드벤처 #포탈2</p>
		</div>
		<div class="cards card-back" style="text-align:center; padding:20px;">
		<p class="card-text" style="color:grey;">포탈 2의 싱글 플레이어는 생동감 있는 새 캐릭터와 다수의 새로운 퍼즐들, 그리고 더욱 거대하고 복잡한 실험실을 소개합니다.</p>
	  	<a href="gameInfo_Portal2.jsp"  class="btn btn-dark">바로가기!</a>
  	    </div>
		</div>
 		</div>	
	
	 	<div class="col-2">	
	 	<div class="card" style="width: 12rem; text-align:center;">
	 	<div class="cards card-front">
	  	<img src="small2/w.jpg" class="card-img-top" alt="...">
	  	<br><br>
	  	<a class="card-title"  style="text-decoration:none; color:black; font-size:20px;">알투비트</a>
	  	<p class="card-text" style="color:grey; font-size:x-small;">#음악 #멀티플레이 #R2Beat</p>
		</div>
		
		<div class="cards card-back" style="text-align:center; padding:20px; font-size:12px;">
		<p class="card-text" style="color:grey;">알투비트는 레이싱 게임과 리듬 게임의 요소를 합한 게임입니다! 본래 씨드나인 엔터테인먼트에서 개발하고 2005년부터 네오위즈게임즈에서 배급하였으며 2014년 서비스 종료되었으나, 2021년 밸로프에서 재오픈하였습니다!
		지금 바로 즐기러오세요!</p>
	  	<a href="gameInfo_R2beat.jsp"  class="btn btn-dark">바로가기!</a>
  	    </div>
	  	</div>
		</div>
		</div>
		</div>
   
    	<br><br><br><br><br><br>
    	<br><br><br><br><br><br>
    	<div class="row">
    	<div class="col-2">
		<div class="card" style="width: 12rem; text-align:center; margin-left:20px">
		<div class="cards card-front">
	  	<img src="small2/x.jpg" class="card-img-top" alt="...">
	  	<br><br>
	  	<a class="card-title"  style="text-decoration:none; color:black; font-size:20px;">스페이스 채널5 : 파트2</a>
	  	<p class="card-text" style="color:grey; font-size:x-small;">#음악 #SpaceChannel5</p>
		</div>
		<div class="cards card-back" style="text-align:center; padding:20px; font-size:15px;">
		<p class="card-text" style="color:grey;">전작에서 모로성인들을 막아낸 스페이스 채널 5의 리포터 울랄라가 이번에는 모종의 세력에게 납치당한 사람들과 우주 대통령을 구하는 것이 주된 스토리입니다!</p>
	  	<a href="gameInfo_SC5.jsp" class="btn btn-dark">바로가기!</a>
  	    </div>
		</div>
  		</div>
	
		<div class="col-2">
		<div class="card" style="width: 12rem; text-align:center;">
		<div class="cards card-front">
	  	<img src="small2/y.jpg" class="card-img-top" alt="...">
	  	<br><br>
	  	<a class="card-title"  style="text-decoration:none; color:black; font-size:20px;">심즈4</a>
	  	<p class="card-text" style="color:grey; font-size:x-small;">#시뮬레이션 #Sims4</p>
		</div>
		
		<div class="cards card-back" style="text-align:center; padding:20px; font-size:15px;">
		<p class="card-text" style="color:grey;">3D로 만들어진 캐릭터와 2D로 만들어진 쿼터뷰 시점으로 구성되어 있으며, 심즈 시리즈 중에서도 특히 '컴퓨터로 하는 나만의 소꿉장난 혹은 인형놀이'의 성격이 두드러지는 4번째 작품 </p>
	  	<a href="gameInfo_Sims4.jsp" class="btn btn-dark">바로가기!</a>
  	    </div>
	  	</div>
		</div>
	
		<div class="col-2">
		<div class="card" style="width: 12rem; text-align:center;">
		<div class="cards card-front">
	  	<img src="small2/z.jpg" class="card-img-top" alt="...">
	  	<br><br> 
	  	<a class="card-title" style="text-decoration:none; color:black; font-size:20px;">워킹데드 시즌1</a>
	  	<p class="card-text" style="color:grey; font-size:x-small;">#어드벤처 #WalkingDead Season1</p>
		</div>
		<div class="cards card-back" style="text-align:center;font-size:10px; padding:20px;">
		<p class="card-text" style="color:grey;">살인 사건의 용의자로 경찰차에 타고 도시 밖으로 이송되던 리(Lee). 그는 잠시 한눈을 판 경찰관이 고속도로를 걸어가던 한 워커를 치면서 가드레일을 뚫고 숲으로 떨어지는 바람에 얼떨결에 풀려납니다. 
		그러나 죽은 줄 알았던 경관은 워커가 되어 그를 습격! 
		리는 간신히 수갑을 풀고 총알을 주워 샷건으로 물리치지만, 뒤이어 나타난 워커 무리에 쫒겨 도망치게 됩니다!</p>
	  	<a  href="gameInfo_WD1.jsp" class="btn btn-dark">바로가기!</a>
  	    </div>
		</div>
  		</div>
	</div>
</body>
</html>