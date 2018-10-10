# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#puts "Populating books system..."
Book.destroy_all #Remove every row from the planets table

Book.create title: 'The Fault in Our Stars', author: 'John Green', published_year: 2015
Book.create title: 'Gone Girl', author: 'Gillian Flynn', published_year: 2014
Book.create title: 'Wonder', author: 'R.J. Palacio', published_year:2012
Book.create title: 'Kitchen', author: 'Banana Yoshimoto', published_year:1970


# puts "Created #{Book.all.length} Books."
# puts "Done!"
