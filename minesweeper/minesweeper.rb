class Minesweeper
	def initialize field
		@field = field
	end
	def hint
		field = @field
		(0..@field.length-1).each do |x|
			(0..@field[0].length-1).each do |y|
				if @field[x][y] == "."
					if one_mine_nearby(x, y)
						field[x][y] = "1"
					else
						field[x][y] = "0"
					end
				end
			end
		end
		field
	end
	def is_mine x, y
		if x >= @field.length
			return false
		end
		@field[x][y] == "*"
	end
	def one_mine_nearby x, y
		is_mine(x-1, y-1) ||
						is_mine(x-1, y) ||
						is_mine(x-1, y+1) ||
						is_mine(x, y-1) ||
						is_mine(x, y+1) ||
						is_mine(x+1, y+1) ||
						is_mine(x+1, y) ||
						is_mine(x+1, y-1)
	end
end