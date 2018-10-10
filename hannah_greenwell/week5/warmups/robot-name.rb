require 'pry'

class Robot

  attr_accessor :instruction_count, :created_at, :reset_at

  def name
    @instruction_count += 1
    @name
  end

  def initialize
    @name = set_name
    @instruction_count = 0
    @created_at = Time.now.to_i
    @reset_at = Time.now.to_i
  end

  def set_name
    # letters = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
    # numbers = %w(1 2 3 4 5 6 7 8 9)
    # (letters.sample(2) + numbers.sample(3)).join

    letters = ("A".."Z").to_a.sample(2)
    numbers = (0..9).to_a.sample(3)
    letters.concat(numbers).join
  end

  def reset
    @instruction_count += 1
    @reset_at = Time.now
    @name = set_name
  end

  def timers
    puts "#{Time.now.to_i - @reset_at} seconds since last boot, #{Time.now.to_i - @created_at} seconds since creation."
  end
end

robot1 = Robot.new
puts robot1.name

robot2 = Robot.new
puts robot2.name

robot3 = Robot.new
puts robot3.name
puts robot3.name
# puts robot3.timers

puts robot3.reset
puts robot3.name
puts robot3.name

puts robot3.instruction_count
# puts robot3.timers
