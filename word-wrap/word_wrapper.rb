class WordWrapper
	def wrap s, column
		if s.length <= column
			return s
		end
		space = s[0..column].rindex(' ')
		if space != nil
			return s[0..space - 1] + "\n" + wrap(s[space + 1..s.length], column)
		else
			return s[0..column - 1] + "\n" + wrap(s[column..s.length], column)
		end
	end
end