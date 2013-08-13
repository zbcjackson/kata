require_relative '../fizz_buzz'

describe "Fizz buzz" do
	let(:game) {FizzBuzz.new}

	it "should prints 1 for 1" do
		game.sequence(1).should == [1]
	end
	it "should prints 1, 2 for 2" do
		game.sequence(2).should == [1, 2]
	end
	it "should prints 1, 2, Fizz for 3" do
		game.sequence(3).should == [1, 2, "Fizz"]
	end
	it "should prints 1, 2, Fizz, 4, Buzz for 5" do
		game.sequence(5).should == [1, 2, "Fizz", 4, "Buzz"]
	end
	it "should prints 1, 2, Fizz, 4, Buzz, Fizz for 6" do
		game.sequence(6).should == [1, 2, "Fizz", 4, "Buzz", "Fizz"]
	end
	it "should prints 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz for 10" do
		game.sequence(10).should == [1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz"]
	end
	it "should prints FizzBuzz for multiples of both 3 and 5" do
		game.sequence(15)[14].should == "FizzBuzz"
	end
end