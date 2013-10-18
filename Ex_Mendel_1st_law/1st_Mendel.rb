#!/usr/bin/env ruby
# Input: an array of 3 numbers representing homozygous dominant, heterozygous, and homozygous recessive 
# Output: Probability that any given member of the next generation will possess a dominant allele


def permutation (array)
#  yields permutation set WITH duplicates
end

def mendelian_inheritance

ancestor_array = File.open("input.txt", "rb").read.tr!("\n", "").split

ancestor_array.map!{|pop| pop.to_i}
genotype_array =[]
ancestor_array[0].times do
  genotype_array << [:D, :D]
  end
ancestor_array[1].times do
  genotype_array << [:D, :d]
  end
ancestor_array[2].times do
  genotype_array << [:d, :d]
  end  
print genotype_array
  
#genotype_array.flatten!
#print genotype_array

mendelian_array = genotype_array.permutation(2).to_a
prob_array = []
mendelian_array.flatten!.each_slice(2) {|a| prob_array << a}
print prob_array
men_numerator = prob_array.collect{|array| array.include?(:D)}.count{|bool| bool == true}
men_denominator = prob_array.size
print men_numerator
print "\n"
print men_denominator
prob = men_numerator.to_f/men_denominator.to_f
print "\n"
print prob
#mendelian_array.count
#print (mendelian_array.collect{|array| array.include?("D")}.count{|bool| bool == true}).to_f/mendelian_array.count.to_f
# print mendelian_array.count
#print mendelian_array
end

if __FILE__ == $PROGRAM_NAME
  puts mendelian_inheritance
end
