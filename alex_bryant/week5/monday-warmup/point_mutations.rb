require 'pry'
# Point Mutations
# A mutation is simply a mistake that occurs during the creation or copying of a nucleic acid, in particular DNA. Because nucleic acids are vital to cellular functions, mutations tend to cause a ripple effect throughout the cell. Although mutations are technically mistakes, a very rare mutation may equip the cell with a beneficial attribute. In fact, the macro effects of evolution are attributable by the accumulated result of beneficial microscopic mutations over many generations.
#
# The simplest and most common type of nucleic acid mutation is a point mutation, which replaces one base with another at a single nucleotide.
#
# By counting the number of differences between two homologous DNA strands taken from different genomes with a common ancestor, we get a measure of the minimum number of point mutations that could have occurred on the evolutionary path between the two strands.
#
# This is called the 'Hamming distance'
#
# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^
# The Hamming distance between these two DNA strands is 7.
#
# Write a program that can calculate the Hamming difference between two DNA strands.
#
# Use a class to structure your code, if you feel confident!

class DNAStrand

  attr_accessor :strand

  def initialize strand
    @strand = strand
  end

  def compare other_strand
    different_strands = ""

    (0..self.strand.length).each do |i|
      if self.strand[i] != other_strand.strand[i]
        different_strands += "^"
      else
        different_strands += " "
      end
    end

    different_strands
  end

end

strand1 = DNAStrand.new "GAGCCTACTAACGGGAT"
strand2 = DNAStrand.new "CATCGTAATGACGGCCT"

strand_diffs = strand1.compare(strand2)
puts strand1.strand
puts strand2.strand
puts strand_diffs
puts "The Hamming distance between these two DNA strands is #{strand_diffs.count('^')}."

#binding pry
