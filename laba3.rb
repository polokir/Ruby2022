num = "100011111001"
val=0
sys=2
res=num.split('').map(&:to_i).reverse.each_with_index {
  |dig, idx|
  val += sys**idx if dig == 1
  print " #{idx} - #{dig} - #{val} \n"
}

print res
