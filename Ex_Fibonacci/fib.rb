
n, k = File.open("rosalind_fib.txt", "rb").read.tr!("\n", "").split

n=n.to_i
k=k.to_i
fib_array = []
fib_array << 1
fib_array << 1+k

(n-3).times do
#  print fib_array[-1]
#  print "\n"
#  print fib_array[-2]*k
#  print "\n"
  fib_array << (fib_array[-1] + fib_array[-2]*k)
  
end

print fib_array.last
