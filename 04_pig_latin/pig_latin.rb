Vowels_a = ["a","e","i","o","u"]

def translate(str)
	str_a = str.split(" ")
	final_a = str_a.map {|x|
	  if Vowels_a.include? x[0]
	    x << "ay"
	  else
			i = 0
		  consonants = ""
		  while not Vowels_a.include? x[i] and i<=x.length
				if x[i] == "q" and i+1 <= x.length and x[i+1] == "u"
				  consonants << x[i] + x[i+1]
					i = i +2
				else
				  consonants << x[i]
					i = i+1
				end
			end
			x[i..x.length-1] + consonants + "ay"
		end
	}
	final_a.join(" ")
end
