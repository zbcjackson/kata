require_relative '../tennis'

describe "Tennis" do
	let(:game) { Tennis.new }

	def deuce
		3.times {game.player1_win_one_ball}
		3.times {game.player2_win_one_ball}
	end

	it "should score 0 - 0 when the game begins" do
		game.score.should == "0 - 0"
	end

	it "should score 15 - 0 when player1 wins one ball" do
		game.player1_win_one_ball
		game.score.should == "15 - 0"
	end

	it "should score 30 - 0 when player1 wins two balls" do
		2.times {game.player1_win_one_ball}
		game.score.should == "30 - 0"
	end

	it "should score 40 - 0 when player1 wins three balls" do
		3.times {game.player1_win_one_ball}
		game.score.should == "40 - 0"
	end

	it "should end with player1 wins when player1 wins four balls" do
		4.times {game.player1_win_one_ball}
		game.score.should == "Player1 wins"
	end

	it "should score 0 - 15 when player2 wins one ball" do
		game.player2_win_one_ball
		game.score.should == "0 - 15"
	end

	it "should score 0 - 30 when player2 wins two balls" do
		2.times {game.player2_win_one_ball}
		game.score.should == "0 - 30"
	end

	it "should score 0 - 40 when player2 wins three balls" do
		3.times {game.player2_win_one_ball}
		game.score.should == "0 - 40"
	end

	it "should end with player2 wins when player2 wins four balls" do
		4.times {game.player2_win_one_ball}
		game.score.should == "Player2 wins"
	end

	it "should score 40 - 30 when player1 wins three balls and player2 wins two balls" do
		3.times {game.player1_win_one_ball}
		2.times {game.player2_win_one_ball}
		game.score.should == "40 - 30"
	end

	it "should score 40 - 40 when in deuce that both player1 and player2 wins three balls" do
		deuce
		game.score.should == "40 - 40"
	end

	it "should score 45 - 40 when player1 wins one ball in deuce" do
		deuce
		game.player1_win_one_ball
		game.score.should == "45 - 40"
	end

	it "should end with player1 wins when player1 wins two balls in deuce" do
		deuce
		2.times {game.player1_win_one_ball}
		game.score.should == "Player1 wins"
	end

	it "should score 40 - 45 when player2 wins one ball in deuce" do
		deuce
		game.player2_win_one_ball
		game.score.should == "40 - 45"
	end

	it "should end with player2 wins when player2 wins two balls in deuce" do
		deuce
		2.times {game.player2_win_one_ball}
		game.score.should == "Player2 wins"
	end

	it "should end with 40 - 40 when both player1 and player2 wins one ball in deuce" do
		deuce
		game.player1_win_one_ball
		game.player2_win_one_ball
		game.score.should == "40 - 40"
	end
end