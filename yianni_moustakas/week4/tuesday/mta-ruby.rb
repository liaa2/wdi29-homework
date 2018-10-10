# # MTA Lab
#
# ### Activity:
# - Students should create a program that models a simple subway system.
#
# - The program takes the line and stop that a user is getting on at and the line
# and stop that user is getting off at and prints:
#   + the stations the user must pass through, in order
#   + where to change lines, if necessary
#   + the total number of stops for the trip.
#
# - There are 3 subway lines:
#   - The N line has the following stops: Times Square, 34th, 28th, 23rd, Union Square, and 8th
#   - The L line has the following stops: 8th, 6th, Union Square, 3rd, and 1st
#   - The 6 line has the following stops: Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place.
#   - All 3 subway lines intersect at Union Square, but there are no other intersection points.
#     - For example, this means the 28th stop on the N line is different than the 28th street stop on the 6 line, so you'll have to differentiate this when you name your stops in the arrays.
#
# We should be able to say:
#
# ```ruby
# plan_trip( :n, "Times Square", :l, "Grand Central" )
# # Or something along those lines
# ```
#
# ### Hints:
# * Don't worry about user input initially: get it working with hardcoded values first, and wire up the user interface once that's working
# * Scope works in a different way in Ruby, so variables that you define outside won't be accessible in a method. Maybe think about using a function to return data. Or perhaps research other types of variables
# * A symbol can't just be a number!
# * Consider diagraming the lines by sketching out the subway lines and their stops and intersection.
# * Make subway lines keys in a hash, while the values are an array of all the stops on each line.
# * The key to the lab is to find the __intersection__ of the lines at Union Square.
# * Make sure the stops that are the same for different lines have different names (i.e. 23rd on the N and on the 6 need to be differentiated)


# mta = {
#   :line_n => ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
# }
#
# # print "Enter your first stop:"
# first_stop = "8th"#gets.chomp.to_s
# # print "Enter your second stop:"
# second_stop = "Times Square"#gets.chomp.to_s
#
# mta.each do |key, value|
#   first_index = value.index(first_stop)
#   second_index = value.index(second_stop)
#   new_array = value.reverse
#   reverse_index1 = new_array.index(first_stop)
#   reverse_index2 = new_array.index(second_stop)
#
#   if first_index < second_index
#     puts value[first_index..second_index ]
#   else
#     puts new_array[reverse_index1..reverse_index2]
#   end
# end



$mta = {
  :line_n => ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
  :line_l => ["8th", "6th", "Union Square", "3rd", "1st"],
  :line_6 => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
}

# print "Enter your stop's line:"
first_line = gets.chomp.to_sym
# print "Enter your stop:"
first_stop = gets.chomp

# print "Enter destinations line:"
second_line = gets.chomp.to_sym
# print "Enter your destination:"
second_stop = gets.chomp

line_1 = mta[first_line]
# print line_1
line_2 = mta[second_line]
# print line_2

# def forward_travel (arr, stop1, stop2)
#   first_index = arr.index(stop1)
#   second_index = arr.index(stop2)
#
#   arr[first_index..second_index ]
#
# def backward_travel (arr, stop1, stop2)
#   new_array = arr.reverse
#   reverse_index1 = new_array.index(stop1)
#   reverse_index2 = new_array.index(stop2)

# line_1.each
  first_index = line_1.index(first_stop)
  second_index = line_1.index("Union Square")

  if first_index < second_index
    to = line_1[first_index..second_index ]
  elsif first_index > second_index
    new_array = line_1.reverse
    reverse_index1 = new_array.index(first_stop)
    reverse_index2 = new_array.index("Union Square")
    to = new_array[reverse_index1..reverse_index2]
  else
    to = "Union Square"
  end


# line_2.each
  first_index = line_2.index("Union Square")
  second_index = line_2.index(second_stop)
  new_array = line_2.reverse
  reverse_index1 = new_array.index("Union Square")
  reverse_index2 = new_array.index(second_stop)

  if first_index < second_index
    change = "Get off at Union Square and get onto #{second_line}"
    leg = line_2[first_index+1..second_index ]
  elsif first_index > second_index
    change = "Get off at Union Square"
    leg = new_array[reverse_index1+1..reverse_index2]
  else
    leg = "Union Square"
  end
