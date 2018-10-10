# create a robot name using 2 letters and 3 numbers
# create a reset method to reset the name of the robot

class Robot

  attr_reader :instruction_count

  # The initialize method will run as soon as an instance of the class has been created. it will store the variables that have been defined.
  def initialize
    @name = make_name
    @instruction_count = 0

    # we capture the current time with Time class.
    @created_at = Time.now.to_i
    @reset_at = Time.now.to_i
  end

  # This function will create the random name for the robot.
  def make_name
    # creating an array with an alphabetical range from A to Z then 'samples' a random letter
    # If select multiple letters, `sample` will select them without repeating
    letter1 = ("A".."Z").to_a.sample
    letter2 = ("A".."Z").to_a.sample
    letter3 = ("A".."Z").to_a.sample
    # Join the letters
    letters = letter1.concat(letter2).concat(letter3)
    # creating an array with a numerical range from 0 to 9 then 'samples' a random number
    number1 = (0..9).to_a.sample.to_s
    number2 = (0..9).to_a.sample.to_s
    number3 = (0..9).to_a.sample.to_s
    numbers = number1.concat(number2).concat(number3)
    # Concatinating the letters and numbers
    letters.concat(numbers)
  end

  # This is a getter, it returns the name
  def name
    # incrementing the count for each action the robot makes
    @instruction_count += 1
    @name
  end

  def reset
    @instruction_count += 1
    @name = make_name
    # resetting the @reset_at variable
    @reset_at = Time.now.to_i
  end

  # def instruction_count
  #   @instruction_count
  # end

  def timers
    puts "#{Time.now.to_i - @reset_at} seconds since last boot, #{Time.now.to_i - @created_at} seconds since creation"
  end
end

robot1 = Robot.new
puts robot1.name

robot2 = Robot.new
puts robot2.name
puts robot2.name

robot3 = Robot.new
puts robot3.name
puts robot3.name
sleep 4
robot3.reset
puts robot3.name
puts robot3.name
sleep 5
puts robot3.instruction_count

puts robot3.timers
