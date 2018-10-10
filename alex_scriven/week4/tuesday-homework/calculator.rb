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

# Bonus
# Mortgage Calculator
# Calculate the monthly required payment given the other variables as input (look up the necessary variables)
#
# BMI Calculator
# Calculate the body mass index (BMI) for an individual, given their height and weight
#
# Trip Calculator
# Calculate a trip time and cost given inputs for
# distance
# miles per gallon
# price per gallon
# speed in miles per hour

loop do

  print "Welcome to the calculator. Please select one of the following options by inputting the number:
  1. Plus numbers
  2. Minus numbers
  3. Multiply numbers
  4. Divide numbers
  5. Exponent numbers
  6. Square root
  7. Mortgage calculator
  8. BMI Calculator
  99. Quit the calculator
  "
  decision = gets.to_i

  puts "You have selected option #{decision}"
  if decision == 99
    puts "Good bye"
    return
  end
  simple_maths_array = [1,2,3,4,5]

  if simple_maths_array.include? decision

    print "Please input two numbers separated by a comma. The first number will be the leading in the eqaution: num2,num2 "
    numbers = gets.chomp.split(",")
    numbers.map! do | elem |
      elem.to_i
    end

    case decision
    when 1 then puts "The Result is #{numbers[0] + numbers[1]} "
    when 2 then puts "The Result is #{numbers[0] - numbers[1]} "
    when 3 then puts "The Result is #{numbers[0] * numbers[1]} "
    when 4 then puts "The Result is #{numbers[0] / numbers[1]} "
    when 5 then puts "The Result is #{numbers[0]**numbers[1] }"
    end
  end
  if decision == 6
    puts "Please input a number to square root"
    number_square_root = gets.chomp.to_i
    puts "The result is #{Math.sqrt(number_square_root).round(2)}"
  end

  if decision == 7
    puts "Please input the following items, separated by a comma:
    1. Principal (loan amount)
    2. Yearly interest rate in %, for example 3.45 for 3.45%
    3. Number of whole years for the loan"
    loan_numbers = gets.chomp.split(",")

    #Some calculations
    monthly_rate = loan_numbers[1].to_f/100.to_f/12.to_f
    number_payments = loan_numbers[2].to_i*12

    eq1 = (1+monthly_rate)**number_payments
    eq2 = loan_numbers[0].to_i*monthly_rate*eq1
    eq3 = eq1 - 1

    result = eq2/eq3

    puts "The monthly repayments are #{result.round(2)}"
  end

  if decision == 8
    puts "Please input the following items, separated by a comma:
    1. Weight in KG to 2.d.p
    2. Height in m to 2.d.p"

    bmi_numbers = gets.chomp.split(",")

    bmi_calculated = bmi_numbers[0].to_f/(bmi_numbers[1].to_f**2)

    puts "Your BMI is #{bmi_calculated.round(2)}"
  end

end
