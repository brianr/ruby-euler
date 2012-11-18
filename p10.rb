# project euler #10
require './p7.rb'

def sum_primes_below(n)
  find_primes(n - 1).reduce(:+)
end


def test
  sum_primes_below(10) == 17
end


if __FILE__ == $0
  puts "Running test..."
  if not test
    puts "Test failed."
    Kernel::exit(1)
  end
  puts "Test passed."

  puts "Running..."
  puts sum_primes_below(2000000)
end
