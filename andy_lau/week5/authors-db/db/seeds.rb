# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Author.destroy_all

a1 = Author.create name: 'George Orwell', country: 'English', dob: '1950/06/25', genre: 'Dystopia', image:'https://upload.wikimedia.org/wikipedia/commons/7/7e/George_Orwell_press_photo.jpg'
a2 = Author.create name: 'Albert Camus', country: 'French', dob: '1913/11/07', genre: 'Philosophy, Absurdism', image:'https://upload.wikimedia.org/wikipedia/commons/0/08/Albert_Camus%2C_gagnant_de_prix_Nobel%2C_portrait_en_buste%2C_pos%C3%A9_au_bureau%2C_faisant_face_%C3%A0_gauche%2C_cigarette_de_tabagisme.jpg'
a3 = Author.create name: 'John Steinbeck', country: 'American', dob: '1902/02/27', genre: 'Themes of fate and injustice', image:'https://upload.wikimedia.org/wikipedia/commons/e/e7/John_Steinbeck_1962.jpg'
a4 = Author.create name: 'J. R. R. Tolkien', country: 'English', dob: '1892/01/03', genre: 'Fantasy, High Fantasy', image:'https://upload.wikimedia.org/wikipedia/commons/b/b4/Tolkien_1916.jpg'
