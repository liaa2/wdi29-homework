=begin
Warmup - Raindrops
Write a program using Ruby that will take a number (eg 28 or 1755 or 9, etc) and output the following:

If the number contains 3 as a factor, output 'Pling'.
If the number contains 5 as a factor, output 'Plang'.
If the number contains 7 as a factor, output 'Plong'.
If the number does not contain 3, 5, or 7 as a factor, output the number as a string.

Examples
28 has 7 as a factor.
In raindrop-speak, this would be a simple "Plong".
1755 has 3 and 5 as factors.
In raindrop-speak, this would be a "PlingPlang".
34 has neither 3, 5 nor 7 as a factor.
Raindrop-speak doesn't know what to make of that, so it just goes with the straightforward "34".
You will need to create a raindrops.rb file that can be executable in your terminal.
=end

def raindrop(num)

  response = ""

  if num % 3 == 0
    response += "Pling"
  end

  if num % 5 == 0
    response += "Plang"
  end

  if num % 7 == 0
    response += "Plong"
  end

  if response.length == 0
    response = num.to_s
  end

  response

end

def raindrop_refactor(num)
  response = ""

  response += "Pling" if num % 3 == 0
  response += "Plang" if num % 5 == 0
  response += "Plong" if num % 7 == 0
  response = num.to_s if response.empty?

  response
end


raindrop(28) # Plong
raindrop(105) # PlingPlang
raindrop(34) # 34
raindrop_case(30)
