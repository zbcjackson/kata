require_relative '../roman'

describe "Roman" do
	{
		1 => "I", 
		2 => "II", 
		3 => "III",
		4 => "IV",
		5 => "V",
		6 => "VI",
		7 => "VII",
		8 => "VIII",
		9 => "IX",
		10 => "X",
		12 => "XII",
		14 => "XIV",
		19 => "XIX",
		23 => "XXIII",
		46 => "XLVI",
		57 => "LVII",
		89 => "LXXXIX",
		99 => "XCIX",
		149 => "CXLIX",
		494 => "CDXCIV",
		562 => "DLXII",
		999 => "CMXCIX",
		1999 => "MCMXCIX"
	}.each do |number, expected|
		it "should translate #{number} to #{expected}" do
			roman = Roman.new
			roman.to_roman(number).should == expected
		end
	end
	

	{
		"I" => 1,
		"II" => 2,
		"III" => 3,
		"V" => 5,
		"VI" => 6,
		"VII" => 7,
		"VIII" => 8,
		"XVI" => 16,
		"LXVII" => 67,
		"CI" => 101,
		"DCII" => 602,
		"MDXI" => 1511,
		"IV" => 4,
		"MCMXCIX" => 1999
	}.each do |romanString, expected|
		it "should translate #{romanString} to #{expected}" do
			roman = Roman.new
			roman.to_arabic(romanString).should == expected
		end
	end
end