import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class TennisTest {

    private Tennis game;

    @Before
    public void setUp() {
        game = new Tennis();
    }

    @Test
    public void game_start() {
        assertEquals("Love All", game.score());
    }

    @Test
    public void fifteen_love_after_player1_scores() {
        game.player1_scores();
        assertEquals("Fifteen Love", game.score());
    }

    @Test
    public void thirty_love_after_player1_scores_twice() {
        player1_scores_many_times(2);
        assertEquals("Thirty Love", game.score());
    }

    @Test
    public void forty_love_after_player1_scores_3_times() {
        player1_scores_many_times(3);
        assertEquals("Forty Love", game.score());
    }

    @Test
    public void player1_wins_after_player1_scores_4_times() {
        player1_scores_many_times(4);
        assertEquals("Player1 Wins", game.score());
    }

    @Test
    public void love_fifteen_after_player2_scores() {
        game.player2_scores();
        assertEquals("Love Fifteen", game.score());
    }

    @Test
    public void love_thirty_after_player2_scores_twice() {
        player2_scores_many_times(2);
        assertEquals("Love Thirty", game.score());
    }

    @Test
    public void love_forty_after_player1_scores_3_times() {
        player2_scores_many_times(3);
        assertEquals("Love Forty", game.score());
    }

    @Test
    public void player2_wins_after_player2_scores_4_times() {
        player2_scores_many_times(4);
        assertEquals("Player2 Wins", game.score());
    }

    @Test
    public void deuce_after_both_players_scores_3_times(){
        player1_scores_many_times(3);
        player2_scores_many_times(3);
        assertEquals("Deuce", game.score());
    }

    @Test
    public void player1_advance_after_player1_scores_in_deuce(){
        player1_scores_many_times(3);
        player2_scores_many_times(3);
        game.player1_scores();
        assertEquals("Player1 Advance", game.score());
    }

    @Test
    public void player2_advance_after_player2_scores_in_deuce(){
        player1_scores_many_times(3);
        player2_scores_many_times(3);
        game.player2_scores();
        assertEquals("Player2 Advance", game.score());
    }

    @Test
    public void deuce_again_after_both_players_score_once_in_deuce(){
        player1_scores_many_times(3);
        player2_scores_many_times(3);
        game.player1_scores();
        game.player2_scores();
        assertEquals("Deuce", game.score());
    }

    @Test
    public void player1_wins_after_player1_scores_twice_in_deuce(){
        player1_scores_many_times(3);
        player2_scores_many_times(3);
        player1_scores_many_times(2);
        assertEquals("Player1 Wins", game.score());
    }

    @Test
    public void player2_wins_after_player2_scores_twice_in_deuce(){
        player1_scores_many_times(3);
        player2_scores_many_times(3);
        player2_scores_many_times(2);
        assertEquals("Player2 Wins", game.score());
    }

    private void player2_scores_many_times(int times) {
        for (int n = 0; n < times; n++){
            game.player2_scores();
        }

    }

    private void player1_scores_many_times(int times) {
        for (int n = 0; n < times; n++){
            game.player1_scores();
        }
    }
}
