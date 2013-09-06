require_relative '../minesweeper'

describe "Minesweeper" do
	it "should be zero if there is no mine nearby" do
		game = Minesweeper.new [
			"...",
			"...",
			"..."
		]
		game.hint.should == [
			"000",
			"000",
			"000"
		]
	end
	it "should be not changed if full of mines" do
		game = Minesweeper.new [
			"***",
			"***",
			"***"
		]
		game.hint.should == [
			"***",
			"***",
			"***"
		]
	end
	it "should show 1 if there is 1 mine nearby" do
		game = Minesweeper.new [
			"...",
			".*.",
			"..."
		]
		game.hint.should == [
			"111",
			"1*1",
			"111"
		]
	end
	
end