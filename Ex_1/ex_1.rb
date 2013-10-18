#!/usr/bin/env ruby

# Counts base of each DNA strand

file = File.open("rosalind_dna.txt", "rb")
sequence = file.read


output = File.open("output.txt", "w") 

BASES = ["A", "C", "G", "T"]

BASES.each_with_index do |base, count|
  output << "#{sequence.count(base)} "
end

file.close
output.close


