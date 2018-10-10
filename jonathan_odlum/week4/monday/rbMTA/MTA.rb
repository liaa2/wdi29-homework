# MTA Lab
# Activity:
# Students should create a program that models a simple subway system.
#
# The program takes the line and stop that a user is getting on at and the line and stop that user is getting off at and prints:
#
# the stations the user must pass through, in order
# where to change lines, if necessary
# the total number of stops for the trip.
# There are 3 subway lines:
#
# The N line has the following stops: Times Square, 34th, 28th, 23rd, Union Square, and 8th
# The L line has the following stops: 8th, 6th, Union Square, 3rd, and 1st
# The 6 line has the following stops: Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place.
# All 3 subway lines intersect at Union Square, but there are no other intersection points.
# For example, this means the 28th stop on the N line is different than the 28th street stop on the 6 line, so you'll have to differentiate this when you name your stops in the arrays.

require 'pry'

man_tran_auth = {
  :line_N => ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
  :line_L => ["8th", "6th", "Union Square", "3rd", "1st"],
  :line_6 => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
}

def travel_line (line, stop1, stop2)
  index1 = line.find_index(stop1)
  index2 = line.find_index(stop2)
  if (index1 < index2)
    sub_line = line[index1..index2]
  else
    sub_line = line[index2..index1].reverse
  end
  sub_line
end

def get_trip (line1, stop1, line2, stop2)
  puts "Your trip will consist of:"
  puts "Board the train:"
  if line1 == line2
    puts travel_line(line1, stop1, stop2).join("--")
  else
    puts travel_line(line1, stop1, "Union Square").join("--")
    puts "Change at Union Square for your second leg:"
    puts travel_line(line2, "Union Square", stop2).join("--")
  end
end

def check_inputs (network, line1, stop1, line2, stop2)
  good_inputs = true;
  if !network.key?(line1)
    puts "First Input Invalid"
    good_inputs = false;
  elsif !network[line1].include?(stop1)
    puts "Second Input Invalid"
    good_inputs = false;
  end
  if !network.key?(line2)
    puts "Third Input Invalid"
    good_inputs = false;
  elsif !network[line2].include?(stop2)
    puts "Fourth Input Invalid"
    good_inputs = false;
  end
  good_inputs
end

def plan_trip(network, line1, stop1, line2, stop2)
  if check_inputs(network,line1, stop1, line2, stop2)
    get_trip(network[line1], stop1, network[line2], stop2)
  end
end

plan_trip(man_tran_auth, :line_N, "Times Square", :line_N, "23rd")
puts ""
plan_trip(man_tran_auth, :line_N, "Times Square", :line_6, "23rd")
puts ""
plan_trip(man_tran_auth, :line_L, "Times Square", :line_6, "9th")
