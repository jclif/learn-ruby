def echo(str)
  str
end

def shout(str)
  str.upcase
end

def repeat(str, num=2)
  final = str
  (num-1).times do
    final = final + " " + str  
  end
  return final
end

def start_of_word(str,num)
  str[0..num-1]
end

def first_word(str)
  str.split(' ')[0]
end

Lower_a = ["over","a","an","and","at","but","by","for","in","nor","of","on","or","so","the","to","up","yet"]

def titleize(str)
  str_a = str.split(' ')
  ans_a = str_a.each_with_index.map{|x,i|
					if (not Lower_a.include? x and x.length>2) or i==0
									x.capitalize
					else
									x
					end
	}
  ans_a.join(' ')
end
