package game;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

 public class GameDAO {
 
	private Connection conn;
	private PreparedStatement pstmt;
    private ResultSet rs; 
    private ArrayList<Game> lists = new ArrayList<Game>();
    
   

 public GameDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS?serverTimezone=UTC"; //데이터베이스 연동 
			String dbID = "root"; 
			String dbPassword = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); // mysql 내 url이랑 id, passwd로 conneection
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
	}	
 
        public String getGame(String gameTitle, String gameDevice, String gameGraphic, String gameCoop, String gameEnd, String gamePuzzle, String gameBattle, String gameGore, String gameInterest, String gameLink, String gameImg){
		try {
			String SQL = "SELECT gameTitle FROM game where gameDevice Like ? and gameGraphics Like ? and gameCoop Like ? "
					+ "and gameEnd Like ? and gamePuzzle Like ? and gameBattle Like ? and gameGore Like ? and gameInterest Like ?";
			pstmt = conn.prepareStatement(SQL);
                       			
			  pstmt.setString(1, gameDevice); 
			  pstmt.setString(2, gameGraphic);
			  pstmt.setString(3, gameCoop);
			  pstmt.setString(4, gameEnd);
			  pstmt.setString(5, gamePuzzle);
			  pstmt.setString(6, gameBattle);
			  pstmt.setString(7, gameGore);
			  pstmt.setString(8, gameInterest);
			  
			  rs = pstmt.executeQuery();
			 
			
			while(rs.next())
			{
				gameTitle = rs.getString(1);
				
				
			}
			
			rs.close();
			
			return gameTitle;			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		return null; //데이터베이스 오류
	}
        
        public ArrayList<Game> getGames(String gameTitle, String gameDevice, String gameGraphic, String gameCoop, String gameEnd, String gamePuzzle, String gameBattle, String gameGore, String gameInterest, String gameLink, String gameImg){
    		try {
    			ArrayList<Game> games = new ArrayList<Game>();
    			String SQL = "SELECT * FROM game where gameDevice Like ? and gameGraphics Like ? and gameCoop Like ? "
    					+ "and gameEnd Like ? and gamePuzzle Like ? and gameBattle Like ? and gameGore Like ? and gameInterest Like ?";
    			pstmt = conn.prepareStatement(SQL);
                  
    			  
    			pstmt.setString(1, gameDevice); 
    			pstmt.setString(2, gameGraphic);
    			pstmt.setString(3, gameCoop);
    			pstmt.setString(4, gameEnd);
    			pstmt.setString(5, gamePuzzle);
  			  	pstmt.setString(6, gameBattle);
  			  	pstmt.setString(7, gameGore);
  			  	pstmt.setString(8, gameInterest);
    			  
    			  rs = pstmt.executeQuery();
    			 
    			
    			while(rs.next())
    			{
    				Game game = new Game();
    				game.setGameTitle(rs.getString(1));
    				game.setGameDevice(rs.getString(2));
    				game.setGameGraphic(rs.getString(3));
    				game.setGameCoop(rs.getString(4));
    				game.setGameEnd(rs.getString(5));
    				game.setGamePuzzle(rs.getString(6));
    				game.setGameBattle(rs.getString(7));
    				game.setGameGore(rs.getString(8));
    				game.setGameInterest(rs.getString(9));
    				game.setGameLink(rs.getString(10));
    				game.setGameImg(rs.getString(11));
    				games.add(game);
    				
    				
    			}
   
    			rs.close();
    			
    			return games;			
    		}catch(Exception e) {
    			e.printStackTrace();
    			System.out.println(e);
    		}
    		return null; //데이터베이스 오류
    	}
        
        public ArrayList<Game> getByDevice(String gameDevice){
    		try {
    			ArrayList<Game> games = new ArrayList<Game>();
    			String SQL = "SELECT * FROM game where gameDevice Like ?";
    			pstmt = conn.prepareStatement(SQL);
                  
    			  pstmt.setString(1, gameDevice);
    			  
    			  rs = pstmt.executeQuery();
    			 
    			
    			while(rs.next())
    			{
    				Game game = new Game();
    				game.setGameTitle(rs.getString(1));
    				game.setGameDevice(rs.getString(2));
    				game.setGameGraphic(rs.getString(3));
    				game.setGameCoop(rs.getString(4));
    				game.setGameEnd(rs.getString(5));
    				game.setGamePuzzle(rs.getString(6));
    				game.setGameBattle(rs.getString(7));
    				game.setGameGore(rs.getString(8));
    				game.setGameInterest(rs.getString(9));
    				game.setGameLink(rs.getString(10));
    				game.setGameImg(rs.getString(11));
    				games.add(game);
    				
    				
    			}
   
    			rs.close();
    			
    			return games;			
    		}catch(Exception e) {
    			e.printStackTrace();
    			System.out.println(e);
    		}
    		return null; //데이터베이스 오류
    	}
        
        public ArrayList<Game> getByGraphic(String gameGraphic){
    		try {
    			ArrayList<Game> games = new ArrayList<Game>();
    			String SQL = "SELECT * FROM game where gameGraphic Like ?";
    			pstmt = conn.prepareStatement(SQL);
                  
    			  pstmt.setString(1, gameGraphic);
    			  
    			  rs = pstmt.executeQuery();
    			 
    			
    			while(rs.next())
    			{
    				Game game = new Game();
    				game.setGameTitle(rs.getString(1));
    				game.setGameDevice(rs.getString(2));
    				game.setGameGraphic(rs.getString(3));
    				game.setGameCoop(rs.getString(4));
    				game.setGameEnd(rs.getString(5));
    				game.setGamePuzzle(rs.getString(6));
    				game.setGameBattle(rs.getString(7));
    				game.setGameGore(rs.getString(8));
    				game.setGameInterest(rs.getString(9));
    				game.setGameLink(rs.getString(10));
    				game.setGameImg(rs.getString(11));
    				games.add(game);
    				
    				
    			}
   
    			rs.close();
    			
    			return games;			
    		}catch(Exception e) {
    			e.printStackTrace();
    			System.out.println(e);
    		}
    		return null; //데이터베이스 오류
    	}
        
        public ArrayList<Game> getByCoop(String gameCoop){
    		try {
    			ArrayList<Game> games = new ArrayList<Game>();
    			String SQL = "SELECT * FROM game where gameCoop Like ?";
    			pstmt = conn.prepareStatement(SQL);
                  
    			  pstmt.setString(1, gameCoop);
    			  
    			  rs = pstmt.executeQuery();
    			 
    			
    			while(rs.next())
    			{
    				Game game = new Game();
    				game.setGameTitle(rs.getString(1));
    				game.setGameDevice(rs.getString(2));
    				game.setGameGraphic(rs.getString(3));
    				game.setGameCoop(rs.getString(4));
    				game.setGameEnd(rs.getString(5));
    				game.setGamePuzzle(rs.getString(6));
    				game.setGameBattle(rs.getString(7));
    				game.setGameGore(rs.getString(8));
    				game.setGameInterest(rs.getString(9));
    				game.setGameLink(rs.getString(10));
    				game.setGameImg(rs.getString(11));
    				games.add(game);
    				
    				
    			}
   
    			rs.close();
    			
    			return games;			
    		}catch(Exception e) {
    			e.printStackTrace();
    			System.out.println(e);
    		}
    		return null; //데이터베이스 오류
    	}
        
        public ArrayList<Game> getByEnd(String gameEnd){
    		try {
    			ArrayList<Game> games = new ArrayList<Game>();
    			String SQL = "SELECT * FROM game where gameEnd Like ?";
    			pstmt = conn.prepareStatement(SQL);
                  
    			  pstmt.setString(1, gameEnd);
    			  
    			  rs = pstmt.executeQuery();
    			 
    			
    			while(rs.next())
    			{
    				Game game = new Game();
    				game.setGameTitle(rs.getString(1));
    				game.setGameDevice(rs.getString(2));
    				game.setGameGraphic(rs.getString(3));
    				game.setGameCoop(rs.getString(4));
    				game.setGameEnd(rs.getString(5));
    				game.setGamePuzzle(rs.getString(6));
    				game.setGameBattle(rs.getString(7));
    				game.setGameGore(rs.getString(8));
    				game.setGameInterest(rs.getString(9));
    				game.setGameLink(rs.getString(10));
    				game.setGameImg(rs.getString(11));
    				games.add(game);
    				
    				
    			}
   
    			rs.close();
    			
    			return games;			
    		}catch(Exception e) {
    			e.printStackTrace();
    			System.out.println(e);
    		}
    		return null; //데이터베이스 오류
    	}
        public ArrayList<Game> getByPuzzle(String gamePuzzle){
    		try {
    			ArrayList<Game> games = new ArrayList<Game>();
    			String SQL = "SELECT * FROM game where gamePuzzle Like ?";
    			pstmt = conn.prepareStatement(SQL);
                  
    			  pstmt.setString(1, gamePuzzle);
    			  
    			  rs = pstmt.executeQuery();
    			 
    			
    			while(rs.next())
    			{
    				Game game = new Game();
    				game.setGameTitle(rs.getString(1));
    				game.setGameDevice(rs.getString(2));
    				game.setGameGraphic(rs.getString(3));
    				game.setGameCoop(rs.getString(4));
    				game.setGameEnd(rs.getString(5));
    				game.setGamePuzzle(rs.getString(6));
    				game.setGameBattle(rs.getString(7));
    				game.setGameGore(rs.getString(8));
    				game.setGameInterest(rs.getString(9));
    				game.setGameLink(rs.getString(10));
    				game.setGameImg(rs.getString(11));
    				games.add(game);
    				
    				
    			}
   
    			rs.close();
    			
    			return games;			
    		}catch(Exception e) {
    			e.printStackTrace();
    			System.out.println(e);
    		}
    		return null; //데이터베이스 오류
    	}
        public ArrayList<Game> getByBattle(String gameBattle){
    		try {
    			ArrayList<Game> games = new ArrayList<Game>();
    			String SQL = "SELECT * FROM game where gameBattle Like ?";
    			pstmt = conn.prepareStatement(SQL);
                  
    			  pstmt.setString(1, gameBattle);
    			  
    			  rs = pstmt.executeQuery();
    			 
    			
    			while(rs.next())
    			{
    				Game game = new Game();
    				game.setGameTitle(rs.getString(1));
    				game.setGameDevice(rs.getString(2));
    				game.setGameGraphic(rs.getString(3));
    				game.setGameCoop(rs.getString(4));
    				game.setGameEnd(rs.getString(5));
    				game.setGamePuzzle(rs.getString(6));
    				game.setGameBattle(rs.getString(7));
    				game.setGameGore(rs.getString(8));
    				game.setGameInterest(rs.getString(9));
    				game.setGameLink(rs.getString(10));
    				game.setGameImg(rs.getString(11));
    				games.add(game);
    				
    				
    			}
   
    			rs.close();
    			
    			return games;			
    		}catch(Exception e) {
    			e.printStackTrace();
    			System.out.println(e);
    		}
    		return null; //데이터베이스 오류
    	}
        public ArrayList<Game> getByGore(String gameGore){
    		try {
    			ArrayList<Game> games = new ArrayList<Game>();
    			String SQL = "SELECT * FROM game where gameGore Like ?";
    			pstmt = conn.prepareStatement(SQL);
                  
    			  pstmt.setString(1, gameGore);
    			  
    			  rs = pstmt.executeQuery();
    			 
    			
    			while(rs.next())
    			{
    				Game game = new Game();
    				game.setGameTitle(rs.getString(1));
    				game.setGameDevice(rs.getString(2));
    				game.setGameGraphic(rs.getString(3));
    				game.setGameCoop(rs.getString(4));
    				game.setGameEnd(rs.getString(5));
    				game.setGamePuzzle(rs.getString(6));
    				game.setGameBattle(rs.getString(7));
    				game.setGameGore(rs.getString(8));
    				game.setGameInterest(rs.getString(9));
    				game.setGameLink(rs.getString(10));
    				game.setGameImg(rs.getString(11));
    				games.add(game);
    				
    				
    			}
   
    			rs.close();
    			
    			return games;			
    		}catch(Exception e) {
    			e.printStackTrace();
    			System.out.println(e);
    		}
    		return null; //데이터베이스 오류
    	}
        public ArrayList<Game> getByInterest(String gameInterest){
    		try {
    			ArrayList<Game> games = new ArrayList<Game>();
    			String SQL = "SELECT * FROM game where gameInterest Like ?";
    			pstmt = conn.prepareStatement(SQL);
                  
    			  pstmt.setString(1, gameInterest);
    			  
    			  rs = pstmt.executeQuery();
    			 
    			
    			while(rs.next())
    			{
    				Game game = new Game();
    				game.setGameTitle(rs.getString(1));
    				game.setGameDevice(rs.getString(2));
    				game.setGameGraphic(rs.getString(3));
    				game.setGameCoop(rs.getString(4));
    				game.setGameEnd(rs.getString(5));
    				game.setGamePuzzle(rs.getString(6));
    				game.setGameBattle(rs.getString(7));
    				game.setGameGore(rs.getString(8));
    				game.setGameInterest(rs.getString(9));
    				game.setGameLink(rs.getString(10));
    				game.setGameImg(rs.getString(11));
    				games.add(game);
    				
    				
    			}
   
    			rs.close();
    			
    			return games;			
    		}catch(Exception e) {
    			e.printStackTrace();
    			System.out.println(e);
    		}
    		return null; //데이터베이스 오류
    	}
        
        public ArrayList<Game> getAllGames(){
    		try {
    			ArrayList<Game> games = new ArrayList<Game>();
    			String SQL = "SELECT * FROM game";
    			pstmt = conn.prepareStatement(SQL);
                           		
    			  
    			  rs = pstmt.executeQuery();
    			 
    			
    			while(rs.next())
    			{
    				Game game = new Game();
    				game.setGameTitle(rs.getString(1));
    				game.setGameDevice(rs.getString(2));
    				game.setGameGraphic(rs.getString(3));
    				game.setGameCoop(rs.getString(4));
    				game.setGameEnd(rs.getString(5));
    				game.setGamePuzzle(rs.getString(6));
    				game.setGameBattle(rs.getString(7));
    				game.setGameGore(rs.getString(8));
    				game.setGameInterest(rs.getString(9));
    				game.setGameLink(rs.getString(10));
    				game.setGameImg(rs.getString(11));
    				games.add(game);
    				
    				
    			}
   
    			rs.close();
    			
    			return games;			
    		}catch(Exception e) {
    			e.printStackTrace();
    			System.out.println(e);
    		}
    		return null; //데이터베이스 오류
    	}

        
        public ArrayList<Game> compareGameName(ArrayList<Game> allGames, ArrayList<Game> searchGames) {       	

        	for(int i = 0; i < allGames.size(); i++) {
        		for(int j =0; j < searchGames.size(); j++)
        			if(allGames.get(i).getGameTitle().equals(searchGames.get(j).getGameTitle())) {
        				allGames.get(i).plusGameCounter();
        			}
        	}
        	
        	return allGames;
        }
}