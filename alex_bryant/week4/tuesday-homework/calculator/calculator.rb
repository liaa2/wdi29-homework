# Calculator
puts "Welcome to the Calculator"
puts
# Explanation
# You will be building a calculator which can perform multiple arithmetic operations. Your program should allow the user to choose which operation to perform, enter the values on which the operation is performed, and output the result.

# Specification:
# A user should be given a menu of operations
# A user should be able to choose from the menu
# A user should be able to enter numbers to perform the operation on
# A user should be shown the result
# The menu should be displayed again, and process should continue until the user selects a quit option from the menu

# Phase 1
# Calculator functionality
# Calculator should be able to do basic arithmetic (+,-, *, /)
# Phase 2
# Advanced Calculator functionality
# Calculator should be able to do basic arithmetic (exponents, square roots)

def check_operation x, num1, num2
  case x
  when "+" then num1 + num2
  when "-" then num1 - num2
  when "*" then num1 * num2
  when "/" then num1 / num2
  when "exp" then num1 ** num2
  when "sqrt" then Math.sqrt num1
  else "Invalid operation choosen"
  end
end

loop do
  puts "Select mathematical operation: ( + , - , * , / , exp , sqrt)"
  operation = gets.chomp
  puts "Enter first number"
  num1 = gets.to_f
  num2 = 0
  unless operation == "sqrt"
    puts "Enter second number"
    num2 = gets.to_f
  end
  puts "Answer: #{(check_operation operation, num1, num2).to_s}"
  puts "Would you like to quit? (y/n)"
  quit = gets.chomp
  break if quit == "y"
end

puts "________"
# Bonus
# Mortgage Calculator
puts "Welcome to the Mortgage Calculator"
puts
# Calculate the monthly required payment given the other variables as input (look up the necessary variables)

# m = p*r(1+r)**n/((1+r)**n - 1)
# m is your monthly payment.
# p is your principal.
# r is your monthly interest rate, calculated by dividing your annual interest rate by 12.
# n is your number of payments (the number of months you will be paying the loan)
def mortgage_calc principle, annual_interest, years
  n = years * 12
  r = (annual_interest / 100)/ 12 #since this is usually expressed as a percentage
  return (principle * r * (1 + r)**n / ((1 + r)**n - 1)).round(2)
end

puts "Enter the principal"
prin = gets.chomp.to_i
puts "Enter annual interest as a percentage"
interest = gets.chomp.to_f
puts "Enter the number of years for the loan"
yrs = gets.chomp.to_f

puts "Monthly repayments = $#{mortgage_calc prin, interest, yrs}"
puts "________"

# BMI Calculator
puts "Welcome to the BMI Calculator"
puts
# Calculate the body mass index (BMI) for an individual, given their height and weight

def bmi_calc height, weight
  return (weight / height**2).to_i
end

puts "Enter your height in metres"
height = gets.chomp.to_f
puts "Enter your weight in kg"
weight = gets.chomp.to_f

puts "Your BMI = #{bmi_calc height, weight}"
puts "________"

# Trip Calculator
puts "Welcome to the Trip Calculator"
puts
# Calculate a trip time and cost given inputs for
# distance
# miles per gallon
# price per gallon
# speed in miles per hour
def trip_calc dist, miles_per_g, price_per_g, speed_mph
  gallons_used = dist / miles_per_g
  cost = gallons_used * price_per_g
  time = dist / speed_mph
  return {cost: cost.to_f.round(2), time: time.to_f.round(2)}
end

puts "Enter the trip distance in miles"
d = gets.chomp.to_f
puts "Enter car miles per gallon"
m = gets.chomp.to_f
puts "Enter price per gallon"
p = gets.chomp.to_f
puts "Enter speed in miles per hour"
s = gets.chomp.to_f

trip_total = trip_calc d, m, p, s
puts "Cost of trip = $#{trip_total[:cost]}"
puts "Time of trip = #{trip_total[:time]} hours"
puts "________"
