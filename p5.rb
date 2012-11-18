# project euler #5

# returns the smallest number that can be divided by each of the numbers between
# `min` and `max` (inclusive)
def smallest_divisible_by_all(min, max)
  factors = factors_to_check(min, max)

  # will fail faster if we check in reverse order
  factors.reverse!

  max_factor = factors[0]
  x = max_factor
  while true
    divisible_by_all = true
    for i in factors
      if x % i != 0
        divisible_by_all = false
        break
      end
    end

    if divisible_by_all
      return x
    end
    
    x += max_factor
  end
end

# returns the list of factors that we need to check.
# some are divisble by each other, so no need to check all of them.
def factors_to_check(min, max)
  factors = []

  if min == 1
    min = 2
  end

  # for each possible factor, see if it is a factor of one of the other factors
  # if so, discard it. otherwise, add to the `factors` array.
  for i in min..max
    is_implied_factor = false
    for j in (i+1)..max
      if j % i == 0
        is_implied_factor = true
        break
      end
    end

    if not is_implied_factor
      factors.push(i)
    end
  end

  factors
end


if __FILE__ == $0
  puts smallest_divisible_by_all(1, 20)
end
