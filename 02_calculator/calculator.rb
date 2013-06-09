def add(x,y)
  x + y
end

def subtract(x,y)
  x - y
end

def sum(array)
  sum = 0
  array.each {|x| sum = sum + x}
  return sum
end

def multiply(*args)
  total = 1
  args.each {|x|total = total * x}
  return total
end

def power(n,pwr)
  total = 1
  pwr.times do
    total = total * n
  end
  return total
end

def factorial(n)
  total = n
  if n==0
    return 0
  end
  if n==1
    return 1
  end
  while n>1
    n = n-1
    total = total * n
  end
  return total
end
