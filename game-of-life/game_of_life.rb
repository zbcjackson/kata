class GameOfLife
	def initialize cells
		@cells = cells
	end

	def next
		height = @cells.length
		width = @cells[0].length
		cells = Array.new(height){[0]* width}
		(0..height-1).each do |x|
			(0..width-1).each do |y|
				neighbours = count_neighbours(x, y)
				if neighbours == 2 || neighbours == 3
					cells[x][y] = 1 if @cells[x][y] == 1 || neighbours == 3
				else
					cells[x][y] = 0
				end
			end
		end
		@cells = cells
	end

	def count_neighbours x, y
		check_cell(x-1, y+1) + check_cell(x, y-1) + 
		check_cell(x-1, y-1) + check_cell(x-1, y) + 
		check_cell(x, y+1) + check_cell(x+1, y-1) +
		check_cell(x+1, y) + check_cell(x+1, y+1)
	end

	def check_cell x, y
		if x < 0 || x >= @cells.length || y < 0 || y >= @cells[0].length
			return 0
		end
		@cells[x][y]
	end
end