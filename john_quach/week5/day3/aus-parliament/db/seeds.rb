# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Party.destroy_all   # remove all rows from the artists table before we seed

puts "Creating parties..."

a1 = Party.create name: 'Liberal Party', founded: '1944/10/16', abbr: 'LP', leader: 'Scott Morrision', position: 'Centre Right', ideology: 'Economic liberalism,Liberal conservatism', image: 'https://cdn.liberal.org.au/headers/LPABanner.png'
a2 = Party.create name: 'Australian Labor Party', founded: '1901/05/08', abbr: 'ALP', leader: 'Bill Shorten', position: 'Centre Left', ideology: 'Social democracy', image: 'http://www.fridaymash.com/wp-content/uploads/1970/01/ALP-coverage-on-FridayMash.jpg'
a3 = Party.create name: 'National Party Australia', founded: '1920/01/20', abbr: 'National', leader: 'Michael McCormack', position: 'Centre Right', ideology: 'Conservatism,Agrarianism', image: 'https://upload.wikimedia.org/wikipedia/commons/a/ab/The_National_Party_of_Australia_Logo.png'

puts "Created #{ Party.all.length } parties: "
puts Party.pluck(:name).join(', ')

Member.destroy_all   # remove all rows from the artists table before we seed

puts "Creating members..."

Member.create name: 'Scott Morrison', about: 'Scott Morrison was sworn in as Prime Minister of Australia on 24 August 2018 after being elected leader of the Liberal Party. He was first elected as the Federal Member for Cook in 2007.', title: 'Prime Minister', seat: 'Cook', image: 'https://www.betootaadvocate.com/wp-content/uploads/2018/08/sco-mo-1.png', party: a1
Member.create name: 'Josh Frydenberg ', about: 'Josh Frydenberg was sworn in as Treasurer on 24 August 2018. He has previously served as the Minister for the Environment and Energy, and Assistant Treasurer', title: 'Treasurer', seat: 'Kooyong', image: 'https://1v1d1e1lmiki1lgcvx32p49h8fe-wpengine.netdna-ssl.com/wp-content/uploads/2017/11/josh-frydenberg-960x540.jpg', party: a1
Member.create name: 'Michael McCormack', about: 'Michael McCormack is the Deputy Prime Minister, Leader of The Nationals and Nationals Federal Member for Riverina.', title: 'Deputy Prime Minister', seat: 'Riverina', image: 'https://www.betootaadvocate.com/wp-content/uploads/2018/08/sco-mo-1.png', party: a1
Member.create name: 'Scott Morrison', about: 'Scott Morrison was sworn in as Prime Minister of Australia on 24 August 2018 after being elected leader of the Liberal Party. He was first elected as the Federal Member for Cook in 2007.', title: 'Prime Minister', seat: 'Cook', position: 'Prime Minister', image: 'https://www.betootaadvocate.com/wp-content/uploads/2018/08/sco-mo-1.png', party: a1


puts "Created #{ Party.all.length } members: "
puts Member.pluck(:name).join(', ')
