class Range
    def initialize input
        range = input[1..input.length-2]
        @start, @end = range.split(',').map{|n| n.to_i}
        @start += 1 if input[0] != '['
        @end -= 1 if input[input.length-1] != ']'
    end

    def contains number
        number >= @start && number <= @end
    end
end