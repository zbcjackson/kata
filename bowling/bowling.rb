class Bowling
	def initialize
		@hits = []
	end

	def hit pins
		@hits << pins
	end

	def score
		score = 0
		frameIndex = 0
		(1..10).each do
			if is_spare? frameIndex
				score += score_for_spare frameIndex
				frameIndex += 2
			elsif is_strike? frameIndex
				score += score_for_strike frameIndex
				frameIndex += 1
			else
				score += @hits[frameIndex] + @hits[frameIndex + 1]
				frameIndex += 2
			end
		end
		score
	end

	def score_for_spare frameIndex
		10 + @hits[frameIndex + 2]
	end

	def score_for_strike frameIndex
		10 + @hits[frameIndex + 1] + @hits[frameIndex + 2]
	end

	def is_spare? frameIndex
		@hits[frameIndex] + @hits[frameIndex + 1] == 10
	end

	def is_strike? frameIndex
		@hits[frameIndex] == 10
	end
end