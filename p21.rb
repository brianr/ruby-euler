# project euler #21

class AmicablePairCalculator
  def initialize
    @memo = {}
  end

  def sum_proper_divisors(n)
    if @memo[n]
      @memo[n]
    else
      @memo[n] = _sum_proper_divisors(n)
    end
  end
  
  def sum_pairs_below(n)
    total = 0  
    for a in 2..(n - 1)
      b = sum_proper_divisors(a)
      if b != a
        sum_b = sum_proper_divisors(b)
        if a == sum_b
          # only add a, as we'll find 'b' on another iteration 
          total += a
        end
      end
    end
    total
  end

  private
  
  def _sum_proper_divisors(n)
    if n == 1
      return 0
    end
    
    sum = 1
    for i in 2..(Math.sqrt(n).to_i)
      if n % i == 0
        sum += i
        other_divisor = n / i
        if other_divisor != i
          sum += other_divisor
        end
      end
    end
    sum
  end
end


if __FILE__ == $0
  puts AmicablePairCalculator.new.sum_pairs_below(10000)
end
