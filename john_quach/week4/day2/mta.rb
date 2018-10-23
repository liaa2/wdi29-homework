require 'pry'
def lines
 {
    n:  [ "Times Square", "34th", "28th", "23rd", "Union Square", "8th" ],
    l:  [ "8th", "6th", "Union Square", "3rd", "1st" ],
    "6":[ "Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place" ],
  }
end


# Testing Hashes above
print lines[:"6"]
print lines[:n]
print lines[:n][0]  + " "
puts " Index is N 34th #{lines[:n].index("34th")}"
print " Index is 6 33rd #{lines[:"6"].index("23rd")}"

puts "Index using Find Index N 34th......#{lines[:n].find_index "34th"}"

def prompt message
	print "#{ message }"
	gets.chomp
end

# Calculate number of stops between final arrival stop and departure stop
def calc_num_stops ( start_line, start_station, end_line, end_station)
	# count_stops = 0
	if start_line == end_line
		index_start_stop = lines[start_line].index(start_station)
		index_end_stop = lines[end_line].index(end_station)
		# index_start_stop = $lines[start_line].find_index start_station
		# index_end_stop = $lines[end_line].find_index end_station
		# puts "Index start stop:   #{index_start_stop}"
		# puts "Index end stop:   #{index_end_stop}"
		( index_end_stop - index_start_stop ).abs
	end
end

start_line = prompt("Please enter boarding line: ")
start_station = prompt("Please enter boarding station: ")
end_line = prompt("Please enter line departure: ")
end_station = prompt("Pleae enter stopping station: ")


puts "#{calc_num_stops(start_line, start_station, end_line, end_station)} stops to your destination."
