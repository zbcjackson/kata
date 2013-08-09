require_relative '../word_wrapper'

describe "Word wrapper" do
	let(:wrapper) {WordWrapper.new}

	it "should do nothing for empty string" do
		wrapper.wrap("", 1).should == ""
	end

	it "should return original string when string is shorter than column" do
		wrapper.wrap("word", 10).should == "word"
	end

	it "should split one word" do
		wrapper.wrap("word", 2).should == "wo\nrd"
	end

	it "should split one word many times" do
		wrapper.wrap("interesting", 4).should == "inte\nrest\ning"
	end

	it "should wrap on word boundary" do
		wrapper.wrap("word word", 5).should == "word\nword"
	end

	it "should wrap after word boundary" do
		wrapper.wrap("word word", 6).should == "word\nword"
	end

	it "should wrap before word boundary" do
		wrapper.wrap("word word", 3).should == "wor\nd\nwor\nd"
	end

	it "should wrap just before word boundary" do
		wrapper.wrap("word word", 4).should == "word\nword"
	end
end