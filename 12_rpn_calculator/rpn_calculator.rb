class RPNCalculator
  def initialize
    @stack = []
  end
  def value 
    @stack[-1]
  end
  def push(x)
    puts "pushing: " + x.to_s
    @stack << x
  end    
  def check_stack
    if @stack == []
      raise Exception, "calculator is empty"
    end
  end
  def plus
    check_stack
    @stack << @stack.pop + @stack.pop
  end
  def minus
    check_stack
    @stack << -(@stack.pop - @stack.pop)
  end
  def divide
    check_stack
    @stack << 1 / (@stack.pop.to_f / @stack.pop.to_f)
  end
  def times
    check_stack
    @stack << @stack.pop * @stack.pop
  end
  def tokens(str)
    str.split(" ").map! {|x|
      if !!(x =~ /^[-+]?[0-9]+$/)
        Integer(x)
      else
        x.to_sym
      end
    }
  end
  def evaluate(str)
    stack = tokens(str)
    stack.each_with_index {|x,i|
      if x.class == Fixnum
        push(x)
      elsif x == :+
        plus
      elsif x == :-
        minus
      elsif x == :/
        divide
      else
        times
      end
    }
    value
  end    
end
