# MTA Lab
# Activity:
# Students should create a program that models a simple subway system.

# The program takes the line and stop that a user is getting on at and the line and stop that user is getting off at and prints:

# the stations the user must pass through, in order
# where to change lines, if necessary
# the total number of stops for the trip.

# There are 3 subway lines:

# The N line has the following stops: Times Square, 34th, 28th, 23rd, Union Square, and 8th
# The L line has the following stops: 8th, 6th, Union Square, 3rd, and 1st
# The 6 line has the following stops: Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place.
# All 3 subway lines intersect at Union Square, but there are no other intersection points.
# For example, this means the 28th stop on the N line is different than the 28th street stop on the 6 line, so you'll have to differentiate this when you name your stops in the arrays.
# We should be able to say:

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

#return the static subway hash
def get_subway
  #return of subway implied
  subway = {
    intersection: "Union Square",
    n: {
      stops: ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
    },
    l: {
      stops: ["8th", "6th", "Union Square", "3rd", "1st"],
    },
    '6': {
      stops: ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"],
    }
  }
end

#check the order and reverse if going backwards
def check_order_of_stops idx1, idx2, stops
  if idx2 > idx1
    return stops
  end
  stops.reverse
end

#perform a single line journey
def single_line_journey line, start_station, end_station
  # get the station in the correct order to parse through them
  new_order = check_order_of_stops get_subway[line][:stops].index(start_station), get_subway[line][:stops].index(end_station), get_subway[line][:stops]
  # add one to not list the starting station
  first_stop_idx = new_order.index(start_station) + 1
  last_stop_idx = new_order.index(end_station) + 1
  #return a sub set of station that are to be travelled through
  travel_list = new_order[first_stop_idx, (last_stop_idx-first_stop_idx)]
  puts "Travel through stations #{travel_list.join(", ")}"
  #return total stops travelled
  return last_stop_idx - first_stop_idx
end

#combine journeys through 2 lines
def full_journey line1, line2, start_station, end_station
  puts "Starting at #{start_station} on the #{line1} line"
  total_stops = 0
  #if line is the same it is a single line journey only
  if line1 == line2
    total_stops += single_line_journey line1, start_station, end_station
  #otherwise 2 journeys with a change at the intersection
  else
    total_stops += single_line_journey line1, start_station, get_subway[:intersection]
    puts "Change at #{get_subway[:intersection]}"
    total_stops += single_line_journey line2, get_subway[:intersection], end_station
  end
  puts "You have arrived at you destination station, #{end_station}."
  puts "#{total_stops} stops in total."
end

#check if the line exists
def line_exists line
  return get_subway.has_key? line
end

#check if the station exists on the line
def station_exists line, station
  return get_subway[line][:stops].include? station
end

#check that the journey is valid first before passing to full_journey method
def check_journey_validity line1, line2, start_station, end_station
  #handle non-existent line errors
  unless line_exists line1
    puts "Line #{line1} doesn't exist!"
    return
  end
  unless line_exists line2
    puts "Line #{line2} doesn't exist!"
    return
  end
  unless station_exists line1, start_station
    puts "#{start_station} doesn't exist on line #{line1}!"
    return
  end
  unless station_exists line2, end_station
    puts "#{end_station} doesn't exist on line #{line2}!"
    return
  end
  #handle if lines different and intersection quoted
  if (line1 != line2) && (start_station == get_subway[:intersection] || end_station == get_subway[:intersection])
    puts "#{get_subway[:intersection]} exists on both lines"
    line2 = line1
  end
  full_journey line1, line2, start_station, end_station
end

puts "Tests..."
puts "--------"
puts "Valid journey on single line"
puts "....."
check_journey_validity :n, :n, "Times Square", "23rd"
puts "--------"
puts "Valid journey on 2 lines"
puts "....."
check_journey_validity :'6', :l, "33rd", "8th"
puts "--------"
puts "Invalid journey with station not existing on specified line"
puts "....."
check_journey_validity :'6', :l, "33rd", "77th"
puts "--------"
puts "Invalid journey with line not existing at all"
puts "....."
check_journey_validity :p, :l, "33rd", "77th"
puts "--------"
puts "Correction where intersection is quoted on different lines"
puts "....."
check_journey_validity :'6', :l, "33rd", "Union Square"
puts "--------"
