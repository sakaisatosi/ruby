class Unit
    def initialize(count=3)
	@cells = []
	(count + 1).times { @cells << rand(9) }
    end

    def learn(patterns)
	while !ok ||= false
	    ok = true
	    result = []
	    patterns.values.each do |pattern|
		ans = answer(pattern)
	        chk = patterns.check(pattern)
		if ans == chk
		    result << 'OK'
	        elsif ans && !chk
		    result << 'NG'
		    ok = false
		    penalize(pattern, -1)
		elsif !ans && chk
		    result << 'NG'
		    ok = false
		    penalize(pattern, 1)
		end
	    end
	    yield(ok, result, @cells)
	end
    end

    def answer(pattern)
	sum = 0
	@cells.length.times { |i| sum += @cells[i + 1] if pattern[i] == 1 }
	@cells[0] <= sum
    end

    def penalize(pattern, direction)
	@cells[0] -= direction
	@cells.length.times { |i| @cells[i + 1] += direction if pattern[i] == 1 }
    end
end

class Patterns
    def initialize
	@limit = 500
	@prices = [310,220,70]
	@values =  [[0, 0, 0],
	    [0, 0, 1],
	    [0, 1, 0],
	    [0, 1, 1],
	    [1, 0, 0],
	    [1, 0, 1],
	    [1, 1, 0],
	    [1, 1, 1]]
	end

	attr_reader :values

def check(pattern)
	sum = 0
	pattern.length.times { |i| sum += @prices[i] * pattern[i] }
	    sum <= @limit
	end
end

#--------------------------------
unit = Unit.new
pat = Patterns.new
unit.learn(pat) do |ok, result, cells|
  p result
  #break if gets =~ /x/
end
