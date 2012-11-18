# project euler #6

# returns the difference between the sum of the squares of numbers 1 to n, and the square of
# the sum of numbers from 1 to n
def difference_between_sum_sq_and_sq_sum(n)
  square_sum(n) - sum_squares(n)
end

def sum_squares(n)
  (1..n).collect{|n| n ** 2}.reduce(:+)
end

def square_sum(n)
  (1..n).reduce(:+) ** 2
end

if __FILE__ == $0
  puts difference_between_sum_sq_and_sq_sum(100)
end
