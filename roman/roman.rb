class Roman
	def to_roman number
		result = ""
		{
			1000 => "M",
			900 => "CM",
			500 => "D",
			400 => "CD",
			100 => "C",
			90 => "XC",
			50 => "L",
			40 => "XL",
			10 => "X",
			9 => "IX",
			5 => "V", 
			4 => "IV", 
			1 => "I"
		}.each do |arabic, roman|
			while number >= arabic
				result += roman
				number -= arabic
			end
		end
		result
	end

	def to_arabic roman
		result = 0
		dict = {"I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000}
		while roman.length > 0
			roman_sym = roman[0]
			roman = roman[1..roman.length - 1]
			if roman.length > 0 && dict[roman_sym] < dict[roman[0]]
				result -= dict[roman_sym]
			else
				result += dict[roman_sym]
			end
		end
		result
	end
end