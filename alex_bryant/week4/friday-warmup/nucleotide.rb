# Nucleotide Count
# DNA is represented by an alphabet of the following symbols: 'A', 'C', 'G', and 'T'.
#
# Each symbol represents a nucleotide, which is a fancy name for the particular molecules that happen to make up a large part of DNA.
#
# Write a program in ruby that will tell you how many times each nucleotide occurs in a string (i.e. how many times 'A', 'C', 'G' and 'T' appear in a given string).
#
# It should also tell you if a character in the string is not a valid nucleotide (i.e. NOT 'A', 'C', 'G', and 'T').
#
# Example:
#
# count_nucleotides "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
# # output:
# A: 20
# C: 12
# G: 17
# T: 21

def count_nucleotides str
  valid_nucleotides = %w{A G C T}
  invalid_nucleotides = []
  n_arr = str.split ''
  #Creates nested arrays containing unique characters
  n_arr = n_arr.group_by{ |let| let[0]}
  n_arr.each do |key, val|
    if valid_nucleotides.include? key
      puts "#{key}: #{val.length}"
    else
      invalid_nucleotides.push key
    end
  end
  puts "Invalid nucleotides: #{invalid_nucleotides.join ", "}"
end

count_nucleotides "AGCTTTTCATTCTGACTGCKAACGGGCAATATGTCTCTGTGTPGGATTAAAAAAAGAGTGTCTGATAGCAGC"
