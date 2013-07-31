class XmlDocument
  def initialize(nested = false)
    @nested = nested
  end
  def hello(hash={})
    if block_given?
      %Q(<hello>#{yield}</hello>)
    else
      str = ""
      hash.each {|key,val|
        str << %Q( #{key.to_s}='#{val}')
      }       
      "<hello#{str}/>"
    end
  end
  def method_missing(tag_name,hash={})
    if block_given?
      %Q(<#{tag_name}>#{yield}</#{tag_name}>)
    elsif hash == {}
      "<#{tag_name}/>"
    else
      str = ""
      hash.each {|key,val|
        str << %Q( #{key.to_s}='#{val}')
      }
      "<#{tag_name}#{str}/>"
    end
  end    
end
