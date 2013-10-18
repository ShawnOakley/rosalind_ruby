#!/usr/bin/env ruby
# Given a positive integer n (n <= 7) returns the total number of permutations of length n, follow by a list of all such permutations)

perm_number = File.open("rosalind_perm.txt", "rb").read.tr!("\n", "").to_i

perm_set=*(1..perm_number)
group_set = perm_set.permutation.to_a
print group_set.count.to_s + "\n"
group_set.each{|group| print group.to_s.tr!("[","").tr!("]","").tr!(",","") + "\n"}
output = File.open("output.txt", "w") 
output << group_set.count.to_s + "\n"
output << group_set.each{|group| group.to_s.tr!("[","").tr!("]","").tr!(",","") + "\n"}
output.close
