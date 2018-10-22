# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Author.destroy_all

a1 = Author.create name: 'John Green', dob: '1960', nationality: 'Australian'
a2 = Author.create name: 'Gillian Flynn', dob: '1975', nationality: 'English'
a3 = Author.create name: 'R. J. Palacio', dob: '1970', nationality: 'USA'

puts "Created #{Author.all.length} authors."
puts "Done!"


#puts "Populating books system..."
Book.destroy_all #Remove every row from the planets table

Book.create title: 'The Fault in Our Stars', published_year: 2015, author: a1, image: 'https://images.livrariasaraiva.com.br/imagemnet/imagem.aspx/?pro_id=4889472&qld=90&l=430&a=-1'
Book.create title: 'Looking for Alaska', published_year: 2000, author: a1,
image: 'https://images-na.ssl-images-amazon.com/images/I/41JbPzUy7UL._SX329_BO1,204,203,200_.jpg'

Book.create title: 'Gone Girl', published_year: 2000, author: a2, image: 'https://images-na.ssl-images-amazon.com/images/I/41f02H4PvDL._SX304_BO1,204,203,200_.jpg'
Book.create title: 'Dark Places', published_year: 1980, author: a2, image: 'https://s3.amazonaws.com/botm-media/covers/list/DarkPlaces.jpg'

Book.create title: 'Wonder', published_year: 1980, author: a3, image: 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/5535/9780553509977.jpg'

Book.create title: 'Pluto', published_year: 1980, author: a3, image: 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/4915/9781491524138.jpg'


puts "Created #{Book.all.length} Books."
puts "Done!"

User.destroy_all

User.create name: 'Mika', email: 'test@ga.co', password: 'chicken'
User.create name: 'Luke', email:'luke@ga.co', password:'chicken'
User.create name: 'Lisa', email:'lisa@ga.co', password:'chicken'
User.create name: 'Taro', email:'taro@ga.co', password:'chicken'

puts "Created #{User.all.length} users."
