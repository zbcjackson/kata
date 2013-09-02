require_relative '../prime'

describe "Prime" do
	describe "Factor" do
		let(:prime) {Prime.new}
		it "should return empty for 1" do
			prime.factors(1).should == []
		end

		it "should return 2 for 2" do
			prime.factors(2).should == [2]
		end

		it "should return 3 for 3" do
			prime.factors(3).should == [3]
		end

		it "should return 2 and 2 for 4" do
			prime.factors(4).should == [2, 2]
		end

		it "should return 2 and 3 for 6" do
			prime.factors(6).should == [2, 3]
		end

		it "should return 2, 2 and 2 for 8" do
			prime.factors(8).should == [2, 2, 2]
		end

		it "should return 3 and 3 for 9" do
			prime.factors(9).should == [3, 3]
		end
	end
end