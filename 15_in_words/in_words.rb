$atoms = 
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
  }
  
$names = ["","thousand","million","billion","trillion"]

def last_two(array,c)
  int = Integer(array.join)
  return [$atoms[int]] if $atoms.include?(int)
  words = []
  array.reverse!
  array.each_with_index{|x,i|
    words.unshift $atoms[x*(10**i)].to_s
  }
  return words
end

class Array

  def take_three(c)
    if self.length >= 3
      if self[-3..-1] == Array.new(3,0)
        self.pop(3)
        return []
      end
      popped = [self.pop, self.pop]
      name = [$atoms[self.pop],"hundred"]
      if popped != [0,0] 
        lt = last_two(popped.reverse,c)
        return name[0] != "zero" ? name + lt + [$names[c]] : lt + [$names[c]]
      else 
        return name
      end
    else
      if c == 0
        lt = last_two([self.pop,self.pop].reverse,c)
        return lt
      else 
        lt = last_two([self.pop,self.pop].reverse,c) + [$names[c]]
        return lt
      end
    end
  end
end

class Fixnum
  
  def in_words
    return $atoms[self] if $atoms.include?(self)
    digits = self.to_s.chars.map(&:to_i)
    counter = 0
    words = []
    while digits != []
      words = digits.take_three(counter) + words
      counter = counter + 1
    end
    words.pop if words[-1] == ""
    return words.join(" ")
  end

end

class Bignum
  
  def in_words
    return $atoms[self] if $atoms.include?(self)
    digits = self.to_s.chars.map(&:to_i)
    counter = 0
    words = []
    while digits != []
      words = digits.take_three(counter) + words
      counter = counter + 1
    end
    words.pop if words[-1] == ""
    return words.join(" ")
  end

end
