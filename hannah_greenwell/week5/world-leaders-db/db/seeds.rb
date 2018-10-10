# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
WorldLeader.destroy_all

puts "Populating the world leaders database."

WorldLeader.create name: "Shinzo Abe", country: "Japan", years_in_office: "2012 - present", alive: true, image: "/assets/shinzo_abe.jpg", quote: "There isn't anything anybody wants that is for any other reason than that they think they would feel better in having it."

WorldLeader.create name: "Harold Holt", country: "Australia", years_in_office: "1966 - 1967", image: "/assets/harold_holt.jpg", quote: "And so, sir, in the lonelier and perhaps even more disheartening moments which come to any national leader, I hope there will be a corner of your mind and heart which takes cheer from the fact that you have an admiring friend, a staunch friend that will be all the way with LBJ."

WorldLeader.create name: "Empress Wu Zetian", country: "Chinese Empire", years_in_office: "690-705", alive: false, image: "/assets/wu_zetian.jpg", quote: "Remember, when one's aim is to achieve greatness... everyone is expendable."

WorldLeader.create name: "Silvio Berlusconi", country: "Italy", years_in_office: "2008-2011", alive: true, image: "/assets/silvio_berlusconi.jpg", quote: "I have little hair because my brain is so big it pushes the hair out."

puts "Created #{WorldLeader.all.length} world leaders."
