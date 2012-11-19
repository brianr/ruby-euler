# project euler #16

def sum_digits(n)
  digits = n.to_s.split("")
  digits.collect{|x| x.to_i}.reduce(:+)
end

if __FILE__ == $0
  puts sum_digits(2 ** 1000)
end
