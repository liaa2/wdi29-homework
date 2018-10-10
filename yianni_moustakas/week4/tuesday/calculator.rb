# # Calculator
#
# ### Explanation
# - You will be building a calculator.  A calculator can perform multiple arithmetic operations.  Your function should allow the user to choose which operation is expected, enter in the values to perform the operation on, and ultimately view the result.
#
# ### Specification:
# - A user should be given a menu of operations
# - A user should be able to choose from the menu
# - A user should be able to enter numbers to perform the operation on
# - A user should be shown the result
# - This process should continue until the user selects a quit option from the menu
#
# #### Phase 1
# - Calculator functionality
# - Calculator should be able to do basic arithmetic (+,-, *, /)
#

"Enter operator +, -, / or *"
operator = gets
number1 = gets.to_i
number2 = gets.to_i

calculation = case operator
when "+" then number1 + number2
when "-" then number1 - number2
when "/" then number1 / number2
when "*" then number1 * number2
else
  "This calc don't do that"
end

puts calculation


# #### Phase 2
# - Advanced Calculator functionality
# - Calculator should be able to do basic arithmetic (exponents, square roots)
#
#
#
# # Bonus
# ## Mortgage Calculator
# Calculate the monthly required payment given the other variables as input (look up the necessary variables)
#

rate = gets.to_f
principal = gets.to_i
years = 30

monthly_repayment = ((rate/100/12) * principal) / (1 - (1 + (rate/100/12)) ** ((-(years).abs)*12)

puts monthly_repayment

# ## BMI Calculator
# Calculate the body mass index (BMI) for an individual, given their height and weight
#
# ## Trip Calculator
# Calculate a trip time and cost given inputs for
# - distance
# - miles per gallon
# - price per gallon
# - speed in miles per hour
