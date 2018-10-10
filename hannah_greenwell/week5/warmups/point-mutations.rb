# POINT MUTATIONS
# The Hamming distance between these two DNA strands is 7.
#
# Write a program that can calculate the Hamming difference between two DNA strands.
#
# Use a class to structure your code, if you feel confident!

# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT

class PointMutation

  def initialize(strand1, strand2)
    @strand1 = strand1.upcase.chars
    @strand2 = strand2.upcase.chars
  end

  def calc_hamming_distance
    hamming_distance = 0

    @strand1.each_index do |i|
      if @strand1[i] != @strand2[i]
        hamming_distance += 1
      end
    end

    puts "The Hamming distance between #{@strand1.join} and #{@strand2.join} is: #{hamming_distance}"
  end
end

output = PointMutation.new("GAGCCTACTAACGGGAT", "CATCGTAATGACGGCCT")
output.calc_hamming_distance
