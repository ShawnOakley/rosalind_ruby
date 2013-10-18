#!/usr/bin/env ruby

# Converts DNA strand to RNA strand


file = File.open("rosalind_rna.txt", "rb")
sequence = file.read

output = File.open("output.txt", "w") 

output<< sequence.to_s.gsub("T","U")

file.close
output.close


