# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  Brand.destroy_all

  Brand.create company_name: 'Nike', founded: 1964, hq: "Beaverton", ceo: "Mark Parker", website: "nike.com", slogan: "Just Do It", logo_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Logo_NIKE.svg/1200px-Logo_NIKE.svg.png"
  Brand.create company_name: 'adidas', founded: 1949, hq: "Herzogenaurach", ceo: "Kasper Rørsted", website: "adidas.com", slogan: "Die Marken Mit Die Drei Streifen", logo_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Adidas_Logo.svg/1200px-Adidas_Logo.svg.png"
  Brand.create company_name: 'Puma', founded: 1948, hq: "Herzogenaurach", ceo: "Bjørn Gulden", website: "au.puma.com", slogan: "Roar", logo_url: "https://upload.wikimedia.org/wikipedia/en/thumb/4/49/Puma_AG.svg/1200px-Puma_AG.svg.png"
