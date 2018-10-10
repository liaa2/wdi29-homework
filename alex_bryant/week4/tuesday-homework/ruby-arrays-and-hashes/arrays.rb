# 1. Create an array of the days of the week
# Create a variable named days_of_the_week as an array of the following:
# Monday
# Tuesday
# Wednesday
# Thursday
# Friday
# Saturday
# Sunday

puts "1. Array containing days of the week"
days_of_the_week =  %w{Monday Tuesday Wednesday Thursday Friday Saturday Sunday}
print days_of_the_week
puts
puts "....."

# 2. My calendar says the first day is Sunday...
# Remove Sunday from the last postion and move it to the first position. Use array methods.

puts "2. Remove Sunday and then move to start"
sunday = days_of_the_week[-1]
days_of_the_week.pop
days_of_the_week.unshift sunday
print days_of_the_week
puts
puts "....."

# 3. Create a new array of the days of the week:
# The first inner array should be the weekdays
# The second inner array should be the weekend days

puts "3. New nested Arrays weekdays / weekend"
saturday = days_of_the_week[-1]
days_of_the_week.pop
days_of_the_week.shift
weekend = [saturday, sunday]
nested_days_of_week = []
nested_days_of_week.push days_of_the_week
nested_days_of_week.push weekend
print nested_days_of_week
puts
puts "....."

# 4. Remove either the weekdays or the weekends
# Your choice...

puts "4. Removing Weekends"
nested_days_of_week.pop
print nested_days_of_week
puts
puts "....."

# 5. Sort the remaining days alphabetically

puts "5. Sort days alphabetically"
nested_days_of_week[0] = nested_days_of_week[0].sort
print nested_days_of_week
puts
puts "....."
