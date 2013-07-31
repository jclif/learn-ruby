class XmlDocument
  def initialize(indent = false)
    @indent = indent
    @format = "\n"

  end
  def method_missing(tag_name,hash={})
    if block_given?
      if @indent
        puts "info:"
        p "format: [#{@format}]"
        puts "tag: #{tag_name}"
      end
      format = @format
      @format << "  "
      y = yield
      s = %Q(<#{tag_name}>#{format if @indent}#{y}</#{tag_name}>#{format if @indent})
      p "s is [#{s}]"
      return s
    elsif hash == {}
      "<#{tag_name}/>"
    else
      str = ""
      hash.each {|key,val|
        str << %Q( #{key.to_s}='#{val}')
      }
      "<#{tag_name}#{str}/>#{"\n" if @indent}"
    end
  end    
end
