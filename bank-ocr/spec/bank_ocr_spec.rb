require_relative '../bank_ocr'

describe "Bank OCR" do
	describe "scan bank account numbers" do

		it "should recognize 1" do
			parser = AccountParser.new [
				"                           ",
				"  |  |  |  |  |  |  |  |  |",
				"  |  |  |  |  |  |  |  |  |"]
			parser.account_number.should == "111111111"
		end

		it "should recognize 2" do
			parser = AccountParser.new [
				" _  _  _  _  _  _  _  _  _ ",
				" _| _| _| _| _| _| _| _| _|",
				"|_ |_ |_ |_ |_ |_ |_ |_ |_ "]
			parser.account_number.should == "222222222"
		end

		it "should recognize 3" do
			parser = AccountParser.new [
				" _  _  _  _  _  _  _  _  _ ",
				" _| _| _| _| _| _| _| _| _|",
				" _| _| _| _| _| _| _| _| _|"]
			parser.account_number.should == "333333333"
		end

		it "should recognize 4" do
			parser = AccountParser.new [
				"                           ",
				"|_||_||_||_||_||_||_||_||_|",
				"  |  |  |  |  |  |  |  |  |"]
			parser.account_number.should == "444444444"
		end

		it "should recognize 5" do
			parser = AccountParser.new [
				" _  _  _  _  _  _  _  _  _ ",
				"|_ |_ |_ |_ |_ |_ |_ |_ |_ ",
				" _| _| _| _| _| _| _| _| _|"]
			parser.account_number.should == "555555555"
		end

		it "should recognize 6" do
			parser = AccountParser.new [
				" _  _  _  _  _  _  _  _  _ ",
				"|_ |_ |_ |_ |_ |_ |_ |_ |_ ",
				"|_||_||_||_||_||_||_||_||_|"]
			parser.account_number.should == "666666666"
		end

		it "should recognize 7" do
			parser = AccountParser.new [
				" _  _  _  _  _  _  _  _  _ ",
				"  |  |  |  |  |  |  |  |  |",
				"  |  |  |  |  |  |  |  |  |"]
			parser.account_number.should == "777777777"
		end

		it "should recognize 8" do
			parser = AccountParser.new [
				" _  _  _  _  _  _  _  _  _ ",
				"|_||_||_||_||_||_||_||_||_|",
				"|_||_||_||_||_||_||_||_||_|"]
			parser.account_number.should == "888888888"
		end

		it "should recognize 9" do
			parser = AccountParser.new [
				" _  _  _  _  _  _  _  _  _ ",
				"|_||_||_||_||_||_||_||_||_|",
				" _| _| _| _| _| _| _| _| _|"]
			parser.account_number.should == "999999999"
		end

		it "should recognize 0" do
			parser = AccountParser.new [
				" _  _  _  _  _  _  _  _  _ ",
				"| || || || || || || || || |",
				"|_||_||_||_||_||_||_||_||_|"]
			parser.account_number.should == "000000000"
		end

		it "should recognize second digit" do
			parser = AccountParser.new [
				" _     _  _  _  _  _  _  _ ",
				"| |  || || || || || || || |",
				"|_|  ||_||_||_||_||_||_||_|"]
			parser.account_number.should == "010000000"
		end

		it "should recognize third digit" do
			parser = AccountParser.new [
				" _     _  _  _  _  _  _  _ ",
				"| |  | _|| || || || || || |",
				"|_|  ||_ |_||_||_||_||_||_|"]
			parser.account_number.should == "012000000"
		end

		it "should recognize nine digits" do
			parser = AccountParser.new [
				" _     _  _     _  _  _  _ ",
				"| |  | _| _||_||_ |_   ||_|",
				"|_|  ||_  _|  | _||_|  ||_|"]
			parser.account_number.should == "012345678"
		end
	end

	describe "checksum" do
		it "should return 1 for checksum of 000000001" do
			parser = AccountParser.new [
				" _  _  _  _  _  _  _  _    ",
				"| || || || || || || || |  |",
				"|_||_||_||_||_||_||_||_|  |"]
			parser.checksum.should == 1
		end

		it "should return 2 for checksum of 000000002" do
			parser = AccountParser.new [
				" _  _  _  _  _  _  _  _  _ ",
				"| || || || || || || || | _|",
				"|_||_||_||_||_||_||_||_||_ "]
			parser.checksum.should == 2
		end

		it "should return 3 for checksum of 000000003" do
			parser = AccountParser.new [
				" _  _  _  _  _  _  _  _  _ ",
				"| || || || || || || || | _|",
				"|_||_||_||_||_||_||_||_| _|"]
			parser.checksum.should == 3
		end

		it "should return 2 for checksum of 000000010" do
			parser = AccountParser.new [
				" _  _  _  _  _  _  _     _ ",
				"| || || || || || || |  || |",
				"|_||_||_||_||_||_||_|  ||_|"]
			parser.checksum.should == 2
		end

		it "should return 4 for checksum of 000000020" do
			parser = AccountParser.new [
				" _  _  _  _  _  _  _  _  _ ",
				"| || || || || || || | _|| |",
				"|_||_||_||_||_||_||_||_ |_|"]
			parser.checksum.should == 4
		end

		it "should return 5 for checksum of 000000021" do
			parser = AccountParser.new [
				" _  _  _  _  _  _  _  _    ",
				"| || || || || || || | _|  |",
				"|_||_||_||_||_||_||_||_   |"]
			parser.checksum.should == 5
		end

		it "should return 14 for checksum of 000000321" do
			parser = AccountParser.new [
				" _  _  _  _  _  _  _  _    ",
				"| || || || || || | _| _|  |",
				"|_||_||_||_||_||_| _||_   |"]
			parser.checksum.should == 14
		end

		it "should return 285 for checksum of 987654321" do
			parser = AccountParser.new [
				" _  _  _  _  _     _  _    ",
				"|_||_|  ||_ |_ |_| _| _|  |",
				" _||_|  ||_| _|  | _||_   |"]
			parser.checksum.should == 285
		end
	end
end