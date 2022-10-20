#Variant 9
require 'test-unit'
class Test_F< Test::Unit::TestCase
  def test_func
    result={0.0=>1.0, 1.0=>2.0, 2.0=>3.0, 3.0=>4.0, 4.0=>5.0, 5.0=>6.0}
    a = 1
    b = 1
    c =1
    x_f = 0
    x_l = 5
    dx = 1
    assert_equal(result,func(a, b, c, x_f, x_l, dx))
  end

  def test_func1
    result={0.0=>0.3333333333333333, 1.0=>1.3333333333333333, 2.0=>1.6666666666666665, 3.0=>2.0, 4.0=>2.333333333333333, 5.0=>2.666666666666667}
    a =1
    b = 2
    c =3
    x_f = 0
    x_l = 5
    dx = 1
    assert_equal(result,func(a, b, c, x_f, x_l, dx))
  end
end



def f(x, a, b, c)
  if 0 > a && x != 0
    return a * x**2 + b**2 * x
  end

  if a > 0 && x == 0
    return x-(a / (x - c))
  end

  1+(x / c)
end

def func(a, b, c, x_f, x_l, dx)
  if !(a.truncate || b) && ((b.truncate || c.truncate))
    a = a.truncate
    b = b.truncate
    c = c.truncate
    x_f = x_f.truncate
    x_l = x_l.truncate
    dx = dx.truncate
  end
  res={}
  (x_f..x_l).step(dx.to_f).each do |i|
    print( i.to_s + " : " + f(i, a, b, c).to_s)
    res[i]=f(i, a, b, c)
    printf("\n")
  end
  return res
end


