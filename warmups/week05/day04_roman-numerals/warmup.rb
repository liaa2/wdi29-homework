class Roman

  def initialize
    # we need to set up this instance variable in our initialize method...
    # we can't just declare it in the class itself - it will not be set
    # NOTE that Class variables DO behave this way, so that is an alternative
    @roman_map = {
      1000 => "M",
      900 => "CM",
      500 => "D",
      400 => "CD",
      100 => "C",
      90 => "XC",
      50 => "L",
      40 => "XL",
      10 => "X",
      9 => "IX",
      5 => "V",
      4 => "IV",
      1 => "I"
    }
  end

  def to_roman(number)
    result = ""

    @roman_map.each do |key, value|
      puts "========= each key: #{key}, value: #{value} =========="

      # don't even enter the while loop if our number is smaller than the current key
      while number >= key
        result += value

        puts "number: #{number} >= #{key}"
        puts "result: #{result}"
        number -= key

        puts "new number: #{number}"
      end #while

    end #loop

    result
  end

end

test = Roman.new
puts test.to_roman 1990
puts test.to_roman 3456
