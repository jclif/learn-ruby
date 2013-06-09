class Friend
  def greeting(name=nil)
		if not name
		  return "Hello!"
		else
		  return "Hello, #{name}!"
		end
	end
end
