require_relative '../potter'

describe Potter do
	book = Potter.new

	{
		[0, 0, 0] => 0, 
		[1, 0, 0] => 8,
	}.each do |book_number, expected_price|
		it "should return #{expected_price} for #{book_number[0]} first potter book" do
			price = book.get_price(book_number[0])
			price.should == expected_price
		end	
	end

	it "should return 16 for 2 first potter books" do
		price = book.get_price(2)
		price.should == 16
	end

	it "should return 16*0.95 for 1 first book and 1 second book" do
		price = book.get_price(1, 1)
		price.should == 16*0.95
	end

	it "should return 8 for 1 second potter books" do
		price = book.get_price(0, 1)
		price.should == 8
	end

	it "should return 23.2 for 1 first book and 2 second book" do
		price = book.get_price(1, 2)
		price.should == 16 * 0.95 + 8
	end

	it "should return 23.2 for 2 first book and 1 second book" do
		price = book.get_price(2, 1)
		price.should == 16 * 0.95 + 8
	end

	it "should return 30.4 for 2 first book and 2 second book" do
		price = book.get_price(2, 2)
		price.should == 16 * 0.95 * 2	
	end

	it "should return 8 for 1 third book" do
		price = book.get_price(0, 0, 1)
		price.should == 8
	end

	it "should return 15.2 for 1 second book and 1 third book" do
		price = book.get_price(0, 1, 1)
		price.should == 15.2
	end

	it "should return 15.2 for 1 first book and 1 third book" do
		price = book.get_price(1, 0, 1)
		price.should == 15.2	
	end

	it "should return 23.2 for 1 second book and 2 third book" do
		price = book.get_price(0, 1, 2)
		price.should == 23.2
	end

	it "should return 23.2 for 2 second book and 1 third book" do
		price = book.get_price(0, 2, 1)
		price.should == 23.2
	end

	it "should return 21.6 for 1 first book and 1 second book and 1 third book" do
		price = book.get_price(1, 1, 1)
		price.should == 21.6
	end

	it "should return 29.6 for 2 first book and 1 second book and 1 third book" do
		price = book.get_price(2, 1, 1)
		price.should == 29.6
	end

	it "should return 36.8 for 2 first book and 2 second book and 1 third book" do
		price = book.get_price(2, 2, 1)
		price.should == 36.8
	end

	it "should return 44.8 for 3 first book and 2 second book and 1 third book" do
		price = book.get_price(3, 2, 1)
		price.should == 44.8
	end

	it "should return 8 for 0 first book and 0 second book and 0 third book and 1 forth book" do
		price = book.get_price(0, 0, 0, 1)
		price.should == 8
	end

	it "should return 8 for 0 first book and 0 second book and 0 third book and 1 forth book" do
		price = book.get_price(0, 0, 0, 1)
		price.should == 8
	end

	it "should return 32*0.8 for 1 first book and 1 second book and 1 third book and 1 forth book" do
		price = book.get_price(1, 1, 1, 1)
		price.should == 32*0.8
	end

	it "should return 16*0.95+32*0.8 for 2 first book and 2 second book and 1 third book and 1 forth book" do
		price = book.get_price(2, 2, 1, 1)
		price.should == 16*0.95+32*0.8
	end

	it "should return 8 for 0 first book and 0 second book and 0 third book and 0 forth book and 1 fifth book" do
		price = book.get_price(0, 0, 0, 0, 1)
		price.should == 8
	end

	it "should return 30 for 1 first book and 1 second book and 1 third book and 1 forth book and 1 fifth book" do
		price = book.get_price(1, 1, 1, 1, 1)
		price.should == 30
	end

	it "should return 51.2 for 1 first book and 1 second book and 1 third book and 1 forth book and 1 fifth book" do
		price = book.get_price(2, 2, 2, 1, 1)
		price.should == 51.2
	end
end