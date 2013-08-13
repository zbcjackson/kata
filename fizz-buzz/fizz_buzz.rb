class FizzBuzz
	def sequence number
		(1..number).to_a.map! do |n| 
			if n % 15 == 0
				"FizzBuzz"
			elsif n % 3 == 0
				"Fizz"
			elsif n % 5 == 0
				"Buzz"
			else
				n
			end
		end
	end
end