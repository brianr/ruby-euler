# project euler #4

def largest_palindrome_from_product(factor_digits)
  min = 10 ** (factor_digits - 1)
  max = (10 ** factor_digits) - 1

  largest = 0
  for i in min..max 
    for j in min..max
      product = i * j
      if is_palindrome(product) and product > largest
        largest = product
      end
    end
  end

  largest
end


def is_palindrome(n)
  digits = n.to_s.chars.to_a
  num_digits = digits.length

  for i in 0..(num_digits / 2)
    if digits[i] != digits[num_digits - i - 1]
      return false
    end
  end

  true
end


if __FILE__ == $0
  puts largest_palindrome_from_product 3
end
