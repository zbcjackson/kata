require_relative '../game_of_life'

describe "Game of life" do
	describe "All cells" do
		it "should be always dead if no cells at beginning" do
			game = GameOfLife.new [
				[0, 0, 0],
				[0, 0, 0],
				[0, 0, 0]
			]
			result = game.next
			result.should == [
				[0, 0, 0],
				[0, 0, 0],
				[0, 0, 0]
			]
		end
		it "should become dead or alive based on last status" do
			game = GameOfLife.new [
				[0, 1, 0],
				[1, 1, 1],
				[0, 1, 0]
			]
			result = game.next
			result.should == [
				[1, 1, 1],
				[1, 0, 1],
				[1, 1, 1]
			]
		end
		it "should change status continously based on last status" do
			game = GameOfLife.new [
				[0, 1, 0],
				[1, 1, 1],
				[0, 1, 0]
			]
			result = game.next
			result = game.next
			result.should == [
				[1, 0, 1],
				[0, 0, 0],
				[1, 0, 1]
			]
		end
	end
	describe "live cell" do
		it "should die with no live neighbours" do
			game = GameOfLife.new [
				[0, 0, 0],
				[0, 1, 0],
				[0, 0, 0]
			]
			result = game.next
			result.should == [
				[0, 0, 0],
				[0, 0, 0],
				[0, 0, 0]
			]
		end
		it "should die with one live neighbours" do
			game = GameOfLife.new [
				[0, 0, 1],
				[0, 1, 0],
				[0, 0, 0]
			]
			result = game.next
			result.should == [
				[0, 0, 0],
				[0, 0, 0],
				[0, 0, 0]
			]
		end

		it "should live with two live neighbours" do
			game = GameOfLife.new [
				[0, 0, 1],
				[1, 1, 0],
				[0, 0, 0]
			]
			result = game.next
			result[1][1].should == 1
		end
		it "should live with two live neighbours" do
			game = GameOfLife.new [
				[1, 1, 0],
				[0, 1, 0],
				[0, 0, 0]
			]
			result = game.next
			result[1][1].should == 1
		end
		it "should live with two live neighbours" do
			game = GameOfLife.new [
				[0, 0, 0],
				[0, 1, 1],
				[1, 0, 0]
			]
			result = game.next
			result[1][1].should == 1
		end
		it "should live with two live neighbours" do
			game = GameOfLife.new [
				[0, 0, 0],
				[0, 1, 0],
				[0, 1, 1]
			]
			result = game.next
			result[1][1].should == 1
		end
		it "should live with three live neighbours" do
			game = GameOfLife.new [
				[0, 1, 0],
				[0, 1, 0],
				[0, 1, 1]
			]
			result = game.next
			result[1][1].should == 1
		end
		it "should die with four live neighbours" do
			game = GameOfLife.new [
				[0, 1, 0],
				[1, 1, 0],
				[0, 1, 1]
			]
			result = game.next
			result[1][1].should == 0
		end
		it "should die with five live neighbours" do
			game = GameOfLife.new [
				[1, 1, 0],
				[1, 1, 0],
				[0, 1, 1]
			]
			result = game.next
			result[1][1].should == 0
		end
	end
	describe "dead cells" do
		it "should be dead with two live neighbours" do
			game = GameOfLife.new [
				[1, 0, 0],
				[0, 0, 0],
				[0, 0, 1]
			]
			result = game.next
			result[1][1].should == 0
		end
		it "should become alive with three live neighbours" do
			game = GameOfLife.new [
				[1, 0, 1],
				[0, 0, 0],
				[0, 0, 1]
			]
			result = game.next
			result[1][1].should == 1
		end
		it "should be dead with four live neighbours" do
			game = GameOfLife.new [
				[1, 0, 1],
				[0, 0, 0],
				[1, 0, 1]
			]
			result = game.next
			result[1][1].should == 0
		end
	end
	describe "top left cell with three neighbours at most" do
		it "should die with no neighbours" do
			game = GameOfLife.new [
				[1, 0, 1],
				[0, 0, 0],
				[1, 0, 1]
			]
			result = game.next
			result[0][0].should == 0
		end
		it "should die with one neighbours" do
			game = GameOfLife.new [
				[1, 1, 1],
				[0, 0, 0],
				[1, 0, 1]
			]
			result = game.next
			result[0][0].should == 0
		end
		it "should live with two neighbours" do
			game = GameOfLife.new [
				[1, 1, 1],
				[1, 0, 0],
				[1, 0, 1]
			]
			result = game.next
			result[0][0].should == 1
		end
	end
	describe "bottom right cell with three neighbours at most" do
		it "should die with no neighbours" do
			game = GameOfLife.new [
				[1, 0, 1],
				[0, 0, 0],
				[1, 0, 1]
			]
			result = game.next
			result[2][2].should == 0
		end
		it "should die with one neighbours" do
			game = GameOfLife.new [
				[1, 1, 1],
				[0, 0, 0],
				[1, 1, 1]
			]
			result = game.next
			result[2][2].should == 0
		end
		it "should live with two neighbours" do
			game = GameOfLife.new [
				[1, 1, 1],
				[0, 0, 1],
				[1, 1, 1]
			]
			result = game.next
			result[2][2].should == 1
		end
	end
end