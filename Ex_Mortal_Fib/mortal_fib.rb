
n, k = File.open("rosalind_fibd.txt", "rb").read.tr!("\n", "").split

n=n.to_i
k=k.to_i
fib_array = [1, 1+k]
death_array = [1, k]

(n-3).times do
#  print fib_array[-1]
#  print "\n"
#  print fib_array[-2]*k
#  print "\n"
  death_toll =  !death_array[death_array.size-k].nil? ? death_array[death_array.size-k] : 0
  births = fib_array[-2]
  death_array << births
  fib_array << (fib_array[-1] + births-death_toll)
  
end

print fib_array.last
