# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Mountain.destroy_all
Mountain.create name: "Mt Fuji", country: "Japan", elevation: 3776, image: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Numazu_and_Mount_Fuji.jpg/320px-Numazu_and_Mount_Fuji.jpg", pointyness: 4
Mountain.create name: "K2", country: "Pakistan", elevation: 8611, image: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/K2_2006b.jpg/280px-K2_2006b.jpg", pointyness: 7
Mountain.create name: "The Matterhorn", country: "Switzerland", elevation: 4478, image: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Matterhorn_from_Domh%C3%BCtte_-_2.jpg/1200px-Matterhorn_from_Domh%C3%BCtte_-_2.jpg", pointyness: 9
