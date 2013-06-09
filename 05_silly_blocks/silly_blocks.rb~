def reverser(&block)
    str_a = block.call.split(" ")
    rev_a = str_a.map! {|x|x.reverse}
    rev_a.join(" ")
end

def adder(num=1,&block)
	  block.call + num
end

def repeater(num=1,&block)
    num.times do
	      block.call
		end
end

