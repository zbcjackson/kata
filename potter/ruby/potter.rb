class Potter
	def get_price *books
		strategy = get_discount_strategy *books
		strategy = optimize_discount_strategy strategy
		calculate_price strategy
	end

	def get_discount_strategy *books
		if books.reduce(:+) == 0
			return []
		end

		differ = 0
		books_after = books.map do |book|
			if book > 0
				differ +=1
				book - 1
			else
				book
			end
		end
		[differ].concat(get_discount_strategy(*books_after))
	end

	def optimize_discount_strategy strategy
		while strategy.index(5) != nil && strategy.index(3) != nil do
			strategy.delete_at strategy.index(5)
			strategy.delete_at strategy.index(3)
			strategy << 4
			strategy << 4
		end
		strategy
	end

	def calculate_price strategy
		strategy.inject(0) {|sum, n| sum + discount_price(n) }
	end

	def discount_price(book_count)
		no_discount_price(book_count) * (1 - discount(book_count))
	end

	def discount(book_count)
		[0, 0, 0.05, 0.1, 0.2, 0.25][book_count]
	end

	def no_discount_price(book_count)
		book_count * 8
	end
end