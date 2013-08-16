class FizzBuzz
	def sequence number
		(1..number).to_a.map do |n|
			n = "FizzBuzz" if n % 15 == 0
			isFizz = multiples_of_3?(n) || contains_3?(n)
			isBuzz = multiples_of_5?(n) || contains_5?(n)
			n = "#{"Fizz" if isFizz}#{"Buzz" if isBuzz}" if isFizz || isBuzz
			n
		end
	end

	def multiples_of_3? number
		number % 3 == 0
	end

	def multiples_of_5? number
		number % 5 == 0
	end

	def contains_3? number
		number.to_s.index('3') != nil
	end

	def contains_5? number
		number.to_s.index('5') != nil
	end
end