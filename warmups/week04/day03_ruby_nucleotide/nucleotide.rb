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


def count_nucleotides(input)

  bases = {
    "A" => 0,
    "C" => 0,
    "G" => 0,
    "T" => 0
  }

  dna = []

  input.upcase.chars.each do |letter|
    # puts "#{letter}"

    #version 1
    # is_nucleotides = false
    #
    # bases.each do |key, value|
    #   # puts "#{key}, #{value}"
    #
    #   if letter == key
    #     bases[key] += 1
    #     is_nucleotides = true
    #   end
    # end #bases.each
    #
    # if is_nucleotides == false
    #   dna.push "#{letter} is not a nucleotide."
    # end #if

    #version 2
    if bases.has_key? letter
      bases[letter] +=1
    else
      dna.push "#{letter} is not a nucleotide."
    end


  end #input.chars

  bases.each do |key, value|
    dna.push "#{key}, #{value}"
  end

  puts dna
  # puts bases
end

count_nucleotides("QWEYUUUUUAGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC")
