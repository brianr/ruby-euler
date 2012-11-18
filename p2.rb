# project euler #2
# sum of even-valued terms in the fibonacci sequence less than 4 million

def sum_even_fib_terms(max)
  sum = 0
  
  # initialize sequence
  t0 = 1
  t1 = 2
  
  while t1 < max
    if t1 % 2 == 0
      sum += t1
    end

    # advance to next term in the sequence
    t2 = t0 + t1
    t0 = t1
    t1 = t2
  end

  sum
end

if __FILE__ == $0
  puts sum_even_fib_terms 4000000
end
