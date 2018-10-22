# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Populating the garage"

Car.destroy_all #remove every row from the planets table

Car.create name: 'Porsche', engine: 1, horsepower: 1, country: 1, turbocharged:1,
Car.create name: 'Nissan', engine:687, horsepower: 2, country: 0.2, turbocharged: 0.2,
Car.create name: 'Ferrai', engine:0.7, horsepower: 0.7, country: 0.1, turbocharged: 5,
Car.create name: 'Lambogini', engine:800, horsepower: 10_000, country: 500, turbocharged: 0.6

puts "Create #{ Car.all.length } cars"
puts "Done!"
