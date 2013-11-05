public class Tennis {
    private final static String[] SCORE_WORD = {"Love", "Fifteen", "Thirty", "Forty"};

    private int player1Score = 0;
    private int player2Score = 0;

    public String score() {
        if (isGameEnd())
            return gameResult();

        if (isInDeuce())
            return scoreInDeuce();

        return normalScore();
    }

    private String normalScore() {
        String scoreDescription;
        if (isDraw())
            scoreDescription = String.format("%s All", SCORE_WORD[player1Score]);
        else
            scoreDescription = String.format("%s %s", SCORE_WORD[player1Score], SCORE_WORD[player2Score]);
        return scoreDescription;
    }

    private String scoreInDeuce() {
        String scoreDescription;
        if (isDraw())
            scoreDescription = "Deuce";
        else if (player1Score > player2Score){
                scoreDescription = "Player1 Advance";
        }
        else{
                scoreDescription = "Player2 Advance";
        }
        return scoreDescription;
    }

    private boolean isGameEnd() {
        return Math.abs(player1Score - player2Score) > 1 && (player1Score >= 4 || player2Score >=4);
    }

    private String gameResult() {
        return player1Score > player2Score ? "Player1 Wins" : "Player2 Wins";
    }

    private boolean isDraw() {
        return player1Score == player2Score;
    }

    private boolean isInDeuce() {
        return player1Score >= 3 && player2Score >= 3;
    }

    public void player1_scores() {
        player1Score += 1;
    }

    public void player2_scores() {
        player2Score += 1;
    }
}
