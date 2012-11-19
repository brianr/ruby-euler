# project euler #30

# returns all number that can be written by the `n`th power of their digits
def can_be_written_by_nth_power_of_digits(n)
  # find the max possible number of digits
  num_digits = 1
  while (10 ** num_digits) - 1 < (9**n) * num_digits
    num_digits += 1
  end

  vals = []
  for i in 2..((10 ** num_digits) - 1)
    if i == i.to_s.split("").collect{|d| d.to_i ** n}.reduce(:+)
      puts "found one: #{i}"
      vals.push(i)
    end
  end

  vals
end

if __FILE__ == $0
  puts can_be_written_by_nth_power_of_digits(5).reduce(:+)
end
