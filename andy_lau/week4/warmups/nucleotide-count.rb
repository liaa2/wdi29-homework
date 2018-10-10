# Nucleotide Count
# DNA is represented by an alphabet of the following symbols: 'A', 'C', 'G', and 'T'.
#
# Each symbol represents a nucleotide, which is a fancy name for the
# particular molecules that happen to make up a large part of DNA.
#
# Write a program in ruby that will tell you how many times each nucleotide occurs in a string
# (i.e. how many times 'A', 'C', 'G' and 'T' appear in a given string).
#
# It should also tell you if a character in the string is not a valid nucleotide
# (i.e. NOT 'A', 'C', 'G', and 'T').
#
# Example:
#
# count_nucleotides "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
# # output:
# A: 20
# C: 12
# G: 17
# T: 21
# Source
# The Calculating DNA Nucleotides problem at Rosalind


# my solution
# def count_nucleotides(input)
#   dna = {
#     "A": 0,
#     "C": 0,
#     "G": 0,
#     "T": 0,
#   }
#
#   other = 0
#
#   input.each_char do |letter|
#     case
#     when "A" == letter then dna[:A] += 1
#     when "C" == letter then dna[:C] += 1
#     when "G" == letter then dna[:G] += 1
#     when "T" == letter then dna[:T] += 1
#     else
#       other += 1
#     end
#   end
#
#   other > 0 ? "Wrong input" : dna
#
# end
#
# puts count_nucleotides("AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC")

# linna's soln
def count_nucleotides (input)
  base = {
      "A" => 0,
      "C" => 0,
      "G" => 0,
      "T" => 0,
    }

  dna = []

  input.upcase.chars.each do |letter|

  #   is_nucleotides = false
  #
  #   base.each do |key, value|
  #     if letter == key
  #       base[key] += 1
  #       is_nucleotides = true
  #     end
  #   end
  #
  #   if is_nucleotides == false
  #     dna.push "#{letter} is not a nucleotide"
  #   end
  # end

    if base.has_key? letter
      base[letter] += 1
    else
      dna.push "#{letter} is not a nucleotide"
    end #if

  end #input

  base.each do |key, value|
    dna.push "#{key}, #{value}"
  end #base

  puts dna
end # def count_nucleotides

count_nucleotides("AGKCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC")
