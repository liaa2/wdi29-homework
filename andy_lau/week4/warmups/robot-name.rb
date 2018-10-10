# Robot Name
# You run a robot factory. As robots are created, they roll off the conveyor belt as empty, mindless husks of machinery -- until you first boot them up.
#
# The first time you boot them up, a random name is randomly generated, and assigned to itself by the robot.
#
# Names typically take the format of things like "BX777" or "SD234".
#
# For instance:
#
# robot1 = Robot.new
#
# puts robot1.name
# => "BX777"
#
# robot2 = Robot.new
#
# puts robot2.name
# => "SD234"
#
# puts robot2.name
# => "SD234"
# Every once in a while we need to reset a robot to its factory settings, which means that their name gets wiped. The next time you ask, it gives a new name.
#
# if I say:
#
# robot3 = Robot.new
#
# puts robot3.name
# => "RF629"
#
# robot3.reset
#
# puts robot3.name
# => "ZC532"

# class Robot
#   def initialize
#     @number1 = [*0..9].sample.to_s
#     @number2 = [*0..9].sample.to_s
#     @letter1 = [*'A'..'Z'].sample
#     @letter2 = [*'A'..'Z'].sample
#     @letter3 = [*'A'..'Z'].sample
#   end
#
#   def name
#     name = @number1 + @number2 + @letter1 + @letter2 + @letter3
#   end
#
#   def reset
#     @number1 = [*0..9].sample.to_s
#     @number2 = [*0..9].sample.to_s
#     @letter1 = [*'A'..'Z'].sample
#     @letter2 = [*'A'..'Z'].sample
#     @letter3 = [*'A'..'Z'].sample
#   end
#
# end

class Robot
  def initialize
    @name = make_name
    @instruction_count = 0
    @create_at = Time.now.to_i
    @reset_at = Time.now.to_i
  end

  def make_name
    name = ''
    number = 2.times {name += [*0..9].sample.to_s}
    letter = 3.times {name += [*'A'..'Z'].sample}

    name

  end

  def name
    @instruction_count += 1
    @name
  end

  def reset
    @instruction_count += 1
    @name = make_name
    @reset_at
  end

  def instruction_count
    @instruction_count
  end

  def timers
    puts "#{Time.now - @reset_at} seconds since last boot, #{Time.now - @create_at} since creation"
  end
end

robot1 = Robot.new
puts robot1.name
puts robot1.name

robot1.reset

puts robot1.name
puts robot1.name

robot2 = Robot.new
puts robot2.name

puts robot1.instruction_count

puts robot1.timers





# Extensions
# Counters
# It's important that we not overwork our robots. While resetting to factory defaults is great, the wear and tear on the robot mechanisms doesn't go away.
#
# For every action our robot takes, we should keep track of it.
#
# robot3 = Robot.new
# puts robot3.name
# puts robot3.name
#
# robot3.reset
# puts robot3.name
# puts robot3.name
#
# puts robot3.instruction_count
# => 5
# Robot Time
# Number of instructions is important, but so is the total age of the robot.
#
# robot3 = Robot.new
# puts robot3.timers
# => "21 seconds since last boot, 21 seconds since creation"
#
# robot3.reset
# puts robot3.timers
# => "8 seconds since last boot, 29 seconds since creation"
