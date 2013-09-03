class Prime
	def factors number
		factors = []
		(2..Math.sqrt(number)).each do |candidate|
			while number % candidate == 0
				factors << candidate
				number /= candidate
			end
		end
		if number > 1
			factors << number
		end
		factors
	end
end