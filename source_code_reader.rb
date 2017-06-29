#Quines i.e. printing a programs own source code!
#Key is properly escaping characters to reprint code
#The first line of code is very close to the second but with lots of escaping characters e.g. \n, and .inspect is used to escape the string itself.

quine = "\nputs \"quine = \" + quine.inspect + quine"
puts "quine = " + quine.inspect + quine