# Luhn Formula
# Write a program that can take a number and determine whether or not it is valid per the Luhn formula.
#
# The Luhn formula is a simple checksum formula used to validate a variety of identification numbers, such as credit card numbers and Canadian Social Insurance Numbers.
#
# This number must pass the following test:
#
# Counting from rightmost digit (which is the check digit) and moving left, double the value of every second digit. For any digits that thus become 10 or more, subtract 9 from the result.
#
# E.g., 1111 becomes 2121, while 8763 becomes 7733 (from 2×6=12 → 12-9=3 and 2×8=16 → 16-9=7).
#
# Add all these digits together. For example, if 1111 becomes 2121, then 2+1+2+1 is 6; and 8763 becomes 7733, so 7+7+3+3 is 20.
#
# If the total ends in 0 (put another way, if the total modulus 10 is 0), then the number is valid according to the Luhn formula; otherwise it is not valid. So, 1111 is not valid (as shown above, it comes out to 6), while 8763 is valid (as shown above, it comes out to 20).
#
# Write a program that, given a number, can check if it is valid per the Luhn formula.
#
# BONUS:
#
# For an invalid number, add a check digit to make the number valid.
#
# l = Luhn.new(3554)
# l.valid?
# # => false
#
# l = Luhn.new(8763)
# l.valid?
# # => true
# Do this in Ruby.


# # MY SOLUTION  #################################################
# class Luhn
#   def initialize
#   end
#
#   def convert(number)
#     i = 0
#     array = []
#     while i < number.digits.count do
#       if i.even?
#         array << number.digits[i]
#         i += 1
#       else
#         even_digit = (number.digits[i] * 2)
#         even_digit < 10 ? even_digit : even_digit = (number.digits[i] * 2) - 9
#         array << even_digit
#         i += 1
#       end
#     end
#
#     converted = array.reverse.join('').to_i
#     sum = converted.digits.sum
#
#     if sum % 10 == 0
#       puts "Converted #{number} to #{converted}"
#       puts true
#     else
#       puts "Converted #{number} to #{converted}"
#       puts "#{number} is not valid."
#       puts false
#     end
#
#
#
#   end
# end
#
# test_number = Luhn.new
# puts test_number.convert(11111)

class Luhn
  def initialize(number)
    @number = number
  end

  def luhnify
    numbers = []
    @number.to_s.reverse.chars.each_with_index do |digit, index|
      digit = digit.to_i
      digit *= 2 if index.odd?
      digit -= 9 if digit > 9
      numbers << digit
    end
    numbers.reverse.join('').to_i
  end

  def valid?
    num = luhnify
    # total = 0
    # num.each do |n|
    #   total += n
    # end

    total = num.inject(0, :+)

    if total % 10 == 0
      puts "#{@number} is a valid Luhn number"
    else
      @number = @number + (10 - total % 10)
      puts "new total: #{total + (10 - total % 10)}"
      puts "#{@number} would be a valid Luhn number"
    end
  end
end


l = Luhn.new(3554)
puts l.luhnify
# l.valid?
# => false
