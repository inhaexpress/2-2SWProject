<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="css/custom.css">
<title>Insert title here</title>
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
   
             
  
       <div class ="mt-4 p-5 text-white rounded feature" style="background:#e7eaef;">
	     <div class="container">
		    <div class="row">
       	 		<div class="col-lg-6">
       	 		 <div style="text-align:center; color:black;"><br><br><br><br>
                 <h1 class="typing-txt" style=" display: none;">여가시간 100% 즐기기</h1><br><br>
                 <h1 class="typing" style="font-size:60px"></h1> 
                 <script>
                  var typingBool = false; 
                  var typingIdx=0; 

                  
                  var typingTxt = $(".typing-txt").text(); 

                  typingTxt=typingTxt.split(""); 

                  if(typingBool==false){ 
                   
                     typingBool=true;     
                     var tyInt = setInterval(typing,100);  
                  } 
                       
                  function typing(){ 
                    if(typingIdx<typingTxt.length){ 
                     
                      $(".typing").append(typingTxt[typingIdx]);
                     
                      typingIdx++; 
                     } else{ 
                      
                      clearInterval(tyInt); 
                     } 
                  }  
                  </script>                 
            	   </div>
            		           	 
            <div style="text-align:center; color:black;">
             <h4>몇가지 문항에 답하고 나에게 맞는 게임을 추천받아 보세요!</h4>
                </div><br><br>
            	</div>
            			
            <div style="text-align:center;margin-top:40px; margin-left:-336px; " id="scroll-target" class="container">
			<p><a href="#scroll-target1" class="btn btn-outline-dark btn-pull" href="#" role="button">시작하기</a></p>
			</div>
			</div>
            </div>			       			
			</div>
		  	
		  	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true"
		  	style="text-align: right; width: 470px; height:235px; margin-top:-380px; margin-left:850px; ">
             <div class="carousel-indicators" style="margin-top:150px;">
             <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
             <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
             <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
             <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
             </div>
             
             <div class="carousel-inner" style="border: 10px solid black;">
             <div class="carousel-item active">
              <img src="small/1.jpg" class="d-block w-100" >
             </div>
             
             <div class="carousel-item">
              <img src="small/2.jpeg" class="d-block w-100" >
             </div>
             
             <div class="carousel-item">
              <img src="small/3.jpg" class="d-block w-100" >
             </div>
             
             <div class="carousel-item">
              <img src="small/4.jpg" class="d-block w-100" >
             </div>
            
            </div>
             <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
             </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
               <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
               </div>
		  	
		  	
		  	
	 
       
           <form method="post" action="surveyAction.jsp">
           <link rel="stylesheet" href="css/Fade.css">
           <div id="scroll-target1">
           <div class="card" style="text-align:center; margin-top:265px; margin-left:120px; width: 1300px; height:150px; background:#e7eaef; border-radius: 50px 50px 50px 50px; border-width: 6px; border-color:black;">
           <br>
           
            <h3>1. 성별을 선택하세요</h3><br>
            <div style="text-align: center;"> 
  			<input type="radio" class="btn-check" name="gameGender" value="남성" id="vbtn-radio1" autocomplete="off">
  			<label class="btn btn-outline-dark" for="vbtn-radio1">남성</label>
  			<input type="radio" class="btn-check"  name="gameGender" value="여성"id="vbtn-radio2" autocomplete="off">
  			<label class="btn btn-outline-dark" for="vbtn-radio2">여성</label>
		    </div>
		    </div>
			</div>
				 
				 
            <div id="scroll-target2">	
	        <div class="card" style="text-align:center; margin-top:123px; margin-left:120px; width: 1300px; height:150px; background:#e7eaef; border-radius: 50px 50px 50px 50px;border-width: 6px; border-color:black; ">
            <br>
            <h3>2. 연령대를 선택하세요</h3><br>
            <div style="text-align: center;"> 
  			<input type="radio" class="btn-check" name="gameAge" value="10" id="vbtn-radio3" autocomplete="off">
  			<label class="btn btn-outline-dark" for="vbtn-radio3">10~19</label>
  			
  			<input type="radio" class="btn-check" name="gameAge" value="20" id="vbtn-radio4" autocomplete="off">
  			<label class="btn btn-outline-dark" for="vbtn-radio4">20~29</label>
  			
            <input type="radio" class="btn-check" name="gameAge" value="30" id="vbtn-radio5" autocomplete="off">
  			<label class="btn btn-outline-dark" for="vbtn-radio5">30~49</label>
  			
            <input type="radio" class="btn-check" name="gameAge" value="50" id="vbtn-radio6" autocomplete="off">
  			<label class="btn btn-outline-dark" for="vbtn-radio6">50</label>
		    </div>
		    </div>
			</div>
			
	
	        <div id="scroll-target3">	
            <div class="card" style="text-align:center; margin-top:123px; margin-left:120px; width: 1300px; height:150px; background:#e7eaef ; border-radius: 50px 50px 50px 50px;border-width: 6px; border-color:black;">
            <br>
            <h3>3. 게임 플레이를 위해 사용하실 기기를 선택해주세요.</h3><br>
		    <div style="text-align: center;">
			
 			<input type="radio" class="btn-check"name="gameDevice" value="PC" id="vbtn-radio7" autocomplete="off" >
  			<label class="btn btn-outline-dark" for="vbtn-radio7">PC</label>
  			
 			<input type="radio" class="btn-check"name="gameDevice" value="Mobile" id="vbtn-radio8" autocomplete="off">
  			<label class="btn btn-outline-dark" for="vbtn-radio8">Mobile</label>
		    </div>
		    </div>
			</div>
			      
		     <div id="scroll-target4">
			 <div class="card" style="text-align:center; margin-top:123px; margin-left:120px; width: 1300px; height:550px; background:#e7eaef ;border-radius: 50px 50px 50px 50px;border-width: 6px; border-color:black;">
	         <br>
	         <h3>4. 선호하는 그래픽은 무엇인가요?</h3>
	         <br>
	         <div class="container text-center">
	         
             <input type="radio" autocomplete="off" name="gameGraphic" value="2D">
             <a style="text-decoration:none;">
             <img src="https://i.imgur.com/lXk6QZf.png" style="width: 320px; height:180px;"></a>
                    
             <input type="radio" autocomplete="off" name="gameGraphic" value="2D">
             <a style="text-decoration:none;">
             <img src="https://i.imgur.com/E4lFZ62.jpeg" style="width: 320px; height:180px;"></a>
                     
             <br><br>                   
                   
             <input type="radio" autocomplete="off" name="gameGraphic" value="3D">
             <a style="text-decoration:none;">
             <img src="https://i.imgur.com/V8Mn0A2.jpg" style="width: 320px; height:180px;"></a>
                              
             <input type="radio" autocomplete="off" name="gameGraphic" value="3D">
             <a style="text-decoration:none;">
             <img src="https://i.imgur.com/DwXv9Vp.jpeg" style="width: 320px; height:180px;"></a>

             </div>
		     </div>  
			 </div>
		     
			     	
			 <div id="scroll-target5">	
	         <div class="card" style="text-align:center; margin-top:123px; margin-left:120px; width: 1300px; height:245px; background:#e7eaef ;border-radius: 50px 50px 50px 50px;border-width: 6px; border-color:black;">
             <br>
             <h3>5. 게임을 즐길 때</h3><br>
		     <div style="text-align: center;">
		     <div class="d-grid gap-2 col-6 mx-auto">
			 <input type="radio" class="btn-check"name="gameCoop" value="SP" id="vbtn-radio9" autocomplete="off">
  			 <label class="btn btn-outline-dark" for="vbtn-radio9">혼자 즐기는 것이 좋다</label>

 			 <input type="radio" class="btn-check"name="gameCoop" value="MP" id="vbtn-radio10" autocomplete="off">
  			 <label class="btn btn-outline-dark" for="vbtn-radio10">여러명과 함께 즐기는 것이 좋다</label>

 			 <input type="radio" class="btn-check"name="gameCoop" value="BP" id="vbtn-radio11" autocomplete="off">
  			 <label class="btn btn-outline-dark" for="vbtn-radio11">때에 따라 혼자 즐기고 싶기도 하고, 여러명과 즐기고 싶기도 하다</label>
		
		     </div>
		     </div>
		     </div>
		     </div>
			

				
		     <div id="scroll-target6">	
		     <div class="card" style="text-align:center; margin-top:123px; margin-left:120px; width: 1300px; height:200px; background:#e7eaef ;border-radius: 50px 50px 50px 50px; border-width: 6px; border-color:black;">
             <br>
             <h3>6. 내가 찾는 게임은?</h3><br>
		     <div style="text-align: center;">
		     <div class="d-grid gap-2 col-6 mx-auto">
		     <input type="radio" class="btn-check"name="gameEnd" value="End" id="vbtn-radio12" autocomplete="off">
			 <label class="btn btn-outline-dark" for="vbtn-radio12">정해진 스토리의 소모에 따라 결말이 있고, 결말 도달 시 끝나는 게임</label>

			 <input type="radio" class="btn-check"name="gameEnd" value="Con" id="vbtn-radio13" autocomplete="off">
			 <label class="btn btn-outline-dark" for="vbtn-radio13">스토리가 상시로 업데이트되며, 결말 없이 언제든 즐길 수 있는 게임</label>
					
			 </div>
			 </div>
		     </div>
			 </div>
				
				
				 
		     <div id="scroll-target7">	
			 <div class="card" style="text-align:center; margin-top:123px; margin-left:120px; width: 1300px; height:200px; background:#e7eaef ;border-radius: 50px 50px 50px 50px;border-width: 6px; border-color:black;">
             <br>
             <h3>7. 내가 하는 게임은 게임 진행을 위해</h3><br>
		     <div style="text-align: center;">
			 <div class="d-grid gap-2 col-6 mx-auto">	
		
			 <input type="radio" class="btn-check" name="gamePuzzle" value="Hard" id="vbtn-radio14" autocomplete="off">
			 <label class="btn btn-outline-dark" for="vbtn-radio14">난이도가 있는 퍼즐(문제 해결) 요소들이 있으면 좋겠다</label>

			 <input type="radio" class="btn-check" name="gamePuzzle" value="Easy" id="vbtn-radio15" autocomplete="off">			
			 <label class="btn btn-outline-dark" for="vbtn-radio15">생각이 필요한 퍼즐(문제 해결) 요소들이 없으면 좋겠다</label>
			 </div>
		     </div>
		     </div>
			 </div>
				
				
		     <div id="scroll-target8">	
			 <div class="card" style="text-align:center; margin-top:123px; margin-left:120px; width: 1300px; height:200px; background:#e7eaef ;border-radius: 50px 50px 50px 50px;border-width: 6px; border-color:black;">
             <br>
             <h3>8. 내가 하고 싶은 게임은?</h3><br>
		     <div style="text-align: center;">
			 <div class="d-grid gap-2 col-6 mx-auto">
			 	
			 <input type="radio" class="btn-check" name="gameBattle" value="Fight" id="vbtn-radio16" autocomplete="off">
			 <label class="btn btn-outline-dark" for="vbtn-radio16">전투 요소가 필요하다.</label>

             <input type="radio" class="btn-check" name="gameBattle" value="Friend"  id="vbtn-radio17" autocomplete="off">
             <label class="btn btn-outline-dark" for="vbtn-radio17">전투 요소가 없어야 한다.</label>
						
			 </div>
			 </div>
			 </div>
			 </div>
				
		     <div id="scroll-target9">	
			 <div class="card" style="text-align:center; margin-top:123px; margin-left:120px; width: 1300px; height:200px; background:#e7eaef ;border-radius: 50px 50px 50px 50px;border-width: 6px; border-color:black;">
             <br>
             <h3>9. 캐릭터가 공격하거나 피해를 입을 때</h3><br>
		     <div style="text-align: center;">
			 <div class="d-grid gap-2 col-6 mx-auto">
			 
			 <input type="radio" class="btn-check" name="gameGore" value="Gore" id="vbtn-radio18" autocomplete="off">
			 <label class="btn btn-outline-dark" for="vbtn-radio18">피를 흘리거나 출혈을 포함한 장면은 문제없다.</label>

		     <input type="radio" class="btn-check" name="gameGore" value="Heal"  id="vbtn-radio19" autocomplete="off">
             <label class="btn btn-outline-dark" for="vbtn-radio19">피를 흘리거나 출혈을 포함한 장면은 보고싶지않다.</label>		
						
		     </div>
			 </div>
			 </div>
			 </div>		
						
				
			 <div id="scroll-target10">			
	         <div class="card" style="text-align:center; margin-top:123px; margin-left:120px; width: 1300px; height:150px; background:#e7eaef ;border-radius: 50px 50px 50px 50px;border-width: 6px; border-color:black;">
             <br>
             <h3>10. 게임에서 찾는 주요 관심사를 하나만 선택해 주세요</h3><br>
		     <div style="text-align: center;">
		     
			 <input type="radio" class="btn-check"  name="gameInterest" value="Music" id="vbtn-radio20" autocomplete="off">
			 <label class="btn btn-outline-dark" for="vbtn-radio20">음악</label>


			 <input type="radio" class="btn-check"  name="gameInterest" value="Cook" id="vbtn-radio21" autocomplete="off">
			 <label class="btn btn-outline-dark" for="vbtn-radio21">요리</label>


			<input type="radio" class="btn-check"  name="gameInterest" value="Simulation" id="vbtn-radio22" autocomplete="off">
			<label class="btn btn-outline-dark" for="vbtn-radio22">제작</label>


			<input type="radio" class="btn-check"  name="gameInterest" value="Venture" id="vbtn-radio23" autocomplete="off">
			<label class="btn btn-outline-dark" for="vbtn-radio23">모험</label>


			<input type="radio" class="btn-check"  name="gameInterest" value="Other" id="vbtn-radio24" autocomplete="off">
			<label class="btn btn-outline-dark" for="vbtn-radio24">기타</label>
					
		   
			</div>
			</div>
			</div>
				    
	        <div class="btn" style="margin-top:80px; margin-left:700px ">
	        <input type="submit" class="btn btn-outline-dark btn-pull" value="결과 제출">
	        </div>
	            
	            
	         <br><br><br>
	         <hr>
	         <br><br>
			  
		
                <script>
                $(document).ready(function() {
                  $(window).scroll( function(){
			
                     $('.card').each( function(){
            
                      var bottom_of_element = $(this).offset().top + $(this).outerHeight();
                      var bottom_of_window = $(window).scrollTop() + $(window).height();
            
                        if( bottom_of_window > bottom_of_element ){
                          $(this).animate({'opacity':'1'},700);
                           }
                         }); 
                       });
                      });
                </script>      
         
         </form>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" 
           integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" 
           crossorigin="anonymous"></script>
         </body>
      </html>