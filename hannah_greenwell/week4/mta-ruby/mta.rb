
# Method that returns an array of all stations on a particular line
def get_stations(line)
  lines = {
    :line_n => ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
    :line_l => ["8th", "6th", "Union Square", "3rd", "1st"],
    :line_6 => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"],
  }

  lines[line]
end


# Method that returns a printable line name
def get_line_name(line)
  case line
  when :line_n then "Line N"
  when :line_l then "Line L"
  when :line_6 then "Line 6"
  else
    "Line does not exist"
  end
end


# Method that prints all the stops on a single line trip and return the number of stops
def single_line_trip(start_station, end_station, line)
  # Get all stations on a line
  stations = get_stations(line)

  # Get (printable) station name
  line_name = get_line_name(line)

  # Get the index of the first and last stop
  first_stop_index = stations.index(start_station)
  last_stop_index = stations.index(end_station)

  # If travelling in the opposite direction, reverse the stations array and first and last stop indices
  if first_stop_index > last_stop_index
    stations.reverse!
    first_stop_index = stations.index(start_station)
    last_stop_index = stations.index(end_station)
  end

  # Create an array of all pass through stops and print them
  stops = stations[first_stop_index + 1 .. last_stop_index]
  puts "You must travel through the following stops on #{line_name}: #{stops.join(", ")}."

  # Return the number of stops
  last_stop_index - first_stop_index
end


def plan_trip(start_line, start_station, end_line, end_station)

  if start_line == end_line
    num_of_stops = single_line_trip(start_station, end_station, start_line)
  else
    num_of_stops = single_line_trip(start_station, "Union Square", start_line)
    puts "Change at Union Square."
    num_of_stops += single_line_trip("Union Square", end_station, end_line)
  end

  puts "#{num_of_stops} stops in total."
end

plan_trip(:line_n, "Times Square", :line_l, "1st")
plan_trip(:line_n, "8th", :line_n, "Times Square")

# "6" => [station, station]
# key will be string

# "6": [station, station]
# "6".to_sym
