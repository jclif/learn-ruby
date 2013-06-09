def measure(num=1,&block)
  if num == 1
	  x = Time.now
	    num.times do
	    block.call
	  end
	  return Time.now - x
  end
  if num>1
    total_time = 0
		num.times do
		  x = Time.now
			block.call
			total_time = total_time + (Time.now - x)
		end
	  return total_time/num
	end
end
