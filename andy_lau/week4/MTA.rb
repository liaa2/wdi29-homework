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
# We should be able to say:
#
# plan_trip( :n, "Times Square", :l, "1st" )
# # Or something along those lines
# Hints:
# Don't worry about user input initially: get it working with hardcoded values first, and wire up the user interface once that's working
# Scope works in a different way in Ruby, so variables that you define outside won't be accessible in a method. Maybe think about using a function to return data. Or perhaps research other types of variables
# A symbol can't just be a number!
# Consider diagraming the lines by sketching out the subway lines and their stops and intersection.
# Make subway lines keys in a hash, while the values are an array of all the stops on each line.
# The key to the lab is to find the intersection of the lines at Union Square.
# Make sure the stops that are the same for different lines have different names (i.e. 23rd on the N and on the 6 need to be differentiated)
print "What is your starting line?: "
start_line = ("line_" + gets.chomp).downcase.to_sym
print "What is your starting stop?: "
start_stop = gets.chomp.to_s
print "What is your destination line?: "
end_line = ("line_" + gets.chomp).downcase.to_sym
print "What is your destination stop?: "
end_stop = gets.chomp.to_s

def mta
  {
    line_n: ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
    line_l: ["8th", "6th", "Union Square", "3rd", "1st"],
    line_6: ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"],
  }
end


def single_trip(mta, line, start_stop, end_stop)
  index_start = mta[line.downcase.to_sym].index(start_stop).to_i
  index_end = mta[line.downcase.to_sym].index(end_stop).to_i
  index_diff = (index_end - index_start).abs.to_i

  if index_end > index_start
    puts mta[line][index_start + 1, index_diff]
  elsif index_start > index_end
    puts mta[line][index_end, index_start].reverse
  end
end

case
# same stops
when start_line == end_line && start_stop == end_stop || start_stop == "Union Square" && end_stop == "Union Square"
  puts "You don't need to travel"

# one line trip
when start_line == end_line
  puts "You must pass through these stops on #{start_line.slice(5).upcase}:"
  single_trip(mta, start_line, start_stop, end_stop)

#union square on different line to destination
when start_line != end_line && start_stop == "Union Square"
  puts "Change at Union Square to line #{end_line.slice(5).upcase}."
  puts "You must pass through these stops on #{end_line}:"
  single_trip(mta, start_line, start_stop, end_stop)

#two line trip
when start_line != end_line
  puts "You must pass through these stops on #{start_line.slice(5).upcase}:"
  single_trip(mta, start_line, start_stop, "Union Square")
  puts "Change at Union Square to line #{end_line.slice(5).upcase}."
  puts "You must pass through these stops on #{end_line.slice(5).upcase}:"
  single_trip(mta, end_line, "Union Square", start_stop)
end


# if start_line == end_line
#   index_start = find_index(mta, start_line, start_stop)
#   index_end = fin_index(mta, start_line, end_stop)
#
# end
# index_start = find_index(mta, start_line, start_stop)
# index_end = find_index(mta, start_line, start_stop)


# puts "What is your starting line?"
# start_line = gets.chomp.downcase.to_sym
# puts "What is your starting stop?"
# start_stop = gets.chomp.downcase
# puts "What is your destination line?"
# end_line = gets.chomp.downcase.to_sym
# puts "What is your destination stop?"
# end_stop = gets.chomp.downcase
#
#
# def find_index(line,stop)
#   mta[line.downcase.to_sym].index(stop)
# end
#
# find_index("n", "34th")



# def find_index(line,stop)
#   mta[line.downcase.to_sym].index(stop)
# end
#
# find_index("n", "34th")
#
# def one_trip(line, start_stop, finish_stop)
#
# end
