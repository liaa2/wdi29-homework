# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Populating the camp site table...."

Campsite.destroy_all   #Remove all rows

Campsite.create name: 'Lane Cove Camping Ground', location: 'Lane Cove', campsite_type: 'Tent', max_people: 5, per_night: 50.00
Campsite.create name: 'Fraser Reserve',           location: 'Fraser',    campsite_type: 'Tent and Caravan', max_people: 10, per_night: 150.00
Campsite.create name: 'Barrington Camping Ground', location: 'Barringtop', campsite_type: 'Cabin', max_people: 20, per_night: 50.00
Campsite.create name: 'Geelong Camping Ground', location: 'Geelong', campsite_type: 'Tent', max_people: 10, per_night: 150.00
Campsite.create name: 'Ringwood Camping Ground', location: 'Ringwood', campsite_type: 'Caravan', max_people: 15, per_night: 50.00
Campsite.create name: 'Croydon Camping Ground', location: 'Croydon', campsite_type: 'Tent', max_people: 8, per_night: 60.00
puts "Created #{Campsite.all.length} campsites."
puts "Done!"
