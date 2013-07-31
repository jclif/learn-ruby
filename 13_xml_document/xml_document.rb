class XmlDocument
  def initialize(indent = false)
    @indent = indent
    @f = "\n"
    @first = true
  end
  def method_missing(tag_name,hash={},&block)
    if block_given?
      if @indent
        first = @first
        @first = false
        @f << "  "
        return "<#{tag_name}>" + @f + yield + "</#{tag_name}>" + "#{@f=@f[0...-2];if not first then @f else "\n" end}"
      else
        return %Q(<#{tag_name}>#{yield}</#{tag_name}>)
      end
    elsif hash == {}
      "<#{tag_name}/>"
    else
      str = ""
      hash.each {|key,val|
        str << %Q( #{key.to_s}='#{val}')
      }
      "<#{tag_name}#{str}/>#{@f=@f[0...-2];@f if @indent}"
    end
  end    
end
