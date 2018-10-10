# Calculator
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



############ CALCULATOR ####################
print "What is your first number: "
first_num = gets.chomp.to_i

print "What is your operator? ( + , - , *, /, ^, sqrt): "
operator = gets.chomp.to_s

print "What is your second number?: "
second_num = gets.chomp.to_i

case
when operator == "+" then puts "Your result is #{first_num + second_num}"
when operator == "-" then puts "Your result is #{first_num - second_num}"
when operator == "*" then puts "Your result is #{first_num * second_num}"
when operator == "/" then puts "Your result is #{first_num / second_num}"
when operator == "^" then puts "Your result is #{first_num ** second_num}"
when operator == "sqrt" then puts "Your result is #{(first_num ** (1/second_num).to_f)}" #dont need 2nd number. doesnt work
end

# Mortgage Calculator
# Calculate the monthly required payment given the other variables as input (look up the necessary variables)

############# MORTGAGE CALCULATOR ######################
print "What is the amount remaining on your loan?: "
loan = gets.chomp.to_f
print "How long is your term on your loan in months?: "
term = gets.chomp.to_i
print "What is your monthly interest rate (%)?: "
interest_rate = gets.chomp.to_f
c = (interest_rate/(12 * 100)).to_f

payment = loan * (c * ((1 + c) ** term)) / (((1 + c) ** term) - 1)
puts payment.to_f

# BMI Calculator
# Calculate the body mass index (BMI) for an individual, given their height and weight

################# BMI CALCULATOR #################
print "What is your mass (kgs)?: "
mass = gets.chomp.to_f

print "What is your height (m)?: "
height = gets.chomp.to_f

puts bmi = (mass / height) / height

# Trip Calculator
# Calculate a trip time and cost given inputs for
#
# distance
# miles per gallon
# price per gallon
# speed in miles per hour

################ TRIP CALCULATOR ####################

print "How long is your trip (miles)?: "
distance = gets.chomp.to_f

print "How many miles per gallon?: "
gallons = gets.chomp.to_f

print "How much $ gallon? : "
price = gets.chomp.to_f

print "How fast are you going (miles/hr)?: "
speed = gets.chomp.to_f

puts "Trip time: #{(distance / speed).to_f} hours"
puts "Cost: $#{((distance / gallons) * price).to_f}"
