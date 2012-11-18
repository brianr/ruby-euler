# project euler #9

def find_triplet_product
  # a pythagorean triplet is a set of three natural numbers, a < b < c, for which
  # a*a + b*b == c*c
  # there exists exactly one for which a + b + c == 1000 . find the product abc

  max_a = 332  # at 333, the min sum would be 1002
  for a in 1..332
    min_b = a + 1
    max_b = (1000 - a) / 2
    for b in min_b..max_b
      min_c = b + 1
      max_c = 1000 - a - b
      for c in min_c..max_c
        if a + b + c == 1000 and a * a + b * b == c * c
          return a * b * c
        end
      end
    end
  end

  "Not found" 
end


if __FILE__ == $0
  puts find_triplet_product
end
