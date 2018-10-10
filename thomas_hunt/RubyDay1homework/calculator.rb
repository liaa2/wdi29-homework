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
# #### Phase 2
# - Advanced Calculator functionality
# - Calculator should be able to do basic arithmetic (exponents, square roots)



puts "please choose first Number:"
num1 = gets.chomp().to_f
# Choose operator
puts "please choose operator:"
operator = gets.chomp()
#choose second number
puts "Please choose second number:"
num2 = gets.chomp().to_f

if operator == "-"
puts ("#{ num1 - num2 }")
end

if operator == "+"
puts ("#{num1 + num2}")
end

if operator == "*"
puts (" #{num1 * num2}")
end

if operator == "/"
puts (" #{num1 / num2}")

if operator == "square_root"
puts (" #{num1 * num1}")
end


case 
