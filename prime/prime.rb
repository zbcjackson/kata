class Prime
	def factors number
		factors = []
		(2..number).each do |candidate|
			while number % candidate == 0
				factors << candidate
				number /= candidate
			end
		end
		factors
	end
end