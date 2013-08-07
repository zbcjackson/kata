require_relative '../bowling'

describe "Bowling", "#score" do
	let(:game) {Bowling.new}

	def roll_spare
		game.hit 5
		game.hit 5
	end

	def roll_strike
		game.hit 10
	end

	def roll_many times, pins
		times.times { game.hit pins }
	end

	it "should return 0 when no pins was hit" do
		roll_many 20, 0
		game.score.should == 0
	end

	it "should return 20 when hit 1 pin each time" do
		roll_many 20, 1
		game.score.should == 20
	end

	it "should return current two rolls plus next roll for one spare" do
		roll_spare
		game.hit 3
		roll_many 17, 0
		game.score.should == 16
	end

	it "should return current roll plus next two rolls for one strike" do
		roll_strike
		game.hit 3
		game.hit 4
		roll_many 17, 0
		game.score.should == 24
	end

	it "should return 300 for a perfect game" do
		roll_many 22, 10
		game.score.should == 300
	end
end