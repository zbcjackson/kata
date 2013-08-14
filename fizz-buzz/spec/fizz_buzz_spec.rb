require_relative '../fizz_buzz'

describe "Fizz buzz" do
	let(:game) {FizzBuzz.new}
	describe "prints number itself" do
		it "should print 1 for 1" do
			game.sequence(1)[0].should == 1
		end
		it "should print 2 for 2" do
			game.sequence(2)[1].should == 2
		end
	end
	describe "prints Fizz for multiples of 3" do
		it "should print Fizz for 3" do
			game.sequence(3)[2].should == "Fizz"
		end
		it "should print Fizz for 6" do
			game.sequence(6)[5].should == "Fizz"
		end
	end
	describe "prints Buzz for multiples of 5" do
		it "should print Buzz for 5" do
			game.sequence(5)[4].should == "Buzz"
		end
		it "should print Buzz for 10" do
			game.sequence(10)[9].should == "Buzz"
		end
	end
	describe "prints FizzBuzz for multiples of both 3 and 5" do
		it "should print FizzBuzz for 15" do
			game.sequence(15)[14].should == "FizzBuzz"
		end
		it "should print FizzBuzz for 30" do
			game.sequence(30)[29].should == "FizzBuzz"
		end
	end
	it "should print all numbers below 10" do
		game.sequence(10).should == [1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz"]
	end
end