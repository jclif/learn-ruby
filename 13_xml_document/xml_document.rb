class XmlDocument
  def hello(hash={})
    str = ""
    hash.each {|key,val|
      str << %Q( #{key.to_s}='#{val}')
    }      
    "<hello#{str}/>"
  end
  def missing_method
end
