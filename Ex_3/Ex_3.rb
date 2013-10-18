#!/usr/bin/env ruby
# returns complement to given DNA strand

file = File.open("rosalind_revc.txt", "rb")
sequence = file.read

output = File.open("output.txt", "w") 


dict = { 'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'T'}
output << sequence.gsub(/G|C|T|A/){|match|dict[match]}.reverse


file.close
output.close