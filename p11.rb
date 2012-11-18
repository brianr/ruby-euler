# project euler #11

def greatest_product_from_grid(filename, product_length)
  grid, cols = read_grid(filename)
  offset_sets = build_offset_sets(product_length, cols)

  greatest = 0
  for i in 0..(grid.length - product_length)
    for offsets in offset_sets
      # bounds check
      if i + offsets[offsets.length - 1] < grid.length
        product = offsets.collect{|x| grid[i + x]}.reduce(1, :*)
        if product > greatest
          greatest = product
        end
      end
    end
  end

  greatest
end


# read the numbers from `filename` into a 1d array
# returns [grid, num_cols]
def read_grid(filename)
  grid = []
  rows = 0
  File.open(filename, 'r') do |fp|
    while line = fp.gets
      rows += 1
      for num in line.split(" ")
        if num != "\n"
          # this to_i conversion considers 0-prefixed numbers to be decimal
          grid.push(num.to_i)
        end
      end
    end
  end
  cols = grid.length / rows

  [grid, cols]
end


def build_offset_sets(product_length, cols)
  # directions to check: right, down, down-to-right
  [
    (0..(product_length - 1)).to_a,  # right
    (0..(product_length - 1)).collect{|x| x * cols},  # down
    (0..(product_length - 1)).collect{|x| x * cols + x},  # down and to the right
    (0..(product_length - 1)).collect{|x| x * cols - x}  # down and to the left
  ]
end


if __FILE__ == $0
  puts greatest_product_from_grid("p11.txt", 4)
end
