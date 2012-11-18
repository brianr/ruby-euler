# project euler #3
# largest prime factor of 600851475143

def largest_prime_factor(n)
  # only need to go as high as sqrt(n)
  search_max = Math.sqrt(n).to_i
  
  largest = 1
  for i in 2..search_max
    if n % i == 0 and is_prime(i)
      largest = i
    end
  end
  largest
end

def is_prime(n)
  search_max = Math.sqrt(n).to_i
  for i in 2..search_max
    if n % i == 0
      return false
    end
  end
  true
end


if __FILE__ == $0
  puts largest_prime_factor 600851475143
end

