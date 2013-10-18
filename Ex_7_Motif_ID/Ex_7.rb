#!/usr/bin/env ruby
#returns location of motifs

strand, motif = File.open("input.txt", "rb").readlines
strand.rstrip!
#motif.rstrip!

# print original.enum_for(:scan, motif).map{ Regexp.last_match.begin(0).to_i + 1} 
index_array = []

motif_match = (/#{motif}/ =~ strand)
#print motif_match
index_array << motif_match + 1
index_strand = strand
counter = 1
original_size = strand.size

while (motif_match != nil && counter<12)
	index_strand  = index_strand[motif_match.to_i+1..-1]
#	print index_strand
	if (/#{motif}/ =~ index_strand) != nil
  	  motif_match = (/#{motif}/ =~ index_strand)
	  index_array << motif_match + 1 + (original_size - index_strand.size)
#	  print motif_match
#	  print "\n"
	  counter += 1
#	  print "counter: " + counter.to_s
#	  print "\n"
	end
end

print index_array.join(' ')
