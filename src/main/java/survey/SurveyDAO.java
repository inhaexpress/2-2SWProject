package survey;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class SurveyDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	
	public SurveyDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
	}
	
	public int result(String gameGender, String gameAge, String gameDevice, String gameGraphic, String gameCoop, String gameEnd, String gamePuzzle, String gameBattle, String gameGore, String gameInterest) {
		String SQL = "INSERT INTO SURVEY VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, gameGender);
			pstmt.setString(2, gameAge);
			pstmt.setString(3, gameDevice); 
			pstmt.setString(4, gameGraphic);
			pstmt.setString(5, gameCoop);
			pstmt.setString(6, gameEnd);
			pstmt.setString(7, gamePuzzle);
			pstmt.setString(8, gameBattle);
			pstmt.setString(9, gameGore);
			pstmt.setString(10, gameInterest);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
}