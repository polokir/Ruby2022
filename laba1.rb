print "Для обчислення виразу введіть x, alpha, gamma \n"
print "Enter x: "
$x = gets.chomp.to_f
print "Enter alpha: "
$alpha = gets.chomp.to_f
print "Enter gamma: "
$gamma = gets.chomp.to_f


$res = ((4.1 * 10**(-1.7))/(($x-Math::PI)*Math.sin(5*$x))) + ((((Math.tan($x.abs))**3) - Math.log10(Math.sqrt($alpha+$gamma)))/((Math::E)**(Math::PI)))
print $res
