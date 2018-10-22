# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  Sneaker.destroy_all

  s1 = Sneaker.create name: 'OFF-WHITE x Chuck 70', silhouette: 'Chuck Taylor', color: 'White', release_date: '2018', image: 'https://image.goat.com/crop/750/attachments/product_template_additional_pictures/images/015/264/462/original/459602_01.jpg.jpeg', brand_id: 1
  s2 = Sneaker.create name: 'OFF-WHITE x Blazer Mid Grim Reapers', silhouette: 'Blazer', color: 'Black', release_date: '2018', image: 'https://image.goat.com/crop/750/attachments/product_template_additional_pictures/images/015/072/548/original/406001_01.jpg.jpeg', brand_id: 2
  s3 = Sneaker.create name: 'Yeezy Boost 700 OG', silhouette: 'Yeezy 700', color: 'Grey', release_date: '2017', image: 'https://image.goat.com/crop/750/attachments/product_template_additional_pictures/images/014/507/858/original/195483_01.jpg.jpeg', brand_id: 3

  Brand.destroy_all

  b1 = Brand.create company_name: "Converse", image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Converse_logo.svg/1200px-Converse_logo.svg.png', founded: '1970'
  b2 = Brand.create company_name: "Nike", image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Logo_NIKE.svg/1200px-Logo_NIKE.svg.png', founded: '1968'
  b3 = Brand.create company_name: "adidas", image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Adidas_Logo.svg/2000px-Adidas_Logo.svg.png', founded: '1949'

  b1.sneakers << s1
  b2.sneakers << s2
  b3.sneakers << s3
