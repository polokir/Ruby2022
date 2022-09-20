def task1(a, b, c, x, y, z)
  puts "task 1"
  puts"a) !(a || b) && (a && !b) = #{!(a || b) && (a && !b)}"
  puts "b) (z != y) <= (6 >= Y) && a || b && c && x>=1.5 = #{(z != y) == (6 >= y) && a || b && c && x>=1.5}"
  puts "c) (8 - x * 2 <= z) && (x^2 <> y^2) ||  (z >= 15) = #{(8 - x * 2 <= z) && (x**2 <= y**2) ||  (z >= 15)}"
  puts "d) x > 0 && y < 0 || z >= (x * y - (-y / x)) + (-z) = #{x > 0 && y < 0 || z >= (x * y - (-y / x)) + (-z)}"
  puts "e) !(a || b && !(c || (!a || b))) = #{!(a || b && !(c || (!a || b)))}"
  puts "f) x^2 + y^2 >= 1 && x >= 0 && y >= 0 = #{x^2 + y^2 >= 1 && x >= 0 && y >= 0}"
  puts "g) (a && (c && b == b || a) || c) && b = #{(a && (c && b == b || a) || c) && b}"
end

def task1n(n, m, p,q)
  puts "task 1n #{(((n/m+m/n)>3)) && ((p && q)||(!p && q))}"
end

puts
task1(true, true, false, 60, -20, 4)
puts
task1n(3, -6, false,false)

def Y_1(x)
  case x
  when -4..0
    return ((x-2).abs / (x**2 * Math.cos(x)))**(1.0/7.0)
  when 0..12
    return 1.0 / (Math.tan(x + Math.exp(-x)) / Math.sin(x)**2)**(1.0/4.5)
  else
    return 1 / ( 1 + x / (1 + x / (1 + x)))
  end
end

puts "Y(-4) = #{Y_1(-4)}"
puts "Y(0) = #{Y_1(0)}"
puts "Y(1) = #{Y_1(1)}"
puts "Y(11) = #{Y_1(11)}"
puts "Y(-5) = #{Y_1(-5)}"
puts "Y(13) = #{Y_1(13)}"


# Lab 3 Task 3 Variants 2, 3

def variant2
  sum = 0
  (0..9).each {
    |i|
    sum += 1.0 / (3 ** i)
  }

  return sum
end

def variant3(x)
  print "Enter n: "
  n = gets.chomp.to_i

  sum = 0
  fact = 1
  (0..n + 1).each {
    |i|
    sum += (x.to_f ** i) / fact
    fact *= (i + 1)
  }

  return sum
end

puts "Sum 1 + 1/3 + 1/3^2 + ... + 1/3^8 = #{variant2()}" , "\n"
print "Enter x for sum2: "
x = gets.chomp.to_f
puts "Sum 1 + x^1/1! + ... + x^n/n! = #{variant3(x)}"


def task_1_4
  res = 0
  factorial = 2

  (2..10).each { |i|
    res += ((factorial / (i - 1)) / (factorial * (i + 1))) ** (i * (i + 1))
    factorial *= (i + 1)
  }

  res
end

def task_2_4(x)
  res = 0
  factorial = 1

  (0..10).each{ |i|
    res += (x.to_f ** i) / factorial
    factorial *= (i + 1)
  }

  res
end

# sum diverges
def task_3_4
  res = 0
  factorials = [6, 1, 6, 1]

  (1..10).each{ |i|
    res += (factorials[0] * factorials[1]) / (factorials[2] * (3 ** (2 * i)) * factorials[3])
    factorials[0] *= (4*i) * (4*i + 1) * (4*i + 2) * (4*i + 3)
    factorials[1] *= (2 * i) * (2 * i + 1)
    factorials[2] *= (3 * i + 1) * (3 * i + 2) * (3 * i + 3)
    factorials[3] *= i

  }

  res
end

print task_1_4.to_s + "\n"
print Math.exp(1).to_s + " " + task_2_4(1).to_s + "\n"
print task_3_4.to_s + "\n"

require 'bigdecimal'

def Y(x,c,n)
  return ((((x-c)/(x**(3/4)+x**(1/n)*c**(1/4))) * ((x**(1/2) * c**(1/4) + n**(1/4))/((x**(1/2) + c**(1/2))) * ((x**(1/4) * c**(-1/4)/(x**(1/2)-2*(x**(1/4) * c**(1/4)) + c**(1/n)))))))
end

def Z(x)
  return (Math.sin(2*x)**2 - Math.cos(Math::PI/3 - 2*x)*Math.sin(-Math::PI/3 + 2*x) +1/(Math::tan((Math::PI+x)/(x+1))**(2/x)))
end

def F(x, n, c)
  case x
  when 2...n
    return Y(x, n,c)
  when n...2*n
    return Z(x)
  else
    return Y(x, n,c) + Z(x)
  end
end

def subtask1(c, n)
  x = 1.0
  step = (n - 1)/(n + c)
  puts "step is #{step}"
  while x <= n
    puts "#{x} | #{Y(x, n,c).round(10)}"
    x += step
  end
end

def subtask2(c, n)
  x = Math::PI / n
  step = (Math::PI - x)/((3/2)*n + c)
  puts "step is #{step}"
  while x <= Math::PI
    puts "#{x} | #{Z(x)}"
    x += step
  end
end

def subtask3(c, n)
  x = 2.0
  step = (c - 2)/(2 * n)
  puts "step is #{step}"
  while x <= c
    puts "#{x} | #{F(x, n, c)}"
    x += step
    return if x == c && step == 0
  end
end

puts "Task 5"
print "Enter N: "
n = gets.chomp.to_f

print "Enter c: "
c = gets.chomp.to_f

puts "Subtask 1:"
puts "x  |  Y"
subtask1(c, n)


puts "\nSubtask 2:"
puts "x  |  Z"
subtask2(c, n)

puts "\nSubtask 3:"
puts "x  |  F"
subtask3(c, n)