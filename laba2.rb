#lab 2 task 1
dots = [[52,289], [46,258], [63,240], [94,234], [132,236],
        [184,234], [198,207], [171,181], [120,171], [92,157],
        [49,134], [43,99], [63,82], [109,69], [157,59],
        [202,57], [245,51], [278,47], [309,41], [340,31],
        [379,33], [415,61], [430,86], [447,140], [474,196],
        [483,245], [471,274], [411,292], [350,302], [299,308],
        [250,309], [193,308], [154,308] ,[111,309], [84,302]]

$sum = 0

for i in 0..dots.size-1 do
  if i == dots.size-1
    $sum += (dots[i][0] + dots[0][0]) * (dots[0][1] - dots[i][1])
  else
    $sum += (dots[i][0]+dots[i+1][0])*(dots[i+1][1]-dots[i][1])
  end
end

$sum = $sum.abs/2
print "result task 1 => " + $sum.to_s, "\n"

# task2
$P = 2
$t = 64
$r = 16

$result = $P**$r*(1 - $P**(-1*$t))

print "result task 2 => " + $result.to_f.to_s, "\n"


def fromBintoDec(num)
  val = 0
  sys = 2
  num.split('').map(&:to_i).reverse.each_with_index {
    |dig, idx|
    val += sys**idx if dig == 1
  }
  return val
end

num = "100011111001"
puts "result task 3 => #{num} - #{fromBintoDec(num)}"

def fromDectoBin(val_)
  value_ = ''
  while val_ > 0
    value_ += (val_ % 2).to_s
    val_ /= 2
  end
  return value_.reverse
end

value_ = 444

puts "result task 4 => #{value_} - #{fromDectoBin(value_)}"