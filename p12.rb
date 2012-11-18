# project euler #12

def first_triangle_with_over_x_divisors(x)
  i = 1
  n = i
  while true
    nf = num_factors(n)
    if nf > x
      return n
    end
    i += 1
    n += i
  end
end

def num_factors(n)
  count = 2  # n and 1
  for i in 2..(Math.sqrt(n).to_i)
    if n % i == 0
      count += 2  # mirror effect
    end
  end
  count
end

if __FILE__ == $0
  puts first_triangle_with_over_x_divisors(500) 
end
