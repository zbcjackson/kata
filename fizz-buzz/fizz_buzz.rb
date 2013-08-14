class FizzBuzz
	def sequence number
		(1..number).to_a.map do |n|
			n = "FizzBuzz" if n % 15 == 0
			n = "Fizz" if n % 3 == 0
			n = "Buzz" if n % 5 == 0
			n
		end
	end
end