class Temperature
  def initialize(opts={})
    @options = opts
  end

  def in_fahrenheit
    if @options[:f]
      return @options[:f]
    else
      return ((@options[:c] * (9.0 / 5.0)) + 32)
    end
  end

  def in_celsius
    if @options[:c]
      return @options[:c]
    else
      return ((@options[:f] - 32) * (5.0 / 9.0))
    end
  end

  def self.from_celsius(c)
    Temperature.new(:c => c)
  end

  def self.from_fahrenheit(f)
    Temperature.new(:f => f)
  end
end

class Celsius < Temperature
  def initialize(c)
    super(:c => c)
  end
end

class Fahrenheit < Temperature
  def initialize(f)
    super(:f => f)
  end
end
