# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Manufacturer.destroy_all
puts "Manufacturers guitars"
m1 = Manufacturer.create name: "Gibson", country: "USA", founded: 1902, image:  'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Gibson%2C_Inc.%2C_Kalamazoo%2C_1936.jpg/1920px-Gibson%2C_Inc.%2C_Kalamazoo%2C_1936.jpg'
m2 = Manufacturer.create name: "Fender", country: "USA", founded: 1946, image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/FGF_museum_01._Leo_and_early_models.jpg/1920px-FGF_museum_01._Leo_and_early_models.jpg'
m3 = Manufacturer.create name: "Yamaha", country: "Japan", founded: 1887, image: 'https://upload.wikimedia.org/wikipedia/commons/2/21/YAMAHA_%28headquarters_1%29.jpg'
puts "Created #{Manufacturer.all.length} manufacturers"
puts Manufacturer.pluck(:name).join(', ')

Guitar.destroy_all
puts "Creating guitars"

Guitar.create name: "Les Paul", guitar_type: "Electric", price: 3000, image: "https://images.samash.com/sa/ENS/ENSLPSTD.fpx?cvt=jpg", manufacturer: m1
Guitar.create name: "J200", guitar_type: "Acoustic", price: 5000, image: "https://images.gibson.com/Products/Acoustic-Guitars/New-Vintage/New-Vintage-J-200/Gallery-Images/SJ2TPANGH1-Finish-Shot.jpg", manufacturer: m1
Guitar.create name: "Telecaster", guitar_type: "Electric", price: 2000, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYBFrjb1pq6sYOHDvjlRFZo0aFHQgn49kzYffHzxVBtl01EQSnVw", manufacturer: m2
Guitar.create name: "RGX 312", guitar_type: "Electric", price: 500, image: "https://webshop.cashconverters.com.au/thumbnail/425x260/2420715-yamaha-left-handed-electric-guitar-rgx312-0.jpg", manufacturer: m3
puts "Created #{Guitar.all.length} guitars"
puts Guitar.pluck(:name).join(', ')
