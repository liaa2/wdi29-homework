days_of_the_week = %w/ Monday Tuesday Wednesday Thursday Friday Saturday Sunday /

days_of_the_week.unshift(days_of_the_week.pop)
weekends = []
weekdays = []

days_of_the_week.each do |day|
  if day == "Saturday" || day == "Sunday"
    weekends.push(day)
  else
    weekdays.push(day)
  end
end

print weekends
print weekdays

puts "Removing Weekdays so we always have weekends forever"

days_of_the_week -= weekdays
print days_of_the_week.sort
