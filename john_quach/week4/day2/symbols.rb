a = ["Anil", "Erik", "Jonathan"]
print a[1]

a.push("John")


h = {0 => "Zero", 1 => "One", :two => "Two", "two" => 2}

# How would you return the string "One"?
print h[1]
# How would you return the string "Two"?
print h[:two]
# How would you return the number 2?
print h["two"]
# How would you add {3 => "Three"} to the hash?
h[3] = "Three"
print h[3]
# How would you add {:four => 4} to the hash?
h[:four] = 4
print h[:four]


is = {true => "It's true!", false => "It's false"}

# What is the return value of is[2 + 2 == 4]?
# It's true!
#
#   What is the return value of is["Erik" == "Jonathan"]?
# It's false!
#
#   What is the return value of is[9 > 10]?
# It's false!
#
#   What is the return value of is[0]?
# Nothing
#
#   What is the return value of is["Erik"]?
# Nothing



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
# users["Jonathan"][:twitter]
#
# How would you add the number 7 to Erik's favorite numbers?
# users["Erik"][:favorite_numbers] << (7)
#
# How would you add yourself to the users hash?
# users["Quach"] = { :twitter => 'jbond034', :favorite_numbers => [5, 11] }
#
# How would you return the array of Erik's favorite numbers?
# users["Erik"][:favorite_numbers]
#
# How would you return the smallest of Erik's favorite numbers?
# users["Erik"][:favorite_numbers].min
#
# How would you return an array of Anil's favorite numbers that are also even?
# users["Anil"][:favorite_numbers].even
# arrya.select { |num| num.even? }
#
# How would you return an array of the favorite numbers common to all users?
# Using the & operator
# users["Jonathan"][:favorite_numbers] & users["Erik"][:favorite_numbers] etc
#
# How would you return an array containing all users' favorite numbers, sorted, and excluding duplicates?
# sort and uniq?
