# project euler #1
# sum of all multiples of 3 or 5 below 1000

# Returns the sum of all natural numbers <= `max` that are multiples of any of `factors`
def sum_multiples(factors, max)
  sum = 0
  (1..max).each do |i|
    for f in factors
      if i % f == 0
        sum += i
        break
      end
    end
  end
  sum
end

if __FILE__ == $0
  puts sum_multiples([3, 5], 999)
end
