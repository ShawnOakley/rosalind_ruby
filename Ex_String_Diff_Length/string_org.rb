#!/usr/bin/env ruby

# Organizing Strings of Different Lengthsclick to collapse

#In “Enumerating k-mers Lexicographically”, we introduced the 
#lexicographic order for strings of the same length constructed from 
#some ordered underlying alphabet. However, our experience with 
#dictionaries suggests that we should be able to order strings of 
#different lengths just as easily. That is, we already have an 
#intuitive sense that "APPLE" comes before "APPLET", which comes 
#before "ARTS," and so we should be able to apply this intuition 
#toward cataloguing genetic strings of varying lengths.

# opens input.txt and formats input parameters
alph, num = File.open("rosalind_lexv.txt", "rb").readlines
alph.rstrip!
alph = alph.split(' ')
num = num.to_i

def add_blank_spaces(perm)
  # Adds blank spaces so all entries are same size.  Need to add blank value in value hash as well
  largest_size = perm.group_by{|element| element.size}.keys.max
  perm.each do |element| 
    if element.size < largest_size
      (largest_size - element.size).times do 
        element.push(" ") 
      end
    end
    end
  perm
end

def generate_order(array)
    # Generates hash_value used to order text
    value_hash = Hash.new{}
    # Add " " value
    value_hash[" "] = array.size + 1
    # Generate ther values
    array.each_with_index {|item, index| value_hash[item] = (array.size - index)}
    value_hash 
  end

def permutation_generator(array, num)
  # Generates permutation
  array = array * 2
  perm = []
  (1..num).each{|number| perm.push(*array.permutation(number).to_a)}
  # Insert self-pairs
  array.each{|element| (1..num).each{|num| perm.push([element]* num)}}
  perm.uniq!
  add_blank_spaces(perm)
end

def k_mer(alph, num)
    # Create permutations
    perm = permutation_generator(alph, num)
    value_hash = generate_order(alph)
    perm.each do |element|
      total_val = 0
      element.each_with_index{|value, index| total_val -= value_hash[value]*(10**-(index))}
      element << total_val
    end
   # Sorts by value_hash element
   perm.sort_by!{|x| x.last}
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
  perm.each{|element| output << element.to_s + "\n"}
  output.close
end

# print permutation_generator(alph, num)

print_all(k_mer(alph, num))


# alph = ['T', 'A', 'G', 'C']
# num = 2

# test_block = Proc.new {k_mer()}
# print test_block.call() if __FILE__ == $0
