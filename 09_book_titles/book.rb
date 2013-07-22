$conj = ["for","and","nor","but","or","yet","so","therefore","consequently","thus","furthermore","however","still","also","besides","moreover","nevertheless","otherwise","then","because","wherever","who","that","how","since","whether","unless","until","as","if","while","before","after","although","than","though","whenever"]
$prep = ["of","in"]
$art  = ["a","an","the"]
class Book
  def title=(t)
    t_a = t.split(" ")
    t_a_final = t_a.each_with_index.map{|x,i|
      if i == 0
        x.capitalize
      elsif $conj.include?(x) or $prep.include?(x) or $art.include?(x)
        x
      else
        x.capitalize
      end
    }
    @title = t_a_final.join(" ") 
  end
  def title
    @title
  end
end
