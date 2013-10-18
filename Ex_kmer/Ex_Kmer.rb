#!/usr/bin/env ruby
# Given an alphabet (alph) returns number of permutations of n digits, 
# organized by the order established in alph

# opens input.txt and formats input parameters
alph, num = File.open("rosalind_lexf.txt", "rb").readlines
alph.rstrip!
alph = alph.split(' ')
num = num.to_i

def generate_order(array)
    # Generates hash_value used to order text
    value_hash = Hash.new{}
    array.each_with_index {|item, index| value_hash[item] = (array.size - index)}
    value_hash
  end

def k_mer(alph, num)
    # Create permutations
    perm = alph.permutation(num).to_a
    # Insert self-pairs
    alph.each{|element| perm << [element]* num}
    value_hash = generate_order(alph)
    perm.each do |element|
      total_val = 0
      element.each_with_index{|value, index| total_val += value_hash[value]*(10**-(index))}
      element << total_val
    end
   # Sorts by value_hash element
   perm.sort_by!{|x| x.last}.reverse!
   perm.map! do |element|
   # Removes final element and joins individual elements into final string 
     element = element[0..-2]
     element.join
   end
   perm
   end

def print_all(perm)
  #prints all in better format and puts into output file
  output = File.open("output.txt", "w") 
  output << perm.each{|element| print element.to_s + "\n"}
  output.close
end

print_all(k_mer(alph, num))


# alph = ['T', 'A', 'G', 'C']
# num = 2

# test_block = Proc.new {k_mer()}
# print test_block.call() if __FILE__ == $0
