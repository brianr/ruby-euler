# project euler #8

# find the greatest product of consecutive digits in the number
# contained in the named file 
def find_greatest_product(filename, product_length)
  digits = read_digits(filename)

  greatest = 0
  for i in 0..(digits.length - product_length)
    product = digits.slice(i, product_length).reduce(1, :*)
    if product > greatest
      greatest = product
    end
  end

  greatest
end

def read_digits(filename)
  digits = []
  File.open(filename, 'r') do |fp|
    while line = fp.gets
      for char in line.split("")
        if char != "\n"
          digits.push(char.to_i)
        end
      end
    end
  end
  digits
end

if __FILE__ == $0
  puts find_greatest_product('p8.txt', 5)
end
