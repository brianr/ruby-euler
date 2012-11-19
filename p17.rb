# project euler #17

class LetterCounter
  def initialize
    @word_lookup = {
      1 => "one",
      2 => "two",
      3 => "three",
      4 => "four",
      5 => "five",
      6 => "six",
      7 => "seven",
      8 => "eight",
      9 => "nine",
      10 => "ten",
      11 => "eleven",
      12 => "twelve",
      13 => "thirteen",
      14 => "fourteen",
      15 => "fifteen",
      16 => "sixteen",
      17 => "seventeen",
      18 => "eighteen",
      19 => "nineteen",
      20 => "twenty",
      30 => "thirty",
      40 => "forty",
      50 => "fifty",
      60 => "sixty",
      70 => "seventy",
      80 => "eighty",
      90 => "ninety",
      100 => "hundred",
      1000 => "thousand"
    }
  end

  # returns the total number of letters used writing out the numbers `min`..`max`
  # (not counting spaces or hyphens)
  def total_letters(min, max)
    (min..max).collect{|x| letters(x)}.reduce(:+)
  end

  # returns the number of letters to print the number n
  # works for integers up to 1000
  def letters(n)
    if n == 1000
      @word_lookup[1].length + @word_lookup[n].length
    elsif n >= 100
      remainder = n % 100
      hundreds_place = @word_lookup[100].length + @word_lookup[n / 100].length
      if remainder != 0
        3 + letters(remainder) + hundreds_place
      else
        hundreds_place
      end
    elsif n >= 20
      tens_place = @word_lookup[(n / 10) * 10].length
      remainder = n % 10
      if remainder != 0
        letters(remainder) + tens_place
      else
        tens_place
      end
    else
      @word_lookup[n].length
    end
  end

end

if __FILE__ == $0
  puts LetterCounter.new.total_letters(1, 1000)
end
