# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Sneaker.destroy_all

Sneaker.create brand: 'Nike', silhouette: 'Air Jordan 1', colorway: 'SBB', description: "Shattered Backboard", heat_rating: 8, release_date: "2014", brand_id: 1

Sneaker.create brand: 'adidas', silhouette: 'Yeezy 700', colorway: 'Waverunner', description: "adidas x Yeezy collab", heat_rating: 7, release_date: "2017", brand_id: 2

Sneaker.create brand: 'New Balance', silhouette: '574', colorway: 'Grey DSM', description: "Ronnie Fieg x Dover Street Market x New Balance", heat_rating: 10, release_date: "2016", brand_id: 1

Sneaker.create brand: 'Nike', silhouette: 'React Element 87', colorway: 'Red, Blue and Cream', description: "Nike x UNDERCOVER", heat_rating: 7.5, release_date: "2018", brand_id: 3

puts "done"

Brand.destroy_all

Brand.create company_name: 'Nike', image: 'http://fillmurray.com/300/300'
Brand.create company_name: 'adidas', image: 'http://fillmurray.com/300/300'
Brand.create company_name: 'New Balance', image: 'http://fillmurray.com/300/300'

puts 'done'
