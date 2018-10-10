# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding planets..."

Planet.destroy_all

p1 = Planet.create name: 'Earth', orbit: 3.14, temperature: 14.6, year: 365.256, day: 24, image: "https://fillmurray.com/200/300"

p2 = Planet.create name: 'Mars', orbit: 9.55, temperature: -63, year: 668.5991, day: 24.65, image: "https://fillmurray.com/300/300"

p3 = Planet.create name: 'Jupiter', orbit: 32.67, temperature: -108, year: 10475.8, day:9.93, image: "https://fillmurray.com/300/200"

puts "Created #{Planet.all.length} planets entries."
puts Planet.pluck(:name).join(', ')

puts "Seeding moons..."
Moon.destroy_all

Moon.create name: 'Luna', period: 27.3, discovery: -1000000000, discoverer: 'Everyone, probably', image: "https://fillmurray.com/300/200", planet_id: p1.id

Moon.create name: 'Io', period: 1.78, discovery: 1610, discoverer: "Galileo Galilei", image: "https://fillmurray.com/300/200", planet_id: p3.id

Moon.create name: 'Phobos', period: 0.32, discovery: 1877, discoverer: 'Asaph Hall', image: "https://fillmurray.com/300/200", planet_id: p2.id

Moon.create name: 'Deimos', period: 1.26, discovery: 1877, discoverer: 'Asaph Hall', image: "https://fillmurray.com/300/200", planet_id: p2.id

puts "Created #{Moon.all.length} moon entries."
puts Moon.pluck(:name).join(', ')
