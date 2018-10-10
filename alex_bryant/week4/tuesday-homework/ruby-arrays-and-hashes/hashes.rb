# Array and Hash access
# A. Given the following data structure:
a = ["Anil", "Erik", "Jonathan"]
puts 'How would you return the string "Erik"?'
puts a[1]
# How would you add your name to the array?
a.push "Alex"
print a
puts
puts "......"
# B. Given the following data structure:
h = {0 => "Zero", 1 => "One", :two => "Two", "two" => 2}
# How would you return the string "One"?
puts h[1]
# How would you return the string "Two"?
puts h[:two]
# How would you return the number 2?
puts h["two"]
# How would you add {3 => "Three"} to the hash?
h[3] = "Three"
puts h
# How would you add {:four => 4} to the hash?
h[:four] = 4
puts h
puts "......."
# C. Given the following data structure:
is = {true => "It's true!", false => "It's false"}
# What is the return value of is[2 + 2 == 4]?
puts is[2+2 == 4]
# What is the return value of is["Erik" == "Jonathan"]?
puts is["Erik" == "Jonathan"]
# What is the return value of is[9 > 10]?
puts is[9 > 10]
# What is the return value of is[0]?
puts is[0]
# What is the return value of is["Erik"]?
puts is["Erik"]
puts "........"
# D. Given the following data structure:
users = {
  "Jonathan" => {
    :twitter => "tronathan",
    :favorite_numbers => [12, 42, 75],
  },
  "Erik" => {
    :twitter => "sferik",
    :favorite_numbers => [8, 12, 24],
  },
  "Anil" => {
    :twitter => "bridgpal",
    :favorite_numbers => [12, 14, 85],
  },
}
# How would you access Jonathan's Twitter handle (i.e. the string "tronathan")?
puts users["Jonathan"][:twitter]
# How would you add the number 7 to Erik's favorite numbers?
users["Erik"][:favorite_numbers].push 7
print users["Erik"][:favorite_numbers]
puts
# How would you add yourself to the users hash?
alex = {
  twitter: "alexbryant_710",
  favorite_numbers: [7, 10, 12]
}
puts alex
users["Alex"] = alex
puts users
# How would you return the array of Erik's favorite numbers?
print users["Erik"][:favorite_numbers]
puts
# How would you return the smallest of Erik's favorite numbers?
puts users["Erik"][:favorite_numbers].sort[0]
# How would you return an array of Anil's favorite numbers that are also even?
evens_arr = []
users["Anil"][:favorite_numbers].each do |x|
  if x.even?
    evens_arr.push x
  end
end
print evens_arr
puts
# How would you return an array of the favorite numbers common to all users?
print users["Anil"][:favorite_numbers] & users["Alex"][:favorite_numbers] & users["Erik"][:favorite_numbers] & users["Jonathan"][:favorite_numbers]
puts
# How would you return an array containing all users' favorite numbers, sorted, and excluding duplicates?
print (users["Anil"][:favorite_numbers] + users["Alex"][:favorite_numbers] + users["Erik"][:favorite_numbers] + users["Jonathan"][:favorite_numbers]).sort.uniq
puts
