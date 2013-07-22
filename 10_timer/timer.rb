class Timer
  attr_accessor :seconds
  def initialize(seconds = 0)
    @seconds = seconds
  end
  def duodigify(num)
    if num<10
      return "0#{num}"
    else
      return num.to_s()
    end    
  end
  def time_string
    hours = @seconds / 3600
    minutes = (@seconds % 3600) / 60
    seconds = @seconds % 60
    time_a = [duodigify(hours),duodigify(minutes),duodigify(seconds)]
    time_a.join(":")
  end
end
