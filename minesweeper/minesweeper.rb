class Minesweeper
	def initialize field
		@field = field
	end
	def hint
		field = @field
		(0..@field.length-1).each do |x|
			(0..@field[0].length-1).each do |y|
				if @field[x][y] == "."
					field[x][y] = mine_count_nearby(x, y).to_s
				end
			end
		end
		field
	end
	def is_mine x, y
		if x >= @field.length or x < 0 or y < 0
			return false
		end
		@field[x][y] == "*"
	end
	def mine_count_nearby x, y
		i = 0
		i += 1 if is_mine(x-1, y-1)
		i += 1 if is_mine(x-1, y)
		i += 1 if is_mine(x-1, y+1)
		i += 1 if is_mine(x, y-1)
		i += 1 if is_mine(x, y+1)
		i += 1 if is_mine(x+1, y+1)
		i += 1 if is_mine(x+1, y)
		i += 1 if is_mine(x+1, y-1)
		i
	end
end