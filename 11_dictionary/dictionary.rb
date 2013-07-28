class Dictionary
  def initialize(entries={})
    @entries = entries
  end
  def entries
    @entries
  end
  def add(entry)
    if entry.class == Hash
      @entries = @entries.merge(entry)
    elsif entry.class == String
      @entries = @entries.merge({entry => nil})
    end
    puts "entries after add",@entries
  end    
  def keywords
    @entries.keys
  end
  def include?(key)
    @entries.keys.include?(key)
  end
  def find(key)
    reg = Regexp.new key
    results = {}
    @entries.each {|x,y|
      if reg.match(x)
        results[x] = y
      end
    }
    results = Hash[results.sort]
    return results
  end
  def keywords
    @entries.keys.sort
  end
  def printable
    s = ""
    sorted = Hash[@entries.sort]
    sorted.each_with_index {|(x,y),index|
      s << "[" + x + "] " + %Q["#{y}"]
      if index < @entries.length - 1
        s << "\n"
      end
    }
    return s
  end
end
