class Tennis
	def initialize
		@player1_wins = 0
		@player2_wins = 0
	end

	def score
		if in_deuce?
			if @player1_wins == 5
				return "Player1 wins"
			end
			if @player2_wins == 5
				return "Player2 wins"
			end
			if @player1_wins == 4 && @player2_wins == 4
				@player1_wins = 3
				@player2_wins = 3
			end
		else	
			if @player1_wins == 4
				return "Player1 wins"
			end
			if @player2_wins == 4
				return "Player2 wins"
			end
		end
		"#{score_for_ball_wins @player1_wins} - #{score_for_ball_wins @player2_wins}"
	end

	def in_deuce?
		@player1_wins >= 3 && @player2_wins >=3
	end

	def score_for_ball_wins ball_wins
		[0, 15, 30, 40, 45][ball_wins]
	end

	def player1_win_one_ball
		@player1_wins += 1
	end

	def player2_win_one_ball
		@player2_wins += 1
	end
end