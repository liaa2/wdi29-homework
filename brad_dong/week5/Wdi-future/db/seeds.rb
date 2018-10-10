# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Future.destroy_all

sk = Future.create name:'WDI Serial Killers', year:2018 ,location:'Super-duper MAX', image:'https://cdn.europosters.eu/image/750/stickers/skull-crossbones-i7800.jpg'
uw = Future.create name:'WDI Underwater', year:2060, location:'Atlantis', image:'https://i.ytimg.com/vi/YXPLOlUMtPQ/maxresdefault.jpg'
d = Future.create name:'WDI Dwarves', year:1970, location:"Far Far Away", image:'https://filmschoolrejects.com/wp-content/uploads/2017/07/sevendwarvesthanksgiving1.jpg'



Student.destroy_all

Student.create name:'Jeffrey Dahmer', location:"USA", hobbies: "Dining with friends", image:'https://static1.squarespace.com/static/553a8ddae4b0bd1c1a10972e/t/5a66876d9140b71728f634cd/1516668784982/dahmer.jpg', future_id: sk.id

Student.create name:'Linna Liu', location: "Behind you", hobbies: "Stalking her next victim, updating the gitbook", image: 'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX8107180.jpg', future_id: sk.id

Student.create name:"Aquaman", location: "Under da sea", hobbies: "Swimming around, dodging fishing nets", image: 'http://2.bp.blogspot.com/--lIiLIJQWu0/Tn_5ti-xHcI/AAAAAAAAANw/suevM6WxjXw/s640/aquaman.jpg', future_id: uw.id

Student.create name:'Spongebib Squorepants', location:"Sweatshop", hobbies: "Avoiding copyright", image: 'https://thoughtcatalog.files.wordpress.com/2013/08/spongerob-cubejeans.jpg?w=584', future_id: uw.id

Student.create name:'Surly', location:"Duff Gardens", hobbies: "Abusing kids", image: 'https://vignette.wikia.nocookie.net/simpsons/images/4/42/Surly_Duff.png/revision/latest?cb=20130601152108', future_id: d.id
