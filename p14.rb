# project euler #14

# for the sequence defined by:
# n -> n/2 (n is even)
# n -> 3n+1 (n is odd)
# returns the starting number of the longest chain, that it is less than `max`
def longest_chain(max)
  longest_start = 1
  longest_length = 0
  calculator = ChainLengthCalculator.new
  for i in 1..max
    length = calculator.chain_length(i)
    if length > longest_length
      longest_start = i
      longest_length = length
    end
  end
  longest_start
end

class ChainLengthCalculator
  def initialize
    @memo = {}
  end

  def chain_length(start)
    length = 1
    n = start
    while n != 1
      if n % 2 == 0
        n = n / 2
      else
        n = 3 * n + 1
      end
      if @memo[n]
        length += @memo[n]
        break
      end
      length += 1
    end
      
    @memo[start] = length
  end
end

if __FILE__ == $0
  puts longest_chain(1000000)
end
