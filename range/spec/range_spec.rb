require_relative '../range'

describe "Range" do
    describe "[1,3]" do
        let(:range) {Range.new "[1,3]"}
        it "should contains 1" do
            range.contains(1).should be_true
        end
        it "should contains 2" do
            range.contains(2).should be_true
        end
        it "should contains 3" do
            range.contains(3).should be_true
        end
        it "should not contains 0" do
            range.contains(0).should be_false
        end
        it "should not contains -1" do
            range.contains(-1).should be_false
        end
        it "should not contains 4" do
            range.contains(4).should be_false
        end
        it "should not contains 5" do
            range.contains(5).should be_false
        end
    end
    describe "[2,3]" do
        let(:range) {Range.new "[2,3]"}
        it "should not contains 1" do
            range.contains(1).should be_false
        end
        it "should contains 2" do
            range.contains(2).should be_true
        end
    end
    describe "[2,4]" do
        let(:range) {Range.new "[2,4]"}
        it "should not contains 5" do
            range.contains(5).should be_false
        end
        it "should contains 4" do
            range.contains(4).should be_true
        end
    end
    describe "[10,11]" do
        let(:range) {Range.new "[10,11]"}
        it "should not contains 9" do
            range.contains(9).should be_false
        end
        it "should contains 10" do
            range.contains(10).should be_true
        end
    end
    describe "(1,3)" do
        let(:range) {Range.new "(1,3)"}
        it "should not contains 1" do
            range.contains(1).should be_false
        end
        it "should contains 2" do
            range.contains(2).should be_true
        end
        it "should not contains 3" do
            range.contains(3).should be_false
        end
    end
    describe "all points" do
        it "should return 1 for [1,1]" do
            range = Range.new "[1,1]"
            range.allPoints.should == [1]
        end
        it "should return 2 for [2,2]" do
            range = Range.new "[2,2]"
            range.allPoints.should == [2]
        end
        it "should return 1, 2 for [1,2]" do
            range = Range.new "[1,2]"
            range.allPoints.should == [1,2]
        end
        it "should return 2, 3, 4, 5 for (1,6)" do
            range = Range.new "(1,6)"
            range.allPoints.should == [2, 3, 4, 5]
        end
    end
end