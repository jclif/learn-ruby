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
    100 => "one hundred"
  }
  
$names = ["","thousand","million","billion"]

def last_two(array,c)
  int = Integer(array.join)
  return $atoms[int] if $atoms.include?(int)
  words = ""
  array.reverse!
  array.each_with_index{|x,i|
    words.insert(0, $atoms[x*(10**i)].to_s + "#{" " if i != 0 and c == 0}")
  }
  return words
end

class Array

  def take_three(c)
    if self.length >= 3
      if self[-3..-1] == Array.new(3,0)
        self.pop(3)
        return ""
      end
      popped = [self.pop, self.pop]
      name = $atoms[self.pop] + " hundred"
      if popped != [0,0] 
        lt = last_two(popped.reverse,c)
        return name + " " + lt + $names[c]
      else 
        return name
      end
    else
      if c == 0
        return last_two([self.pop,self.pop].reverse,c)
      else 
        return last_two([self.pop,self.pop].reverse,c) + " " + $names[c] + " "
      end
    end
  end
end

class Fixnum
  
  def in_words
    return $atoms[self] if $atoms.include?(self)
    digits = self.to_s.chars.map(&:to_i)
    counter = 0
    words = ""
    while digits != []
      words.insert(0,digits.take_three(counter))
      counter = counter + 1
    end
    return words
  end

end
