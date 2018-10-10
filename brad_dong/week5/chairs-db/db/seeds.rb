# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Chair.destroy_all

Chair.create name:'Couch', image:'https://ozdesignfurniture.com.au/media/catalog/product/a/l/al0213096-alexa-2seater-victor-soft-grey-f-web_1.jpg',legs:4 ,material:'fabric', recliner:true

Chair.create name:'Desk Chair', image: 'https://www.thecontractchair.co.uk/content/images/thumbs/0030408_tati-desk-chair.jpeg', legs:4, material:'cloth', recliner:false

Chair.create name:'Rocking chair', image:'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Moravsk%C3%A1_galerie_02_-_Thonet-Mundus_k%C5%99eslo.jpg/1200px-Moravsk%C3%A1_galerie_02_-_Thonet-Mundus_k%C5%99eslo.jpg', legs:2, material:'wood', recliner:false

Chair.create name:'stool', image:'https://images-na.ssl-images-amazon.com/images/I/81AAC5s8hKL._SY500_.jpg', legs:3,material:'wood', recliner:false

puts "Done!"
