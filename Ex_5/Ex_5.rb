#!/usr/bin/env ruby
#calculates max GC content in a collection of sequences and outputs sequence with max content

rosalind_sequences = File.open("rosalind_gc.txt", "rb").read
id = rosalind_sequences.scan(/^>.*/)
id.each{|id| id.tr!(">", "")}
sequences = rosalind_sequences.scan(/[C|G|A|T|\n]+/m)
sequences.each{|sequence| sequence.tr!("\n", "")}
id_hash = Hash[id.zip(sequences)]
print id_hash
gc_content = id_hash.values.map{|string| ((string.scan(/[G|C]/).size.to_f/string.size.to_f)*100).round(6)}
print gc_content
max_value = id_hash.values[gc_content.index(gc_content.max)]
output = File.open("output.txt", "w") 
output << id_hash.key(max_value) + "\n" + gc_content.max.to_s
output.close