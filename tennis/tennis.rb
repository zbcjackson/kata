class Tennis
	def initialize
		@player1 = 0
		@player2 = 0
	end
	def description
		in_deuce? ? deuce_stage : normal_stage
	end

	def player1_win
		@player1 += 1
	end
	def player2_win
		@player2 += 1
	end

	private
	def scoring score
		["love", "fifteen", "thirty", "forty"][score]
	end

	def in_deuce?
		@player1 >= 3 && @player2 >= 3
	end

	def normal_stage
		if @player1 == 4
			desc = "player1 wins"
		elsif @player2 == 4
			desc = "player2 wins"
		else
			player1_scoring = scoring @player1	
			player2_scoring = scoring @player2
			desc = "#{player1_scoring} #{player2_scoring}"
		end
		desc
	end

	def deuce_stage
		if @player1 == @player2
			desc = "deuce"
		end
		case @player1 - @player2
		when 1
			desc = "player1 advantage"
		when 2
			desc = "player1 wins"
		when -1
			desc = "player2 advantage"
		when -2
			desc = "player2 wins"
		end
		desc
	end
end