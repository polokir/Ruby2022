#task1

def integrate_rectangle(a, b, n, dx = (b - a) / n)
  x = a + dx / 2
  sum = 0
  (1..n).each {
    y = yield(x)
    sum += dx * y
    x += dx
  }
  return sum
end

def integrate_trapezia(a, b, n, dx = (b - a) / n)
  x = a + dx
  sum = dx * (yield(a) / 2 - yield(b) / 2)
  loop {
    y = yield(x)
    sum += dx * y
    x += dx
    break if x > b
  }
  return sum
end

def f1(x)
  return 1/(1+Math.sqrt(x))
end

def f2(x)
  return (1 / (3 + Math.cos(x)))
end

x = integrate_rectangle(0.2, 2.1, 100000.0) {|x| f1(x)}
puts x, "\n"

x = integrate_rectangle(0.2, 2.1, 100000.0) {|x| f2(x)}
puts x, "\n"

#task2


def fun(x, i)
  (x**(4*i+1))/(4*i)
end

def series(f, x, n)
  x_rage = 0.1..0.8
  n_range = 17..58
  error = 0.001

  unless x_rage.include? x
    raise "'x' is out of range"
  end

  res, i, cur = 0.0, n, error
  if n_range.include? n
    (1..n).each do |i|
      cur = f.call(x, i)
      res += cur
    end
  else
    i = 0
    while cur.abs >= error
      cur = f.call(x, i)
      res += cur
      i += 1
    end
  end
  [res, i, cur]
end

sum, iter, error = series(method(:fun),0.3, 10)

puts "Sum: #{sum}"

puts "Error: #{error}"