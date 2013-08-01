class Fixnum
  @@atoms = 
    { 
      0 => "zero",
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
      16 => "sixteen" ,
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
      100 => "one hundred",
      200 => "two hundred",
      300 => "three hundred",
      400 => "four hundred",
      500 => "five hundred",
      600 => "six hundred",
      700 => "seven hundred",
      800 => "eight hundred",
      900 => "nine hundred",
    }

  def in_words
    return @@atoms[self] if @@atoms.include?(self)
    words = ""
    digits = self.to_s.chars.map(&:to_i)
    puts "the length of the array is " + digits.length.to_s
    digits.reverse!
    digits.each_with_index{|x,i|
      words.insert(0, @@atoms[x*(10**i)].to_s + "#{" " if i!=0}")
      puts "when i is " + i.to_s + ", the string is [" + "#{@@atoms[x*(10**i)].to_s}" + %Q(#{" " if i != 0}])
    }
    return words
  end
end
