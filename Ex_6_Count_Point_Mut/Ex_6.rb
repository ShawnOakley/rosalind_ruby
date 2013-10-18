#!/usr/bin/env ruby
#calculates Hamming distance for point mutations

original, mutation = File.open("rosalind_hamm.txt", "rb").readlines
original.rstrip!
# print original
# print("\n")
# print("\n")
# print("\n")
# print mutation
length = 0...original.size
hamming = 0
length.each {|i| hamming += 1 if (mutation.slice(i) != original.slice(i))}

output = File.open("output.txt", "w") 
output << (hamming.to_s + "\n")
output.close