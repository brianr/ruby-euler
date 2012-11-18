# project euler #13

def first_n_digits_of_sum(numbers, n)
  sum = numbers.reduce(:+)
  sum.to_s.slice(0, n)
end

def read_numbers(filename)
  numbers = []
  File.open(filename, 'r') do |fp|
    while line = fp.gets
      numbers.push(line.strip.to_i)
    end
  end
  numbers
end

if __FILE__ == $0
  puts first_n_digits_of_sum(read_numbers('p13.txt'), 10)
end
