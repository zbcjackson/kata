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
			roman.translate(number).should == expected
		end
	end
	
end