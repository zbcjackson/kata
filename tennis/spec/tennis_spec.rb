require_relative '../tennis'

describe "Tennis" do
	describe "description" do
		let(:game) {Tennis.new}
		def deuce
			3.times {game.player1_win}
			3.times {game.player2_win}
		end
		it "should be love love at the beginning of the game" do
			game.description.should == "love love"
		end
		it "should be fifteen love when player 1 wins a ball" do
			game.player1_win
			game.description.should == "fifteen love"
		end
		it "should be love fifteen when player 2 wins a ball" do
			game.player2_win
			game.description.should == "love fifteen"
		end
		it "should be fifteen fifteen when both player 1 and player 2 win a ball" do
			game.player1_win
			game.player2_win
			game.description.should == "fifteen fifteen"
		end
		it "should be thirty thirty when both player 1 and player 2 win two balls" do
			game.player1_win
			game.player2_win
			game.player1_win
			game.player2_win
			game.description.should == "thirty thirty"
		end
		it "should be forty thirty when player 1 win 3 balls and player2 win 2 balls" do
			3.times {game.player1_win}
			2.times {game.player2_win}
			game.description.should == "forty thirty"
		end
		it "should be deuce when both player1 and player 2 win 3 balls" do
			deuce
			game.description.should == "deuce"
		end
		it "should be player1 advantage when player 1 wins a ball after deuce" do
			deuce
			game.player1_win
			game.description.should == "player1 advantage"
		end
		it "should be player2 advantage when player 2 wins a ball after deuce" do
			deuce
			game.player2_win
			game.description.should == "player2 advantage"
		end
		it "should be deuce when both player1 and player2 wins a ball after deuce" do
			deuce
			game.player1_win
			game.player2_win
			game.description.should == "deuce"
		end
		it "should be deuce when both player1 and player2 wins 2 balls after deuce" do
			deuce
			game.player1_win
			game.player2_win
			game.player1_win
			game.player2_win
			game.description.should == "deuce"
		end
		it "should be player1 wins when player1 wins 2 balls after deuce" do
			deuce
			2.times {game.player1_win}
			game.description.should == "player1 wins"
		end
		it "should be player2 wins when player2 wins 2 balls after deuce" do
			deuce
			2.times {game.player2_win}
			game.description.should == "player2 wins"
		end
		it "should be player1 wins when player1 wins 4 balls" do
			4.times {game.player1_win}
			game.description.should == "player1 wins"
		end
		it "should be player2 wins when player2 wins 4 balls" do
			4.times {game.player2_win}
			game.description.should == "player2 wins"
		end
	end
end