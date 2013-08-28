class AccountParser
	def initialize account_strings
		@digit_map = {
			" _ " => {
				"|_ " => {
					" _|" => "5",
					"|_|" => "6"
				}, 
				" _|" => {
					" _|" => "3", 
					"|_ " => "2"
				},
				"  |" => "7",
				"|_|" => {
					"|_|" => "8",
					" _|" => "9"
				},
				"| |" => "0"
			},
			"   " => {
				"|_|" => "4",
				"  |" => "1"
			}
		}

		@account_strings = account_strings
		@account_number = ""
	end

	def parse
		result = ""

		(0..8).each do |digit_index|
			digit = get_digit digit_index
			result << digit
		end
		result
	end

	def account_number
		@account_number = parse if @account_number.empty?
		@account_number
	end

	def checksum
		(1..9).reduce(0) {|result, i| result + account_number[9-i].to_i * i}
	end

	def valid?
		checksum % 11 == 0
	end

	def get_digit digit_index
		start = 3 * digit_index
		range = start..(start+2)
		digit = @digit_map[@account_strings[0][range]]
		digit = digit[@account_strings[1][range]] if digit && digit.length > 1
		digit = digit[@account_strings[2][range]] if digit && digit.length > 1
		digit
	end
end