package game;

public class Game implements Comparable<Game> {

	private String gameTitle;
	private String gameDevice;
	private String gameGraphic;
	private String gameCoop;
	private String gameEnd;
	private String gamePuzzle;
	private String gameBattle;
	private String gameGore;
	private String gameInterest;
	private String gameLink;
	private String gameImg;
	
	private int gameCounter;
	
	public String getGameTitle() {
		return gameTitle;
	}
	public void setGameTitle(String gameTitle) {
		this.gameTitle = gameTitle;
	}
	public String getGameDevice() {
		return gameDevice;
	}
	public void setGameDevice(String gameDevice) {
		this.gameDevice = gameDevice;
	}
	public String getGameGraphic() {
		return gameGraphic;
	}
	public void setGameGraphic(String gameGraphic) {
		this.gameGraphic = gameGraphic;
	}
	public String getGameCoop() {
		return gameCoop;
	}
	public void setGameCoop(String gameCoop) {
		this.gameCoop = gameCoop;
	}
	public String getGameEnd() {
		return gameEnd;
	}
	public void setGameEnd(String gameEnd) {
		this.gameEnd = gameEnd;
	}
	public String getGamePuzzle() {
		return gamePuzzle;
	}
	public void setGamePuzzle(String gamePuzzle) {
		this.gamePuzzle = gamePuzzle;
	}
	public String getGameBattle() {
		return gameBattle;
	}
	public void setGameBattle(String gameBattle) {
		this.gameBattle = gameBattle;
	}
	public String getGameGore() {
		return gameGore;
	}
	public void setGameGore(String gameGore) {
		this.gameGore = gameGore;
	}
	public String getGameInterest() {
		return gameInterest;
	}
	public void setGameInterest(String gameInterest) {
		this.gameInterest = gameInterest;
	}
	
	public String getGameLink() {
		return gameLink;
	}
	public void setGameLink(String gameLink) {
		this.gameLink = gameLink;
	}
	public String getGameImg() {
		return gameImg;
	}
	public void setGameImg(String gameImg) {
		this.gameImg = gameImg;
	}
	
	public int getGameCounter() {
		return gameCounter;
	}
	public void setGameCounter(int gameCounter) {
		this.gameCounter = gameCounter;
	}
	
	public void plusGameCounter() {
		this.gameCounter = this.gameCounter + 1;
	}
	
	@Override
	public int compareTo(Game game) {
		if(game.getGameCounter() < gameCounter) {
			return 1;
		} else if (game.getGameCounter() > gameCounter) {
			return -1;
		}
		return 0;
	}
}